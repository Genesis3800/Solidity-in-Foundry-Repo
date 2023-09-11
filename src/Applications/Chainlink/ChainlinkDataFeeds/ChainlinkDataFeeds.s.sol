// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.19;

import "forge-std/Script.sol";
import {ChainlinkDataFeeds} from "./ChainlinkDataFeeds.sol";

contract DeployDataFeed is Script {
    ChainlinkDataFeeds chainlinkDataFeeds;

    function run() external {
        
        // Using the envUint cheatcode we can read some env variables
        uint256 PrivateKey = vm.envUint("PRIVATE_KEY");

        // Anything within the broadcast cheatcodes is executed on-chain
        vm.startBroadcast(PrivateKey);
        chainlinkDataFeeds = new ChainlinkDataFeeds(0x694AA1769357215DE4FAC081bf1f309aDC325306);
        vm.stopBroadcast();
    }
}
