pragma solidity 0.4.18;

contract Counter {
  uint256 count = 0;

  function addOne() public {
    count = count + 1;
  }
}
