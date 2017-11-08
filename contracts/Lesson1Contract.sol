pragma solidity ^0.4.0;

contract testContract {
 
// 1. this is a simple variable, if we want to get the value of the variable word
// we have to add public befor the variable name, this is a getter because the
// button lets us get the information.  setters let you change the information.
// in solidity when you creat the contract it automaticly fires all the getters
// at the beginning so you get the value right away. 
// this is also just like a function, but its not very good because anyone who 
// has access to the contract can call that getter.

//  string public word = "test this contract";
  

// 2. custome getter for sinsitive variables
// we got rid of the word public so the variable doesn't create a getter.

    string word = "test this contract";
    
// next we will create a function that will return the variable word.
// in a function you have to define the type of data you want to return, this 
// is why we add "constant returns (string)", if you creat this function without
// the word "constant" before the part "returns(string)" you will have a setter,
// it will still give you the right return value but it will create a transaction
// on the blockchain, it will apend the blockchain and cost gas, but in this
// case we are not changing anything we are just returning the variable word.
// when you simply want to return something from the current block you should 
// use a getter, so we use the key word constant.
  
    function getWord() constant returns(string) {
// this is an argument in the function.
      return word;
    }

// Now we are going to change the value of the variable word so we need to make
// a setter, we don't need the constant key word. 

    function setWord(string newWord)  returns(string) {
       word = newWord;  
       return word;
    }
}

// getters do not creat new blocks but setters do miners do the apending.

