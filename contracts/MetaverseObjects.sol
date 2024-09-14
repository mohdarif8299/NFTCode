// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract MetaverseObjects is ERC721, Ownable {
    uint256 private _nextTokenId;

    // Mapping to store DID and URI associated with each object
    mapping(uint256 => string) private _objectDIDs;
    mapping(uint256 => string) private _tokenURIs;

    event ObjectMinted(address indexed owner, uint256 indexed tokenId, string tokenURI, string did);
    event DIDUpdated(uint256 indexed tokenId, string newDID);

    constructor(address initialOwner) ERC721("MetaverseObjects", "MOBJ") Ownable(initialOwner) {}

    // Mint a single 3D object as an NFT with a DID
    function mintObject(address recipient, string calldata tokenURI, string calldata did) external onlyOwner returns (uint256) {
        require(bytes(did).length > 0 && bytes(tokenURI).length > 0, "Empty DID or URI");
        
        uint256 tokenId = _nextTokenId++;
        _safeMint(recipient, tokenId);
        _tokenURIs[tokenId] = tokenURI;
        _objectDIDs[tokenId] = did;
        
        emit ObjectMinted(recipient, tokenId, tokenURI, did);
        return tokenId;
    }

    // Mint multiple objects in a batch
    function mintBatch(address recipient, string[] calldata tokenURIs, string[] calldata dids) external onlyOwner {
        require(tokenURIs.length == dids.length && tokenURIs.length > 0, "Invalid input");
    
        uint256 tokenId;
        for (uint256 i = 0; i < tokenURIs.length; i++) {
            tokenId = _nextTokenId++;
            _safeMint(recipient, tokenId);
            _tokenURIs[tokenId] = tokenURIs[i];
            _objectDIDs[tokenId] = dids[i];
            emit ObjectMinted(recipient, tokenId, tokenURIs[i], dids[i]);
        }
    }

    // Retrieve the DID associated with the object
    function getObjectDID(uint256 tokenId) external view returns (string memory) {
        require(_exists(tokenId), "Nonexistent token");
        return _objectDIDs[tokenId];
    }

    // Update the DID associated with the object
    function updateObjectDID(uint256 tokenId, string calldata newDID) external {
        require(ownerOf(tokenId) == msg.sender, "Not token owner");
        require(bytes(newDID).length > 0, "Empty DID");
        _objectDIDs[tokenId] = newDID;
        emit DIDUpdated(tokenId, newDID);
    }

    // Retrieve the URI of the object
    function tokenURI(uint256 tokenId) public view override returns (string memory) {
        require(_exists(tokenId), "Nonexistent token");
        return _tokenURIs[tokenId];
    }

    // Validate the owner of the NFT
    function isOwner(address claimant, uint256 tokenId) external view returns (bool) {
        return _exists(tokenId) && ownerOf(tokenId) == claimant;
    }

    // Internal function to check if a token exists
    function _exists(uint256 tokenId) internal view returns (bool) {
        return _ownerOf(tokenId) != address(0);
    }
}