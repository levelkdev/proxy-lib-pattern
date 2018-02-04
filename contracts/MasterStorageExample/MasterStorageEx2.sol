pragma solidity ^0.4.18;

import "../MasterStorage/MasterStorage.sol";
import "./OwnerUpgradable.sol";

contract MasterStorageEx2 is OwnerUpgradable {

  function MasterStorageEx2(MasterStorage store) public OwnerUpgradable(store) { }

  function getNum() public view returns (uint256) {
    return _store.getUint("number");
  }

}