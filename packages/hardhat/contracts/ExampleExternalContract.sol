// SPDX-License-Identifier: MIT
pragma solidity 0.8.4;

import "hardhat/console.sol";

contract ExampleExternalContract {
    bool public completed;

    function complete() public payable {
        completed = true;
    }

    function transferEthBack(address _stakerContract) public payable {
        console.log("External contract address", address(this).balance);
        completed = false;
        (bool success, ) = _stakerContract.call{value: address(this).balance}(
            ""
        );
        require(success, "Failed to send Ether to Staker contract");
    }
}
