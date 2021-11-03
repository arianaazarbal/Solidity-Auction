// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

import "./User.sol";

/**
 * @title Item
 */
contract Item {

    string description;
    address owner;
    
    modifier owns() {
        require(msg.sender==owner);
        _;
    }
    
    constructor(string memory _description){
        description = _description;
        owner = msg.sender;
    }
    
    function transfer(address newOwner) public owns{
        owner = newOwner;
    }
    
    function getOwner() public view returns(address){
        return owner;
    }

}