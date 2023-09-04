// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

// Importing the Chainlink Aggregator interface to interact with Chainlink price feeds.
import "@chainlink/v0.8/interfaces/AggregatorV3Interface.sol";

/**
 * @title ChainlinkDataFeeds
 * @dev This contract reads from Chainlink's price feed aggregator.
 */

contract ChainlinkDataFeeds {

    // Here we initialize an instance of the AggregatorV3Interface.
    AggregatorV3Interface internal immutable priceFeed;

    constructor(address _priceFeed) {
        priceFeed = AggregatorV3Interface(_priceFeed);
    }

    function getLatestPrice() public view returns (uint80 roundID, int price) {
        (roundID, price ,,,) = priceFeed.latestRoundData();
        return (roundID, price);
    }
}
