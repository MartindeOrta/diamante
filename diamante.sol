// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract DiamanteToken is ERC20 {
    constructor() ERC20("Diamante", "DMT") {
        _mint(msg.sender, 1000 * 10 ** decimals());
    }

    function decimals() public view virtual override returns (uint8) {
        return 0;
    }
}