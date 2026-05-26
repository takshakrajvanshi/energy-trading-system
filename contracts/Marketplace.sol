// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract Marketplace {

    IERC20 public energyToken;
    IERC20 public stablecoin;

    uint256 public listingCounter;

    struct Listing {
        uint256 id;
        address seller;
        uint256 amount;
        uint256 pricePerToken;
        bool active;
    }

    mapping(uint256 => Listing) public listings;

    constructor(address _energyToken, address _stablecoin) {
        energyToken = IERC20(_energyToken);
        stablecoin = IERC20(_stablecoin);
    }

    function listEnergy(uint256 _amount, uint256 _pricePerToken) external {

        require(_amount > 0, "Amount must be greater than 0");
        require(_pricePerToken > 0, "Price must be greater than 0");

        energyToken.transferFrom(
            msg.sender,
            address(this),
            _amount
        );

        listings[listingCounter] = Listing({
            id: listingCounter,
            seller: msg.sender,
            amount: _amount,
            pricePerToken: _pricePerToken,
            active: true
        });

        listingCounter++;
    }

    function executeTrade(uint256 _listingId) external {

        Listing storage listing = listings[_listingId];

        require(listing.active, "Listing inactive");

        uint256 totalCost =
            listing.amount * listing.pricePerToken;

        stablecoin.transferFrom(
            msg.sender,
            listing.seller,
            totalCost
        );

        energyToken.transfer(
            msg.sender,
            listing.amount
        );

        listing.active = false;
    }
}