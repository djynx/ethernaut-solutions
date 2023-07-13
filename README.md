Solutions for some of Openzeppelin's Ethernaut challenges written in Solidity. May or may not turn this into a real project, this repo is not guaranteed to work on every environment and setup. 

## PuzzleWallet
```zsh
forge script script/PuzzleWalletAttack.s.sol:PuzzleWalletAttack --sig "run(address)" $PUZZLE_WALLET_INSTANCE --rpc-url $FORGE_SEPOLIA_RPC --broadcast -vvvv --private-key $ETHERNAUT
```

## Motorbike
```zsh
forge script script/MotorbikeAttack.s.sol:MotorbikeAttack --sig "run(address,address)" $MOTORBIKE_INSTANCE $DESTROY_INSTANCE --rpc-url $FORGE_SEPOLIA_RPC --broadcast -vvvv --private-key $ETHERNAUT
```