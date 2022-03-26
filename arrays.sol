// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

contract Array {
    
    // dynamic sized array
    uint[] public arr;
    uint[] public arr2 = [1, 2, 3];
    // Fixed sized array
    uint[10] public myFixedSizeArr;

    function get(uint i) public view returns (uint) {
        return arr[i];
    }

    // Solidity can return the entire array.
    // But this function should be avoided for arrays that can grow indefinitely in length.
    function getArr() public view returns (uint[] memory) {
        return arr;
    }

    // appends at the end
    function push(uint i) public {
        arr.push(i);
    }

    // removes the last element
    function pop() public {
        arr.pop();
    }

    function getLength() public view returns (uint) {
        return arr.length;
    }

    // doesn't change the array length, value changes to 0
    function deleteArr(uint index) public {
        delete arr[index];
    }

    // create array in memory, only fixed size can be created
    function examples() pure external {
        uint[] memory a = new uint[](5);
        a[1] = 12;
    }

    // for removing an element from array
    function remove(uint _index) public {
        require(_index < arr.length, "index out of bound");

        for (uint i = _index; i < arr.length - 1; i++) {
            arr[i] = arr[i + 1];
        }
        arr.pop();
    }

    function test1() external {
        arr = [1, 2, 3, 4, 5];
        remove(2);         // [1, 2, 4, 5]
        assert(arr[0] == 1);
        assert(arr[1] == 2);
        assert(arr[2] == 4);
        assert(arr[3] == 5);
        assert(arr.length == 4);

        arr = [1];
        remove(0);          // []
        assert(arr.length == 0); 
    }

    // when the order of elements are not important
    function remove(uint index) public {
        // Move the last element into the place to delete - exchange the places
        arr[index] = arr[arr.length - 1];
        // Remove the last element
        arr.pop();
    }

    function test2() public {
        arr = [1, 2, 3, 4];

        remove(1);
        // [1, 4, 3]
        assert(arr.length == 3);
        assert(arr[0] == 1);
        assert(arr[1] == 4);
        assert(arr[2] == 3);

        remove(2);
        // [1, 4]
        assert(arr.length == 2);
        assert(arr[0] == 1);
        assert(arr[1] == 4);
    }
}
