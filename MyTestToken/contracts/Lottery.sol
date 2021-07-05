// SPDX-License-Identifier: MIT
pragma solidity ^0.8.6;


import "ERC20.sol";
import "@openzeppelin/contracts/utils/math/SafeMath.sol";


contract Lottery is ERC20 {
    // is defines a kind of inheritance 
  using SafeMath for uint;
  // using: includes a library within a contract in solidity 
  // SafeMath: defines functions add, sub, mul, div (to prevent overflows)
     
    string internal _name;
    //internal: like "protected", i.e. accessible to contract itself and derived contracts 
    string internal _symbol;
    uint8 internal _decimals;
    uint256 internal currentSupply;
    uint256 internal exchange_rate;
    uint256 internal max;
    uint256 internal Supplyleft;

    mapping (address => uint256) public balances;
    // keys: address ; values: uint256 (a 256-bit integer used to store token balances)
    mapping (address => mapping (address => uint256)) internal allowed;
    // now you have to specify two addresses: allowed[_from][msg.sender] <- who allows, who is allowed
    // will include all accounts approved to withdraw from
    // a given account together with the withdrawal sum allowed for each

 
    constructor(string memory name, string memory symbol, uint8 decimals, address user1, address user2, address user3) ERC20(name, symbol) {
        
        _decimals = decimals;
        currentSupply = 30*3;
        balances[user1] = 30;
        balances[user2] = 30;
        balances[user3] = 30;
        exchange_rate = currentSupply*(0.00005 ether);
        max = 5000;
        Supplyleft = max - currentSupply;
        enroll(user1);
        enroll(user2);
        enroll(user3);
        // set the total amount of tokens, give them all to the "msg.sender",
        //... i.e. an account that executes the current contract function 
        
        // Note: a constructor is available only to a deploying account 
    }
    
    function enroll (address _user) public {
        require(max - currentSupply > 30);
        balances[_user] = balances[_user] + 30;
        currentSupply = currentSupply + 30;
        Supplyleft = max - currentSupply;
    }
    
    function getTokenCirculation() public view returns (uint256){
        return currentSupply;
    }
    
    function buyTokens(uint quantity) public payable{
        require(quantity + currentSupply <= max);
        require(msg.value == quantity*exchange_rate);
        
        balances[msg.sender] =balances[msg.sender] + quantity;
        currentSupply = currentSupply + quantity;
        Supplyleft = max - currentSupply;
    }
    
    function sellTokens(uint quantity) public{
        require(address(this).balance >= quantity*exchange_rate);
        balances[msg.sender] = balances[msg.sender] - quantity;
    }
    
    function getCurrentExchangeRate() public returns (uint256){
        // in Gweis:
        return currentSupply*50000;
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



   function transfer(address _to, uint256 _value) public override returns (bool) {
     require(_to != address(0));
     
     require(_value <= balances[msg.sender]);
     // the value of the transaction should be smaller than the balance 
     // of the transaction originator
     
     balances[msg.sender] = SafeMath.sub(balances[msg.sender], _value);
     balances[_to] = SafeMath.add(balances[_to], _value);
     // add money to the account you transfer money to 
     
     emit Transfer(msg.sender, _to, _value);
     // emit an event "Transfer"
     
     return true;
   }

  function balanceOf(address _owner) public view override returns (uint256 balance) {
    return balances[_owner];
   } // balanceOf will return the current token balance of
   //an account, identified by its owner's address

  function transferFrom(address _from, address _to, uint256 _value) public override returns (bool) {
    require(_to != address(0));
     require(_value <= balances[_from]);
     require(_value <= allowed[_from][msg.sender]);
    // Verify that the transaction is legitimate

    balances[_from] = SafeMath.sub(balances[_from], _value);
     balances[_to] = SafeMath.add(balances[_to], _value);
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

   function increaseApproval(address _spender, uint _addedValue) public returns (bool) {
     allowed[msg.sender][_spender] = SafeMath.add(allowed[msg.sender][_spender], _addedValue);
     emit Approval(msg.sender, _spender, allowed[msg.sender][_spender]);
     return true;
   }

  function decreaseApproval(address _spender, uint _subtractedValue) public returns (bool) {
     uint oldValue = allowed[msg.sender][_spender];
     if (_subtractedValue > oldValue) {
       allowed[msg.sender][_spender] = 0;
     } else {
       allowed[msg.sender][_spender] = SafeMath.sub(oldValue, _subtractedValue);
    }
     emit Approval(msg.sender, _spender, allowed[msg.sender][_spender]);
     return true;
   }

}