// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;

import "forge-std/Test.sol";
import {BadMathLib , UsingBadMathLib} from "./BadMathLib.sol";

contract BadMathLib_test is Test {

    UsingBadMathLib usingBadMathLib;

    function setUp() public {
        usingBadMathLib = new UsingBadMathLib();
    }

    function testAddition(uint256 a , uint256 b) public {

        vm.assume(a < 1000 && b < 1000);
        usingBadMathLib.add(a,b);
        assertEq(usingBadMathLib.add(a,b), (a+b));
    }

    function testSubtraction(uint256 a , uint256 b) public {

        assertEq(usingBadMathLib.sub(a,b), (a-b));
    }

    function testMultiplication(uint256 a , uint256 b) public {

        assertEq(usingBadMathLib.mul(a,b), (a*b));
    }

    function testDivision(uint256 a , uint256 b) public {

        assertEq(usingBadMathLib.div(a,b), (a/b));
    }

}