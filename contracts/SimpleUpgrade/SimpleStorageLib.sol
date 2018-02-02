pragma solidity ^0.4.18;

library SimpleStorageLib {
  struct KeyValueStore {
    mapping(bytes32 => uint256) uintStorage;
  }

  function getUint(KeyValueStore storage self, bytes32 key) view returns (uint256) {
    return self.uintStorage[key];
  }

  function setUint(KeyValueStore storage self, bytes32 key, uint256 value) public {
    self.uintStorage[key] = value;
  }

}