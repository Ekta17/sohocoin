# Soho (SOHO) ERC20 Token

Soho (SOHO) is an ERC-20 token deployed on the Ethereum mainnet.  
The contract was developed, deployed, and verified using [Hardhat](https://hardhat.org/).

---

## Token Details

- **Name:** Soho  
- **Symbol:** SOHO  
- **Decimals:** 18  
- **Initial Supply:** `1000000000000000000000010` (1,000,010 SOHO)  
- **Deployer Address:** [0xf5d793B2a30C77442874518b0Ea83354B7a0242f](https://etherscan.io/address/0xf5d793B2a30C77442874518b0Ea83354B7a0242f)  
- **Contract Address:** [0xf5d793B2a30C77442874518b0Ea83354B7a0242f](https://etherscan.io/token/0xf5d793B2a30C77442874518b0Ea83354B7a0242f)  

---

## Etherscan

The contract is verified and publicly available on Etherscan:  
🔗 [View on Etherscan](https://etherscan.io/token/0xf5d793B2a30C77442874518b0Ea83354B7a0242f)

---

## Usage

### Add Token to MetaMask
1. Open MetaMask and click **Import Tokens**.  
2. Enter the contract address:  
   ```
   0xf5d793B2a30C77442874518b0Ea83354B7a0242f
   ```
3. The token symbol (`SOHO`) and decimals (`18`) should auto-populate.  
4. Confirm to add the token.

### Interacting with the Token (Hardhat)
Clone the repo and install dependencies:
```bash
git clone https://github.com/Ekta17/sohocoin.git
cd sohocoin
npm install
```

Compile contracts:
```bash
npx hardhat compile
```

Check balances:
```bash
npx hardhat console --network mainnet
> const soho = await ethers.getContractAt("ERC20", "0xf5d793B2a30C77442874518b0Ea83354B7a0242f");
> (await soho.balanceOf("0xYourAddress")).toString();
```

Transfer tokens:
```js
await soho.transfer("0xRecipientAddress", ethers.utils.parseUnits("10", 18));
```

---

## Development

This repo uses **Hardhat** for smart contract development and deployment.

Scripts include:
- `deploy.js` – deploys the contract  
- `verify.js` – verifies the contract on Etherscan  

---

## License

This project is licensed under the MIT License.
