function _transferFrom(uint256 data, address _to, uint256 _tokenId) internal {
        address _from = address(data);
        //removing the tokenId
        // 1. We replace _tokenId in ownedTokens[_from] with the last token id
        //    in ownedTokens[_from]
        uint256 lastTokenIndex = ownedTokens[_from].length - 1;
        uint256 lastTokenId = ownedTokens[_from][lastTokenIndex];
        if (lastTokenId != _tokenId) {
            uint256 tokenIndex = data >> 160 & UINT16_MASK;
            ownedTokens[_from][tokenIndex] = uint32(lastTokenId);
            // 2. We set lastTokeId to point to its new position in ownedTokens[_from]
            mokens[lastTokenId].data = mokens[lastTokenId].data & 0xffffffffffffffffffff0000ffffffffffffffffffffffffffffffffffffffff | tokenIndex << 160;
        }
        // 3. We remove lastTokenId from the end of ownedTokens[_from]
        ownedTokens[_from].length--;

        //adding the tokenId
        uint256 ownedTokensIndex = ownedTokens[_to].length;
        // prevents 16 bit overflow
        require(ownedTokensIndex < MAX_OWNER_MOKENS, "A token owner address cannot possess more than 65,536 mokens.");
        mokens[_tokenId].data = data & 0xffffffffffffffffffff00000000000000000000000000000000000000000000 | ownedTokensIndex << 160 | uint256(_to);
        ownedTokens[_to].push(uint32(_tokenId));

        emit Transfer(_from, _to, _tokenId);
    }
