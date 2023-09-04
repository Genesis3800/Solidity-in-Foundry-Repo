// SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;

import "forge-std/Test.sol";
import {ChainlinkDataFeeds} from "./ChainlinkDataFeeds.sol";
import {MockV3Aggregator} from "@chainlink/v0.8/tests/MockV3Aggregator.sol";

contract ChainlinkDataFeeds_test is Test {

    // Configuring the base data for the mock aggregator
    uint8 public _decimals = 8;
    int256 public _initialAnswer = 10**18;

    // Initializing the contract instances
    ChainlinkDataFeeds public chainlinkDataFeeds;
    MockV3Aggregator public mockV3aggregator;

    // Seeting up the initial state
    function setUp() public {

        mockV3aggregator = new MockV3Aggregator(_decimals, _initialAnswer);
        chainlinkDataFeeds = new ChainlinkDataFeeds(address(mockV3aggregator));
    }
    
    // Checking if our contract can read data from the mock aggregator
    function testgetLatestPrice() public {

        (uint80 roundID, int256 price) = chainlinkDataFeeds.getLatestPrice();
        
        assertEq(price, _initialAnswer);
        assertEq(roundID, 1);
    }
}
