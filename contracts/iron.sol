// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Pausable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract IronVaultToken is ERC20, ERC20Pausable, Ownable {
    
    // Setup initial state
    constructor() ERC20("Iron Vault", "IVT") Ownable(msg.sender) {
        uint256 initialTokens = 5000000 * (10 ** uint256(decimals()));
        _mint(msg.sender, initialTokens);
    }

    function triggerPause() external onlyOwner {
        _pause();
    }

    function triggerUnpause() external onlyOwner {
        _unpause();
    }

    // Required override for OpenZeppelin 5.0 updates
    function _update(address from, address to, uint256 value) internal virtual override(ERC20, ERC20Pausable) {
        super._update(from, to, value);
    }
}