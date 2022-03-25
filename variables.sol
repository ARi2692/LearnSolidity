// SPDX-License-Identifier: MIT

pragma solidity ^0.8.10;

// State variables - declared inside a contract but outside a function 
// local variables - declared inside function
// global variables - declared both inside and outside of function 
contract Variables {

    // state variables - stored on blockchain
    uint public myUint = 123;
    string public text = "Hello";

    // global variables - exist in global workspace 
    uint timestamp;

    function myFunc() external {

        // Local variables - not saved to the blockchain
        uint i = 234;
        bool check = true;
        // operations on local variable restricted only within the function
        i += 123;
        check = !(check);

        // using the state variables - changes the value
        myUint = 234;
        text = "Hello World";

        // global variables - provides information about the blockchain
        timestamp = block.timestamp; // Current block timestamp
        address myAddr = msg.sender; // address of the caller
        uint blockNum = block.number; // current block number
    }
}