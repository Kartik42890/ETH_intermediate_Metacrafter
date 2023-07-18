This contract implements the require(), assert(), and revert() statements.

Functions
set(): Sets the value of the value variable. The function requires that the new value be greater than 0.
assertValid(): Asserts that the value of the value variable is greater than 0. If the value is not greater than 0, the function will revert.
revertIfInvalid(): Checks if the value of the value variable is less than or equal to 0. If it is, the function reverts with the message "Invalid value".
Usage
To use the contract, you can first deploy it to a blockchain network. Once the contract is deployed, you can interact with it by calling the set(), assertValid(), and revertIfInvalid() functions.

Example
The following code shows how to deploy the contract and call the set() function:

solidity
pragma solidity ^0.8.0;

import "./RequireAssertRevert.sol";

contract Example {

function deployContract() public {
RequireAssertRevert contract = new RequireAssertRevert(10);
contract.set(20);
}

}

This code will deploy the RequireAssertRevert contract and call the set() function with the value 20. If the value is not greater than 0, the function will revert.

License
The contract is licensed under the MIT License.
