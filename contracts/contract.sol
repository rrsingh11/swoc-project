//SPDX-License-Identifier:MIT 
pragma solidity ^0.8.7; 
import "./owner.sol"; 
 
contract Hospital is Owner{ 
    uint public index; 
    mapping(address=>bool) isHospital; 
    struct hospital { 
        uint256 id; 
        string hname; 
        string haddress; 
        string hcontact; 
        address addr; 
        bool isApproved; 
    } 
 
    mapping(address=>hospital) hospitals; 
    address[] public hospitalList; 
 
    function addHospital(string memory _hname,string memory _haddress,string memory _hcontact,address _addr) public { 
        require(!isHospital[_addr],"Already a Hospital"); 
        hospitalList.push(_addr); 
        index = index + 1; 
        isHospital[_addr]=true; 
        hospitals[_addr]=hospital(index,_hname,_haddress,_hcontact,_addr,true); 
    } 
     
    function getHospitalByAddress(address _address) public view returns(uint256 id,string memory hname,string memory haddress , string memory hcontact ,address addr , bool isApproved) { 
        require(hospitals[_address].isApproved,"Hospital is not Approved or doesn't exist"); 
        hospital memory tmp = hospitals[_address]; 
        return (tmp.id,tmp.hname,tmp.haddress,tmp.hcontact,tmp.addr,tmp.isApproved); 
    }     
 
 
}