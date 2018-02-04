pragma solidity ^0.4.18;

import "../MasterStorage/MasterStorage.sol";
import "./PublicUpgradable.sol";

contract MasterStorageEx2 is PublicUpgradable {

  function MasterStorageEx2(MasterStorage store) public PublicUpgradable(store) { }

  function getNum() public view returns (uint256) {
    return _store.getUint("number");
  }

}