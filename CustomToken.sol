// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v4.0.0/contracts/token/ERC20/ERC20.sol";

contract CustomToken is ERC20 {
    address public owner; 
    constructor() ERC20("Custom Token", "CTK") {
        owner = msg.sender;
        _mint(msg.sender, 100000 * (10 ** uint(decimals()))); // Mint 100,000 tokens with 18 decimal places
    }

    function mint(address account, uint256 amount) public {
        require(msg.sender == owner, "You are not the owner of the contract.");
        _mint(account, amount);
    }

    function burn(address account, uint256 amount) public {
        _burn(account, amount);
    }
}

