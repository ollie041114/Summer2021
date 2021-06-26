const assert = require('assert');
const ganache = require('ganache-cli');
const Web3 = require('web3'); // Web3 is capitalized because we use constructor function

const web3 = new Web3(ganache.provider());
const { interface, bytecode} = require('../compile');
let accounts;
let inbox;

beforeEach(async () => {
  accounts = await web3.eth.getAccounts();
  
  // Deploying a contract is
  // ...obviously an asynchronous thing, so we have to await
  inbox = await new web3.eth.Contract(JSON.parse(interface))
  .deploy({data: bytecode, arguments: ['Hi there!']})
  .send({ from: accounts[0], gas: "1000000"})
});

describe('Inbox', ()=> {
  it('deploys a contract', () => {
    assert.ok(inbox.options.address);
// ok: makes an assertion that this value actually exists
  });

  it('has a default message', async() => {
    const message = await inbox.methods.message().call();
	  assert.equal(message, 'Hi there!');
  });

  it('can change the message', async() => {
    // Attempt to change the message and retrieve it
    await inbox.methods.setMessage('bye').send({ from: accounts[0]});
    // send({from: accounts[0]}) -> specify that the first
    //...account will pay for the transaction

    // Make sure the message got updated
    const message = await inbox.methods.message().call();
	  assert.equal(message, 'bye');
  });

});