pragma solidity ^0.4.18;

import "../MasterStorage/MasterStorage.sol";
import "./PublicUpgradable.sol";

contract MasterStorageEx1 is PublicUpgradable {

  function MasterStorageEx1(MasterStorage store) public PublicUpgradable(store) { }

  function setNum(uint256 n) public {
    _store.setUint("number", n);
  }

  function getNum() public view returns (uint256) {
    return _store.getUint("number");
  }

}