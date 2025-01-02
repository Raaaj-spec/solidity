// SPDX-License-Identifier: MIT
pragma solidity  0.8.28;
contract Twitter{

    struct Tweet{
        uint256 id;
        address creator;
        uint256 likes;
        uint256 createdAt;
        string content;
    }

     address public owner;

        modifier onlyowner(){
        require(owner==msg.sender, "you are not the owner");
        _;
    }

    uint16 public maxTweetLength= 280;

    function changeTweetlength(uint16 newTweetLength) public onlyowner{
        maxTweetLength=newTweetLength;
    }

    mapping (address => Tweet[]) userTweets;
   
    constructor(){
        owner = msg.sender;

    }




    function createTweet(string memory tweet) public {
        require(bytes (tweet).length<=maxTweetLength,"the tweet is long");


        Tweet memory newTweet = Tweet({
            id : userTweets[msg.sender].length,
            creator : msg.sender,
            likes : 0,
            createdAt : block.timestamp,
            content : tweet
        });

        userTweets[msg.sender].push(newTweet);


    }

    function getMyTweets () public view returns (Tweet[] memory){
        return userTweets[msg.sender];
    }

    function getAllTweets(address _owner)public  view returns (Tweet[] memory){
        return userTweets[_owner];
    }

    function getTweet(address _owner) public view returns (Tweet memory)
    {
        return userTweets[_owner] [0];
    }
    function likeTweet (address _owner, uint256 id) external {
        require(userTweets[_owner][id].id==id);
        userTweets[_owner][id].likes++;

    } 
}