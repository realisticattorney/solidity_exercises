function f() public pure{
        uint[] memory x= new uint[](3); 
        x[0] = 10;
        x[1] =20;
        x[2] =30;
    }    
    function f2() public{
        uint[] memory y= new uint[](3); 
        y[0] = 10;
        y[1] =20;
        y[2] =30;
        numbers = y;
    }
    //bytes are reference types. reference types dont have a .length method
}


// Consider the following variable declarations:

bytes public b1 = 'abc'; //You can add a new element by calling push()
//You can also call by index b1[0]
string public s1 = 'abc'; //you can't do neither both

//SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.5.0 <0.9.0;


contract A{
    string[] public cities = ['Prague', 'Budapest'];
    
    function memA() view public { //this does not modify cities
        string[] memory s1 = cities;
        s1[0] = "Berlin";   
    }

    
    function storA() public {
        string[] storage s1= cities; //but this does, as an array is a reference type, the equality means: access to the same data, not copy the same data
        s1[0] = "Berlin";   //is a location, not a value
    }
}