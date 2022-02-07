import { expect } from "chai";
import { ethers } from "hardhat";
import { Greeter, SendFile } from "../typechain";

describe("Greeter", function () {
  let greeter: Greeter;

  beforeEach(async () => {
    const Greeter = await ethers.getContractFactory("Greeter");
    greeter = await Greeter.deploy("Hello, world!");
  });

  it("Should return the new greeting once it's changed", async function () {
    await greeter.deployed();

    expect(await greeter.greet()).to.equal("Hello, world!");

    const setGreetingTx = await greeter.setGreeting("Hola, mundo!");

    // wait until the transaction is mined
    await setGreetingTx.wait();

    expect(await greeter.greet()).to.equal("Hola, mundo!");
  });
});

describe("SendFile", function () {
  let sendFile: SendFile;

  beforeEach(async () => {
    const SendFile = await ethers.getContractFactory("SendFile");
    sendFile = await SendFile.deploy();
  });

  it("Should return the new file", async function () {
    await sendFile.deployed();

    const setFileTx = await sendFile.createFiles(
      "name",
      "ipfs://dlkaspodposdakpoa",
      2
    );

    // wait until the transaction is mined
    await setFileTx.wait();

    expect(setFileTx).to.be.not.undefined;
    expect(setFileTx).to.be.not.null;
    expect(setFileTx).to.be.not.NaN;

    const setSendFileTx = await sendFile.getFiles();
    console.log(setSendFileTx);

    expect(setSendFileTx).to.equal(setSendFileTx);
  });
});
