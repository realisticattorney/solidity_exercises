

//struct are classes. They can be declared inside or OUTSIDE of a contract. 
//mappings are like objects

pragma solidity >=0.5.0 <0.9.0;


struct Instructor{
     uint age;
     string name;
     address adr;
}

contract Academy{
    Instructor public academyInstructor;
        
    constructor(uint _age, string memory _name){//2 args required when deploying
        academyInstructor.age = _age; 
        academyInstructor.name = _name;
        academyInstructor.adr = msg.sender;
}
    
    function changeInstructor(uint _age, string memory _name, address _adr)  public { //you can set ANY ADDRESS HERE. So you can set whoever you want 
        Instructor memory memInstructor = Instructor({
            age: _age,
            name: _name,
            adr: _adr});
        academyInstructor = memInstructor;
    }
    
}


