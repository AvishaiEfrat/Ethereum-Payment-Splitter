# Ethereum-Payment-Splitter

Ethereum Payment Splitter for musical royalties. It's a web based DApp test project using Solidity & JS Web3 library. 
The current functionality consists of:
```
1. Adding recipients and their relative royalties of a song (name, address, % of royalties).
2. Depositing and sending them these shares based on a certain deposited amount for the song.
```

## Prerequisites
1. Install NPM (https://www.npmjs.com/get-npm)
2. Install Truffle using NPM (https://www.truffleframework.com/truffle) by typing **npm install truffle -g**
3. Install Ganache (https://www.truffleframework.com/ganache)
4. Install MetaMask in your browser (https://metamask.io) and create a user.

You should understand the basic functionality and purpose of these tools before moving forward.

## Getting Started 
These instructions will get you a copy of the project up and running on your local machine for development and testing purposes:

1. Start Ganache and make sure that it's configured to localhost **port 8545**
2. Go to the project's local folder
3. type **truffle migrate --reset --compile-all** in order to recompile and upload the Solidity contracts to the local testnet (Ganache)
4. Type **truffle console** to enter Truffle's Web3 console
5. Type **AppStein.new().then( result => {new_instance = result})** in order to save the information from the contract into a variable you can reference using a Javascript promise
6. Check the deployed contract's address by typing **new_instance.address**
7. make sure that the address is the same in **line 160** in the **AppStein.html** file which is located in the project folder (**0x5227e903028a5ca06c029afe269053fd146f4540**). 
   If not, update the correct address.

You should now be ready to go!

## Using the DApp
1. Open the **AppStein.html** file, located in the project folder
2. Open Metamask and login
3. Configure MetaMask to run on your localhost network on **port 8545** (using the dropdown menu in the main screen).
4. Configure MetaMask to use you Ganache account by importing the seed.
   This is explained here: https://ethereum.stackexchange.com/questions/34287/using-ganache-with-an-existing-metamask-account
5. Add a recipient, an address and a percentage of music royalties. Now press the **Add Recipient** button.
6. Add a song ID & named and enter an amount of Ether to submit.
7. Submit!
8. The amounts should be transferred in accordence to your specifications.

## Built With
* [NPM] (https://www.npmjs.com/get-npm) - Dependency Management.
* [Ganache] (https://www.truffleframework.com/ganache) - Used to create and manage a local BlockChain tesnet on the localhost.
* [MetaMask] (https://metamask.io) - Used to interact with the DApp using an injected WEB3 interface within the browser.
* [Truffle] (https://www.truffleframework.com/truffle) - Used to compile, migrate the Solidity contract files to the local testnet and interact with the deployed contracts. 
                 The truffle network configuration is available in the truffle.js & truffle-config.js files. More on this here: https://truffleframework.com/docs/truffle/reference/configuration
## Authors
* **Avishai Efrat** - *Initial work* - [AvishaiEfrat](https://github.com/AvishaiEfrat)

## Acknowledgments
* Project inspiration and guidence by Chanan Sack. 
* README.md structure taken from https://gist.githubusercontent.com/PurpleBooth.
* HTML & JS original structure based on Javascript30's tutorials (www.javascript30.com).
* Background image from https://pixabay.com/en/microphone-music-audio-radio-voice-1007154/ (Creative Commons CC0)
