// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract Variable {
    int256 public x;

    constructor(int256 y) {
        x = y;
    }

    function add(int256 y) external {
        x += y;
        emit Add(x, y);
    }

    function sub(int256 y) external {
        x -= y;
        emit Sub(x, y);
    }

    function div(int256 y) external {
        require(y != 0, "Error: Division by zero");
        x /= y;
        emit Div(x, y);
    }

    event Add(int256 x, int256 y);
    event Sub(int256 x, int256 y);
    event Div(int256 x, int256 y);
}
