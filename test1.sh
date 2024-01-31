#!/bin/sh

source .env

if [ $# -eq 0 ] ; then
    echo "Usage: $0 targetContractAddress"
    exit 255
fi

# Let's see how a simple calldata with two uint256 parameters are made.

echo "[+] The function selector: "
cast sig "fixedCalldata(uint256,uint256)"
echo ""

echo "[+] The parameters: "
cast abi-encode "fixedCalldata(uint256,uint256)" 1 2
echo ""

echo "[+] All together: "
cast calldata "fixedCalldata(uint256,uint256)" 1 2
echo ""

echo "[+] In a transaction (in the input): "
TX=`cast send $1 "fixedCalldata(uint256,uint256)" 1 2 --private-key ${PRIVATE_KEY} | grep transactionHash | awk '{print $2}'`
cast tx $TX
