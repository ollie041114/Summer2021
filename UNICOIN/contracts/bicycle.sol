pragma solidity ^0.8.0;

//import "./User.sol";
import "./Datetime.sol";
import "./UnicInterface.sol";

contract Bicycle{

    //using Datetime for Datetime;
    uint256 private transactionCounter = 0;
    abstractBicycleInfo public BicycleInfo;
    uint256 public fee;
    
    bool AllPreviousTransactionsClosed = true; 
    
    UNICOIN unicoinInBicycle;
    
    constructor(address _owner_address, address UNICOINaddress, uint256 _fee) {
        BicycleInfo.owner = _owner_address;
        BicycleInfo.bicycleId = keccak256(abi.encodePacked(_owner_address));
        unicoinInBicycle = UNICOIN(UNICOINaddress);
        fee = _fee;
    }
    
    struct transaction{
        uint256 transactionID;
        
        uint256 Openlatitude;
        uint256 Openlongitude;
        
        uint256 Closelatitude;
        uint256 Closelongitude;
        
        DateTime openTime;
        DateTime closeTime;
        uint256 fee_rate;
        uint totalFee;
        address borrower;
        address lender;
    }
    
    struct abstractBicycleInfo{
        address owner;
        bytes32 bicycleId;
        transaction[] transactionHistory;
    }
    
    function getBicycleID() public returns (bytes32){
        return BicycleInfo.bicycleId;
    }
    
    
    function openTransaction(uint256 _latitude, uint256 _longitude, uint256 _timeStamp, address _borrower) public{
        // Handling longitude and latitude
        uint256 decimals = 6;
        require(AllPreviousTransactionsClosed == true, "You have one unfinished transaction!");
        DateTime openTime = new DateTime();
        openTime.setDate(_timeStamp);
        
        DateTime closeTime = new DateTime();
        closeTime.setDate(_timeStamp);
        transaction memory new_transaction = transaction(transactionCounter, _latitude, _longitude, 0, 0, openTime, closeTime, 10, 0, _borrower, BicycleInfo.owner);
        BicycleInfo.transactionHistory.push(new_transaction);
        AllPreviousTransactionsClosed = false;
    }
    
    transaction forClosure;
    function closeTransaction(uint256 _latitude, uint256 _longitude, uint256 _timeStamp) public returns (uint256, uint256, uint256, uint256, uint256){
        BicycleInfo.transactionHistory[transactionCounter].closeTime.setDate(_timeStamp);
        BicycleInfo.transactionHistory[transactionCounter].totalFee = getTotalFee(BicycleInfo.transactionHistory[transactionCounter]);
        
        // Handling longitude and latitude
        BicycleInfo.transactionHistory[transactionCounter].Closelatitude = _latitude;
        BicycleInfo.transactionHistory[transactionCounter].Closelongitude = _longitude;
        
        transaction memory my_transaction = BicycleInfo.transactionHistory[transactionCounter];
        forClosure = my_transaction;
        
        UNICOIN(unicoinInBicycle).transfer(my_transaction.borrower, my_transaction.lender, my_transaction.totalFee);
        
        transactionCounter = transactionCounter + 1;
        AllPreviousTransactionsClosed = true;
        return (my_transaction.transactionID, my_transaction.Openlatitude, my_transaction.Openlongitude, my_transaction.Closelatitude, my_transaction.Closelongitude);
    }
    
    function getCloseTransactionDetails() public returns (uint256, uint256, uint256, uint, address, address) {
        return (forClosure.openTime.getMytimestamp(), forClosure.closeTime.getMytimestamp(), forClosure.fee_rate, forClosure.totalFee, forClosure.borrower, forClosure.lender);
    }
    function getTotalFee(transaction memory my_transaction) public returns (uint){
        DateTime differenceTime = new DateTime();
        differenceTime.
            setDate(
                    differenceTime.getDifferenceinTimeStamp(
                        my_transaction.openTime.getMyDatetime(),
                        my_transaction.closeTime.getMyDatetime()
                )
            );
        return differenceTime.getMytimestamp()*fee;
    }
    
}