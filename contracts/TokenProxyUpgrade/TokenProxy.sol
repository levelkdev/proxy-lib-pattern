pragma solidity ^0.4.18;

import "./UpgradabilityProxy.sol";
import "./TokenStorage.sol";

contract TokenProxy is UpgradabilityProxy, TokenStorage {}
