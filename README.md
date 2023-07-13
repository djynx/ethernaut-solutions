## PuzzleWallet

```zsh
forge script script/PuzzleWalletAttack.s.sol:PuzzleWalletAttack --sig "run(address)" $PUZZLE_WALLET_INSTANCE --rpc-url $FORGE_SEPOLIA_RPC --broadcast -vvvv --private-key $ETHERNAUT
```

## Motorbike

```zsh
forge script script/MotorbikeAttack.s.sol:MotorbikeAttack --sig "run(address,address)" $MOTORBIKE_INSTANCE $DESTROY_INSTANCE --rpc-url $FORGE_SEPOLIA_RPC --broadcast -vvvv --private-key $ETHERNAUT
```