pragma solidity ^0.8.0;

contract ReferralProgram {
    mapping(address => address) public referrer;
    mapping(address => uint256) public rewards;
    uint256 public rewardAmount = 10;

    function refer(address _referee) public {
        require(_referee != address(0), "Invalid referee address");
        require(referrer[_referee] == address(0), "Referee already referred");
        require(_referee != msg.sender, "Cannot refer yourself");
        
        referrer[_referee] = msg.sender;
        rewards[msg.sender] += rewardAmount;
    }

    function getReferrer(address _user) public view returns (address) {
        return referrer[_user];
    }
    
    function getRewards(address _user) public view returns (uint256) {
        return rewards[_user];
    }
}
