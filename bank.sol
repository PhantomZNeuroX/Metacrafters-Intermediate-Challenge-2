// SPDX-License-Identifier: MIT
pragma solidity 0.8.18;

contract Bank {
    mapping(address => uint) public balances;
    uint public totalDeposits;

    function deposit(uint _amount) public {
        require(_amount > 0, "Deposit amount must be greater than 0");
        balances[msg.sender] += _amount;
        totalDeposits += _amount;
    }

    function withdraw(uint _amount) public {

        if (balances[msg.sender] < _amount){
            revert("Insufficient balance");
        }
        
        balances[msg.sender] -= _amount;
        totalDeposits -= _amount;
    }

    function closeAccount() public {
        uint balance = balances[msg.sender];
        balances[msg.sender] = 0;
        totalDeposits -= balance;
        assert(totalDeposits >= 0);

    }

}
