// SPDX-License-Identifier: MIT

pragma solidity ^0.8.21;

import {Test, console2} from "forge-std/Test.sol";
import "./Types.sol";

contract Types_test is Test {

    ValueType_vs_ReferenceType types;

    function setUp() public {

        types = new ValueType_vs_ReferenceType();
    }

    function test_modifyValueType() public {

        types.modifyValueType(1234);

        // Check that the value of valueVar1 is still 10
        assertEq(types.valueVar1(), 10);
    }

    function test_modifyReferenceType() public {

        console2.log("The original value of referenceVar1[0] is", types.referenceVar1(0));
        types.modifyReferenceType(0, 1234);

        // Check that the value of referenceVar1[0] is now 1234
        assertEq(types.referenceVar1(0), 1234);
    }
}
