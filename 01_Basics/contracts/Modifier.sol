// SPDX-License-Identifier: MIT
pragma solidity 0.8.28;

contract Modifier{
    address public owner;
    bool public paused;
    mapping(address => uint256) public balances;

    constructor() {
        owner = msg.sender;
        paused = false;
        balances[owner] = 1000;
    }

    modifier  onlyOwner(){
        require(msg.sender == owner, "Only owner can perform this task");
        _;
  
    }

    modifier notPaused(){
        require(!paused, "The contract is paused, try again later");
        _;
    }

    function pause() public onlyOwner {
        paused = true;
    }

    function unpause() public onlyOwner {
        paused = false;
    }

    function transfer(address to, uint256 amount) public notPaused{
        require(balances[msg.sender] >= amount, "The amount you have in your account is insufficient");

        balances[msg.sender] = balances[msg.sender] - amount;
        balances[to] = balances[to] + amount;

    }

}