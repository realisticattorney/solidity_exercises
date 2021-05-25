//SPDX-License-Identifier: GPL-3.0
 
pragma solidity >=0.5.0 <0.9.0;
 
contract BabylonLottery {
    address payable[] public players;
    address public manager;
    string public instruction = 'Send a multiple of 0.1 eth (e.g. 0.4, 1.2, 2 eth';
    
    constructor(){
        manager = msg.sender;
    }
    
    receive() external payable {
        require(msg.value > 0.1 ether, 'Minimum is 0.1 eth');
        uint tickets = msg.value / 100000000000000000;
        for(uint i= 1 ; i <= tickets ; i++) {
        players.push(payable(msg.sender));
            
        }
    }
    
    function r() public view returns(uint) {
        return uint(keccak256(abi.encodePacked(block.difficulty, block.timestamp, players.length)));
    }
    
    function timeOut() public {
        require(msg.sender == manager, "You're not allowed to perform this action");
        require(players.length > 3)
        uint random = r();
        uint winner_index = random % players.length;
        winnerTakeAll(players[winner_index]);
    }
    
    function getBalance() public view returns(uint){
        return address(this).balance;
    }
    
    function winnerTakeAll(address payable winner) private {
        winner.transfer(getBalance());
    }
}