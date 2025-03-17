// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

contract BiometricAuthentication {
    // Declare variables to store project title and description
    string public projectTitle;
    string public projectDescription;

    // Declare an owner of the contract
    address public owner;

    // Event to log the project information update
    event ProjectUpdated(string title, string description);

    // Modifier to restrict access to only the owner of the contract
    modifier onlyOwner() {
        require(msg.sender == owner, "You are not the owner!");
        _;
    }

    // Constructor to set the initial project title and description
    constructor() {
        owner = msg.sender;
        projectTitle = "Blockchain-based Biometric Authentication";
        projectDescription = "Implement a secure biometric authentication system on the blockchain.";
    }

    // Function to update project title and description (onlyOwner modifier used)
    function updateProjectDetails(string memory _title, string memory _description) public onlyOwner {
        projectTitle = _title;
        projectDescription = _description;

        emit ProjectUpdated(_title, _description);
    }

    // Function to get project details
    function getProjectDetails() public view returns (string memory, string memory) {
        return (projectTitle, projectDescription);
    }

    // Function to get the owner address
    function getOwner() public view returns (address) {
        return owner;
    }
}

