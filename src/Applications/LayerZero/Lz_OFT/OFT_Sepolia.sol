// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@layerzero-contracts/token/oft/v2/OFTV2.sol";

contract OFT_Sepolia is OFTV2 {
    constructor(
        string memory _name,
        string memory _symbol,
        address _layerZeroEndpoint,
        uint _initialSupply,
        uint8 _sharedDecimals
    ) OFTV2(_name, _symbol, _sharedDecimals, _layerZeroEndpoint) {
        _mint(_msgSender(), _initialSupply);
    }
}
