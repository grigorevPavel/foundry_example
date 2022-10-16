// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract Contract {
    uint256 x = 0;

    function add(uint256 y) external{
        x += y;
        emit Add(x, y);
    }

    function sub(uint256 y) external{
        x -= y;
        emit Sub(x, y);
    }

    event Add(uint256 x, uint256 y);
    event Sub(uint256 x, uint256 y);
}
