require("@nomicfoundation/hardhat-toolbox");
require("dotenv").config();

/** @type import('hardhat/config').HardhatUserConfig */
module.exports = {
  solidity: "0.8.20",
  networks: {
    localhost: {
      url: "http://localhost:8545",
    },
    sepolia: {
      url: process.env.ALCHEMY_API_URL, // Alchemy API URL for Sepolia, set in .env file
      accounts: [process.env.PRIVATE_KEY], // Your deployer's private key, set in .env file
    }, 
  }
};
