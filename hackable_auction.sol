//this contract is hackable by sending not enough gas to return the highest bid when it turns second highest, thus blocking the auction & winning the bid. 

//SPDX-License-Identifier: GPL-3.0
 
pragma solidity >=0.5.0 <0.9.0;
 
contract Auction {
    address payable public owner;
    string public ipfsHash;
    
    uint public startDate;
    uint public endDate;
    
    enum State {Started, Running, Ended, Canceled}
    State public auctionState;
    
    uint starterBid;
    uint highestBid = starterBid;
    uint secondHighestBid;
    address payable highestBidder;

    uint bidIncrement;
    
    constructor(uint _starterBid, uint _endDate) {
        owner = payable(msg.sender); // payable() is required because the addres is set to be payable
        startDate = block.number;
        starterBid = _starterBid;
        auctionState = State.Running;
        endDate = _endDate;
        ipfsHash = '';
        bidIncrement = 100000000000000000;
    }
    
    
    modifier notOwner() {
        require(msg.sender != owner, "You can't bid on your on auction");
        _;
    }
    
    modifier onlyOwner() {
        require(msg.sender == owner, "Only the auction's owner can perform this action");
        _;
    }
    
    
    modifier afterStart() {
        require(block.number >= startDate, "The auction hasn't started yet");
        _;
        
    }
    
    modifier beforeEnding() {
        require(block.number <= endDate, "The auction was already finished");
        _;
    }
    
    
    function bid() public payable notOwner afterStart beforeEnding {
        require(auctionState == State.Running);
        require(msg.value >= highestBid + 0.1 ether, "Current highest bid is more than that");
        secondHighestBid = highestBid;
        highestBidder.transfer(highestBid);
        highestBid = msg.value;
        highestBidder = payable(msg.sender);
    }
    
    function cancelAuction() public onlyOwner {
        require(auctionState == State.Running);
        highestBidder.transfer(highestBid);
        highestBidder = owner;
        auctionState = State.Canceled;
    }    
    
    function cashOut() public onlyOwner {
       require(auctionState == State.Running);
       require(highestBid > starterBid, "No one made any bid");
       require(block.number >= endDate);
       payable(owner).transfer(secondHighestBid + bidIncrement);
       auctionState = State.Ended;
    }
    
}