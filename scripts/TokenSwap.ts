import { ethers } from "hardhat";

async function main() {
    
  const TokenSwap = await ethers.getContractFactory("TokenSwap");
  // pass address _token1,address _owner1,address _token2,address _owner2 on the deploy
  
  const tokenSwap = await TokenSwap.deploy("");
  await tokenSwap.deployed();

  console.log("TokenCreator deployed to:", tokenSwap.address);
}

main();