// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "src/Variable.sol";
import "src/Equation.sol";
import "forge-std/Vm.sol";
import "test/utils/RandomAddress.sol";

contract EquationTest is Test, RandomAddress {
   
    Equation testEquation;

    function setUp() public {        
        testEquation = new Equation(0, 0);
    }

    function testAPlusB() public {
        Variable oldA = testEquation.a();
        testEquation.aAddB();
        Variable newA = testEquation.a();
        assertEq(newA.x() - oldA.x(), (testEquation.b()).x());
    }

    function setAB() public {
        testEquation.a().add(5);
        testEquation.b().add(10);
    }

    function testAEqB() public {
        setAB();
        testEquation.a().add(5);
        assertEq(testEquation.a().x(), testEquation.b().x());
    }
}
