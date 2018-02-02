pragma solidity ^0.4.18;

import "../Proxy/UpgradabilityProxy.sol";
import "./SimpleStorage.sol";

contract SimpleCore is UpgradabilityProxy, SimpleStorage { }
