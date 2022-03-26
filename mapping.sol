// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

contract Mapping {
    // Mapping from address to uint
    mapping(address => uint) public myMap;

    // fetches the value at this address
    function get(address _addr) public view returns (uint) {
        return myMap[_addr];
    }

    // Update the value at this address
    function set(address _addr, uint _i) public {
        myMap[_addr] = _i;
    }

    // Reset the value to the default value.
    function remove(address _addr) public {
        delete myMap[_addr];
    }
}

contract NestedMapping {
    // Nested mapping (mapping from address to another mapping)
    mapping(address => mapping(uint => bool)) public nested;

    function get(address _addr1, uint _i) public view returns (bool) {
        return nested[_addr1][_i];
    }

    function set( address _addr1, uint _i, bool _boo) public {
        nested[_addr1][_i] = _boo;
    }

    function remove(address _addr1, uint _i) public {
        delete nested[_addr1][_i];
    }

// iterable mapping

    mapping(address => uint) public balances;
    mapping(address => bool) public inserted;
    address[] public keys;

    function set(address _key, uint _value) external {
        balances[_key] = _value;

        if (!inserted[_key]) {
            inserted[_key] = true;
            keys.push(_key);
        }
    }

    // get no of elements 
    function getSize() view public returns (uint) {
        return keys.length;
    }

    // get the balances of each element
    function getElem(uint _i) view public returns(uint) {
            return balances[keys[_i]];
    }

    // access all elements
    function foo() view public {
        uint x = getSize();
        for(uint i=0; i<x; i++) {
            getElem(i);
        }
    } 
}
