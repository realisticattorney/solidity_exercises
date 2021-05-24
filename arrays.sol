//SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.5.0 <0.9.0;


contract FixedSizeArrays{
  uint[3] public numbers = [0, 2];

  function setArrayVal(uint index, uint value) public {
      numbers[index] = value;
  }
  
  function numbersLength() view public returns(uint) {
      return numbers.length;
  }
  
}

contract DynamicArrays{ //cost more gas than fixedarrays
    
    uint[] public numbers;
    
    function setNextItem(uint item) public {
        numbers.push(item);
    }

    function getItem(uint i) public view returns(uint) {
        if(i < numbers.length) {//getItem is NEEDLESS bc uint[] public numbers already has the function public which calls it. however:
        return numbers[i];
    } else {
        return 0;
    }
    }
    
    function getNumbersLength() public view returns(uint) {
        return numbers.length;
    }
