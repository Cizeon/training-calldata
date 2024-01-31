#!/bin/sh

source .env

if [ $# -eq 0 ] ; then
    echo "Usage: $0 targetContractAddress"
    exit 255
fi

# Let's see how a simple calldata with an array is made.

echo "[+] The function selector: "
cast sig "fixedAndArrayAndFixedCalldata(uint256 _a, uint256 _b, uint256[] calldata _data, uint256 _c)"
echo ""

echo "[+] The parameters: "
cast abi-encode "fixedAndArrayAndFixedCalldata(uint256 _a, uint256 _b, uint256[] calldata _data, uint256 _c)" 1 2 "[65,66]" 3
echo ""

echo "[+] All together: "
cast calldata "fixedAndArrayAndFixedCalldata(uint256 _a, uint256 _b, uint256[] calldata _data, uint256 _c)" 1 2 "[65,66]" 3
echo ""

echo "[+] In a transaction (in the input): "
TX=`cast send $1 "fixedAndArrayAndFixedCalldata(uint256 _a, uint256 _b, uint256[] calldata _data, uint256 _c)" 1 2 "[65,66]" 3 --private-key ${PRIVATE_KEY} | grep transactionHash | awk '{print $2}'`
cast tx $TX
