#!/bin/bash

source internal/docker/docker_env.sh

export PRIVATE_KEY=0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80
export TAIKO_L2_ADDRESS=0x1670010000000000000000000000000000010001
export L2_SIGNAL_SERVICE=0x1670010000000000000000000000000000010005
export CONTRACT_OWNER=0x23618e81E3f5cdF7f54C3d65f7FBc0aBf5B21E8f
export TAIKO_TOKEN_PREMINT_RECIPIENT=0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266
export TAIKO_TOKEN_NAME="Taiko Token Test"
export TAIKO_TOKEN_SYMBOL="TTKOt"
export TIER_PROVIDER="devnet"
export PAUSE_TAIKO_L1="false"
export PAUSE_BRIDGE="false"
export TAIKO_TOKEN=0x0000000000000000000000000000000000000000
export SHARED_ADDRESS_MANAGER=0x0000000000000000000000000000000000000000
export PROPOSER=0x0000000000000000000000000000000000000000
export PROPOSER_ONE=0x0000000000000000000000000000000000000000

GUARDIAN_PROVERS_ADDRESSES_LIST=(
    "0x70997970C51812dc3A010C7d01b50e0d17dc79C8"
    "0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266"
    "0x3C44CdDdB6a900fa2b585dd299e03d12FA4293BC"
    "0x90F79bf6EB2c4f870365E785982E1f101E93b906"
    "0x15d34AAf54267DB7D7c367839AAf71A00a2C6A65"
    "0x23618e81E3f5cdF7f54C3d65f7FBc0aBf5B21E8f"
    "0xa0Ee7A142d267C1f36714E4a8F75612F20a79720"
)
GUARDIAN_PROVERS_ADDRESSES=$(printf ",%s" "${GUARDIAN_PROVERS_ADDRESSES_LIST[@]}")
export GUARDIAN_PROVERS=${GUARDIAN_PROVERS_ADDRESSES:1}
export MIN_GUARDIANS=${#GUARDIAN_PROVERS_ADDRESSES_LIST[@]}

# Get the hash of L2 genesis.
export L2_GENESIS_HASH=$(
    curl \
        --silent \
        -X POST \
        -H "Content-Type: application/json" \
        -d '{"jsonrpc":"2.0","id":0,"method":"eth_getBlockByNumber","params":["0x0", false]}' \
        $L2_EXECUTION_ENGINE_HTTP_ENDPOINT | jq .result.hash | sed 's/\"//g'
)
echo "L2_GENESIS_HASH: $L2_GENESIS_HASH"