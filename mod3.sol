// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract MyToken is ERC20 {
    // public variables here
    string public tokenName = "Metacrafters";
    string public tokenAbbrv = "Meta";

    // Owner address
    address public owner;

    constructor() ERC20(tokenName, tokenAbbrv) {
        owner = msg.sender; // Set the contract deployer as the owner
    }

    // Modifier that only allows the owner to perform the action
    modifier onlyOwner() {
        require(msg.sender == owner, "Only the owner can call this function");
        _;
    }

    //mint function code here increases balances
    function mint(address _address, uint _value) public onlyOwner {
        _mint(_address, _value);
    }

    //burn function code here opposite of mint function
    function burn(address _address, uint _value) public onlyOwner {
        _burn(_address, _value);
    }

    // transfer function
    function transfer(address recipient, uint256 amount) public override returns (bool) {
        _transfer(msg.sender, recipient, amount);
        return true;
    }
}
