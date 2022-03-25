// SPDX-License-Identifier: MIT

pragma solidity ^0.8.10;

// all the data types - value and reference

contract basicConcepts {
    
    // Value types - boolean, integer
    bool public boolValue = true; // default is false

    // uint is an , same for int 
    // uint(alias for uint256) range from 0 to 2 ** n - 1 , 0 to 2 ** 256 - 1
    // int(alias for int256) range from - 2 ** (n - 1) - 1 to 2 ** (n - 1) - 1, -2 ** 255 to 2 ** 255 - 1
    uint public number1 = 123; // default is 0
    int public signedNumber1 = -123; // default is 0

    // minimum and maximum of int or uint 
    int public minInt = type(int).min;
    uint public maxUint = type(uint).max;

    // address - hexadecimal - 40hex / 20 bytes
    // declaring state variables as constant, when its value never change, saves gas 
    address public addr = 0xCA35b7d915458EF540aDe6068dFe2F44E8fa733c; // default - sequence of 40 zeroes
    address public constant MY_ADDR = 0x7777b7D915458Ef540ade6068dFe2F44e8FA733C;

    // fixed-sized byte arrays - bytes1, bytes32.. - bytes32 - keechak256
    // dynamically-sized byte arrays - bytes 
    bytes1 a = 0xb5; // default - 0x00 
    bytes32 b; // default - sequence of 64 zeroes
    
}