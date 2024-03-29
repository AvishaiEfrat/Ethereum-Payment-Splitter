# Ethereum-Payment-Splitter

An Ether Payment Splitter for musical royalties. It's a web based DApp test project using Solidity & Javascript (including the Web3 library).

![](/AppSteinScreenShot.png)

## Important Note
The web3 library used here has had a vulnerabilty found in it which hasn't been patched yet - WS-2019-0097
(https://github.com/ethereum/web3.js/issues/2739). This isn't relevant to the current version of the project, however if you use web.js and implement the wallet.save method (https://web3js.readthedocs.io/en/v1.2.0/web3-eth-accounts.html#wallet-save), which stores the wallet encrypted and as a string in local storage, you should be aware that it's vulnerable to Insecure Credential Storage attacks (once a user enters a password to load the wallet from storage, the private key will remain available and this leaves the private key vulnerable to XSS).

## Overview
The current functionality consists of the following::
```
1. Adding recipients and their relative royalties of a song (name, address, % of royalties).
2. Depositing and sending them these shares based on a certain deposited amount for the song.
```
**Do not use with real funds without a proper audit**.

## Required Installations
1. NPM (https://www.npmjs.com/get-npm)
2. Truffle, using NPM (https://www.truffleframework.com/truffle) by typing **npm install truffle -g**
3. Ganache (https://www.truffleframework.com/ganache)
4. MetaMask - add it to your browser (https://metamask.io) and create a password

You should understand the basic functionality and purpose of these tools before moving forward.

## Getting Started 
These instructions will get you a copy of the project up and running on your local machine for development and testing purposes:

1. Start Ganache and make sure that it's configured to localhost **port 8545**
2. Go to the project's local folder
3. Type **truffle migrate --reset --compile-all** in order to recompile and upload the Solidity contracts to the local testnet (Ganache)
4. Type **truffle console** to enter Truffle's Web3 console
5. Type **AppStein.new().then( result => {new_instance = result})** in order to save the information from the contract into a variable you can reference using a Javascript promise
6. Check the deployed contract's address by typing **new_instance.address**
7. Make sure that the address is the same in **line 160** in the **AppStein.html** file which is located in the project folder (**0x5227e903028a5ca06c029afe269053fd146f4540**). 
   If not, update the correct address.
8. Verify that the ABI in **line 70** in the **AppStein.html** file is the the value that resides under the **/build/contracts/AppStein.JSON** file. Another implementation is 
   possible for this, as suggested here, among other places (reading the JSON contents dynamically instead of entering the static ABI hardcoded value): 
   https://ethereum.stackexchange.com/questions/38828/what-is-the-best-way-to-get-the-json-abi-after-deploying-a-contract-with-truffle.

You should now be ready to go!

## Using the DApp
1. Open the **AppStein.html** file, located in the project folder
2. Open Metamask and login
3. Configure MetaMask to run on your localhost network on **port 8545** (using the dropdown menu in the main screen).
4. Configure MetaMask to use your Ganache account by importing the seed.
   This is explained here: https://ethereum.stackexchange.com/questions/34287/using-ganache-with-an-existing-metamask-account
5. Add a recipient, an address and a percentage of music royalties. Now press the **Add Recipient** button.
6. Add a song ID & named and enter an amount of Ether to submit.
7. Submit!
8. The amounts should be transferred in accordance to your specifications.

## Quick Guide for Developers
Here is a list of the files holding the logic of the DApp. I made these files as documented as possible.
```
1. /AppStein.html - Holds the HTML & JavaScript logic.
2. /Contracts/AppStein.sol - Holds the Solidity Logic.
3. /Contracts/Ownable.sol - Holds the Open Zeppelin Ownable contract Solidity logic. 
4. /style.css - Holds the styling & formatting for the html file.
5. /truffle.js and /truffle-config.js - Hold the project's configuration for the network exports & migrations.
```

## Built With
* [NPM] (https://www.npmjs.com/get-npm) - Dependency Management.
* [Ganache] (https://www.truffleframework.com/ganache) - Used to create and manage a local BlockChain tesnet on the localhost.
* [MetaMask] (https://metamask.io) - Used to interact with the DApp using an injected WEB3 interface within the browser.
* [Truffle] (https://www.truffleframework.com/truffle) - Used to compile, migrate the Solidity contract files to the local testnet and interact with the deployed contracts. 
                 The truffle network configuration is available in the truffle.js & truffle-config.js files. More on this here: https://truffleframework.com/docs/truffle/reference/configuration
* [Ethereum Blockchain App Platform] (https://www.ethereum.org) - A decentralized platform for smart contracts.          
## Authors
* **Avishai Efrat** - *Initial work* - [AvishaiEfrat](https://github.com/AvishaiEfrat)

## Acknowledgments
* Project inspiration and guidence by Chanan Sack. 
* README.md structure taken from https://gist.githubusercontent.com/PurpleBooth.
* HTML & JS original structure based on Javascript30's tutorials (www.javascript30.com).
* Background image from https://pixabay.com/en/audio-condenser-microphone-music-1844798 (Creative Commons CC0).

## Also Check
* [Open Zeppelin Payment Splitter] (https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/finance/PaymentSplitter.sol) - A payment splitter on the Open Zeppelin GitHub page (a library for secure smart contract development).
