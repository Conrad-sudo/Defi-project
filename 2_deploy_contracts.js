const Tether = artifacts.require("Tether");
const Bank = artifacts.require("Bank");
const RWD= artifacts.require("Reward");



module.exports = async function (deployer, network, accounts) {

//Deploy mock tether contract	
  await deployer.deploy(Tether);
  const usdt= await Tether.deployed();

//Deploy Reward contract
  await deployer.deploy(RWD);
  const rwd = await RWD.deployed();

  //Deploy Bank contract
  await deployer.deploy(Bank, rwd.address, usdt.address);	
  const bank= await Bank.deployed();

  
// transfer all RWD tokens to the bank contract

await rwd.transfer(bank.address, '1000000000000000000000000');

//distribute 100 Tether to each investor
await usdt.transfer(accounts[1], '100000000000000000000')

};
