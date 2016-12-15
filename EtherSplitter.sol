pragma solidity ^0.4.2;

contract EtherSplitter {

	event Transfer (address _to1, address _to2, uint256 value);

	function EtherSplitter () {}

	function transferToTwoAccounts (address _to1, address _to2) payable {
		if (msg.value < 2) throw;

		// O ether é sempre representador em Wei, a menor unidade de valor. 
		// Estamos calculando o resultado inteiro da divisão.
		uint256 amount = msg.value / 2;

		if(!_to1.send(amount)) throw;

		// Caso haja resto na divisão, transferimos usando msg.value - amount
		if(!_to2.send(msg.value - amount)) throw;

		Transfer(_to1, _to2, msg.value);
	}

}