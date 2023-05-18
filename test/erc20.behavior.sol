// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console2 as console} from "forge-std/Test.sol";
import {ERC20} from "openzeppelin-contracts/token/ERC20/ERC20.sol";

/* solhint-disable no-console, func-name-mixedcase */
contract ERC20Behavior is Test {
  ERC20 private token;
  Account private account;

  function setUp(address _token, Account memory _account) public {
    token = ERC20(_token);
    account = _account;
  }

  function ERC20_getBehaviors() public {
    console.log("Name:   ", token.name());
    console.log("Symbol: ", token.symbol());
    assertEq(token.totalSupply(), 0);
  }
}
