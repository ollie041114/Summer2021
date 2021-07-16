pragma solidity ^0.8.0;

//import "./User.sol";
import "./Datetime.sol";
import "./UnicInterface.sol";
import "./UNICOIN.sol";
contract Bicycle{

    //using Datetime for Datetime;
    uint256 private transactionCounter = 0;
    abstractBicycleInfo public BicycleInfo;
    uint256 public fee = 10;
    
    bool AllPreviousTransactionsClosed = true; 
    
    UNICOIN unicoinInBicycle;
    
    constructor(address _owner_address, address UNICOINaddress) {
        BicycleInfo.owner = _owner_address;
        BicycleInfo.bicycleId = keccak256(abi.encodePacked(_owner_address));
        unicoinInBicycle = UNICOIN(UNICOINaddress);
    }
    
    struct transaction{
        uint256 transactionID;
        DateTime openTime;
        DateTime closeTime;
        string openLoc;
        string closeLoc; 
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
    
    
    function openTransaction(uint256 _timeStamp, string memory _location, address _borrower) public{
        require(AllPreviousTransactionsClosed == true, "You have one unfinished transaction!");
        DateTime openTime = new DateTime();
        openTime.setDate(_timeStamp);
        
        DateTime closeTime = new DateTime();
        closeTime.setDate(_timeStamp);
        transaction memory new_transaction = transaction(transactionCounter, openTime, closeTime,
        _location, _location, 10, 0, _borrower, BicycleInfo.owner);
        BicycleInfo.transactionHistory.push(new_transaction);
        AllPreviousTransactionsClosed = false;
    }
    
    function closeTransaction(uint256 _timeStamp, string memory _location) public{
        BicycleInfo.transactionHistory[transactionCounter].closeTime.setDate(_timeStamp);
        BicycleInfo.transactionHistory[transactionCounter].closeLoc = _location;
        BicycleInfo.transactionHistory[transactionCounter].totalFee = getTotalFee(BicycleInfo.transactionHistory[transactionCounter]);
        transaction memory my_transaction = BicycleInfo.transactionHistory[transactionCounter];
        UNICOIN(unicoinInBicycle).transfer(my_transaction.borrower, my_transaction.lender, my_transaction.totalFee);
        transactionCounter = transactionCounter + 1;
        AllPreviousTransactionsClosed = true;
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