
//SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.5.0 <0.9.0;

// declaring a struct type outsite of a contract
// can be used in any contract declard in this file
struct Instructor{
     uint age;
     string name;
     address adr;
}

contract Academy{
     // declaring a state variabla of type Instructor
    Instructor public academyInstructor;
    
      // declaring a new enum type
    enum State{Open, Closed, Unknown}
    State public academyState = State.Open;
            
    constructor(uint _age, string memory _name){
        academyInstructor.age = _age;
        academyInstructor.name = _name;
        academyInstructor.adr = msg.sender;
}
    
    function changeInstructor(uint _age, string memory _name, address _adr) public {
        if(academyState == State.Open) {
        Instructor memory memInstructor = Instructor({
            age: _age,
            name: _name,
            adr: _adr});
        academyInstructor = memInstructor;
    }
    }
}

// the struct can be used in any contract declared in this file
contract School{
    Instructor public schoolInstructor;
}

