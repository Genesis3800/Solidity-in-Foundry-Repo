// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.19;

import "forge-std/Test.sol";
import {VRFCoordinatorV2Mock} from "@chainlink/v0.8/mocks/VRFCoordinatorV2Mock.sol";
import {ChainlinkVRF} from "./ChainlinkVRF.sol";

contract ChainlinkVRF_test is Test {

    // Initializing the contract instances
    ChainlinkVRF public chainlinkVRF;
    VRFCoordinatorV2Mock public vrfCoordinatorV2Mock;

    // These variables will keep a count of the number of times each
    // random number number was generated
    uint counter1; uint counter2; uint counter3;

    // Setting up the initial state
    function setUp() public {
        vrfCoordinatorV2Mock = new VRFCoordinatorV2Mock(100000000000000000, 1000000000);
        uint64 subId = vrfCoordinatorV2Mock.createSubscription();

        //funding the subscription with 1000 LINK
        vrfCoordinatorV2Mock.fundSubscription(subId, 1000000000000000000000);

        chainlinkVRF = new ChainlinkVRF(subId, address(vrfCoordinatorV2Mock));
        vrfCoordinatorV2Mock.addConsumer(subId, address(chainlinkVRF));
    }

    // This test function will always pass since there is no assertion at the end
    // Console logging the number of times each value was generated to see if the
    // distribution is as expected
    function testrequestRandomWords() public {

        for(uint i = 0; i < 3000; i++)
        {                    
            uint256 requestId = chainlinkVRF.requestRandomWords();
            vrfCoordinatorV2Mock.fulfillRandomWords(requestId, address(chainlinkVRF));

            if(chainlinkVRF.number() == 1){
                counter1++;
            } else if(chainlinkVRF.number() == 2){
                counter2++;
            } else {
                counter3++;
            }   
        }

        console2.log("Number of times 1 was generated: ", counter1);
        console2.log("Number of times 2 was generated: ", counter2);
        console2.log("Number of times 3 was generated: ", counter3);

    }

}
