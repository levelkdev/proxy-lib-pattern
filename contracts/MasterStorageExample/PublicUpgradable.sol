pragma solidity ^0.4.18;

import "../MasterStorage/MasterStorage.sol";

contract PublicUpgradable {

  MasterStorage internal _store;

  function PublicUpgradable(MasterStorage store) public {
    _store = store;
  }

  function upgrade(address newOwner) public {
    _store.transferOwnership(newOwner);
  }

}