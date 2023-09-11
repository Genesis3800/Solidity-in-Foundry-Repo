// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract Parent {

    // State variables cannot be marked external
    string public publicString = "Public String";
    string private privateString = "Private String";
    string internal internalString = "Internal String";

    /**
     * @dev Declaring 4 consecutive functions with different visibilities that do the same thing
     * @param (a , b) each function takes two variables as params and returns the sum.
     */
        
    function publicAddition(uint a , uint b) public pure returns (uint) {
        return a+b;
    }

    function privateAddition(uint a , uint b) private pure returns (uint) {
        return a+b;
    }

    function internalAddition(uint a , uint b) internal pure returns (uint) {
        return a+b;
    }

    function externalAddition(uint a , uint b) external pure returns (uint) {
        return a+b;
    }


    /**
     * @dev We cannot call external functions from within the same contract.
            Note that since all the functions that are calling the functions
            above are marked public, the visibility specifiers don't do much 
            in our code. Not meant for production.            
    */

    function callPrivateAddition(uint a , uint b) public pure returns (uint) {
        return privateAddition(a , b);
    }

    function callPublicAddition(uint a , uint b) public pure returns (uint) {
        return publicAddition(a , b);
    }

    function callInternalAddition(uint a , uint b) public pure returns (uint) {
        return internalAddition(a , b);
    }

}

contract Child is Parent {

    /**
     * @dev We cannot call private or external functions from inside a child contract.          
    */

    function  callInternalAdditionInParentFromChild(uint a , uint b) public pure returns (uint) {
        return internalAddition(a , b);
    }

    function callPublicAdditionInParentFromChild(uint a , uint b) public pure returns (uint) {
        return publicAddition(a , b);
    }

    function callInternalStringInParentFromChild() public view returns (string memory) {
        return internalString;
    }

}
