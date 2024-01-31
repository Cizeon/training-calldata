#!/bin/sh

source .env

if [ $# -eq 0 ] ; then
    echo "Usage: $0 targetContractAddress"
    exit 255
fi

# Let's see how a simple calldata with an array is made.

echo "[+] The function selector: "
cast sig "stringCalldata(string calldata _message)"
echo ""

echo "[+] Encoding the string: "
cast format-bytes32-string "Hello you"
echo ""

echo "[+] The parameters: "
cast abi-encode "stringCalldata(string calldata _message)" "Hello you"
echo ""

echo "[+] All together: "
cast calldata "stringCalldata(string calldata _message)" "Hello you"
echo ""

echo "[+] In a transaction (in the input): "
TX=`cast send $1 "stringCalldata(string calldata _message)" "Hello you" --private-key ${PRIVATE_KEY} | grep transactionHash | awk '{print $2}'`
cast tx $TX
