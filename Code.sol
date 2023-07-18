// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract RequireAssertRevert {

  uint256 public value;

  constructor(uint256 initialValue) {
    value = initialValue;
  }

  function set(uint256 newValue) public {
    require(newValue > 0);
    value = newValue;
  }

  function assertValid() public view {
    assert(value > 10);
  }

  function revertIfInvalid() public view {
    if (value <= 0) {
      revert("Invalid value");
    }
  }
}
