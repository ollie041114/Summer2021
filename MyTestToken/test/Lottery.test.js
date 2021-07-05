const assert = require('assert');
const ganache = require('ganache-cli');
const Web3 = require('web3');
const web3 = new Web3(ganache.provider());

const { interface, bytecode} = require('../compile');

let lottery;
let accounts;

beforeEach(async () => {
    accounts = await web3.eth.getAccounts();

    lottery = await new web3.eth.Contract(JSON.parse(interface))
    .deploy({data: bytecode})
    .send({from: accounts[0], gas: '1000000'});
});

describe('Lottery Contract', () => {
    it('deploys a contract', () => {
        // Assert that the contract is actually deployed
        assert.ok(lottery.options.address);
        console.log(lottery.options.address);
    });

    it('Allows multiple accounts to enter', async () => {
        // Try to enter many accounts

        await lottery.methods.enter().send({
            from: accounts[0],
            // Enter the amount of ether
            value: web3.utils.toWei('0.02', 'ether')
        });

        await lottery.methods.enter().send({
            from: accounts[1],
            // Enter the amount of ether
            value: web3.utils.toWei('0.02', 'ether')
        });

        await lottery.methods.enter().send({
            from: accounts[2],
            // Enter the amount of ether
            value: web3.utils.toWei('0.02', 'ether')
        });


        // Now check the lengths and so on

        const players = await lottery.methods.getPlayers().call({
            from: accounts[0]
        });

    assert.equal(accounts[0], players[0]);
    assert.equal(accounts[1], players[1]);
    assert.equal(accounts[2], players[2]);
    assert.equal(3, players.length);
    });

    it('requires a minimum amount of ether to enter', async() => {
        try {
                // Attempt to run the code
            await lottery.methods.enter().send({
                from: accounts[0],
                value: 0
            });
            // Gonna fail our test no matter what
            assert(false);
        } catch(err) {
            // Trigger this if an error is catched (the code above 
            //... doesn't run)
            // The test will still pass if you catch an error! 
            assert(err);
        }
    });


    it('only manager can call pickWinner', async () => {
        try{
            await lottery.methods.pickWinner().send({
                from: accounts[1]
            });
            assert(false);
        } catch(err){
            assert(err);
        }
    });


    it('Sends money to the winner and resets the players array', async () => {
        
        // Try to make only one participant, send money, pickWinner, see if the money is back
        // ... by checking the balance of the user. 
        
        await lottery.methods.enter().send({
            from: accounts[0],
            value: web3.utils.toWei('2', 'ether')
        });

        const initialBalance = await web3.eth.getBalance(accounts[0]);

        await lottery.methods.pickWinner().send({ from: accounts[0]});

        const finalBalance = await web3.eth.getBalance(accounts[0]);

        // The difference will not be exactly 2 ether because of transaction fees
        const difference = finalBalance - initialBalance;
        assert(difference > web3.utils.toWei('1.8', 'ether'));
    });

    

});