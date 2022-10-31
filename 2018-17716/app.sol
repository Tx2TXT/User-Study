	function withdrawAll(uint tokensToSend) public onlyAdmins {
		// Prevent withdrawal function from being called simultaneously by two parties
		require(withdrawalDeployed == false);
		// Confirm sufficient tokens available
		require(validate());
		withdrawalDeployed = true;
		// Send all tokens
		for (uint i = 0; i < payees.length; i++) {
			// Confirm that contributor has not yet been paid is owed more than gas withhold
			if (payees[i].paid == false && tokensDue(payees[i].contributionWei) >= withhold) {
				// Withhold tokens to cover gas cost
				tokensToSend = tokensDue(payees[i].contributionWei) - withhold;
				// Send tokens to payee
				payees[i].addr.transfer(tokensToSend*tokenMultiplier);
				// Mark payee as paid
				payees[i].paid = true;
			}
		}
	}