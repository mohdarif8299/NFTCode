// scripts/deploy.js
const hre = require("hardhat");

async function main() {
  // Get the signer (deployer) information
  const [deployer] = await hre.ethers.getSigners();

  // Log the deployer's address
  console.log("Deploying contracts with the account:", deployer.address);

  // Get the contract factory for MetaverseObjects
  const MetaverseObjects = await hre.ethers.getContractFactory("MetaverseObjects");

  // Deploy the contract, passing the deployer's address as the initial owner
  const metaverseObjects = await MetaverseObjects.deploy(deployer.address);

  // Wait for the transaction to be mined
  await metaverseObjects.waitForDeployment();

  // Retrieve the contract address after deployment
  const contractAddress = await metaverseObjects.getAddress();

  // Log the deployed contract address
  console.log("MetaverseObjects deployed to:", contractAddress);
}

// Catch and log errors during deployment
main().catch((error) => {
  console.error("Error deploying the contract:", error);
  process.exitCode = 1;
});