// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";    
import "@openzeppelin/contracts/access/Ownable.sol";

// make this contract inherits from: ERC721URIStorage contract
contract Assignment8 is ERC721URIStorage, Ownable {
    // declare a private uint called _tokenIdCounter
    uint256 private _tokenIdCounter;
    // pass name and symbol of the nft token collection
    constructor() ERC721("Blokkat", "BLKT") Ownable(msg.sender) {
        
    }

    // make this function visibility: external
    // pass string json uri parameter
    // restrict this function to be called only by the owner
        // Hint: You can use OpenZeppelin Ownable contract imported above
    
    function mintNFT(string memory jsonURI) external returns(unit256) {
        // call _mint to mint a new nft to the function caller
        uint256 newTokenId = _tokenIdCounter;
        _mint(msg.sender, newTokenId);
        // set token uri to the token id using _setTokenURI
        _setTokenURI(newTokenId, jsonURI);
        // increment token id counter
        _tokenIdCounter++;
        return newTokenId;
    }

}
