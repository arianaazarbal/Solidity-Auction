// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

import "./Item.sol";

/**
 * @title User
 */
contract User {
    
    
    address Adr;
    Item[] ownedItems;
    
    modifier owns() {
        require(msg.sender==Adr);
        _;
    }
    
    constructor(){
        Adr = msg.sender;
    }
    
    function getAdr() public view returns(address){
        return Adr;
    }
    function getOwnedItems() public view returns(Item[] memory){
        return ownedItems;
    }
    
    function createItem(string memory name, string memory symbol,string memory description) public owns{
        Item newitem = new Item(name,symbol,description);
        ownedItems.push(newitem);
    }
    
}