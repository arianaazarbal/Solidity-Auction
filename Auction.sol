// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

import "./User.sol";
import "./Item.sol";
import "@openzeppelin/contracts/token/ERC721/IERC721.sol";
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

/**
 * @title Auction
 */
contract Auction {

    uint start_time;
    uint end_time;
    bool auctionIsLive;
    
    
    ERC721 public nft;
    uint public nftId;
    
    
    address payable public seller;
    
    
    uint highestBid;
    address currentHighBidder;
    
    
    modifier isSeller() {
        require(msg.sender==seller);
        _;
    }
    modifier auctionLive() {
        require(auctionIsLive, "Auction Isn't Live");
        _;
    }
    modifier hasEnoughMoney(uint bidPrice)
    {
        require(address(msg.sender).balance>=bidPrice, "You don't have enough money");
        _;
    }
    modifier highEnoughBid(uint bidPrice)
    {
        require(bidPrice>highestBid, "Bid is lower than current highest bid");
        _;
    }
    
    constructor(uint _startTime, uint _endtime,  uint minPrice){
        start_time =_startTime;
        end_time = _endtime;
        auctionIsLive = true;
        seller = payable(msg.sender);
        highestBid = minPrice;
    }
    
    /*constructor(uint _startTime, uint _endtime, address _nft, uint _nftId, uint minPrice){
        start_time =_startTime;
        end_time = _endtime;
        auctionIsLive = true;
        
        nft = ERC721(_nft);
        
        nftId = _nftId;
        seller = payable(msg.sender);
        highestBid = minPrice;
        
    }*/
    
    
    /*fallback () external payable{
        
    }*/
    
    event End(address winner, uint256 amount);
    function setNFT(address _nft, uint _nftId) external {
        nft = ERC721(_nft);
        
        nftId = _nftId;
    }
    
    function end() external payable{
        
        if (currentHighBidder != address(0)) {
            nft.safeTransferFrom(address(this),currentHighBidder, nftId);
        }
        emit End(currentHighBidder,highestBid);
    }
    
    function makeBid(uint bidPrice) public auctionLive hasEnoughMoney(bidPrice) highEnoughBid(bidPrice) {
        setHighestBid(bidPrice);
        setCurrentHighBidder(msg.sender);
    }
    
    function addTime() internal{
        end_time+=30;
    }
    function getOwner() public view returns(address){
        return nft.ownerOf(nftId);
    }
    function getMyBalance() public view returns(uint){
        return address(msg.sender).balance;
    }
    
    
    function getIsLive() public view returns(bool){
        return auctionIsLive;
    }
    
    function getStartTime() public view returns(uint){
        return start_time;
    }
    
    function getEndTime() public view returns(uint){
        return end_time;
    }
    
    function getObject() public view returns(ERC721){
        return nft;
    }
    
    function getSeller() public view returns(address){
        return seller;
    }
    
    function getHighestBid() public view returns(uint){
        return highestBid;
    }
    
    function getCurrentHighBidder() public view returns(address){
        return currentHighBidder;
    }
    
    function setHighestBid(uint newHigh) internal{
        highestBid = newHigh;
    }
    
    function setCurrentHighBidder(address newHighUser) internal{
        currentHighBidder = newHighUser;
    }
    
    

}