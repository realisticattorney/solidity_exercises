//SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.5.0 <0.9.0;

contract CryptosToken {
    string public constant name = "Cryptos";
    uint256 supply;

    function getSupply() public view returns (uint256) {
        return supply;
    }

    function setSupply(uint256 _supply) public {
        supply = _supply;
    }
}
