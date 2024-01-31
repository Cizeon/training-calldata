# Calldata

I put together this contract for a Solidity class where we dived into calldata and how functions and arguments are packed. Figured it might spark some interest for others too!

## Installation

Follow this guide to install [Forge](https://github.com/foundry-rs/foundry/tree/master/crates/forge).

```bash
make
```

## Deploying

To deploy the smart-contracts to test:

```console
make chain
```

Write the first private key generated by anvil in the .env file:

```
ETH_FROM=0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266
PRIVATE_KEY=0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80
```

Deploy the smart contracts:

```console
make deploy
forge create src/Calldata.sol:Calldata --private-key 0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80 --rpc-url local
[⠊] Compiling...
No files changed, compilation skipped
Deployer: 0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266
Deployed to: 0x5FbDB2315678afecb367f032d93F642f64180aa3
Transaction hash: 0x5ef836ff0ef1a644068818c3c216a69f09e8b65180f67d19664df1c0a825e88a
```

## Testing

### Test 1

> function fixedCalldata(uint256 \_a, uint256 \_b)

```console
sh test1.sh 0x5FbDB2315678afecb367f032d93F642f64180aa3
[+] The function selector:
0xe1c92c65

[+] The parameters:
0x00000000000000000000000000000000000000000000000000000000000000010000000000000000000000000000000000000000000000000000000000000002

[+] All together:
0xe1c92c6500000000000000000000000000000000000000000000000000000000000000010000000000000000000000000000000000000000000000000000000000000002

[+] In a transaction (in the input):

blockHash            0xe9272f118ccaaac61199381ecbe57a8bf4a7597d72347de5acebad1d8cd815c8
blockNumber          2
from                 0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266
gas                  43858
gasPrice             3879406050
hash                 0xca85c1a6522f9e6d68b43330dcf23d43c674a1a1133fc9d353ec82ce5db42da8
input                0xe1c92c6500000000000000000000000000000000000000000000000000000000000000010000000000000000000000000000000000000000000000000000000000000002
nonce                1
r                    0x2f097cb198215bc8aa93d2791768fad5fe4fcf63482aa7b4def026ef7b0c8d75
s                    0x1b65bc0026d13dc7897cc24ce9c5fc198b3058253a4b4440e56e316767b1417a
to                   0x5FbDB2315678afecb367f032d93F642f64180aa3
transactionIndex     0
v                    0
value                0
```

### Test 2

> function structCalldata(MyStruct calldata \_struct)

```console
sh test2.sh 0x5FbDB2315678afecb367f032d93F642f64180aa3
[+] The function selector:
0xa87c1fd7

[+] The parameters:
0x000000000000000000000000000000000000000000000000000000000000004100000000000000000000000000000000000000000000000000000000000000420000000000000000000000000000000000000000000000000000000000000043

[+] All together:
0xa87c1fd7000000000000000000000000000000000000000000000000000000000000004100000000000000000000000000000000000000000000000000000000000000420000000000000000000000000000000000000000000000000000000000000043

[+] In a transaction (in the input):

blockHash            0xfc40b690c48ce3333fe4896752a4f454be3f57fd1bf3d0c9950666417d976962
blockNumber          3
from                 0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266
gas                  66295
gasPrice             3769801703
hash                 0xc67cebd0643e2239fc06242b8d854eff1b511b541d195452696bb2a7522a9111
input                0xa87c1fd7000000000000000000000000000000000000000000000000000000000000004100000000000000000000000000000000000000000000000000000000000000420000000000000000000000000000000000000000000000000000000000000043
nonce                2
r                    0x6da4c431c37fe333b54c486cb2b1e904bbce09a7e5559572e3b2cc914f7d6086
s                    0x3a698172045e629b15ac7fe53ef81e73d072d5a15a855d54ea6542661107dda6
to                   0x5FbDB2315678afecb367f032d93F642f64180aa3
transactionIndex     0
v                    0
value                0
```

### Test 3

> function arrayCalldata(uint256[] calldata \_array)

```console
sh test3.sh 0x5FbDB2315678afecb367f032d93F642f64180aa3
[+] The function selector:
0x170bd560

[+] The parameters:
0x0000000000000000000000000000000000000000000000000000000000000020000000000000000000000000000000000000000000000000000000000000000200000000000000000000000000000000000000000000000000000000000000410000000000000000000000000000000000000000000000000000000000000042

[+] All together:
0x170bd5600000000000000000000000000000000000000000000000000000000000000020000000000000000000000000000000000000000000000000000000000000000200000000000000000000000000000000000000000000000000000000000000410000000000000000000000000000000000000000000000000000000000000042

[+] In a transaction (in the input):

blockHash            0x010921392b3a1c914042647c1cc918bc5327041d672e8841669ecc8e1d78ddea
blockNumber          4
from                 0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266
gas                  88757
gasPrice             3674001774
hash                 0x5578b6218aa929152ac7312133fa1f32f5220a2b68bd1a6473cc7786f67de0f6
input                0x170bd5600000000000000000000000000000000000000000000000000000000000000020000000000000000000000000000000000000000000000000000000000000000200000000000000000000000000000000000000000000000000000000000000410000000000000000000000000000000000000000000000000000000000000042
nonce                3
r                    0xd38bd679e68f4577dee5c654e57ccdbe711a940d8a0514992d2c81b1255aae1a
s                    0x5d80656bd6484ab9c79770772a843d8dbefc18af5e10d3075ca3a0675734d676
to                   0x5FbDB2315678afecb367f032d93F642f64180aa3
transactionIndex     0
v                    0
value                0
```

### Test 4

> function stringCalldata(string calldata \_message)

```console
sh test4.sh 0x5FbDB2315678afecb367f032d93F642f64180aa3
[+] The function selector:
0xc9ccfda1

[+] Encoding the string:
0x48656c6c6f20796f750000000000000000000000000000000000000000000000

[+] The parameters:
0x0000000000000000000000000000000000000000000000000000000000000020000000000000000000000000000000000000000000000000000000000000000948656c6c6f20796f750000000000000000000000000000000000000000000000

[+] All together:
0xc9ccfda10000000000000000000000000000000000000000000000000000000000000020000000000000000000000000000000000000000000000000000000000000000948656c6c6f20796f750000000000000000000000000000000000000000000000

[+] In a transaction (in the input):

blockHash            0x7ebd984cf9b92fbf6a35a275687d78d315fd0aa4de477231a1c6a7303742040e
blockNumber          5
from                 0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266
gas                  44548
gasPrice             3590250073
hash                 0xc44544edc713a60d34ba554050bcac70117626478b01106cbf07cb16a0b63572
input                0xc9ccfda10000000000000000000000000000000000000000000000000000000000000020000000000000000000000000000000000000000000000000000000000000000948656c6c6f20796f750000000000000000000000000000000000000000000000
nonce                4
r                    0x4ea004110bfa814be8b7ddd994466b828f989f79c227ddb8e969ccb7976ed201
s                    0x0558ed8e1c2f676aad091e0140af7f7598a77e37417040c8eef9d60e2deb3dd7
to                   0x5FbDB2315678afecb367f032d93F642f64180aa3
transactionIndex     0
v                    1
value                0
```

### Test 5

> function fixedAndArrayCalldata(uint256 \_a, uint256 \_b, uint256[] calldata \_data)

```console
sh test5.sh 0x5FbDB2315678afecb367f032d93F642f64180aa3
[+] The function selector:
0xd52a37ba

[+] The parameters:
0x000000000000000000000000000000000000000000000000000000000000000100000000000000000000000000000000000000000000000000000000000000020000000000000000000000000000000000000000000000000000000000000060000000000000000000000000000000000000000000000000000000000000000200000000000000000000000000000000000000000000000000000000000000410000000000000000000000000000000000000000000000000000000000000042

[+] All together:
0xd52a37ba000000000000000000000000000000000000000000000000000000000000000100000000000000000000000000000000000000000000000000000000000000020000000000000000000000000000000000000000000000000000000000000060000000000000000000000000000000000000000000000000000000000000000200000000000000000000000000000000000000000000000000000000000000410000000000000000000000000000000000000000000000000000000000000042

[+] In a transaction (in the input):

blockHash            0x2bf1d3a29a2a5474b82c8ab4024d50fdd9ca4505d1311f4a6d0ffd759cbe79c1
blockNumber          6
from                 0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266
gas                  31724
gasPrice             3516687935
hash                 0x16746efdc020d90dd5acb5fc8bd0cbd2a15681966e9bb65d1187679323f4cfa4
input                0xd52a37ba000000000000000000000000000000000000000000000000000000000000000100000000000000000000000000000000000000000000000000000000000000020000000000000000000000000000000000000000000000000000000000000060000000000000000000000000000000000000000000000000000000000000000200000000000000000000000000000000000000000000000000000000000000410000000000000000000000000000000000000000000000000000000000000042
nonce                5
r                    0x92067b97a28b8e882fab03b8adc7e342ab954a69ce84ef03a2fa32616b2eb81e
s                    0x5de32de643939c514d6f4d69b0ca927e7aa196176e9c2d320a46c0a9770ed657
to                   0x5FbDB2315678afecb367f032d93F642f64180aa3
transactionIndex     0
v                    1
value                0
```

### Test 6

> function fixedAndArrayAndFixedCalldata(uint256 \_a, uint256 \_b, uint256[] calldata \_data, uint256 \_c)

```console
sh test6.sh 0x5FbDB2315678afecb367f032d93F642f64180aa3
[+] The function selector:
0xa1610e25

[+] The parameters:
0x0000000000000000000000000000000000000000000000000000000000000001000000000000000000000000000000000000000000000000000000000000000200000000000000000000000000000000000000000000000000000000000000800000000000000000000000000000000000000000000000000000000000000003000000000000000000000000000000000000000000000000000000000000000200000000000000000000000000000000000000000000000000000000000000410000000000000000000000000000000000000000000000000000000000000042

[+] All together:
0xa1610e250000000000000000000000000000000000000000000000000000000000000001000000000000000000000000000000000000000000000000000000000000000200000000000000000000000000000000000000000000000000000000000000800000000000000000000000000000000000000000000000000000000000000003000000000000000000000000000000000000000000000000000000000000000200000000000000000000000000000000000000000000000000000000000000410000000000000000000000000000000000000000000000000000000000000042

[+] In a transaction (in the input):

blockHash            0xfb5053ae2da5af565f94e2724d4d6575034c61dc6e324bd1046892e62197467c
blockNumber          7
from                 0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266
gas                  34785
gasPrice             3452238539
hash                 0x2a9c185c928f46f44f5ad7d3d3ffedf905bde23eeda72a8eaa3c832507ba5d5e
input                0xa1610e250000000000000000000000000000000000000000000000000000000000000001000000000000000000000000000000000000000000000000000000000000000200000000000000000000000000000000000000000000000000000000000000800000000000000000000000000000000000000000000000000000000000000003000000000000000000000000000000000000000000000000000000000000000200000000000000000000000000000000000000000000000000000000000000410000000000000000000000000000000000000000000000000000000000000042
nonce                6
r                    0x2d7b1bac7bd8bb3a2d6f189aff1a50d0aafc64ea7d57b8864aa9ceb5359eab7b
s                    0x5d5ceadb422ecb6631e1dfa0905634966f054ed173334ab99b1e493683c5eab3
to                   0x5FbDB2315678afecb367f032d93F642f64180aa3
transactionIndex     0
v                    1
value                0
```

### Test 7

> function ultimateCalldata(uint256 \_a, uint256 \_b, uint256[] calldata \_data1, string calldata \_message, uint256[] calldata \_data2)

```console
sh test7.sh 0x5FbDB2315678afecb367f032d93F642f64180aa3
[+] The function selector:
0xb066a149

[+] The parameters:
0x0000000000000000000000000000000000000000000000000000000000000001000000000000000000000000000000000000000000000000000000000000000200000000000000000000000000000000000000000000000000000000000000a000000000000000000000000000000000000000000000000000000000000001000000000000000000000000000000000000000000000000000000000000000140000000000000000000000000000000000000000000000000000000000000000200000000000000000000000000000000000000000000000000000000000000410000000000000000000000000000000000000000000000000000000000000042000000000000000000000000000000000000000000000000000000000000000948656c6c6f20796f750000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000200000000000000000000000000000000000000000000000000000000000000430000000000000000000000000000000000000000000000000000000000000044

[+] All together:
0xb066a1490000000000000000000000000000000000000000000000000000000000000001000000000000000000000000000000000000000000000000000000000000000200000000000000000000000000000000000000000000000000000000000000a000000000000000000000000000000000000000000000000000000000000001000000000000000000000000000000000000000000000000000000000000000140000000000000000000000000000000000000000000000000000000000000000200000000000000000000000000000000000000000000000000000000000000410000000000000000000000000000000000000000000000000000000000000042000000000000000000000000000000000000000000000000000000000000000948656c6c6f20796f750000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000200000000000000000000000000000000000000000000000000000000000000430000000000000000000000000000000000000000000000000000000000000044

[+] In a transaction (in the input):

blockHash            0x16610a13ee0433e7650524cdd86f9b0d36220ab3ac780d17e010184114d53ee7
blockNumber          8
from                 0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266
gas                  47184
gasPrice             3395839815
hash                 0xfe2695d96b4f266a08883efc3eb7cf9e43ada261a67a4872224f7ee50772f22a
input                0xb066a1490000000000000000000000000000000000000000000000000000000000000001000000000000000000000000000000000000000000000000000000000000000200000000000000000000000000000000000000000000000000000000000000a000000000000000000000000000000000000000000000000000000000000001000000000000000000000000000000000000000000000000000000000000000140000000000000000000000000000000000000000000000000000000000000000200000000000000000000000000000000000000000000000000000000000000410000000000000000000000000000000000000000000000000000000000000042000000000000000000000000000000000000000000000000000000000000000948656c6c6f20796f750000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000200000000000000000000000000000000000000000000000000000000000000430000000000000000000000000000000000000000000000000000000000000044
nonce                7
r                    0x25bc229268c788e6d6d5cb4fa46ea1e8d11d52952c7f98fd9cbc29eaa6f67b50
s                    0x49fe55c0db4814160524d7a2bcba67da89d12b0ea67a9cb25b534e086e76d0f5
to                   0x5FbDB2315678afecb367f032d93F642f64180aa3
transactionIndex     0
v                    0
value                0
```

## License

[MIT](https://choosealicense.com/licenses/mit/)
