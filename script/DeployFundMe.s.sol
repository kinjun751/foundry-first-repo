// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {Script} from "forge-std/Script.sol";
import {FundMe} from "../src/FundMe.sol";
import {HelperConfig} from "./HelperConfig.s.sol";

contract DeployFundMe is Script {
    function run() external returns (FundMe) {
        // ANYTHING BEFORE startBroadcast is "NOT A REAL TX"
        HelperConfig helperConfig = new HelperConfig();
        address ethUsdPriceFeed = helperConfig.activeNetworkConfig();

        // ANYTHING AFTER startBroadcast is "A REAL TX"
        vm.startBroadcast();
        FundMe fundMe = new FundMe(ethUsdPriceFeed); //0x694AA1769357215DE4FAC081bf1f309aDC325306
        vm.stopBroadcast();
        return fundMe;
    }
}
