pragma solidity ^0.4.18;

import "../Proxy/UpgradabilityProxy.sol";
import "./SimpleStorage.sol";

contract SimpleV0 is SimpleStorage {

  function setThing() public {
    _store.setUint("thing", 100);
  }

  function getThing() view returns (uint256) {
    return _store.getUint("thing");
  }

}
