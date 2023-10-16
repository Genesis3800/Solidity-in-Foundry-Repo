// SPDX-License-Identifier: MIT

pragma solidity ^0.8.21;

import {Test, console2} from "forge-std/Test.sol";
import {SimpleAddition} from "./SimpleAddition.sol";
import {UsingInterface} from "./UsingInterface.sol";

contract UsingInterface_test is Test {

    SimpleAddition public simpleAddition;
    UsingInterface public usingInterface;

    function setUp() public {
        
        simpleAddition = new SimpleAddition();
        usingInterface = new UsingInterface(address(simpleAddition));
    }

    function test_setA() public {
        usingInterface.setA(1);
        assertEq(simpleAddition.a(), 1, "Value of `a` in SimpleAddition should be 1");
    }

    function test_setB() public {
        usingInterface.setB(2);
        assertEq(simpleAddition.b(), 2, "Value of `b` in SimpleAddition should be 2");
    }

    function test_returnSumOfStateVariablesWithoutChange() public {
        assertEq(usingInterface.returnSumOfStateVariables(), 30, "sum of state variables should be 30");
    }

    function test_returnSumOfStateVariablesWithChange() public {
        usingInterface.setA(1);
        usingInterface.setB(2);
        assertEq(usingInterface.returnSumOfStateVariables(), 3, "sum of state variables should be 3");
    }

    function test_returnSumOfLocalVariables() public {
        assertEq(usingInterface.returnSumOfLocalVariables(5, 10), 15, "sum should be 3");
    }

}