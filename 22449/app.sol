    function transferFee() onlyOwner public{
      uint valfee1 = balanceFee.div(2);
      feeAccount1.transfer(valfee1);
      balanceFee = balanceFee.sub(valfee1);
      feeAccount2.transfer(balanceFee);
    }