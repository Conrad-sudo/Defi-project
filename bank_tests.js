const Tether = artifacts.require("Tether");
const Bank = artifacts.require("Bank");
const RWD= artifacts.require("Reward");

require("chai")
.use(require("chai-as-promised"))
.should()


contract ('Bank',(accounts )=> {
	//All the code goes here

	describe("Mock Tether deployment", async() =>{

		it("Matches name successfully", async() =>{

			let tether = await Tether.new()
			const name = tether.name()
			assert.equal(name,"Tether")
		})
	})

})