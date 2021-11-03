// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

import "./User.sol";
import "./Item.sol";
import "./Auction.sol";

/**
 * @title Auction
 */
contract AuctionHouse {
    
    Auction[] auctions;
    
    function createAuction(User u, Item i, int _startTime, int _endtime,  int minPrice) public {
        Auction newAuction = new Auction(_startTime, _endtime, i, u, minPrice);
        auctions.push(newAuction);
    }
    function bid(User u, Auction a, int bidPrice) public {
        require(a.getIsLive());
        //require(u.getMoney()>=bidPrice);
        a.setHighestBid(bidPrice);
        a.setCurrentHighBid(u);
    }
    function getAuctions() public view returns(Auction[] memory){
        return auctions;
    }
    
    

}