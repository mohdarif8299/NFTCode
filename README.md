# NFTCode

NFTCode is a project designed to integrate NFT functionality into a metaverse environment. It leverages blockchain technology for minting NFTs, assigning ownership to digital objects, and managing them in a decentralized manner. This project connects Unity with a server and blockchain using smart contracts.

## Features

- **Minting NFTs**: Create NFTs for 3D objects within the metaverse.
- **Ownership**: Assign and manage ownership of digital assets through smart contracts.
- **Integration**: Unity is used for the 3D environment, and smart contracts manage the backend for NFT creation.
- **First-Person Controller**: Navigate the 3D environment in Unity.

## Prerequisites

Make sure you have the following installed:

- [Node.js](https://nodejs.org/) (version 16.16.0)
- [Ganache](https://trufflesuite.com/ganache/) or a similar local Ethereum blockchain
- [Unity](https://unity.com/) for 3D environment creation
- [Alchemy API](https://www.alchemy.com/) for Ethereum blockchain access
- [MetaMask](https://metamask.io/) for interacting with the blockchain
- `mysql2` package for database interactions

## Setup

1. Clone the repository:
   ```bash
   git clone https://github.com/mohdarif8299/NFTCode.git
   cd NFTCode
   ```

2. Install the required dependencies:
   ```bash
   npm install
   ```

3. Set up your `.env` file with the following information:
   ```
   ALCHEMY_API_URL=<your-alchemy-api-url>
   PRIVATE_KEY=<your-private-key>
   ```

4. Run your local Ethereum blockchain using Ganache.

5. Start the server:
   ```bash
   npm start
   ```

6. Open Unity, and load the scene where your 3D objects are placed. The server will handle fetching NFT ownership and minting information.

## Usage

- **Minting NFTs**: Click on a 3D object in Unity to mint it as an NFT.
- **Viewing Ownership**: A popup in Unity will show the owner's address and token details upon clicking a minted NFT object.
- **Server Interaction**: The server runs on `http://localhost:3000/nfts` and fetches the NFT metadata including tokenId, tokenURI, owner address, etc.

## Testing

To test the smart contracts and NFT interaction:

1. Deploy the smart contract using Remix or Truffle.
2. Interact with the Unity scene and check the minted objects in your blockchain explorer.

## Contributing

Feel free to fork this repository and submit pull requests for any improvements or bug fixes. For major changes, please open an issue first to discuss what you'd like to change.
