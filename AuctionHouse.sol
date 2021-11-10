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
    
    modifier auctionIsLive(Auction a) {
        require(a.getIsLive(), "Auction Isn't Live");
        _;
    }
    modifier hasEnoughMoney(Auction a, uint bidPrice)
    {
        require(address(this).balance>=bidPrice);
        _;
    }
    
    function createAuction(Item i, int _startTime, int _endtime,  uint minPrice) public {
        User u = User(msg.sender);
        require(msg.sender==i.ownerOf());
        Auction newAuction = new Auction(_startTime, _endtime, i, u, minPrice);
        auctions.push(newAuction);
    }
    function makeBid(Auction a, uint bidPrice) public auctionIsLive(a){
        User u = User(msg.sender);
        
        a.setHighestBid(bidPrice);
        a.setCurrentHighBid(u);
    }
    function getAuctions() public view returns(Auction[] memory){
        return auctions;
    }
    
    

}