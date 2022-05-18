pragma solidity >=0.4.22 <0.9.0;

contract Reward {

		


		address public manager;
		string public name= "Reward";
		string public ticker= "RWD";
		uint256 public totalSupply= 1000000000000000000000000; //a million tokens
		uint decimals= 18;
		mapping(address=>uint) public balance ;
		mapping(address=> mapping (address=>uint)) public allowance;



			constructor (){

				balance[msg.sender]= totalSupply;
			}



			event Transfer(

					address indexed sender,
					address indexed receiver,
					uint amount

			);


			event Approval(

					address indexed owner,
					address indexed spender,
					uint amount

			);



			function transfer (address receiver, uint amount) public returns(bool success) {

					require(balance[msg.sender]>= amount);
					balance[msg.sender]-=amount;
					balance[receiver]+=amount;
					emit Transfer(msg.sender,receiver,amount);
					return true;

			}



			function transferfrom ( address from,address to, uint amount) public returns (bool success){

					require(balance[from]>= amount);
					require(allowance[from][msg.sender]>= amount);

					balance[from]-=amount;
					balance[to]+=amount;

	

					allowance[msg.sender][from]-= amount;
					emit Transfer(from,to,amount);
					return true;


			}


			function approve(address spender, uint value) public returns (bool success){

				allowance[msg.sender][spender]= value;

				emit Approval(msg.sender,spender, value);
				return true;
			}










				



}