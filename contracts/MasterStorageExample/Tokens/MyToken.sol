pragma solidity ^0.4.18;

import "../../MasterStorage/ERC20Storage.sol";
import "../../MasterStorage/MasterStorage.sol";

contract MyToken {

  event Transfer(address indexed from, address indexed to, uint value);
  event Approval(address indexed owner, address indexed spender, uint value);

  ERC20Storage _store;

  function MyToken(ERC20Storage erc20Proxy, MasterStorage store, uint256 initialSupply) public {
    _store = ERC20Storage(store);
    _store.setProxy(erc20Proxy);
    _store.addSupply(initialSupply);
  }

  function totalSupply() public view returns (uint256) {
    return _store.totalSupply();
  }
  
  /* function init(ERC20LibInterface.TokenStorage storage self, uint _initial_supply) public {
    self.totalSupply_ = _initial_supply;
    self.balances[msg.sender] = _initial_supply;
  }

  function transfer(ERC20LibInterface.TokenStorage storage self, address _to, uint _value) public returns (bool success) {
    self.balances[msg.sender] = self.balances[msg.sender].minus(_value);
    self.balances[_to] = self.balances[_to].plus(_value);
    Transfer(msg.sender, _to, _value);
    return true;
  }

  function transferFrom(ERC20LibInterface.TokenStorage storage self, address _from, address _to, uint _value) public returns (bool success) {
    var _allowance = self.allowed[_from][msg.sender];

    self.balances[_to] = self.balances[_to].plus(_value);
    self.balances[_from] = self.balances[_from].minus(_value);
    self.allowed[_from][msg.sender] = _allowance.minus(_value);
    Transfer(_from, _to, _value);
    return true;
  }

  function balanceOf(ERC20LibInterface.TokenStorage storage self, address _owner) public constant returns (uint balance) {
    return self.balances[_owner];
  }

  function totalSupply(ERC20LibInterface.TokenStorage storage self) public view returns (uint256) {
    return self.totalSupply_;
  }

  function approve(ERC20LibInterface.TokenStorage storage self, address _spender, uint _value) public returns (bool success) {
    self.allowed[msg.sender][_spender] = _value;
    Approval(msg.sender, _spender, _value);
    return true;
  }

  function allowance(ERC20LibInterface.TokenStorage storage self, address _owner, address _spender) public constant returns (uint remaining) {
    return self.allowed[_owner][_spender];
  } */
}
