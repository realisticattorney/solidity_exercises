contract Auction {
    //cant iterate over mappings (are objects) however, instead of key names, its values are indexed
    //this contract is to bid, highest bid's bidder gets the whatever 
    mapping(address => uint ) public bids;//this has a default 0 for every valid address there is
    
    function bid() payable public{
        bids[msg.sender] = msg.value; //value in wei when calling the function. global predefined values
    }//to bid, add value in the form but instead of clicking the deploy button, click bid
}
