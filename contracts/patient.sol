//SPDX-License-Identifier:MIT 
pragma solidity ^0.8.7; 
import "./contract.sol"; 
 
contract Patient is Hospital{ 
    uint256 public i;   // i -> patient index 
 
    struct pRecords{    // to get the information of a patient 
        string name; 
        uint patientId; 
        string gender; 
        string bloodgroup; 
        address addr; 
        hRecords[] records; 
    } 
 
    struct hRecords{    // getting hospitals informations 
        string hospitalName; 
        string admittedOn; 
        string dischargedOn; 
    } 
 
    mapping(address=>pRecords) patients; 
    mapping(address=>bool) isPatient; 
    address[] patientlist; //array to store the address of patients added 
 
    function addHrecord(address _addr,string memory _hname,string memory _admittedOn,string memory _dischargedOn) public{ 
        require(isPatient[_addr],"User Not registered"); 
        patients[_addr].records.push(hRecords(_hname,_admittedOn,_dischargedOn)); 
    } 
 
    function addPatient(string memory _name, uint _patientId, string memory _gender, string memory _bloodgroup) public { 
        require(!isPatient[msg.sender],"PAtient already Exists"); 
        patientlist.push(msg.sender); 
        i=i+1; 
        isPatient[msg.sender]=true; 
        patients[msg.sender].name=_name; 
        patients[msg.sender].patientId=_patientId; 
        patients[msg.sender].gender=_gender; 
        patients[msg.sender].bloodgroup=_bloodgroup; 
        patients[msg.sender].addr=msg.sender; 
    }  
}

