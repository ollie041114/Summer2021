interface IUNICOIN{
   function transfer(address _from, address _to, uint256 _value) external returns (bool);

  function increaseBalanceOf(address _owner, uint256 _amount) external;  
  function decreaseBalanceOf(address _owner, uint256 _amount) external;
  function increaseCirculation(address _owner, uint256 _amount) external;
  function decreaseCirculation(address _owner, uint256 _amount) external;
  function enroll(address _owner, uint256 _amount) external;
}