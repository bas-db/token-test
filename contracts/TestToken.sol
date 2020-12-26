// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract TestToken is ERC20 {
  // when contract is created, constructor is executed once
  constructor() public ERC20("TestToken", "TT") {
    // mints and sends initialSupply to contract creator / msg.sender 
    _mint(msg.sender, 1e7 * 10 ** 18); // 10 million at 18 decimals
  }
}