// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console2 as console} from "forge-std/Test.sol";

// ERC20 Behavior helper
import {ERC20Behavior} from "./erc20.behavior.sol";

import {MainToken} from "../src/MainToken.sol";

/* solhint-disable no-console, func-name-mixedcase */
contract MainTokenTest is Test {
  MainToken public mainToken;
  ERC20Behavior public erc20behavior;

  // address gokhan.addr, uint256 gokhan.key
  Account private sato;

  function setUp() public {
    mainToken = new MainToken("MainToken", "MT");
    erc20behavior = new ERC20Behavior();

    sato = makeAccount("sato");
  }

  function test01_GetERC20Behavior() public {
    erc20behavior.setUp(address(mainToken), sato);
    erc20behavior.ERC20_getBehaviors();
  }
}
