// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

import "./Item.sol";

/**
 * @title User
 */
contract User {
    
    
    address Adr;
    int money;
    Item[] ownedItems;
    
    modifier owns() {
        require(msg.sender==Adr);
        _;
    }
    
    constructor(){
        Adr = msg.sender;
        money = 10;
    }
    
    function getAdr() public view returns(address){
        return Adr;
    }
    function getMoney() public view returns(int){
        return money;
    }
    function getOwnedItems() public view returns(Item[] memory){
        return ownedItems;
    }
    
    function createItem(string memory description) public owns{
        Item newitem = new Item(description);
        ownedItems.push(newitem);
    }
    
}