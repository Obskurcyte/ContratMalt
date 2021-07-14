// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.0;

contract Locker {
    uint256 public limitDate = 1639526410; // date = 15 dec 2021
    address payable recipient =
        payable(0x73aBcDB09e09983c602FA02aa498F332A959c663); //replace this address with your one
    receive() external payable {}
    function withdrawEth() external {
        //this prevents the code inside the function to be run if the due date (epoch format) has not been met yet.
        require(block.timestamp >= limitDate, "Due date has not been met yet");
        // send all the contract balance to recipient
        recipient.transfer(address(this).balance);
    }
}
