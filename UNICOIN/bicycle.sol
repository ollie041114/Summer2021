pragma solidity ^0.8.0;

import "./MyUser.sol";
import "./UNICOIN.sol";
import "./DateTime.sol";

contract bicycle{
    //using Datetime for Datetime;
    uint256 private transactionCounter = 0;
    
    constructor() {
        
    }
    
    struct transaction{
        uint256 transactionID;
        DateTime openTime;
        DateTime closeTime;
        string openLoc;
        string closeLoc; 
    }
    
    struct abstractBicycleInfo{
        address owner;
        uint256 bicycleId;
        transaction[] transactionHistory;
    }
    abstractBicycleInfo public BicycleInfo;
    
    
    function openTransaction(uint256 _timeStamp, string memory _location) public{
        DateTime openTime = new DateTime();
        openTime.setDate(_timeStamp);
        
        DateTime closeTime = new DateTime();
        closeTime.setDate(_timeStamp);
        transaction memory new_transaction = transaction(transactionCounter, openTime, closeTime,
        _location, _location);
        BicycleInfo.transactionHistory.push(new_transaction);
        transactionCounter = transactionCounter + 1;
    }
    
    function closeTransaction(uint256 _timeStamp, string memory _location) public{
        BicycleInfo.transactionHistory[transactionCounter-1].closeTime.setDate(_timeStamp);
        BicycleInfo.transactionHistory[transactionCounter-1].closeLoc = _location;
    }
}