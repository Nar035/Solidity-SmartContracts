// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.0;

contract Time
{
        mapping (address => uint) public balances;

        mapping (address => uint) public lockedTime;
         

         function deposit() external payable
         {
                balances[msg.sender] += msg.value;
                lockedTime[msg.sender] = block.timestamp + 1 weeks;
         }

        function withdraw() public payable
         { 
                   
        require(balances[msg.sender] > 0, "insufficient funds");

        // check that the now time is > the time saved in the lock time mapping
        require(block.timestamp > lockedTime[msg.sender], "lock time has not expired");
      

        // update the balance
        uint amount = balances[msg.sender];
        balances[msg.sender] = 0;

       
        // send the ether back to the sender
        (bool sent, ) = msg.sender.call{value: amount}("");
        require(sent, "Failed to send ether");
         }

         function getBalance() public view returns (uint)
         {
             return balances[msg.sender];
         }

}