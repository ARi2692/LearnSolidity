// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

contract Loops {
    function loop() pure public {
        // for loop
        for (uint i = 0; i < 10; i++) {
            if (i == 3) {
                // Skip to next iteration with continue
                continue;
            }
            if (i == 5) {
                // Exit loop with break
                break;
            }
        }

        // while loop
        uint j;
        while (j < 10) {
            j++;
        }
    }

    // in loops gas price more, so try for smaller loops
    function sum(uint _y) pure public returns(uint) {
        uint s;
        for (uint i = 0; i <= _y; i++) {
            s += i;
        }
        return s;
    }
}