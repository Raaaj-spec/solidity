// SPDX-License-Identifier: MIT
pragma solidity  0.8.28;
contract Twitter{

    struct Tweet{
        address creator;
        uint256 likes;
        uint256 createdAt;
        string content;
    }
    mapping (address => Tweet[]) userTweets;
    function createTweet(string memory tweet) public {
        Tweet memory newTweet = Tweet({
            creator : msg.sender,
            likes : 0,
            createdAt : block.timestamp,
            content : tweet
        });

        userTweets[msg.sender].push(newTweet);


    }

    function getAllTweets(address owner)public  view returns (Tweet[] memory){
        return userTweets[owner];
    }

    function getTweet(address owner) public view returns (Tweet memory)
    {
        return userTweets[owner] [0];
    }

}