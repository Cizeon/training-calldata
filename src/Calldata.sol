// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.19;

contract Calldata {
    struct MyStruct {
        uint16 a;
        uint16 b;
        uint256 c;
    }

    uint256 public sum;
    uint256[] public array;
    string public message;
    MyStruct public myStruct;

    function fixedCalldata(uint256 _a, uint256 _b) external {
        sum = _a + _b;
    }

    function structCalldata(MyStruct calldata _struct) external {
        myStruct = _struct;
    }

    function arrayCalldata(uint256[] calldata _array) external {
        array = _array;
    }

    function stringCalldata(string calldata _message) external {
        message = _message;
    }

    function fixedAndArrayCalldata(uint256 _a, uint256 _b, uint256[] calldata _data) external {
        sum = _a + _b;
        array = _data;
    }

    function fixedAndArrayAndFixedCalldata(uint256 _a, uint256 _b, uint256[] calldata _data, uint256 _c) external {
        sum = _a + _b + _c;
        array = _data;
    }

    function ultimateCalldata(
        uint256 _a,
        uint256 _b,
        uint256[] calldata _data1,
        string calldata _message,
        uint256[] calldata _data2
    ) external {
        sum = _a + _b;
        array = _data1;
        array = _data2;
        message = _message;
    }
}
