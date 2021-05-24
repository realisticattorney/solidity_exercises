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
