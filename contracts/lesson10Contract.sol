pragma solidity ^0.4.0;
 
 /** data types, arrays, mappings and structs.
  * 
  **/
 
contract DataTypes {
    
    // 1. bool can be true or false.
    bool myBool = false;
    
    // 2. with this int8 Data type you have a constraint that the length of the int 
    // has to divisable by 8 and that can be 8 to 256. you can also have this with
    // uint. thats the length in bytes, myInt can be anywhere between 127 to -128 
    int8 myInt = -128;
    // uint of 8 bits can be a value between 0 and 255
    uint8 myUint = 255;
    
    // 3. strings because the way solidity stores strings, it stores strings in an 
    // array of intagers. so when your creating a string your really creating a 
    // array of values, so these two are basicly the same.
    string myString;
    uint8[] myStringArr;
    // so in this function we are actually passing in an array
    function myFunk(string s) {
    }
    function myArrFunk(uint8[] s) {
    }
    // this function wont work because an array of strings is a nested array of strings.
    //function myArrString(string[] s) {
    //}
    
    // 5. bytes... byte and bytes1 is the same thing, with bytes simualar to intagers
    // you can spesify a range between 1 and 32 
    byte myValue;
    bytes1 myBytes1;
    bytes32 myBytes32;
    
    // 6. Fixed point number.. this will be something that is coming in the future 
    // of solidity.  a Fixed point number is something you should use in a financial
    // system where a floating point number is somthing that should be used in 
    // geometry, because you can never garontie the results you dont want unpridictable.
    // behind the seens with the keyword fixed you are creating an intager with a 
    // value of 120 bits and asigning it 19 decimal places as well.
    // fixed myFixed;
    // simualar to intager we can spesify the length in bits
    // fixed256x8 myFixedBit = 1; // 255.0 not implemented
    ufixed myFixed = 1;
    
    // 7. enum.. so with this you can add a list of in this case acctions.
    enum Acction {ADD, REMOVE, UPDATE}
    Acction myAction = Acction.ADD;
    
    // 8. addresses.. if we want to find the value of myAddress you will have to 
    // make a method thats payable.
    address myAddress;
    function assignAddress() {
        // this is how you assign an address.
        myAddress = msg.sender;
        // find the balance of the address
        myAddress.balance;
        // transfer an amount of eth to that spacific address.
        myAddress.transfer(10);
    }
    
    // 9. arrays... arrays can be defigned in one of two ways. you can deffine an
    // array by simply stating [1, 2, 3]
    // [] means no fixed length
    uint[] myIntArr = [1, 2, 3]
    function arrFunk() {
        myIntArr.push(1);
        myIntArr.length;
        myIntArr[0];
    }
    uint[10] myfixedarr;
    
    // 10. structs
    struct Account {
        uint balance;
        uint dailyLimit;
    }
    Account myAccount;
    function structFunc() {
        myAccount.balance = 100;
    }
    
    // 11. mappings
    mapping(address => Account) _accounts;
    
    function mappingFunc() payable {
        _accounts[msg.sender].balance += msg.value;
    }
    
    function getBallance() constant returns (uint) {
        return _accounts[msg.sender].balance;
        
        
    }

       
    
}