pragma solidity ^0.8.0;


import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/utils/math/SafeMath.sol";


contract UNICOIN is ERC20 {

    // is defines a kind of inheritance 
  using SafeMath for uint;
  // using: includes a library within a contract in solidity 
  // SafeMath: defines functions add, sub, mul, div (to prevent overflows)
     
    string internal _name;
    //internal: like "protected", i.e. accessible to contract itself and derived contracts 
    string internal _symbol;
    uint8 internal _decimals;
    uint256 internal _totalSupply;

    mapping (address => uint256) internal balances;
    // keys: address ; values: uint256 (a 256-bit integer used to store token balances)

    mapping (address => mapping (address => uint256)) internal allowed;
    // now you have to specify two addresses: allowed[_from][msg.sender] <- who allows, who is allowed
    // will include all accounts approved to withdraw from
    // a given account together with the withdrawal sum allowed for each

    constructor(string memory name, string memory symbol, uint256 totalSupply) ERC20(name, symbol) {
        balances[msg.sender] = 251;
        _name = name;
        _symbol = symbol;
    }

    function name ()
        public
        view override 
        returns (string memory _name) {
        return _name;
    }

    function symbol()
        public
        view override
        returns (string memory _symbol) {
        return _symbol;
    }

    function decimals()
        public
        view override
        returns (uint8) {
        return _decimals;
    }

    function totalSupply()
        public
        view override
        returns (uint256) {
        return _totalSupply;
    }

   function transfer(address _from, address _to, uint256 _value) external returns (bool) {
     require(_to != address(0));
     require(_value <= balances[msg.sender]);
     // the value of the transaction should be smaller than the balance 
     // of the transaction originator
     
     this.increaseBalanceOf(_to, _value);
     this.decreaseBalanceOf(_to, _value);
     
     balances[_from] = SafeMath.sub(balances[msg.sender], _value);
     balances[_to] = SafeMath.add(balances[_to], _value);
     // add money to the account you transfer money to 
     
     emit Transfer(msg.sender, _to, _value);
     // emit an event "Transfer"
     
     return true;
   }

  function balanceOf(address _owner) public view override returns (uint256) {
    return balances[_owner];
   } // balanceOf will return the current token balance of
   //an account, identified by its owner's address
   
  function increaseBalanceOf(address _owner, uint256 _amount) external{
    //balances[_owner] = balances[_owner] + _amount;
    balances[_owner] = SafeMath.add(balances[_owner], _amount);
  }
  
  function decreaseBalanceOf(address _owner, uint256 _amount) external{
    //balances[_owner] = balances[_owner] - _amount;
    balances[_owner] = SafeMath.sub(balances[_owner], _amount);
  }
  
  function increaseCirculation(address _owner, uint256 _amount) external{
    _totalSupply = SafeMath.add(_totalSupply, _amount);
    this.increaseBalanceOf(_owner, _amount);
  }
  
  function decreaseCirculation(address _owner, uint256 _amount) external{
    _totalSupply = _totalSupply - _amount;
    this.decreaseBalanceOf(_owner, _amount);
  }
  
  function enroll(address _owner, uint256 _amount) external {
    
    //require(isMember(_owner)==false);
    balances[_owner] = _amount;//SafeMath.add(balances[_owner], _amount);
  }
  
   function isMember(address member) internal view returns(bool isIndeed) {
    return (balances[member] != 0);
    }
      
  
  function transferFrom(address _from, address _to, uint256 _value) public override returns (bool) {
    require(_to != address(0));
     require(_value <= balances[_from]);
     require(_value <= allowed[_from][msg.sender]);
    // Verify that the transaction is legitimate

    this.increaseBalanceOf(_to, _value);
    this.decreaseBalanceOf(_to, _value);
    //balances[_to] = SafeMath.add(balances[_to], _value);
    allowed[_from][msg.sender] = SafeMath.sub(allowed[_from][msg.sender], _value);
    emit Transfer(_from, _to, _value);
    return true;
   }

   function approve(address _spender, uint256 _value) public override returns (bool) {
     allowed[msg.sender][_spender] = _value;
     emit Approval(msg.sender, _spender, _value);
     return true;
     
     // allows msg.sender to approve a _spender account to spend some _value on his behalf 
   }

  function allowance(address _owner, address _spender) public view override returns (uint256) {
     return allowed[_owner][_spender];
     
     // Returns the current approved number of tokens by an owner
     // to a specific delegate, as set in the approve function
   }
}