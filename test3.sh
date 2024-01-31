#!/bin/sh

source .env

if [ $# -eq 0 ] ; then
    echo "Usage: $0 targetContractAddress"
    exit 255
fi

# Let's see how a simple calldata with an array is made.

echo "[+] The function selector: "
cast sig "arrayCalldata(uint256[] data)"
echo ""

echo "[+] The parameters: "
cast abi-encode "arrayCalldata(uint256[] data)" "[65,66]"
echo ""

echo "[+] All together: "
cast calldata "arrayCalldata(uint256[] data)" "[65,66]"
echo ""

echo "[+] In a transaction (in the input): "
TX=`cast send $1 "arrayCalldata(uint256[] data)" "[65,66]" --private-key ${PRIVATE_KEY} | grep transactionHash | awk '{print $2}'`
cast tx $TX
