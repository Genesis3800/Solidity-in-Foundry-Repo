// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;

contract ValueType_vs_ReferenceType {

    //Value Type
    uint public valueVar1 = 10;
    
    // Reference Type: array of unsigned integers
    uint[] public referenceVar1 = [1, 2, 3];

    function modifyValueType(uint newValue) public view {
        
        // New Variable assigned the value of valueVar1
        uint valueVar2 = valueVar1;  

        //New variable passed 
        valueVar2 = newValue;
    }

    function modifyReferenceType(uint index, uint newValue) public {
        
        // New variable, referenceVar2, refers to the same storage location as referenceVar1
        uint[] storage referenceVar2 = referenceVar1;  
        
        // Modifying the localReference will modify referenceVar
        referenceVar2[index] = newValue;              
    }

}
