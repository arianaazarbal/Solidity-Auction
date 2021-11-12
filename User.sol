// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

import "./Item.sol";
import "./Auction.sol";

/**
 * @title User
 */
contract User {
    
    
    address Adr;
    Auction[] watchList;
    
    modifier isOwner() {
        require(msg.sender==Adr);
        _;
    }
    
    constructor(){
        Adr = msg.sender;
    }
    
    function getAdr() public view returns(address){
        return Adr;
    }
    
    
    function getWatchList() public view returns(Auction[] memory){
        return watchList;
    }
    
    function addToWatchList(Auction a) public isOwner{
        watchList.push(a);
    }
    
}