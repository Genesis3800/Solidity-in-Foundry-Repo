// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/* Note that we only import the interface, not the actual contract
   we will be calling.
*/
import {Interface_SimpleAddition} from "./Interface_SimpleAddition.sol";

contract UsingInterface {

    Interface_SimpleAddition public IsimpleAddition;

    constructor(address _simpleAdditionAddress) {
        IsimpleAddition = Interface_SimpleAddition(_simpleAdditionAddress);
    }

    function setA(uint256 _a) public {
        IsimpleAddition.setA(_a);
    }

    function setB(uint256 _b) public {
        IsimpleAddition.setB(_b);
    }

    function returnSumOfStateVariables() public view returns (uint256) {
        return IsimpleAddition.returnSumOfStateVariables();
    }

    function returnSumOfLocalVariables(uint256 _a, uint256 _b) public view returns (uint256) {
        return IsimpleAddition.returnSumOfLocalVariables(_a, _b);
    }

}