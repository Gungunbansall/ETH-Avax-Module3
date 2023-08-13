// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

// Uncomment this line to use console.log
// import "hardhat/console.sol";

contract MyToken {
    // public variables here
    string public tokenName = "Aish";
    string public tokenAbbrv = "Meta";
    uint public totalSupply = 0;
    
    // Owner address
    address public owner;

    //mapping variables here
    mapping (address => uint) public balances;

    constructor() {
        owner = msg.sender; // Set the contract deployer as the owner
    }
    
    // Modifier that only allows the owner to perform the action
    modifier onlyOwner() {
        require(msg.sender == owner, "Only the owner can call this function");
        _;
    }

    //mint function code here increases balances
    function mint(address _address, uint _value) public onlyOwner {
        totalSupply += _value;
        balances[_address] += _value;
    }

    //burn function code here opposite of mint function
    function burn(address _address, uint _value) public onlyOwner {
        require(balances[_address] >= _value, "Insufficient balance");

        totalSupply -= _value;
        balances[_address] -= _value;
    }

    function transfer(address to, uint256 amount) public {
        require(to != address(0), "Invalid address");
        require(amount > 0, "Amount must be greater than 0");
        require(balances[msg.sender] >= amount, "Insufficient balance");

        balances[msg.sender] -= amount;
        balances[to] += amount;
    }
}
