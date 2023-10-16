// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;

library BadMathLib {

    function addition(uint256 a, uint256 b) internal pure returns (uint256) {
        return a + b;
    }

    function subtraction(uint256 a, uint256 b) internal pure returns (uint256) {
        return a - b;
    }

    function multiplication(uint256 a, uint256 b) internal pure returns (uint256) {
        return a * b;
    }

    function division(uint256 a, uint256 b) internal pure returns (uint256) {
        return a / b;
    }
}

contract UsingBadMathLib {

    function add(uint256 a, uint256 b) public pure returns (uint256) {
        return BadMathLib.addition(a,b);
    }

    function sub(uint256 a, uint256 b) public pure returns (uint256) {
        return BadMathLib.subtraction(a,b);
    }

    function mul(uint256 a, uint256 b) public pure returns (uint256) {
        return BadMathLib.multiplication(a,b);
    }

    function div(uint256 a, uint256 b) public pure returns (uint256) {
        return BadMathLib.division(a,b);
    }
}