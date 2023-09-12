// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/**
 * @title Interface_SimpleAddition
 * @dev All function declarations in an interface must be external.
 */
interface Interface_SimpleAddition {

    function setA(uint256 _a) external;

    function setB(uint256 _b) external;

    function returnSumOfStateVariables() external view returns (uint256);

    function returnSumOfLocalVariables(uint256 _a, uint256 _b) external pure returns (uint256);

}