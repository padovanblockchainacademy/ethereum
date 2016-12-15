pragma solidity ^0.4.2;

contract Identities {
	
	struct Person {
		address account,
		string name,
		string email,
		string phone,
		string pictureURL
	}

	event Registered(string _name, address _from);

	mapping (address => Person) public people;

	function Identities(){

	}

	function register (string name, string email, string phone, string pictureURL) {
		people[msg.sender] = Person(msg.sender, name, email, phone, pictureURL);
		Registered(name, msg.sender)
	}

}