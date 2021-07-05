const solcImport = require('solc-import');
var solc = require('solc');
// compile code will go here
const path = require('path');
// Helps us build a directory path to Inbox.sol file - we are guaranteed to get cross-
// platform compatibility (the paths will be written differently in Windows etc)
const fs = require('fs');

const inboxPath = path.resolve(__dirname, 'contracts', 'Lottery.sol');
const source = fs.readFileSync(inboxPath, 'utf8');

let myDB = new Map();
myDB.set('ERC20.sol', 'library L { function f() internal returns (uint) { return 7; } }');
 
const getImportContent = async function (path) {
  return myDB.get(path);
};
 
const sourceCodeIncludeImport = source;

const sources = async function () {
  let sources = await solcImport.combineSource(sourceCodeIncludeImport, getImportContent);
  return sources;
};
console.log(sources);