pragma solidity ^0.8.0;

// SYNOPSIS: This is basically a payment splitter. It receives a 100% worth of recipient and sends them the funds which have been deposited in the contract.
// I've done my best to circumvent any potential security flaws (especially since the GUI isn't really needed to interact with the contracts) but this might still need to be tested. 
// You should also check out this OpenZeppelin audited branch which holds similar logic (payments splitter): 
// https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/finance/PaymentSplitter.sol

import "./Ownable.sol"; //Added for extended management of the contract


contract AppStein {
    using SafeMath for uint;

    // VARIABLES
    uint256 internal amountForCalc1 = 0;
    uint256 internal amountForCalc2;
    uint256 internal _percentageSum = 0;
    uint256 _totalRecipients = 0;

    // MAPPING (manages the users and their shares)
    mapping (uint256 => address) public recipients;
    mapping (address => uint256) public shares;

    // It was decided to currently not use a fallback payment function

    // FUNCTIONS
    function fundContract() public payable{
        require(msg.value > 0, "Royalty amount must be higher than 0");
        amountForCalc1 = amountForCalc1.add(msg.value);
    }

    function addRecipient(uint256 _percentage, address _address) public returns (bool success){
        // Make sure that the added recipient doesn't hurt the integrity of the data constraint
        require(_percentage > 0 && _percentage <= 100 && (_percentageSum + _percentage) <= 100, "Percentages are not valid"); 
        
        // Update the data in the mappings and update the index
        recipients[_totalRecipients] = _address;
        shares[_address] = _percentage;
        _totalRecipients++;

        // Update the total percentage monitoring    
        _percentageSum = _percentageSum.add(_percentage);
                
        return true;
    }

    function payRecipients() public payable returns (bool success){
        // Validate that funds have been deposited in the contract
        require (amountForCalc1 > 0, "No funds have been sent to the contract");
        // Validate that the trasnfer of funds will only be done after 100% of recipients have been updated in the mappings
        if (_percentageSum != 100) {
            return false;
        } else {
            // Clean up variable
            _percentageSum = 0;
            //Perform step 1 of percentage caluclation
            amountForCalc2 = amountForCalc1.div(100);
            // Clean up variable
            amountForCalc1 = 0;
            // Go over each mapping item and trasfer the relative percentage of funds to its supplied address
            for (uint256 i = 0; i < _totalRecipients; i++) {
                address(recipients[i]).transfer(amountForCalc2.mul(shares[recipients[i]]));
                // Clean up mappings
                delete recipients[i];
                delete shares[recipients[i]];
            }
            return true;
        }
    }
    
}
