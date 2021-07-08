//const { default: Contract } = require("web3/eth/contract");

var MyUser = artifacts.require("MyUser");

contract("MyUser", function(accounts){

    it("should call a function that depends on a linked library", async () => {
        const meta = await MyUser.deployed();
        //string memory _name, string memory _surname, uint _id, address _eth_address,
        //bool _isCurator, bool _exists
        await meta.addUser.sendTransaction("Joji", "Miller", "22", accounts[2], {from: accounts[0]});
        let coinBalance = await meta.balanceOf( accounts[2], {from: accounts[0]});
        let actualBalance = (coinBalance.toNumber());
        
        assert.equal(actualBalance, 10);
      });
});