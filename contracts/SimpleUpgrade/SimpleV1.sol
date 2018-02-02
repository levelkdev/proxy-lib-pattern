pragma solidity ^0.4.18;

import "./SimpleV0.sol";

contract SimpleV1 is SimpleV0 {

  function incrementThing() public {
    uint256 t = getThing();
    _store.setUint("thing", t + 1);
  }

  function setOther() public {
    _store.setUint("other", 255);
  }

  function getOther() view returns (uint256) {
    return _store.getUint("other");
  }

}
