// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

contract FunctionModifier {

    address public owner;
    uint public x;
    uint public count;

    constructor(uint _x) {
        // called only once when the contract is deployed
        // Set the transaction sender as the owner of the contract.
        owner = msg.sender;
        x = _x;
    }

    // Modifier to check that the caller is the owner of
    // the contract.
    modifier onlyOwner() {
        require(msg.sender == owner, "Not owner");
        // underscore tells Solidity to execute the rest of the code
        _;
    }

    // Modifiers can take Inputs
    modifier validAddress(address _addr) {
        require(_addr != address(0), "Not valid address");
        _;
    }

    function changeOwner(address _newOwner) public onlyOwner validAddress(_newOwner) {
        owner = _newOwner;
    }

    // Sandwich - can call the function in between the codes
    modifier sandwich() {
        count += 10;
        _;
        count -= 2;
    }

    function decrement(uint i) public sandwich {
        count -= i;
    }
}