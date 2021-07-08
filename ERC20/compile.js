// compile code will go here
const path = require('path');
// Helps us build a directory path to Inbox.sol file - we are guaranteed to get cross-
// platform compatibility (the paths will be written differently in Windows etc)
const fs = require('fs');
const solc = require('solc');

const inboxPath = path.resolve(__dirname, 'contracts', 'Inbox.sol');
const source = fs.readFileSync(inboxPath, 'utf8');

// require in the source code, export, get immediate access to it (for other directories):
module.exports = solc.compile(source, 1).contracts[':Inbox'];
// We try to export only the contracts[':Inbox'] property, which contains
// the bytecode property and the ABI