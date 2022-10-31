  function sellTokens (uint256 _value) public {
    require (_value > 0);
    require (_value < TWO_128);

    updateStage ();
    require (stage == Stage.LIFE);

    assert (reserveAmount < TWO_128);
    uint256 totalSupply = orgonToken.totalSupply ();
    require (totalSupply < TWO_128);

    require (_value <= totalSupply);

    uint256 toPay = safeMul (
      reserveAmount,
      safeSub (
        TWO_128,
        pow_10 (safeSub (TWO_128, (_value << 128) / totalSupply)))) >> 128;

    require (orgonToken.transferFrom (msg.sender, this, _value));
    require (orgonToken.burnTokens (_value));

    reserveAmount = safeSub (reserveAmount, toPay);

    msg.sender.transfer (toPay);
  }