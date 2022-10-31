## Vulnerable logic
There is a reentrancy problem in line 5. Before transfer in line 15,
the contract update state variable.

## Descriptions generated by Tx2TXT
**The function transfers a user input amount0 from the user to the contract, 
and then calculates an amount1 using this user input amount0 and a state variable, 
and then transfers the amount1 to user.**

## Descriptions generated by MMTrans
**Register a vesting schedule to transfer SENC from a group SENC wallet to an individual wallet .**

## Survey questions
Here is what you can expect from an internal transfer service:

You can see internal transfer a specified amount from one designated account to another specific account.

A specific implementation of this functionality can be described as this:

"**The function transfers a user input amount0 from the user to the contract, 
and then calculates an amount1 using this user input amount0 and a state variable, 
and then transfers the amount1 to user.**"

Do you think this is a secure and fair service that you will use?

Yes
No
Not sure