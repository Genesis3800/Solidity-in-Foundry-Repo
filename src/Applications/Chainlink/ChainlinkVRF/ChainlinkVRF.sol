// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

// Importing Chainlink VRF interfaces for secure randomness generation
import "@chainlink/v0.8/interfaces/VRFCoordinatorV2Interface.sol";
import "@chainlink/v0.8/VRFConsumerBaseV2.sol";

/**
 * @title ChainlinkVRF
 * @dev A contract that demonstrates how to fetch random numbers from Chainlink VRF with variable probability.
 */
contract ChainlinkVRF is VRFConsumerBaseV2 {

    // Chainlink VRF parameters
    VRFCoordinatorV2Interface private CoordinatorInterface;
    uint64 private _subscriptionId;
    bytes32 private constant KEY_HASH = 0x4b09e658ed251bcafeebbc69400383d49f344ace09b9576fe248bb02c003fe9f;
    uint32 private constant CALLBACK_GAS_LIMIT = 200000;
    uint16 private constant BLOCK_CONFIRMATIONS = 10;
    uint32 private constant NUM_WORDS = 1;

    // Variable to store the generated random number
    uint256 public number;

    /**
     * @dev Contract constructor that initializes the Chainlink VRF parameters.
     * @param subscriptionId The subscription ID for the Chainlink VRF service.
     * @param vrfCoordinatorV2Address The address of the Chainlink VRF Coordinator contract.
     */
    constructor(uint64 subscriptionId, address vrfCoordinatorV2Address) VRFConsumerBaseV2(vrfCoordinatorV2Address) {
        _subscriptionId = subscriptionId;
        CoordinatorInterface = VRFCoordinatorV2Interface(vrfCoordinatorV2Address);
    }

    /**
     * @dev Requests a random number from the Chainlink VRF.
     * @return requestId The ID of the randomness request.
     */
    function requestRandomWords() public returns (uint256 requestId) {
        requestId = CoordinatorInterface.requestRandomWords(
            KEY_HASH,
            _subscriptionId,
            BLOCK_CONFIRMATIONS,
            CALLBACK_GAS_LIMIT,
            NUM_WORDS
        );
        return requestId;
    }

    /**
     * @dev Callback function used by Chainlink VRF to provide the random number
     * This function will truncate the received random number into 1, 2, or 3.
     * Probability of 1 : 1%
     * Probability of 2 : 33%
     * Probability of 3 : 66%
     */
    function fulfillRandomWords(uint256 requestId, uint256[] memory randomWords) internal override {
        uint256 randomNumber = (randomWords[0] % 100) + 1;

        if(randomNumber == 100){
            number = 1;
        } else if(randomNumber % 3 == 0) {
            number = 2;
        } else {
            number = 3;
        }
    }
}
