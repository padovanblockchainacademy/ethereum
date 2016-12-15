pragma solidity ^0.4.2;

contract FundsWithDiscountedEther {

	address toFunds; 
	address owner;

	function FoxEther(address _toFunds){
		toFunds = _toFunds;
		owner = msg.sender;
	}

	function doThings () payable {
		uint256 fee = msg.value * 0.001;
		toFunds.send(fee);

		uint256 remaining = msg.value - fee;
		// ...
		
	}

	modifier onlyOwner() {
		if (msg.sender != owner) throw;
		_;
	}

	function changeAddress( address newAddr) onlyOwner {
		toFunds = newAddr;
	}
}