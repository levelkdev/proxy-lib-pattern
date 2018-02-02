pragma solidity ^0.4.18;

import "../Proxy/UpgradabilityProxy.sol";
import "./TokenStorage.sol";

contract TokenProxy is UpgradabilityProxy, TokenStorage {}
