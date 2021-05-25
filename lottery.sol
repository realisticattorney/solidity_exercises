//SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.5.0 <0.9.0;

contract BabylonLottery {
    address payable[] public players;
    address public manager;
    string public instruction =
        "Send a multiple of 0.1 eth (e.g. 0.4, 1.2, 2 eth";

    constructor() {
        manager = msg.sender;
        // players.push(payable(manager));
    }

    receive() external payable {
        require(msg.sender != manager, "Manager can't play!");
        require(msg.value > 0.1 ether, "Minimum is 0.1 eth");
        uint256 tickets = msg.value / 100000000000000000;
        for (uint256 i = 1; i <= tickets; i++) {
            players.push(payable(msg.sender));
        }
    }

    function r() public view returns (uint256) {
        return
            uint256(
                keccak256(
                    abi.encodePacked(
                        block.difficulty,
                        block.timestamp,
                        players.length
                    )
                )
            );
    }

    function timeOut() public {
        require(
            msg.sender == manager,
            "You're not allowed to perform this action"
        );
        require(players.length >= 3);
        uint256 random = r();
        uint256 winner_index = random % players.length;
        winnerTakeAll(players[winner_index]);
    }

    function getBalance() public view returns (uint256) {
        require(
            msg.sender == manager,
            "Only the manager can know how much is at stake"
        );
        return address(this).balance;
    }

    function winnerTakeAll(address payable winner) private {
        uint256 managerFee = (getBalance() * 10) / 100;
        uint256 winnerPrize = (getBalance() * 90) / 100;
        payable(manager).transfer(managerFee);
        winner.transfer(winnerPrize);
        players = new address payable[](0);
    }
}
