// SPDX-License-Identifier: MIT

pragma solidity ^0.8.10;

contract error {

    // require - used to validate input and for access control, long the error msg more gas
    function testReq(uint _i) pure public {
        require(_i <= 10, "i > 10");
    }

    // revert - used to validate input 
    function testRev(uint _i) pure public {
        if ( _i <= 10) {
            _i %= 2;
            if (_i >= 3) {
                revert("i > 5");
            }    
        }        
    }

    // assert - used to check for code that should never be false
    uint public num = 123;

    function testAssert() public view {
        assert(num == 123);
    } 

    // custom errors - cheaper than require

    error myErr(address caller, uint value);

    function testCusErr(uint _i) view public {
        if(_i <= 10) {
            revert myErr(msg.sender, _i);
        }
    }

    error InsufficientBalance(uint balance, uint withdrawAmount);

    function testCustomError(uint _withdrawAmount) public view {
        uint bal = address(this).balance;
        if (bal < _withdrawAmount) {
            revert InsufficientBalance({balance: bal, withdrawAmount: _withdrawAmount});
        }
    }
}

contract Account {
    uint public balance;
    uint public constant MAX_UINT = 2**256 - 1;

    function deposit(uint _amount) public {
        uint oldBalance = balance;
        uint newBalance = balance + _amount;

        // balance + _amount does not overflow if balance + _amount >= balance
        require(newBalance >= oldBalance, "Overflow");

        balance = newBalance;

        assert(balance >= oldBalance);
    }

    function withdraw(uint _amount) public {
        uint oldBalance = balance;

        // balance - _amount does not underflow if balance >= _amount
        require(balance >= _amount, "Underflow");

        if (balance < _amount) {
            revert("Underflow");
        }

        balance -= _amount;

        assert(balance <= oldBalance);
    }
}
