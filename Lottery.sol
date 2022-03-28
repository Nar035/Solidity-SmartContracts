// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.4.16 <0.9.0;

contract Lottery
{
    address public manager; //Owner's variable
    address payable[] public participants; //Participants Dynamic array

    constructor ()
    {
        manager = msg.sender; // Assigning the owner of the contract
    }

    receive () payable external // function for recieving values
    { 
        require(msg.value == 1 ether);
        participants.push(payable(msg.sender));
    }
     //checking contract balance
    function getBalance() public view returns(uint)   
    {
        require(msg.sender == manager);
        return address(this).balance;
    }

    function random() internal view returns(uint){
       return uint(keccak256(abi.encodePacked(block.difficulty, block.timestamp, participants.length)));
    }

    function pickWinner() public{

        require(msg.sender == manager);
        require (participants.length >= 3);

        uint r = random();
        address payable winner;


        uint index = r % participants.length;

        winner = participants[index];

        winner.transfer(getBalance());

        participants = new address payable[](0);
    }

}
