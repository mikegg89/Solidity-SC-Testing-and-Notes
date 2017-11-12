pragma solidity ^0.4.0;

// the Video lessons for these can be found on the "whats solidity" YouTube channel. 
// here is a link to his channel https://youtu.be/v_hU0jPtLto , deffenitly suggest 
// checking out these videos if you want to learn solidity also check out Vlad wolf's channel

// 1. going over the basics again with a different instructor to pick up some things the
// other lessons may have missed.

contract lesson6Contract {
    
    string private name;
    // solidity uses the concept of signed and unsigned variables, signed variables
    // can be positive and negitive and unsigned can only be positive. uint
    uint private age;
    
    // in this function "string" is a import because this is a staticly typed language
    // we have to define our variable types.  You can use the keyword var ? but if
    // you use the keyword var it referse to a uint of 256 bits so we say string.
    // because the value you pass in has to be json encoded it requiers quotations.
    function setName(string newName) {
        // this will set the value of name to what ever we pass into setName.
        name = newName;
    }
    
    // () is there because were not passing in any perameters.
    function getName() constant returns(string) {
        return name;
    }
    
    function setAge(uint newAge) {
        age = newAge;
    }
    
    function getAge() constant returns(uint) {
        return age;
    }
}




/** 2. In this lesson we are going ot go over inheritance within solidity
 * inheritance.  We will look at 3 aspects of inheritance, the first aspect
 * that will be coverd is a general extension of functionality from one contract 
 * to the next.
 **/
 
  /** we want to add some atributes to bank which we dont want lesson6Contract to 
  access, we can do this in one of two ways, for instance if you wanted to add
  something to the bank contract that you want to hide from the outside world
  but you did want lesson6Contract to access you would make an internal method
  an internal atribute.
    internal is a access modifier, so is public, private and internal.
  **/
 
contract bank {
    
    // internal is accessable from the other contract
    uint internal myInternalValue;
    
    // private is not accessable from another contract, only bank can modify this 
    // variable.
    uint private myPrivateValue;
    
    // with public you can access it from another contract but so can the whole 
    // outside world.
    uint public myPublicValue;
    
} 

 // to extend the functionality and member atributes of bank to the 
 // lesson6Contract contract we will spesify the extension with the identifyer
 // "is", so any functionality that exhist in bank will also exhist in 
 // the lesson6Contract.  

contract lesson6Contract is bank{
    
    string private name;
    uint private age;
    
    function setName(string newName) {
        myPublicValue = 1;      //works but also the whole outside world can access it
        myInternalValue = 1;    //works and con only be accessed by these two contracts
        myPrivateValue = 1;     //does not work because its private.
        name = newName;
    }




/** 3. now were going to add some functionality to the lesson6Contract with the 
 * bank contact. 
**/
 
contract bank {
    
    // were going to set a default value when the lesson6Contract is initialized 
    // we could do it one of two ways we could set the 
    // uint private value = 10; but that means everything that inharents from the bank
    // will also inharent the value of 10, so we will make a constructor.
    uint private value;
    
    // with this constructor means that now any sort of object that inharents from the 
    // original object can also specify a starting set value, and every object
    // that inharents could have a different value.
    function bank(uint amount) {
        value = amount;
    }
    
    // all this will do is add an amount to our exhisting value.. these functions
    // are methods, if we publish the bank contract we will have access to the methods
    // but we will not have access to the value.
    function deposit(uint amount) {
        value += amount;
    }
    
    function withdraw(uint amount) {
        value -= amount;
    }
    
    function balance() constant returns (uint) {
        return value;
    }
} 

// we put (10) after bank to state the lesson6Contract object's starting value to 10
// so now when we launch the lesson6Contract we will have a starting balance of 10.
contract lesson6Contract is bank(10){
    
    string private name;
    uint private age;
    
    function setName(string newName) {
        name = newName;
    }
}




/** 4. now were going to create an abstract contract, with bank.
  **/
 
contract bank {

    // this is an abstract method/constraint, if we create it like this without putting
    // function loan() returns (bool){
    //    return true;
    // }
    // in our lesson6Contract contract we will get the error _msg:
    // This contract does not implement all functions and thus cannot be created.
    // there is no keyword abstract in solidity so this is how we get around it
    function loan() returns (bool);
} 



contract lesson6Contract is bank{
    
    function loan() returns (bool){
        return true;
    }
  
}




    /** 5. now were going to create an interface
    **/
 
interface Regulator {
    
    // The reson for the checkValue basicly to readdress the issue we raised before
    // with withdraw, we want to make sure we actually have enough funds to withdraw.
    function checkValue(uint amount) returns(bool);
    function loan() returns(bool);
}
 
    // we want to make sure our bank has the checkValue function so we will inharint 
    // the Regulator.
contract bank is Regulator {
    
    uint private value;

    function bank(uint amount) {
        value = amount;
    }
    
    function deposit(uint amount) {
        value += amount;
    }
    
    function withdraw(uint amount) {
        if(checkValue(amount)) {
            value -= amount;
        }
    }
    
    function balance() constant returns (uint) {
        return value;
    }
    
    // putting these two function up here in bank no longer classifies them as 
    // abstract, there just basic functionality.
    function loan() returns (bool){
       return value > 0;
    }
    
     function checkValue(uint amount) returns (bool){
       return value >= amount;
    }
    
} 