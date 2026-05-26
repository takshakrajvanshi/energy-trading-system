const hre = require("hardhat");

async function main() {

    const [deployer, user1, user2] =
        await hre.ethers.getSigners();

    console.log("Deploying contracts with:", deployer.address);

    // Deploy Energy Token
    const EnergyToken =
        await hre.ethers.getContractFactory("EnergyToken");

    const energyToken =
        await EnergyToken.deploy();

    await energyToken.waitForDeployment();

    console.log(
        "EnergyToken deployed to:",
        await energyToken.getAddress()
    );

    // Deploy MockUSD
    const MockUSD =
        await hre.ethers.getContractFactory("MockUSD");

    const mockUSD =
        await MockUSD.deploy();

    await mockUSD.waitForDeployment();

    console.log(
        "MockUSD deployed to:",
        await mockUSD.getAddress()
    );

    // Deploy Marketplace
    const Marketplace =
        await hre.ethers.getContractFactory("Marketplace");

    const marketplace =
        await Marketplace.deploy(
            await energyToken.getAddress(),
            await mockUSD.getAddress()
        );

    await marketplace.waitForDeployment();

    console.log(
        "Marketplace deployed to:",
        await marketplace.getAddress()
    );

    // Give tokens to test users
    await energyToken.mint(
        user1.address,
        hre.ethers.parseUnits("1000", 18)
    );

    await mockUSD.mint(
        user2.address,
        hre.ethers.parseUnits("10000", 18)
    );

    console.log("Test tokens minted");
}

main().catch((error) => {
    console.error(error);
    process.exitCode = 1;
});