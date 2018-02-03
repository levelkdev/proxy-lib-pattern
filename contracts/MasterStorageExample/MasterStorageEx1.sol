pragma solidity ^0.4.18;

import "../MasterStorage/MasterStorage.sol";

contract MasterStorageEx1 {

  MasterStorage _store;

  function MasterStorageEx1(MasterStorage store) public {
    _store = store;
  }

  function setNum(uint256 n) public {
    _store.setUint("number", n);
  }

  function getNum() public view returns (uint256) {
    return _store.getUint("number");
  }

}