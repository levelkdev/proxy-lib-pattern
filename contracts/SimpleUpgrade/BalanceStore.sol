pragma solidity ^0.4.18;

import "./SimpleStorage.sol";

contract BalanceStore is SimpleStorage {

  function setBalance(address owner, uint256 value) internal {
    _store.setUint(keccak256("balances", owner), value);
  }

  function getBalance(address owner) view returns (uint256) {
    return _store.getUint(keccak256("balances", owner));
  }

}