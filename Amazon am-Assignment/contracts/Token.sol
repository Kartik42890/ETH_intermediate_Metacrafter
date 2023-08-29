// SPDX-License-Identifier: MIT
pragma solidity >=0.5.0 <0.9.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract Token is ERC20, ERC20Burnable, Ownable {
    constructor() ERC20("Rizzlers", "RIZZ") {}

    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }

    // This function allows the owner to burn a specific amount of their own tokens
    function burnFromOwner(uint256 amount) public onlyOwner {
        _burn(owner(), amount);
    }

    // This function allows any holder to transfer tokens to another address
    function transferTokens(address to, uint256 amount) public {
        _transfer(msg.sender, to, amount);
    }
}
