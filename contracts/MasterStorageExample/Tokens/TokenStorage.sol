pragma solidity ^0.4.18;

import "zeppelin-solidity/contracts/math/SafeMath.sol";
import "../OwnerUpgradable.sol";

contract TokenStorage is OwnerUpgradable {
  using SafeMath for uint256;

  function addSupply(uint256 amount) public {
    uint256 totalSupply = _store.getUint("totalSupply");
    _store.setUint("totalSupply", totalSupply.add(amount));
  }

  function totalSupply() public view returns (uint256) {
    return _store.getUint("totalSupply");
  }

}
