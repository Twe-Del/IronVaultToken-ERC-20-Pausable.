// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

/**
 * ApexYield Token
 * Features a hardcoded maximum supply using custom modifier logic.
 */
contract ApexYield is ERC20, Ownable {
    uint256 public constant MAX_CAP = 10000000 * 1e18; // 10 million max

    constructor() ERC20("ApexYield", "APEX") Ownable(msg.sender) {
        _mint(msg.sender, 2000000 * 1e18); // 2 million initial
    }

    modifier checkCap(uint256 amount) {
        require(totalSupply() + amount <= MAX_CAP, "ApexYield: Hard cap exceeded");
        _;
    }

    function issueTokens(address to, uint256 amount) public onlyOwner checkCap(amount) {
        _mint(to, amount);
    }
}