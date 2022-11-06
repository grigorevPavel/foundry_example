// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "./Variable.sol";

contract Equation {
    Variable public a;
    Variable public b;

    constructor(int256 a_, int256 b_) {
        a = new Variable(a_);
        b = new Variable(b_);
    }

    function aAddB() external {
        a.add(b.x());
    }

    function bAddA() external {
        b.add(a.x());
    }

    function isEqual() external returns(bool) {
       return a.x() == b.x();
    }
}