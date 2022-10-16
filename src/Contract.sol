// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract Contract {
    int256 public x = 0;

    function add(int256 y) external{
        x += y;
        emit Add(x, y);
    }

    function sub(int256 y) external{
        x -= y;
        emit Sub(x, y);
    }

    event Add(int256 x, int256 y);
    event Sub(int256 x, int256 y);
}
