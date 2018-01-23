pragma solidity ^0.4.18;

library ERC20LibInterface {
  struct TokenStorage {
    mapping (address => uint) balances;
    mapping (address => mapping (address => uint)) allowed;
    uint256 totalSupply_;
  }

  event Transfer(address indexed from, address indexed to, uint value);
  event Approval(address indexed owner, address indexed spender, uint value);
  
  function init(TokenStorage storage self, uint _initial_supply) public;
  function transfer(TokenStorage storage self, address _to, uint _value) public returns (bool success);
  function transferFrom(TokenStorage storage self, address _from, address _to, uint _value) public returns (bool success);
  function balanceOf(TokenStorage storage self, address _owner) public constant returns (uint balance);
  function totalSupply(TokenStorage storage self) public view returns (uint256);
  function approve(TokenStorage storage self, address _spender, uint _value) public returns (bool success);
  function allowance(TokenStorage storage self, address _owner, address _spender) public constant returns (uint remaining);
}
