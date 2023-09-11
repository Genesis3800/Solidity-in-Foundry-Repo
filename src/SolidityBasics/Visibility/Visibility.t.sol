// SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;

import {Test, console2} from "forge-std/Test.sol";
import "./Visibility.sol";

contract Visibility_test is Test {

    Child child;

    function setUp() public {
        child = new Child();
    }

    function test_callInternalAdditionInParentFromChild() public {

        uint a = 10; uint b = 20;
        uint c = child.callInternalAdditionInParentFromChild(a , b);

        // test passes if the value of (a + b) is returned correctly 
        assertEq(c, 30);
    }

    function test_callPublicAdditionInParentFromChild() public {

        uint a = 10; uint b = 20;
        uint c = child.callPublicAdditionInParentFromChild(a , b);

        // test passes if the value of (a + b) is returned correctly 
        assertEq(c, 30);
    }

    function test_callInternalStringInParentFromChild() public {

        string memory str = child.callInternalStringInParentFromChild();

        // test passes if the value of internalString is returned correctly 
        assertEq(str, "Internal String");
    }

}