// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.6;

//contract name is MyFirstContract
contract SetAttributes {

//create two variables.  A sting and an integer

    string private name;
    uint private age;

//set
    function setName(string memory newName) public {
        name = newName;
    }

//get
    function getName () public view returns (string memory) {
        return name;
    }
    
//set
    function setAge(uint newAge) public {
        age = newAge;
        
    }

//get
    function getAge () public view returns (uint) {
        return age;
    }
    
}