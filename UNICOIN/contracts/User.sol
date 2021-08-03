pragma solidity ^0.8.0;


import "@openzeppelin/contracts/utils/math/SafeMath.sol";
import "./UnicInterface.sol";


contract User {
    // is defines a kind of inheritance 
    using SafeMath for uint;
    
    uint256 initialBalance = 10;
    bool deployed = false; 
    event UserAdded(string _name, string _surname, uint _id, address _eth_address, bool _isCurator, bool _exists);
    
    abstractUserInfo UserInfo;
    UNICOIN unicoinInUser;
    struct abstractUserInfo {
        string name;
        string surname;
        string email; 
        uint id;
        address eth_address;
        bool isCurator;
        bool exists;
    }
    // string memory name, string memory symbol, uint256 totalSupply) ERC20("UNICOIN", "UNIc"
    


    
    //mapping (address => uint256) internal balances;
    
    constructor (string memory _name, string memory _surname, string memory _email, uint _id, address _eth_address, bool _isCurator, address UNICOINaddress) {
        UserInfo = abstractUserInfo(_name, _surname, _email, _id, _eth_address, _isCurator, true);
        emit UserAdded(_name, _surname, _id, _eth_address, _isCurator, true);
        unicoinInUser = UNICOIN(UNICOINaddress);
        // UNICOIN(unicoin).enroll(_eth_address, initialBalance);
    }
    
}
