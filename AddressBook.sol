// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.5.10;

contract AddressBook {

    mapping(address => address[]) private _addresses;

    mapping(address => mapping(address => string)) private _aliases;

    function getAddressArray(address addr) public view returns (address[] memory) {
        return _addresses[addr];
    }

    function addAddress(address addr, string memory alia) public {
        _addresses[msg.sender].push(addr);
        _aliases[msg.sender][addr] = alia;
    }

    function removeAddress(address addr) public  {  // ta =3  length =3 0x2 
      
        uint length = _addresses[msg.sender].length; //length =3
        for(uint i = 0; i < length; i++) { //i<3
           
            if (addr == _addresses[msg.sender][i]) {  // 0x2 == 2
               
                if(1 < _addresses[msg.sender].length && i < length-1) { // 1<3 && 1 < 2 
                  
                    _addresses[msg.sender][i] = _addresses[msg.sender][length-1]; // deleted address = address [3]
                }
          
               
                delete _addresses[msg.sender][length-1];      
                _addresses[msg.sender].length--;    
                delete _aliases[msg.sender][addr];
                 
                break;
            }
        }
    }

    function getLen() public view returns (uint)
    {
        return _addresses[msg.sender].length;
    }
    
    function getAlias(address addrowner, address addr) public view returns (string memory) {
        return _aliases[addrowner][addr];
    } 
}

