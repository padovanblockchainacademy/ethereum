pragma solidity ^0.4.2;

contract MyToken {
	
	uint totalSupply;

	event Transfer(address from, address to_, uint value);
	address public owner;
	mapping (address => uint) public balanceOf;

	function MyToken(uint initialSupply) {
		owner = msg.sender;

		totalSupply = initialSupply;
		balanceOf[msg.sender] = initialSupply;
	}

	function transfer (address _to, uint _value) {
		if (balanceOf[msg.sender] < _value) throw;
		if (balanceOf[_to] + _value < balanceOf[_to]) throw;

		balanceOf[msg.sender] += _value;
		balanceOf[_to] += _value;
		Transfer(msg.sender, _to, _value);
	}

	function mintCoin(uint _value) {
		if (msg.sender != owner) throw;
		
		balanceOf[msg.sender] += _value;
	}
}