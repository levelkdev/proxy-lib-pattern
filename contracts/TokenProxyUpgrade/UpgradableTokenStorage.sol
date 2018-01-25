pragma solidity ^0.4.18;

import "./UpgradabilityStorage.sol";
import "./TokenStorage.sol";

contract UpgradableTokenStorage is UpgradabilityStorage, TokenStorage {}
