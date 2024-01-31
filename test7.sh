#!/bin/sh

source .env

if [ $# -eq 0 ] ; then
    echo "Usage: $0 targetContractAddress"
    exit 255
fi

# Let's see how a simple calldata with an array is made.

echo "[+] The function selector: "
cast sig "ultimateCalldata(uint256 _a, uint256 _b, uint256[] calldata _data1, string calldata _message, uint256[] calldata _data2)"
echo ""

echo "[+] The parameters: "
cast abi-encode 'ultimateCalldata(uint256 _a, uint256 _b, uint256[] calldata _data1, string calldata _message, uint256[] calldata _data2)' \
    1 \
    2 \
    '[65,66]' \
    'Hello you' \
    '[67,68]'
echo ""

echo "[+] All together: "
cast calldata 'ultimateCalldata(uint256 _a, uint256 _b, uint256[] calldata _data1, string calldata _message, uint256[] calldata _data2)' \
    1 \
    2 \
    '[65,66]' \
    'Hello you' \
    '[67,68]'
echo ""

echo "[+] In a transaction (in the input): "
TX=`cast send $1 'ultimateCalldata(uint256 _a, uint256 _b, uint256[] calldata _data1, string calldata _message, uint256[] calldata _data2)' 1 2 '[65,66]' 'Hello you'  '[67,68]' --private-key ${PRIVATE_KEY} | grep transactionHash | awk '{print $2}'`
cast tx $TX
