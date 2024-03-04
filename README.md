Staking Smart Contract
Description
The Staking smart contract allows users to stake ERC721 tokens and earn rewards in ERC20 tokens. It provides a mechanism for users to lock up their ERC721 tokens for a certain period and receive rewards based on the duration of their stake.

Features
1. Staking Functionality: Users can stake their ERC721 tokens by calling the stake(uint256 _tokenId) function. This function transfers the ownership of the ERC721 token to the Staking contract.
2. Reward Calculation: Rewards are calculated based on the duration for which the tokens have been staked. The longer a token is staked, the higher the reward it accumulates.
3. Reward Distribution: Rewards are distributed in ERC20 tokens. The contract keeps track of the amount of ERC20 tokens each user is entitled to based on their stake duration.
4. Claiming Rewards: Users can claim their rewards by calling the unstake(uint256 _tokenId) function. This function unstakes the ERC721 token and transfers the accumulated rewards in ERC20 tokens to the user's wallet.
5. Reward Calculation
The contract calculates rewards based on the duration for which the tokens have been staked. Here's a simplified

**example of how rewards Are calculated**:

Define a reward rate per minute based on the total supply of ERC20 tokens allocated for rewards.
When a user stakes their tokens, record the current timestamp.
When a user unstakes their tokens, calculate the duration for which the tokens were staked.
Multiply the duration by the reward rate per minute to calculate the total reward.
Transfer the calculated reward in ERC20 tokens to the user's wallet.
Reward Distribution
The contract keeps track of the accumulated rewards for each user. When a user unstakes their tokens, the contract transfers the accumulated rewards in ERC20 tokens to the user's wallet.

**Conclusion**
The Staking smart contract provides users with a straightforward mechanism to stake their ERC721 tokens and earn rewards in ERC20 tokens. By staking their tokens, users can contribute to the ecosystem while receiving incentives based on the duration of their stake. With transparent reward calculation and distribution mechanisms, users can trust the fairness and reliability of the staking process. Get started today and start earning rewards by participating in the staking program!



