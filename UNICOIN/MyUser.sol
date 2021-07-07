pragma solidity ^0.8.0;


import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/utils/math/SafeMath.sol";
import "./UNICOIN.sol";

contract MyUser {
    
    // is defines a kind of inheritance 
    using SafeMath for uint;
    
    struct UserInfo {
        string name;
        string surname;
        uint id;
        address eth_address;
        bool isCurator;
        bool exists;
    }
    
    
    // string memory name, string memory symbol, uint256 totalSupply) ERC20("UNICOIN", "UNIc"
    UNICOIN public unicoin = new UNICOIN("UNICOIN", "UNIc", 10000);

    function balanceOf() public view{
        //require (_counters[msg.sender] != Counter(0));
        UNICOIN(unicoin).balanceOf(msg.sender);
    }
    
    uint initialBalance = 10;
    
    //mapping (address => uint256) internal balances;
    mapping (address => UserInfo) internal users;
    
    bool deployed = false; 
    event UserAdded(string _name, string _surname, uint _id, 
    address _eth_address, bool _isCurator, bool _exists);
    
    modifier addsUser(string memory _name, string memory _surname, uint _id, address _eth_address,
    bool _isCurator, bool _exists){
        require(users[msg.sender].exists == false, "This user already exists!");
        _;
        string memory name = _name;
        string memory surname = _surname;
        uint id = _id;
        bool isCurator = _isCurator;
        bool exists = _exists;
        address eth_address = _eth_address;
        UNICOIN(unicoin).enroll(_eth_address, initialBalance);
        UserInfo memory new_user = UserInfo(name, surname, id, eth_address, isCurator, exists);
        users[_eth_address] = new_user;
        emit UserAdded(name, surname, id, eth_address, isCurator, exists);
    }
    
    function addCurator(string memory _name, string memory _surname, uint _id, address _eth_address)
    addsUser(_name, _surname, _id, _eth_address, true, true)
    public{
        if (deployed == true){
          require(users[msg.sender].isCurator, "This user is not the curator.");
        }else if (deployed == false){
            deployed = true;
        }

    }     
    
    function addUser(string memory _name, string memory _surname, uint _id)
    addsUser(_name, _surname, _id, msg.sender, false, true)
    public{
          // require(users[msg.sender].exists, "This user is not the curator.");
    }

    constructor (string memory _name, string memory _surname, uint _id, address _eth_address) {
        addCurator(_name, _surname, _id,
                    msg.sender);
        //UNICOIN(unicoin).increaseBalanceOf(msg.sender, 100);
        
    }
    
}
