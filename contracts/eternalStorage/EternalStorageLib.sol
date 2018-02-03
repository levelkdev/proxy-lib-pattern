pragma solidity ^0.4.18;

library EternalStorageLib {
  struct KeyValueStore {
    mapping(bytes32 => uint256) _uintStorage;
    mapping(bytes32 => string) _stringStorage;
    mapping(bytes32 => address) _addressStorage;
    mapping(bytes32 => bytes) _bytesStorage;
    mapping(bytes32 => bool) _boolStorage;
    mapping(bytes32 => int256) _intStorage;
  }

  /**** Get Methods ***********/

  /// @param self The storage struct
  /// @param key The key for the record
  function getAddress(KeyValueStore storage self, bytes32 key) view returns (address) {
      return self._addressStorage[key];
  }

  /// @param self The storage struct
  /// @param key The key for the record
  function getUint(KeyValueStore storage self, bytes32 key) view returns (uint) {
      return self._uintStorage[key];
  }

  /// @param self The storage struct
  /// @param key The key for the record
  function getString(KeyValueStore storage self, bytes32 key) view returns (string) {
      return self._stringStorage[key];
  }

  /// @param self The storage struct
  /// @param key The key for the record
  function getBytes(KeyValueStore storage self, bytes32 key) view returns (bytes) {
      return self._bytesStorage[key];
  }

  /// @param self The storage struct
  /// @param key The key for the record
  function getBool(KeyValueStore storage self, bytes32 key) view returns (bool) {
      return self._boolStorage[key];
  }

  /// @param self The storage struct
  /// @param key The key for the record
  function getInt(KeyValueStore storage self, bytes32 key) view returns (int) {
      return self._intStorage[key];
  }

  /**** Set Methods ***********/

  /// @param self The storage struct
  /// @param key The key for the record
  function setAddress(KeyValueStore storage self, bytes32 key, address value) {
      self._addressStorage[key] = value;
  }

  /// @param self The storage struct
  /// @param key The key for the record
  function setUint(KeyValueStore storage self, bytes32 key, uint value) {
      self._uintStorage[key] = value;
  }

  /// @param self The storage struct
  /// @param key The key for the record
  function setString(KeyValueStore storage self, bytes32 key, string value) {
      self._stringStorage[key] = value;
  }

  /// @param self The storage struct
  /// @param key The key for the record
  function setBytes(KeyValueStore storage self, bytes32 key, bytes value) {
      self._bytesStorage[key] = value;
  }

  /// @param self The storage struct
  /// @param key The key for the record
  function setBool(KeyValueStore storage self, bytes32 key, bool value) {
      self._boolStorage[key] = value;
  }

  /// @param self The storage struct
  /// @param key The key for the record
  function setInt(KeyValueStore storage self, bytes32 key, int value) {
      self._intStorage[key] = value;
  }

  /**** Delete Methods ***********/

  /// @param self The storage struct
  /// @param key The key for the record
  function deleteAddress(KeyValueStore storage self, bytes32 key) {
      delete self._addressStorage[key];
  }

  /// @param self The storage struct
  /// @param key The key for the record
  function deleteUint(KeyValueStore storage self, bytes32 key) {
      delete self._uintStorage[key];
  }

  /// @param self The storage struct
  /// @param key The key for the record
  function deleteString(KeyValueStore storage self, bytes32 key) {
      delete self._stringStorage[key];
  }

  /// @param self The storage struct
  /// @param key The key for the record
  function deleteBytes(KeyValueStore storage self, bytes32 key) {
      delete self._bytesStorage[key];
  }

  /// @param self The storage struct
  /// @param key The key for the record
  function deleteBool(KeyValueStore storage self, bytes32 key) {
      delete self._boolStorage[key];
  }

  /// @param self The storage struct
  /// @param key The key for the record
  function deleteInt(KeyValueStore storage self, bytes32 key) {
      delete self._intStorage[key];
  }
}
