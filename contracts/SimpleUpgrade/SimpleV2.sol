pragma solidity ^0.4.18;

import "./SimpleV1.sol";

contract SimpleV2 is SimpleV1 {

  function setBalance(address owner, uint256 value) public {
    _store.setUint(keccak256("balances", owner), value);
  }

  function getBalance(address owner) view returns (uint256) {
    return _store.getUint(keccak256("balances", owner));
  }

}
