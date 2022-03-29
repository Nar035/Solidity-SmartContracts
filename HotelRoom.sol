// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.7.6;

contract HotelRent 
{
    address payable public owner; 

    event Occupy(address _Occupant, uint _value); // Passes a message of room stay and value 

    enum statuses {Vacant, Occupied}  // Enum to get room statuse 

    statuses currentStatues;

    constructor()
    {
        owner = msg.sender;
         currentStatues = statuses.Vacant;
    }
 //Checks the statues of Room availability
    modifier onlyWhileVacant()
    {
        require(currentStatues == statuses.Vacant, "Currently Occupied");
        _;
    }
 //Checks the cost of room rent 
    modifier costs(uint _amount)
    {
        require(msg.value >= _amount, "Required min. Ether to book");
        _;
    }
// Payable function 
    receive() external payable onlyWhileVacant costs(2 ether)
    {
        currentStatues = statuses.Vacant;
        owner.transfer(msg.value); // Transfers amount to owner address
        emit Occupy(msg.sender, msg.value); //Emit Event
    }
}