//!!Someone has sent ETH directly to the contract address. Choose the correct statement.
//The receive() payable function was automatically executed. If there is neither a function called receive() nor a fallback payable function the transaction will fail.
//SO, I think that if you send money with no function, it will be received only if there is a receive() or fallback() function. But if you send it to a payable function it's all good
//How can someone transfer ETH from the contract balance to another account?
//By using the address.transfer() or address.send() functions. In this case the value of wei which is the function argument is transferred to the address.


// Question 4:
// Consider following Smart Contract. What will happen if someone sends ETH directly to the contract's address?
//A: it will fail

//SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.5.0 <0.9.0;
 
contract Deposit{
    address public owner;
     
    constructor(){
        owner = msg.sender;    
     }
     
    function sendEther() public payable{} //because there is no owner = msg.value here
     
    function getBalance() public view returns(uint){
         return address(this).balance;
     }
 }


//Consider the following Smart Contract. Can it hold a balance of wei?
//Yes. there's at least one payable function. But it can only have it thorugh deployment
pragma solidity >=0.5.0 <0.9.0;
 
contract Deposit{
    address public owner;
     
    constructor(){
        owner = msg.sender;    
     }
 
    function sendEther() public payable{}
     
    function getBalance() public view returns(uint){
         return address(this).balance;
     }
 }



//SPDX-License-Identifier: GPL-3.0
 
pragma solidity >=0.6.0 <0.9.0;
 
contract Deposit{
    
    // either receive() or fallback() is mandatory for the contract to receive ETH by 
    // sending ETH to the contract's address
    
    // declaring the receive() function that is executed when sending ETH to the contract address
    // it was introduced in Solidity 0.6 and a contract can have only one receive function, 
    // declared with this syntax (without the function keyword and without arguments). 
    receive() external payable{
    }
   
 
    // declaring a fallback payable function that is called when msg.data is not empty or
    // when no other function matches
    fallback() external payable {
    }
    
    
    // ether can be send and received by the contract in the trasaction that calls this function as well
    function sendEther() public payable{
        
    }
 
   
    // returning the balance of the contract. 
    function getBalance() public view returns (uint) {
        // this is the current contract, explicitly convertible to address, 
        // and balance is a member of any variable of type address. 
        return address(this).balance;
    }
}