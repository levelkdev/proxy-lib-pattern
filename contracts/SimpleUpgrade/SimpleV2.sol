pragma solidity ^0.4.18;

import "./SimpleV1.sol";
import "./BalanceStore.sol";

contract SimpleV2 is SimpleV1, BalanceStore {

  function buy() public payable {
    setBalance(msg.sender, msg.value);
  }

  function getSenderBalance() public view returns (uint256) {
    return getBalance(msg.sender);
  }

}
