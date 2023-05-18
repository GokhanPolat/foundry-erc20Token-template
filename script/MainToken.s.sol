// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script} from "forge-std/Script.sol";

import {MainToken} from "src/MainToken.sol";

contract MainTokenScript is Script {
  MainToken private mainToken;

  function setUp() public {}

  function run() public {
    uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");
    vm.startBroadcast(deployerPrivateKey);

    mainToken = new MainToken("MainToken", "MT");

    vm.stopBroadcast();

    // vm.broadcast();
  }
}
