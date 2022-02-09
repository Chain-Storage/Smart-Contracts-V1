import { ethers } from "hardhat";
async function main() {
  const BuyStorage = await ethers.getContractFactory("BuyStorage");
  const storage = await BuyStorage.deploy();
  await storage.deployed();
  console.log("BuyStorage deployed to:", storage.address);
}
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
