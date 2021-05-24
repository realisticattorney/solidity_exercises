//SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.6.0 <0.9.0;


contract Deposit {
    
    receive() external payable{//introduced in ^0.6.0. No function syntax. It can't have arguments, nor returns anything, and must have external visibility 
    }
    
    function getBalance() public view returns(uint) {
        return address(this).balance;
    }
    
    function transferAll(address payable recipient) public {
        recipient.transfer(address(this).balance);
    }
}