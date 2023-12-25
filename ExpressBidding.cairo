// Bidding App

// Define the contract
contract ExpressBidding:

    // State variables
    owner: address
    highestBidder: address
    highestBid: Uint128
    auctionEndTime: Timestamp

    // Event to log bids
    Bid: event({bidder: indexed(address), amount: uint128})

    // Event to log auction end
    AuctionEnded: event({winner: indexed(address), amount: uint128})

    // Initialize the bidding app
    init(biddingDuration: Timestamp):
        owner = msg.sender
        auctionEndTime = now() + biddingDuration

    // Function to place a bid
    function placeBid() payable:
        // Check if the auction is still open
        require(now() < auctionEndTime, "Auction has ended")

        // Check if the bid is higher than the current highest bid
        require(msg.value > highestBid, "Bid is too low")

        // If there was a previous highest bidder, refund their bid
        if highestBidder != 0:
            send(highestBidder, highestBid)

        // Update the highest bid and bidder
        highestBid = msg.value
        highestBidder = msg.sender

        // Log the bid event
        log Bid({bidder: msg.send
