pragma solidity ^0.8.0;


import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/utils/math/SafeMath.sol";
import "./User.sol";
import "./Datetime.sol";
import "./Bicycle.sol";


contract Everything {
    // events 
    event NewUser(string _name, string _surname, string _email, uint _id, address _eth_address, bool _isCurator);
    event NewBicycle(address _owner, bytes32 BicycleId);
    event NewTransaction(uint256 transactionID, uint256 Openlatitude, uint256 Openlongitude, uint256 Closelatitude, uint256 Closelongitude, uint256 openTimestamp, uint256 closeTimestamp, uint256 fee_rate, uint totalFee, address borrower, address lender);
    
    address UNICOINaddress;
    UNICOIN unicoin;
    
    mapping (address => User) internal users;
    mapping(bytes32 => Bicycle) internal bicycles;
    mapping(address => mapping(bytes32 => Bicycle)) internal UserToBicycles;
    
    uint256 initialBalance = 100;
    uint256 fee = 10;
    
    constructor(address _UNICOINaddress){
        UNICOINaddress = _UNICOINaddress;
        unicoin = UNICOIN(UNICOINaddress);
    }

    function enrollUser(string memory _name, string memory _surname, string memory _email, uint _id, address _eth_address, bool _isCurator) public{
        //require(users[_eth_address].UserInfo.exists == false, "This user already exists!");
        users[_eth_address] = new User(_name, _surname, _email, _id, _eth_address, _isCurator, UNICOINaddress);
        UNICOIN(unicoin).enroll(_eth_address, initialBalance);
        emit NewUser(_name, _surname, _email, _id, _eth_address, _isCurator);
    }
    
    function enrollBicycle(address _owner) public{
        Bicycle new_bicycle = new Bicycle(_owner, UNICOINaddress, fee);
        bicycles[Bicycle(new_bicycle).getBicycleID()] = new_bicycle;
        UserToBicycles[_owner][Bicycle(new_bicycle).getBicycleID()] = new_bicycle;
        emit NewBicycle(_owner, Bicycle(new_bicycle).getBicycleID());
    }
    
    function openBicycleTransaction(uint256 _latitude, uint256 _longitude, uint256 _timeStamp, string memory _location, address _borrower, address _owner, bytes32 _bicycle_number) public{
        UserToBicycles[_owner][_bicycle_number].openTransaction(_latitude, _longitude, _timeStamp, _borrower);
    }
    
    function closeBicycleTransaction(uint256 _latitude, uint256 _longitude, uint256 _timeStamp, address _owner, bytes32 _bicycle_number) public{
        
        // emitting an event
    (uint256 transactionID, uint256 Openlatitude, uint256 Openlongitude, uint256 Closelatitude, uint256 Closelongitude) 
     = UserToBicycles[_owner][_bicycle_number].closeTransaction(_latitude, _longitude, _timeStamp);
    (uint256 openTimestamp, uint256 closeTimestamp, uint256 fee_rate, uint totalFee, address borrower, address lender)
    =  UserToBicycles[_owner][_bicycle_number].getCloseTransactionDetails();
    emit NewTransaction(transactionID, Openlatitude, Openlongitude, Closelatitude, Closelongitude, openTimestamp, closeTimestamp, fee_rate, totalFee, borrower, lender);
    }
    
    
    
}