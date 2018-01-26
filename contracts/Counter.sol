pragma solidity 0.4.18;

import "./eternalStorage/EternalStorageLib.sol";

contract Counter {
  using EternalStorageLib for EternalStorageLib.KeyValueStore;

  EternalStorageLib.KeyValueStore store;

  function Counter() {
    store.setUint(keccak256("count"), 0);
  }

  function addOne() external {
    store.setUint(keccak256("count"), store.getUint(keccak256("count")) + 1);
  }

  function count() external view returns (uint256) {
    return store.getUint(keccak256("count"));
  }
}
