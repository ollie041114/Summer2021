var kCLOUD = artifacts.require('KCLOUD');

module.exports = function(deployer) {
    deployer.deploy(kCLOUD)
    // .then(() => kCLOUD.deployed())
    // .then(_instance => {
    //     var KCLOUD = {
    //         "address": _instance.address
    //     }
    //     exportToJsonFile(KCLOUD);
    // }
        
        
    //     );
    // Additional contracts can be deployed here
};


function exportToJsonFile(jsonData) {
    const fs = require('fs');
    const data = JSON.stringify(jsonData);

// write JSON string to a file
    fs.writeFile('kcloud_data.json', data, (err) => {
        if (err) {
            throw err;
        }
        console.log("JSON data is saved.");
    });
}