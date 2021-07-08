pragma solidity ^0.8.0;


import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/utils/math/SafeMath.sol";
import "./User.sol";
import "./Datetime.sol";
import "./Bicycle.sol";


contract Everything {
    address UNICOINaddress;
    UNICOIN unicoin;
    
    mapping (address => User) internal users;
    mapping(bytes32 => Bicycle) internal bicycles;
    mapping(address => Bicycle[]) internal UserToBicycles;
    
    uint256 initialBalance = 10;
    
    constructor(address _UNICOINaddress){
        UNICOINaddress = _UNICOINaddress;
        unicoin = UNICOIN(UNICOINaddress);
    }

    function enrollUser(string memory _name, string memory _surname, uint _id, address _eth_address, bool _isCurator) public{
        //require(users[_eth_address].UserInfo.exists == false, "This user already exists!");
        users[_eth_address] = new User(_name, _surname, _id, _eth_address, _isCurator, UNICOINaddress);
        UNICOIN(unicoin).enroll(_eth_address, initialBalance);
    }
    
    function enrollBicycle(address _owner) public{
        Bicycle new_bicycle = new Bicycle(_owner, UNICOINaddress);
        bicycles[Bicycle(new_bicycle).getBicycleID()] = new_bicycle;
        UserToBicycles[_owner].push(new_bicycle);
    }

    
}