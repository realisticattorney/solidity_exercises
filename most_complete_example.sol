//SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.5.0 <0.9.0;


contract GlobalVariables{
    address public owner;
    uint public value;
    bytes public data; //not being used in this contract
    uint public currentMax;
    address public realOwner; //just a jk (the one paying more is the real owner)
    uint public start;
    uint public end;
    uint public block_time = block.timestamp; //gives you the exact date (2021,month  day, hour min sec) at unix time stamp
    uint public block_number = block.number; //block number of the contract instance, not the transaction. in JS virtual machine it runs it in our machine and it starts with one
    uint public block_difficulty = block.difficulty;
    constructor(){
        owner = msg.sender;
        data = msg.data;
        currentMax = 0;
    }
    
    function changeOwner() public { //changes owner to whoever calls it. msg.sender is not the sender of the contract source, it's whoever is interacting 
        owner = msg.sender;
    }
    
    function payToShow() payable public { //you pay. but it just shows last payment done! doesnt even matter who paid
        start = gasleft();
        value = msg.value;
          if (currentMax < msg.value) {
            realOwner = msg.sender;
        }
        end = gasleft();
    }
    
    function getBalance() public view returns(uint) {
        return address(this).balance; // this refers to the current contract. and balance is a property of any address
    }
    
    function getMyOwnBalance() public view returns(uint) {
        return address(msg.sender).balance; //balance of sender
    }
    

    function howMuchGas()  public{
        start = gasleft();
        uint j = 1;
        for(uint i=1 ; i < 20 ; i++){
            j*=i;
         }
         end = gasleft();
    }
}