// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/**
 * @title SimpleAddition
 * @dev SimpleAddition contract is used to demonstrate the use of interfaces.
 * We will write an interface for this contract.
 */
contract SimpleAddition {

    uint256 public a =10; uint256 public b =20;

    function setA(uint256 _a) public {
        a = _a;
    }

    function setB(uint256 _b) public {
        b = _b;
    }

    function returnSumOfStateVariables() public view returns (uint256) {
        return a + b;
    }

    /**
     * @dev Both public and external functions can be called by other contracts.
     */
    function returnSumOfLocalVariables(uint256 _a, uint256 _b) external pure returns (uint256) {
        return _a + _b;
    }

}