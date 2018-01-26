pragma solidity ^0.4.18;

import "zeppelin-solidity/contracts/Math/SafeMath.sol";
import "./TokenV0.sol";

contract TokenV1 is TokenV0 {
  using SafeMath for uint256;
  event Mint(address indexed to, uint256 amount);
  event Burn(address indexed burner, uint256 value);

  function mint(address to, uint256 amount) public returns (bool) {
    _totalSupply = _totalSupply.add(amount);
    _balances[to] = _balances[to].add(amount);
    Mint(to, amount);
    Transfer(address(0), to, amount);
    return true;
  }

  function burn(uint256 value) public {
    require(value <= _balances[msg.sender]);
    // no need to require value <= totalSupply, since that would imply the
    // sender's balance is greater than the totalSupply, which *should* be an assertion failure

    address burner = msg.sender;
    _balances[burner] = _balances[burner].sub(value);
    _totalSupply = _totalSupply.sub(value);
    Burn(burner, value);
  }
}
