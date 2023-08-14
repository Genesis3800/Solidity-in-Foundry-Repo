// SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;

import "forge-std/Test.sol";
import "./HelloWorld.sol";

contract HelloWorld_test is Test {

    function testgreeting() public {
        HelloWorld helloWorld = new HelloWorld();
        assertEq(helloWorld.greeting(), "Hello World");
    }

}