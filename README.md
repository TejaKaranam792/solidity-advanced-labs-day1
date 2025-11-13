🚀 Solidity Concepts – Deep Dive with Examples

This repository contains clear, beginner-friendly, and production-oriented explanations of four important Solidity concepts:

Function Overloading

Fallback & Receive Functions

call vs delegatecall vs staticcall

ABI Encoding / Decoding (abi.encode, abi.encodePacked)

Each concept is supported with readable explanations and sample smart contracts.

📘 1. Function Overloading

Solidity allows multiple functions with the same name but different parameters.

✅ Key Points

Compile-time polymorphism

Same name, different input types or count

Most commonly used when making flexible contract APIs

📌 Example
function sum(uint a, uint b) public pure returns (uint) {
    return a + b;
}

function sum(uint a, uint b, uint c) public pure returns (uint) {
    return a + b + c;
}

⚡ 2. Fallback & Receive

These special functions handle Ether sent to the contract.

🟦 receive()

Runs when msg.data is empty

Used for plain ETH transfers

receive() external payable {}

🟥 fallback()

Runs when:

receive() does not exist, OR

data is sent to the contract, OR

function does not exist

fallback() external payable {}

🔎 Summary Table
Case	Function Triggered
Ether sent with no data	receive() → fallback() (if receive missing)
Unknown function call	fallback()
ETH + data	fallback()
🛠️ 3. call vs delegatecall vs staticcall
🔵 call

Low-level interaction

Executes in the target contract

Changes target state

For sending ETH + data

(bool success, ) = target.call{value:1 ether}(data);

🟣 delegatecall

Executes code of target contract in caller’s context

Storage of caller contract is modified

Used in proxies, upgradeable contracts

(bool success, ) = lib.delegatecall(data);

🟡 staticcall

Read-only version of call

State changes are not allowed

Used for view and pure functions

(bool success, bytes memory res) = target.staticcall(data);

📌 Comparison Table
Feature	call	delegatecall	staticcall
Modifies target storage	✔	✖	✖
Modifies caller storage	✖	✔	✖
ETH transfer	✔	✖	✖
Allows state changes	✔	✔	✖
🔐 4. ABI Encoding & Decoding
🟦 abi.encode()

Encodes data into full ABI format

Useful while interacting with contracts

Returns dynamic bytes

bytes memory data = abi.encode(msg.sender, 100);

🟩 abi.encodePacked()

Packed / compressed encoding

Cheaper gas

Used in hashing, signatures

bytes32 hash = keccak256(abi.encodePacked(msg.sender, 100));


⚠ Not safe for ambiguous inputs
Example:

"AA", "BBB"

"A", "ABBB"

Both produce same packed bytes → collision risk.

📁 Folder Structure
📦 solidity-core-concepts
 ┣ 📜 FunctionOverloading.sol
 ┣ 📜 FallbackReceive.sol
 ┣ 📜 CallDelegateStatic.sol
 ┣ 📜 EncodingDecoding.sol
 ┗ 📜 README.md

📚 Purpose of This Repository

This repo is created to help developers:

Understand core Solidity concepts

Learn with simple, clean examples

Prepare for interviews & blockchain internships

Improve smart contract writing skills

🤝 Contributions

Feel free to:

Open issues

Suggest improvements

Add more examples

⭐ If you find this helpful, give the repo a star!

If you want, I can also create:

✅ GitHub Cover Photo
✅ A LinkedIn Post to announce this repo
✅ A YouTube-style explanation script

Just tell me!
