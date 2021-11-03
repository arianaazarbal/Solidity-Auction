// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

import "./User.sol";
import "./Item.sol";

/**
 * @title Auction
 */
contract Auction {

    int start_time;
    int end_time;
    bool auctionIsLive;
    Item sellingObject;
    User originalOwner;
    int highestBid;
    User currentHighBid;
    
    
    constructor(int _startTime, int _endtime, Item _sellingObject, User _originalOwner, int minPrice){
        start_time =_startTime;
        end_time = _endtime;
        auctionIsLive = false;
        sellingObject = _sellingObject;
        originalOwner = _originalOwner;
        highestBid = minPrice;
        currentHighBid = _originalOwner;
        checkTime();
    }
    
    function checkTime() public{
        auctionIsLive = true;
    }
    
    function getIsLive() public view returns(bool){
        return auctionIsLive;
    }
    
    function getStartTime() public view returns(int){
        return start_time;
    }
    
    function getEndTime() public view returns(int){
        return end_time;
    }
    
    function getObject() public view returns(Item){
        return sellingObject;
    }
    
    function getOriginalOwner() public view returns(User){
        return originalOwner;
    }
    
    function getHighestBid() public view returns(int){
        return highestBid;
    }
    
    function getCurrentHighBid() public view returns(User){
        return currentHighBid;
    }
    
    function setHighestBid(int newHigh) public{
        highestBid = newHigh;
    }
    
    function setCurrentHighBid(User newHighUser) public{
        currentHighBid = newHighUser;
    }
    
    

}