var Everything = artifacts.require("/.Everything.sol");
var UNICOIN = artifacts.require("/.UNICOIN.sol");

module.exports = function(deployer, network, accounts) {
    // (string memory _name, string memory _surname, uint _id, address _eth_address)
    deployer.deploy(UNICOIN, "UNICOIN", "UNI", "200000000000").then(function(){
      return deployer.deploy(Everything, UNICOIN.address)
    });
};