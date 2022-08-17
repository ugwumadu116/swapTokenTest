
import { ethers } from "hardhat";

async function main() {
    
  const TokenCreator = await ethers.getContractFactory("TokenCreator");
  const tokenCreator = await TokenCreator.deploy("JoelToken", "JT");
  await tokenCreator.deployed();

  console.log("JoelToken deployed to:", tokenCreator.address);
}

main();