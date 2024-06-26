// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MyToken {
    // Mapping of balances
    mapping (address => uint256) public balances;

    // Mapping of allowances
    mapping (address => mapping (address => uint256)) public allowances;

    // Total supply of tokens
    uint256 public totalSupply;

    // Token name
    string public name;

    // Token symbol
    string public symbol;

    // Token decimals
    uint8 public decimals;

    // Event emitted when tokens are transferred
    event Transfer(address indexed from, address indexed to, uint256 value);

    // Event emitted when tokens are approved for spending
    event Approval(address indexed owner, address indexed spender, uint256 value);

    // Event emitted when tokens are burned
    event Burn(address indexed burner, uint256 value);

    /**
     * @dev Initializes the contract with a token name, symbol, and decimals
     */
    constructor() public {
        name = "MyToken";
        symbol = "MTK";
        decimals = 18;
        totalSupply = 0;
    }

    /**
     * @dev Mints tokens to a provided address
     * @param _to The address to mint tokens to
     * @param _amount The amount of tokens to mint
     */
    function mint(address _to, uint256 _amount) public {
        require(msg.sender == owner, "Only the owner can mint tokens");
        totalSupply += _amount;
        balances[_to] += _amount;
        emit Transfer(address(0), _to, _amount);
    }

    /**
     * @dev Transfers tokens from one address to another
     * @param _from The address to transfer tokens from
     * @param _to The address to transfer tokens to
     * @param _amount The amount of tokens to transfer
     */
    function transfer(address _from, address _to, uint256 _amount) public {
        require(balances[_from] >= _amount, "Insufficient balance");
        balances[_from] -= _amount;
        balances[_to] += _amount;
        emit Transfer(_from, _to, _amount);
    }

    /**
     * @dev Approves an address to spend tokens on behalf of another address
     * @param _owner The address that owns the tokens
     * @param _spender The address that is approved to spend tokens
     * @param _amount The amount of tokens that can be spent
     */
    function approve(address _owner, address _spender, uint256 _amount) public {
        allowances[_owner][_spender] = _amount;
        emit Approval(_owner, _spender, _amount);
    }

    /**
     * @dev Burns tokens from a provided address
     * @param _from The address to burn tokens from
     * @param _amount The amount of tokens to burn
     */
    function burn(address _from, uint256 _amount) public {
        require(balances[_from] >= _amount, "Insufficient balance");
        balances[_from] -= _amount;
        totalSupply -= _amount;
        emit Burn(_from, _amount);
    }
} //  
