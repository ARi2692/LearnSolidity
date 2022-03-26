// SPDX-License-Identifier: MIT

pragma solidity ^0.8.10;

// concepts of functions and operations.
// visibility - for functions and variables
    // public - inside and outside the contract, 
    // external - only from outside contract, 
    // internal - only inside contract and child contracts, 
    // private - only inside contract
// view - read the state variables / data from blockchain 
// pure - niether read nor write the state variables / data from blockchain 

contract functionIntro {

    uint num = 2;

    // adding -
    function add(uint x, uint y) external pure returns(uint) {
        return x + y; 
    }

    // subtracting
    function sub(uint x, uint y) internal returns(uint) {
        num--;
        return x - y; 
    }

    // multiplying and modulus
    function mul(uint x, uint y) public view returns(uint) {
        return x * y % num; 
    }

    // dividing 
    function div(uint x, uint y) private pure returns(uint) {
        return x / y;
    }

// functions outputs - 
    // return multiple outputs
    // Name outputs
    // destructuring Assignment

    function returnMany() public pure returns(uint, bool) {
        return (1, true);
    }

    function named() public pure returns(uint x, bool b) {
        return ( 1, true);
    }

    // more gas efficent 
    function assigned() public pure returns(uint x, bool b) {
        x = 1;
        b = true;
    }

    function destructuringAssignments() pure public {
        (uint x, bool b) = returnMany();
        (, bool _b) = returnMany();
    }
}