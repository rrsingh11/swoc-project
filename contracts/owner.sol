// SPDX-License-Identifier:MIT 
 
pragma solidity ^0.8.7; 
 
contract Owner { 
    address public owner; 
    mapping(address=>bool) isAdmin; 
    event OwnerChanged(address indexed _from,address indexed _to); 
    event AdminAdded(address indexed Admin_Address); 
 
    constructor() { 
        owner = msg.sender; 
        isAdmin[msg.sender]=true; 
    } 
 
    modifier onlyOwner(){ 
        require(owner == msg.sender,"Only Owner has permission to do that action"); 
        _; 
    } 
 
     modifier onlyAdmin(){ 
        require(isAdmin[msg.sender] == true,"Only Admin has permission to do that action"); 
        _; 
    } 
 
    function setOwner(address _owner) public onlyOwner returns(address){ 
        require(msg.sender!=_owner,"Already Your the owner"); 
        owner = _owner; 
        emit OwnerChanged(msg.sender, _owner); 
        return _owner; 
    } 
 
    function addAdmin(address _address) public onlyAdmin returns(bool){ 
        require(!isAdmin[_address],"User is already an admin"); 
        isAdmin[_address]=true; 
        emit AdminAdded(_address); 
        return true; 
    } 
 
}