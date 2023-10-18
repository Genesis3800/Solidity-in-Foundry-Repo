// SPDX-License-Identifier: MIT

pragma solidity ^0.8.21;

//HelloWorld
//A simple contract that sets a string greeting.
contract HelloWorld {

    string public greeting;

//Used to set the value of a string variable.
//The string value to be set.
    function setGreeting(string memory _greeting) public {
        greeting = _greeting;
    }

}