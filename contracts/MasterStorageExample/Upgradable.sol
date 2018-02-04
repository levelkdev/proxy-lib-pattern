pragma solidity ^0.4.18;

interface Upgradable {

  function upgrade(address newOwner) public;

}
