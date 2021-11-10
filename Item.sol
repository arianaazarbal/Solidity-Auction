// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

import "./User.sol";
import "@openzeppelin/contracts/token/ERC721/IERC721.sol";
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

/**
 * @title Item
 */
contract Item is ERC721{

    string description;
    address owner;
    
    
    modifier owns() {
        require(msg.sender==owner, "You don't own this silly");
        _;
    }
    
    constructor(string memory name, string memory symbol, string memory _description) ERC721(name,symbol){
        description = _description;
        owner = msg.sender;
    }

}