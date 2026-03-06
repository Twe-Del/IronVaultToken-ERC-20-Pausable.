// SPDX-License-Identifier: MIT
pragma solidity >=0.8.20 <0.9.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

/*
 * @dev NexusPass NFT Collection.
 * Generates a unique digital pass for early supporters.
 */
contract NexusPass is ERC721, Ownable {
    uint256 public currentTokenId;

    constructor() 
        ERC721("NexusPass", "NXP") 
        Ownable(msg.sender) 
    {}

    function mintPass(address _recipient) external onlyOwner {
        require(_recipient != address(0), "Error: Cannot mint to the zero address!");
        
        uint256 newItemId = currentTokenId;
        _safeMint(_recipient, newItemId);
        
        currentTokenId = currentTokenId + 1;
    }
}