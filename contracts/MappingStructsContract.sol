pragma solidity ^0.4.10;

/** This is from the DesignCourse Video Series on youtube the I added the part:
    modifier onlyFiveAccounts () {
        assert(ownersAccounts.length <= 4);
        _;
    }
 That limits the amount of addresses in the address array 
 https://youtu.be/gfXewa4xmYE thats a link to the mapping video lesson, awesome
 video.
**/

contract multiOwner {
    
    struct Owner {
        uint age;
        string fName;
        string lName;
    }
    
    mapping (address => Owner) ownersAddresses;
    
    address[] ownersAccounts;
    
    modifier onlyFiveAccounts () {
        assert(ownersAccounts.length <= 4);
        _;
    }
    
    function setOwner(address _address, uint _age, string _fName, string _lName) onlyFiveAccounts public {
        var owner = ownersAddresses[_address];
        
        owner.age = _age;
        owner.fName = _fName;
        owner.lName = _lName;
        
        ownersAccounts.push(_address) -1;
    }
    
    function getOwners() view public returns(address[]) {
            return ownersAccounts;

    }
    
    function getOwner(address _address) view public returns (uint, string, string) {
            return (ownersAddresses[_address].age, ownersAddresses[_address].fName, ownersAddresses[_address].lName);
    }
    
    function countOwners() view public returns (uint) {
            return ownersAccounts.length;
    }
}
