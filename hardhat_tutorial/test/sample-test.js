const { expect } = require("chai");
const { ethers } = require("hardhat");
const { providers } = require("web3");

let Greeter;
let greeter;

describe("Greeter", function() {
  // We separate it into a function 

  beforeEach(async function() {
    Greeter = await ethers.getContractFactory("MyTestToken");
    greeter = await Greeter.deploy("JojiCoin", "JOJI", '1', '0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266', '0x70997970C51812dc3A010C7d01b50e0d17dc79C8', '0x3C44CdDdB6a900fa2b585dd299e03d12FA4293BC');
    await greeter.deployed();
  });


  it("Token creation", async function() {
    console.log('lol');
    expect(await greeter.balanceOf('0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266')).to.equal("60");
    expect(await greeter.balanceOf('0x70997970C51812dc3A010C7d01b50e0d17dc79C8')).to.equal("60");
    expect(await greeter.balanceOf('0x3C44CdDdB6a900fa2b585dd299e03d12FA4293BC')).to.equal("60");

    expect(await greeter.remained()).to.equal("4820");
    expect(await greeter.getTokenCirculation()).to.equal("180");
    expect(await greeter.getCurrentExchangeRate()).to.equal("9000000");


    //const setGreetingTx = await greeter.setGreeting("Hola, mundo!");
    
    // wait until the transaction is mined
    //await setGreetingTx.wait();

    //expect(await greeter.greet()).to.equal("Hola, mundo!");
  });

  it("User A enrolls user D", async function() {
    //console.log('lol');
    const balanceD = await greeter.enroll('0x90F79bf6EB2c4f870365E785982E1f101E93b906');
    
    expect(await greeter.balanceOf('0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266')).to.equal("60");
    expect(await greeter.balanceOf('0x70997970C51812dc3A010C7d01b50e0d17dc79C8')).to.equal("60");
    expect(await greeter.balanceOf('0x3C44CdDdB6a900fa2b585dd299e03d12FA4293BC')).to.equal("60");
    expect(await greeter.balanceOf('0x90F79bf6EB2c4f870365E785982E1f101E93b906')).to.equal("30");

    expect(await greeter.getTokenCirculation()).to.equal("210");
    expect(await greeter.getCurrentExchangeRate()).to.equal("10500000");
  });
  
  it("User B sells 5 tokens", async function() {
    const [A, B, C, D] = await ethers.getSigners();
    //expect(await greeter.connect(B).sellTokens('5')).to.throw('Currently the balance isnt high enough');   
    
    //const es = 'Error: VM Exception while processing transaction: reverted with reason string \'Currently the balance isn\'t high enough\''
    await expect(greeter.connect(B).sellTokens('5')).to.be.reverted;
    //expect(async function(){await greeter.connect(B).balan();}).to.equal(60);   
  });

  it("User C buys 5 tokens", async function() {
    const balanceD = await greeter.enroll('0x90F79bf6EB2c4f870365E785982E1f101E93b906');
    
    const [A, B, C, D] = await ethers.getSigners();
    //expect(await greeter.connect(B).sellTokens('5')).to.throw('Currently the balance isnt high enough');   
    expect(await greeter.connect(C).getCurrentExchangeRate()).to.equal(10500000);
    
    await greeter.connect(C).buyTokens(5, {value: '52500000000000000'});
    
    expect(await greeter.connect(C).balanceOf('0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266')).to.equal(60);
    //expect(await greeter.connect(C).balanceOf(B)).to.equal(60);
    //expect(await greeter.connect(C).balanceOf(C)).to.equal(65);
    //expect(await greeter.connect(C).balanceOf(D)).to.equal(30);
    //expect(await greeter.connect(C).getCurrentExchangeRate()).to.equal(10750000);

    //expect(await greeter.contractBalance()).to.equal(52500000000000000);

    //expect(async function(){await greeter.connect(B).balan();}).to.equal(60);   
  });

  it("User B sells 2 tokens", async function() {
    let provider = ethers.getDefaultProvider();
    const balanceD = await greeter.enroll('0x90F79bf6EB2c4f870365E785982E1f101E93b906');
    
    const [A, B, C, D] = await ethers.getSigners();
    //expect(await greeter.connect(B).sellTokens('5')).to.throw('Currently the balance isnt high enough');   
    expect(await greeter.connect(C).getCurrentExchangeRate()).to.equal(10500000);
    
    await greeter.connect(C).buyTokens(5, {value: '52500000000000000'});
    
    expect(await greeter.connect(C).balanceOf('0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266')).to.equal(60);
    


    //expect(await greeter.connect(B).sellTokens('5')).to.throw('Currently the balance isnt high enough');   
    expect(await greeter.connect(B).getCurrentExchangeRate()).to.equal(10750000);
    
    await greeter.connect(B).buyTokens(2, {value: '21500000000000000'});
    
    expect(await provider.getBalance(greeter.address)).to.equal('31000000000000000');
    expect(await greeter.connect(C).balanceOf('0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266')).to.equal(60);
    expect(await greeter.connect(C).balanceOf('0x70997970C51812dc3A010C7d01b50e0d17dc79C8')).to.equal(58);
    expect(await greeter.connect(C).balanceOf('0x3C44CdDdB6a900fa2b585dd299e03d12FA4293BC')).to.equal(65);
    expect(await greeter.connect(C).balanceOf('0x90F79bf6EB2c4f870365E785982E1f101E93b906')).to.equal(30);

  });



});

  
