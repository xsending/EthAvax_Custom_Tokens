# EthAvax_Custom_Tokens

This program is a demonstration on having your own ERC20 token by importing ERC20.sol from OpenZeppelin which contains the standard functions for ERC20 tokens. The purpose of this program is to show how various addresses, including the owner address, interact with each other when minting, burning, and transferring tokens.

## Description

This program shows the process on how various addresses can mint, burn, and transfer ERC20 tokens. It imports the ERC20 contract from OpenZeppelin containing all the standard functions of an ERC20 token, and shows how these functions operate. The program includes two functions, namely mint and burn. Because the standard functions of the ERC20 token does not include mint and burn functions that can be publicly called, you have to explicitly declare your own.   

## Getting Started

### Executing program
To run this program, you can use the Remix IDE(https://remix.ethereum.org). To properly use the program, take note of the following:
1. Create a new file, and simply copy this code and compile it on the "Solidity Compiler" tab
  ```javascript
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

```
2. Take note of the address that will be running the contract. That will be the owner of the contract.
3. Always check the current user of the contract (right under the "environment" dropdown bar in the deploy tab). Calling the mint function will require the active user to be the owner.
4. To properly use the transfer function, you first have to approve an amount for the address that you want to initiate the token transfer.
5. When transferring the token, once again take note of the current user of the contract. The address with the approved amount should be the current active user of the contract.

## Authors

Abel Gomez  

## License

This project is licensed under the MIT License - see the LICENSE.md file for details
