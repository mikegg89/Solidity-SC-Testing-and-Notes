   
    /** 1. basics of imports and librarys with "What's solidity" YouTube series.
    *   were going to use imports to keep things a bit cleaner so were going to 
    *   create 2 files 
    **/
    // This would be its own script like library.sol

pragma solidity ^0.4.0;

library IntExtended {
    
    function increment(uint _self) returns (uint) {
        return _self+1;
    }
    
    function decrement(uint _self) returns (uint) {
        return _self-1;
    }
    
    function incrementByValue(uint _self, uint _value) returns (uint) {
        return _self + _value;
    }
    
    function decrementByValue(uint _self, uint _value) returns (uint) {
        return _self - _value;
    }
}



// this would be a different script but with import we would point to the library.sol script

pragma solidity ^0.4.0;

// you can use this to import other contracts from other scripts with remix we
// use the word browser to say where the script is coming from
import "browser/library.sol";
// you can also import libraries from github for examle
// import "github.com/willitscale/solidity/library.sol";
 
 contract testlibraries {
     // this is only estending the functionality to uint so if we used uint8 It 
     // would not work, if we wanted to extend it to all the ints then we could use 
     // "*" 
    using IntExtended for uint;
     
    function testIncrement(uint _base) returns(uint) {
        return _base.increment();
     }
     
    function testDecrement(uint _base) returns(uint) {
        return _base.decrement();
     }
     
    function testIncrementByValue(uint _base, uint _value) returns(uint) {
        return _base.incrementByValue(_value);
     }
     
    function testDecrementByValue(uint _base, uint _value) returns(uint) {
        return _base.decrementByValue(_value);
     }
     
 }
