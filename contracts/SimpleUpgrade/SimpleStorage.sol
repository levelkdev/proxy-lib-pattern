pragma solidity ^0.4.18;

import "../EternalStorage/EternalStorageLib.sol";

contract SimpleStorage {
  using EternalStorageLib for EternalStorageLib.KeyValueStore;
  EternalStorageLib.KeyValueStore _store;
}
