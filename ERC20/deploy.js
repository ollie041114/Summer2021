// deploy code will go here
const HDWalletProvider = require('truffle-hdwallet-provider');
const Web3 = require('web3');
const {interface, bytecode} = require('./compile');
// Since we're in the same directory as the compile file, use only one dot

const provider = new HDWalletProvider(
    // your account mnemonic
    'miracle only receive service quick forget strike taste tuition ship future nothing',
    
    // URL of the network we are trying to connect to, gotten from Infura
    'https://ropsten.infura.io/v3/8423219ae8424432b234f409e9462eae'
);

const web3 = new Web3(provider);

//arbitrarily write a function to use the async/await syntax
const deploy = async() => {
    //Get accounts associated with the contract and the mnemonic
    const accounts = await web3.eth.getAccounts();
    console.log('Attempting to deploy from account', accounts[0]);
    // Print out the account paying for the deployment (the first account,
    // because a single mnemonic corresponds to many accounts)


    //Make a new instance of our smart contract provide your ABI
    const result = await new web3.eth.Contract(JSON.parse(interface))
    .deploy({data: bytecode, arguments: ['Hi there!']})
    .send({gas: '1000000', from: accounts[0]});

    console.log('Contract deployed to', result.options.address);
};

deploy();