// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.6;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/ERC20.sol";

contract TokenCreator is ERC20 {
    address owner;

    constructor(string memory name, string memory symbol) ERC20(name, symbol)  {
        
         owner = msg.sender;
        _mint(owner, 10000e18);
    }

    function withdrawTroken(address _address, uint amount) external {
        require(msg.sender == owner, "Not owner");
        require(_address != address(0), "Can't withdraw to zero address");

        uint balance = balanceOf(address(this));
        require(balance >= amount, "Insufficient funds in contract");

        _transfer(owner, _address, amount);
    }

    function approveToken(address _address, uint amount) external {
        require(msg.sender == owner, "Not owner");
        require(_address != address(0), "Can't withdraw to zero address");

        uint balance = balanceOf(address(this));
        require(balance >= amount, "Insufficient funds in contract");

        _approve(owner, _address, amount);
    }
}