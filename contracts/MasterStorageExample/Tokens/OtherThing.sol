pragma solidity ^0.4.18;

import "../../MasterStorage/OtherStorage.sol";
import "../../MasterStorage/MasterStorage.sol";

contract OtherThing {

  event Transfer(address indexed from, address indexed to, uint value);
  event Approval(address indexed owner, address indexed spender, uint value);

  OtherStorage _store;

  function OtherThing(OtherStorage otherProxy, MasterStorage store, uint256 someAmount) public {
    _store = OtherStorage(store);
    _store.setProxy(otherProxy);
    _store.setAmount(someAmount);
  }

  function amount() public view returns (uint256) {
    return _store.getAmount();
  }
}
