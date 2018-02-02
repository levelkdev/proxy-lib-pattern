pragma solidity ^0.4.18;

import "./SimpleStorageLib.sol";

contract SimpleStorage {
  using SimpleStorageLib for SimpleStorageLib.KeyValueStore;
  SimpleStorageLib.KeyValueStore _store;
}
