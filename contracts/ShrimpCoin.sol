pragma solidity ^0.4.18;

import './StandardToken.sol';

contract ShrimpCoin is StandardToken() {

	string public constant name = "Shrimp Coin";
	string public constant symbol = "SHRMP";
	uint8 public constant decimals = 18;
  uint public INITIAL_SUPPLY = 10000;

  function ShrimpCoin() public StandardToken(INITIAL_SUPPLY) {

  }
}
