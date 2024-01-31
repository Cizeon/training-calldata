#!/bin/sh

source .env

if [ $# -eq 0 ] ; then
    echo "Usage: $0 targetContractAddress"
    exit 255
fi

# Let's see how a simple calldata with an array is made.

echo "[+] The function selector: "
cast sig "structCalldata((uint16, uint16, uint256))"
echo ""

echo "[+] The parameters: "
cast abi-encode "structCalldata((uint16, uint16, uint256))" "(65,66,67)"
echo ""

echo "[+] All together: "
cast calldata "structCalldata((uint16, uint16, uint256))" "(65,66,67)"
echo ""

echo "[+] In a transaction (in the input): "
TX=`cast send $1 "structCalldata((uint16, uint16, uint256))" "(65,66,67)" --private-key ${PRIVATE_KEY} | grep transactionHash | awk '{print $2}'`
cast tx $TX
