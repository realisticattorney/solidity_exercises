//SPDX-License-Identifier: GPL-3.0

pragma solidity 0.8.0;


contract FixedSizeArrays{
  uint[3] public numbers = [0, 2];

  function setArrayVal(uint index, uint value) public {
      numbers[index] = value;
  }
  
  function numbersLength() view public returns(uint) {
      return numbers.length;
  }
  
}