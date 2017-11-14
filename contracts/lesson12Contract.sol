pragma solidity ^0.4.0;

// 1. Debugging, learning how to use the Debugging tool in remix.
// we will go over 3 aspects, 1st we will be Debugging things in a stack
// 2nd Debugging things in memory, 3rd storage.

contract Debugging {
    
    uint[] private vars;
    
    
    // stack hit Debug and look at stack and solidity locals
    function assignment() {
        uint myVal1 = 1;
        uint myVal2 = 2;
        assert(myVal1 == myVal2);
    }
    
    // memory hit Debug and look at stack and solidity locals
    function memoryAlloc() {
        string memory myString = "test";
        assert(bytes(myString).length == 10);
    }
    
    // storage hit Debug and look at stack and solidity locals
    function storageAlloc() {
        vars.push(2);
        vars.push(3);
        assert(vars.length == 4);
    }
    
    
}