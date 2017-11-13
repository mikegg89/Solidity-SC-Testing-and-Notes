pragma solidity ^0.4.0;

/** 1. here we are going to extend the functionality of string using library.
 *  we will using bytes pretty heavily.
 *  we will learn two basic functions concat and sting pause.
 *  2. there are three types of storage memory, storage and stack. 
 *  Stack: is any thing that is stored withen a function and is destroyed once 
 *  the functio is exicuted.
 *  Memory: which is relitive to the exicution of that transaction on the contract
 *  which can be short term memory and is simular to the stack.
 *  Storage: storage is used for passing a value that you dont want to be cloned.
 *  so normally when you pass a value into a function it just clones the value 
 *  and doesnt change the original value.
 *  
 **/
 
 // this is string concatnation
 library Strings {
     
    function concat(string _base, string _value) internal returns (string) {
        bytes memory _baseBytes = bytes(_base);
        bytes memory _valueBytes = bytes(_value);
        
        string memory _tempValue = new string(_baseBytes.length + _valueBytes.length);
        bytes memory _newValue = bytes(_tempValue);
        
        uint i;
        uint j;
         
        for(i=0;i<_baseBytes.length;i++) {
            _newValue[j++] = _baseBytes[i];
        }
        
         for(i=0;i<_valueBytes.length;i++) {
            _newValue[j++] = _valueBytes[i];
        }
        
        return string(_newValue);
    }
}

contract TestStrings {
    
    using Strings for string;
    
    // were concatnating a imput string to _suffix.
    function testConcat(string _base) constant returns (string) {
        return _base.concat("_suffix");
        
    }
}
    

/** 3. string pos or string posistion, you can find where a string is in a String
 *  "can you find the t" the t was 13 plases away from the begining.
 **/
 

 library Strings {
     
    function concat(string _base, string _value) internal returns (string) {
        bytes memory _baseBytes = bytes(_base);
        bytes memory _valueBytes = bytes(_value);
        
        string memory _tempValue = new string(_baseBytes.length + _valueBytes.length);
        bytes memory _newValue = bytes(_tempValue);
        
        uint i;
        uint j;
         
        for(i=0;i<_baseBytes.length;i++) {
            _newValue[j++] = _baseBytes[i];
        }
        
         for(i=0;i<_valueBytes.length;i++) {
            _newValue[j++] = _valueBytes[i];
        }
        
        return string(_newValue);
    }
    
    function strpos(string _base, string _value) internal returns (int) {
        // here were converting the values to bytes.
        bytes memory _baseBytes = bytes(_base);
        bytes memory _valueBytes = bytes(_value);
        
        assert(_valueBytes.length == 1);
        
        for(uint i=0;i<_baseBytes.length;i++) {
            if (_baseBytes[i] == _valueBytes[0]) {
                return int(i);
            }
        }
        
        return -1;
    }
}

contract TestStrings {
    
    using Strings for string;
    
    function testConcat(string _base) constant returns (string) {
        return _base.concat("_suffix");
    }
    
    function needleInHaystack(string _base) constant returns (int) {
        return _base.strpos("t");
    }
}
    
     
    