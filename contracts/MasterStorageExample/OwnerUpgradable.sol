pragma solidity ^0.4.18;

import "zeppelin-solidity/contracts/ownership/Ownable.sol";
import "../MasterStorage/MasterStorage.sol";

contract OwnerUpgradable is Ownable {

  MasterStorage internal _store;

  function OwnerUpgradable(MasterStorage store) public {
    _store = store;
  }

  function upgrade(address newOwner) public onlyOwner {
    _store.transferOwnership(newOwner);
  }

}