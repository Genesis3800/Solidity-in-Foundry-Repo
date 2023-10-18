// SPDX-License-Identifier: MIT

pragma solidity ^0.8.21;

/// @title HelloWorld
/// @notice A simple contract that sets a string greeting.
contract HelloWorld {

    string public greeting;

/// @notice Used to set the value of a string variable.
/// @param _greeting The string value to be set.
    function setGreeting(string memory _greeting) public {
        greeting = _greeting;
    }

}