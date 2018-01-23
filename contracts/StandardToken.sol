pragma solidity ^0.4.18;

import './ERC20LibInterface.sol';

contract StandardToken {
   using ERC20LibInterface for ERC20LibInterface.TokenStorage;

   ERC20LibInterface.TokenStorage token;

   function StandardToken(uint _initialSupply) public {
      token.init(_initialSupply);
   }

   function totalSupply() public constant returns (uint) {
     return token.totalSupply();
   }

   function balanceOf(address who) public constant returns (uint) {
     return token.balanceOf(who);
   }

   function allowance(address owner, address spender) public constant returns (uint) {
     return token.allowance(owner, spender);
   }

   function transfer(address to, uint value) public returns (bool ok) {
     return token.transfer(to, value);
   }

   function transferFrom(address from, address to, uint value) public returns (bool ok) {
     return token.transferFrom(from, to, value);
   }

   function approve(address spender, uint value) public returns (bool ok) {
     return token.approve(spender, value);
   }

   event Transfer(address indexed from, address indexed to, uint value);
   event Approval(address indexed owner, address indexed spender, uint value);
 }
 