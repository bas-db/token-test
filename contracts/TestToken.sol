// SPDX-License-Identifier: MIT
pragma solidity ^0.6.6;

import "@openzeppelin/contracts/token/ERC20/ERC20Capped.sol";

contract TestToken is ERC20Capped {
  // when contract is created, constructor is executed once
  // hard cap at 100 million tokens at 18 decimals
  constructor() public ERC20("TestToken", "TT") ERC20Capped(1e8 * (10 ** uint256(18))) {
    _setupDecimals(18);
    // mints and sends initialSupply to contract creator / msg.sender 
    _mint(msg.sender, 1e7 * (10 ** uint256(decimals()))); // 10 million at 18 decimals
  }
}