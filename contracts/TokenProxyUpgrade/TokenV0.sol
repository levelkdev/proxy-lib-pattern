pragma solidity ^0.4.18;

import "zeppelin-solidity/contracts/Math/SafeMath.sol";
import "./UpgradableTokenStorage.sol";

contract TokenV0 is UpgradableTokenStorage {
  using SafeMath for uint256;
  event Initialized(address initializer, uint256 value);
  event Transfer(address indexed from, address indexed to, uint256 value);
  event Approval(address indexed owner, address indexed spender, uint256 value);

  function init() public {
    uint256 initAmount = 1 * 10**9;
    _balances[msg.sender] = initAmount;
    _totalSupply = _totalSupply.add(initAmount);
    Initialized(msg.sender, initAmount);
  }

  function totalSupply() public view returns (uint256) {
    return _totalSupply;
  }

  function balanceOf(address owner) public view returns (uint256 balance) {
    return _balances[owner];
  }

  function transfer(address to, uint256 value) public returns (bool) {
    require(to != address(0));
    require(value <= _balances[msg.sender]);

    // SafeMath.sub will throw if there is not enough balance.
    _balances[msg.sender] = _balances[msg.sender].sub(value);
    _balances[to] = _balances[to].add(value);
    Transfer(msg.sender, to, value);
    return true;
  }

  function transferFrom(address from, address to, uint256 value) public returns (bool) {
    require(to != address(0));
    require(value <= _balances[from]);
    require(value <= _allowed[from][msg.sender]);

    _balances[from] = _balances[from].sub(value);
    _balances[to] = _balances[to].add(value);
    _allowed[from][msg.sender] = _allowed[from][msg.sender].sub(value);
    Transfer(from, to, value);
    return true;
  }

  function approve(address spender, uint256 value) public returns (bool) {
    _allowed[msg.sender][spender] = value;
    Approval(msg.sender, spender, value);
    return true;
  }
}
