//SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.5.0 <0.9.0;

contract CryptosToken {
    string public constant name = "Cryptos";
    uint256 supply;
    address public owner;

    constructor(uint _supply){
        supply = _supply;
        owner = msg.sender;
    }

    function getSupply() public view returns (uint256) {
        return supply;
    }

    function setSupply(uint256 _supply) public {
        supply = _supply;
    }
}



//challenge 3
//SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.5.0 <0.9.0;

contract MyTokens {
    string[] public tokens = ["BTC", "ETH"];

    function changeTokens() public {
        string[] storage t = tokens;
        t[0] = "VET";
    }
}


//challenge 5
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



//challenge 7

//SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.6.0 <0.9.0;

contract Game {
    address[] public players;

    function start() public {
        players.push(msg.sender);
    }
}


//challenge 8

//SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.5.0 <0.9.0;

contract A {
    int256 public x = 10;

    function f3() internal view returns (int256) {
        return x;
    }
}

contract B is A {
    int256 public xx = f3();
}
