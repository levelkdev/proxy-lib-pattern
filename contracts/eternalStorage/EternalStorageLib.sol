pragma solidity 0.4.18;

library EternalStorageLib {
  struct KeyValueStore {
    mapping(bytes32 => uint256) uIntStorage;
    mapping(bytes32 => string) stringStorage;
    mapping(bytes32 => address) addressStorage;
    mapping(bytes32 => bytes) bytesStorage;
    mapping(bytes32 => bool) boolStorage;
    mapping(bytes32 => int256) intStorage;
  }

  /**** Get Methods ***********/

  /// @param self The storage struct
  /// @param key The key for the record
  function getAddress(KeyValueStore storage self, bytes32 key) view returns (address) {
      return self.addressStorage[key];
  }

  /// @param self The storage struct
  /// @param key The key for the record
  function getUint(KeyValueStore storage self, bytes32 key) view returns (uint) {
      return self.uIntStorage[key];
  }

  /// @param self The storage struct
  /// @param key The key for the record
  function getString(KeyValueStore storage self, bytes32 key) view returns (string) {
      return self.stringStorage[key];
  }

  /// @param self The storage struct
  /// @param key The key for the record
  function getBytes(KeyValueStore storage self, bytes32 key) view returns (bytes) {
      return self.bytesStorage[key];
  }

  /// @param self The storage struct
  /// @param key The key for the record
  function getBool(KeyValueStore storage self, bytes32 key) view returns (bool) {
      return self.boolStorage[key];
  }

  /// @param self The storage struct
  /// @param key The key for the record
  function getInt(KeyValueStore storage self, bytes32 key) view returns (int) {
      return self.intStorage[key];
  }

  /**** Set Methods ***********/

  /// @param self The storage struct
  /// @param key The key for the record
  function setAddress(KeyValueStore storage self, bytes32 key, address value) {
      self.addressStorage[key] = value;
  }

  /// @param self The storage struct
  /// @param key The key for the record
  function setUint(KeyValueStore storage self, bytes32 key, uint value) {
      self.uIntStorage[key] = value;
  }

  /// @param self The storage struct
  /// @param key The key for the record
  function setString(KeyValueStore storage self, bytes32 key, string value) {
      self.stringStorage[key] = value;
  }

  /// @param self The storage struct
  /// @param key The key for the record
  function setBytes(KeyValueStore storage self, bytes32 key, bytes value) {
      self.bytesStorage[key] = value;
  }

  /// @param self The storage struct
  /// @param key The key for the record
  function setBool(KeyValueStore storage self, bytes32 key, bool value) {
      self.boolStorage[key] = value;
  }

  /// @param self The storage struct
  /// @param key The key for the record
  function setInt(KeyValueStore storage self, bytes32 key, int value) {
      self.intStorage[key] = value;
  }

  /**** Delete Methods ***********/

  /// @param self The storage struct
  /// @param key The key for the record
  function deleteAddress(KeyValueStore storage self, bytes32 key) {
      delete self.addressStorage[key];
  }

  /// @param self The storage struct
  /// @param key The key for the record
  function deleteUint(KeyValueStore storage self, bytes32 key) {
      delete self.uIntStorage[key];
  }

  /// @param self The storage struct
  /// @param key The key for the record
  function deleteString(KeyValueStore storage self, bytes32 key) {
      delete self.stringStorage[key];
  }

  /// @param self The storage struct
  /// @param key The key for the record
  function deleteBytes(KeyValueStore storage self, bytes32 key) {
      delete self.bytesStorage[key];
  }

  /// @param self The storage struct
  /// @param key The key for the record
  function deleteBool(KeyValueStore storage self, bytes32 key) {
      delete self.boolStorage[key];
  }

  /// @param self The storage struct
  /// @param key The key for the record
  function deleteInt(KeyValueStore storage self, bytes32 key) {
      delete self.intStorage[key];
  }
}
