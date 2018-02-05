pragma solidity ^0.4.18;

import "./MasterStorage.sol";

contract OtherStorage is MasterStorage {

  function setAmount(uint256 amount) public {
    setUint("someAmount", amount);
  }

  function getAmount() public view returns (uint256) {
    return getUint("someAmount");
  }

}
