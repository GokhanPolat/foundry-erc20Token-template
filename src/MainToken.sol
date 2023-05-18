// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import {ERC20} from "openzeppelin-contracts/token/ERC20/ERC20.sol";

contract MainToken is ERC20 {
  address private owner;

  constructor(string memory name, string memory symbol) ERC20(name, symbol) {
    owner = msg.sender;
  }
}
