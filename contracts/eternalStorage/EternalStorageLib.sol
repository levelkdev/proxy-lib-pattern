pragma solidity 0.4.18;

library EternalStorageLib {
  struct Storage {
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
  function getAddress(Storage storage self, bytes32 key) external view returns (address) {
      return self.addressStorage[key];
  }

  /// @param self The storage struct
  /// @param key The key for the record
  function getUint(Storage storage self, bytes32 key) external view returns (uint) {
      return self.uIntStorage[key];
  }

  /// @param self The storage struct
  /// @param key The key for the record
  function getString(Storage storage self, bytes32 key) external view returns (string) {
      return self.stringStorage[key];
  }

  /// @param self The storage struct
  /// @param key The key for the record
  function getBytes(Storage storage self, bytes32 key) external view returns (bytes) {
      return self.bytesStorage[key];
  }

  /// @param self The storage struct
  /// @param key The key for the record
  function getBool(Storage storage self, bytes32 key) external view returns (bool) {
      return self.boolStorage[key];
  }

  /// @param self The storage struct
  /// @param key The key for the record
  function getInt(Storage storage self, bytes32 key) external view returns (int) {
      return self.intStorage[key];
  }

  /**** Set Methods ***********/

  /// @param self The storage struct
  /// @param key The key for the record
  function setAddress(Storage storage self, bytes32 key, address _value) external {
      self.addressStorage[key] = _value;
  }

  /// @param self The storage struct
  /// @param key The key for the record
  function setUint(Storage storage self, bytes32 key, uint _value) external {
      self.uIntStorage[key] = _value;
  }

  /// @param self The storage struct
  /// @param key The key for the record
  function setString(Storage storage self, bytes32 key, string _value) external {
      self.stringStorage[key] = _value;
  }

  /// @param self The storage struct
  /// @param key The key for the record
  function setBytes(Storage storage self, bytes32 key, bytes _value) external {
      self.bytesStorage[key] = _value;
  }

  /// @param self The storage struct
  /// @param key The key for the record
  function setBool(Storage storage self, bytes32 key, bool _value) external {
      self.boolStorage[key] = _value;
  }

  /// @param self The storage struct
  /// @param key The key for the record
  function setInt(Storage storage self, bytes32 key, int _value) external {
      self.intStorage[key] = _value;
  }

  /**** Delete Methods ***********/

  /// @param self The storage struct
  /// @param key The key for the record
  function deleteAddress(Storage storage self, bytes32 key) external {
      delete self.addressStorage[key];
  }

  /// @param self The storage struct
  /// @param key The key for the record
  function deleteUint(Storage storage self, bytes32 key) external {
      delete self.uIntStorage[key];
  }

  /// @param self The storage struct
  /// @param key The key for the record
  function deleteString(Storage storage self, bytes32 key) external {
      delete self.stringStorage[key];
  }

  /// @param self The storage struct
  /// @param key The key for the record
  function deleteBytes(Storage storage self, bytes32 key) external {
      delete self.bytesStorage[key];
  }

  /// @param self The storage struct
  /// @param key The key for the record
  function deleteBool(Storage storage self, bytes32 key) external {
      delete self.boolStorage[key];
  }

  /// @param self The storage struct
  /// @param key The key for the record
  function deleteInt(Storage storage self, bytes32 key) external {
      delete self.intStorage[key];
  }
}
