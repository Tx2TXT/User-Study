![](4.png)
## Vulnerable logic
The contract is vulnerable. The state variable `withdrawalDeployed` 
is written before transfer function, and there could be a reentrancy problem.


## Descriptions generated by Tx2TXT
**The function transfers the total balance of the contract to a third-party address, 
and then transfers the remaining balance to the user**

## Descriptions generated by MMTrans
**low level token purchase function**

## Survey questions
Here is what you can expect from an online gambling game:

You must pay to place a bet in this game. 
If you are the winner, the contract must transfer the jackpot (all of its accumulated balance) to your account.

A specific implementation of a gambling game can be described as this:

"**The function transfers the total balance of the contract to a third-party address, 
and then transfers the remaining balance to the user**"



Do you think this is a secure and fair game that you will play?

Yes
No
Not sure