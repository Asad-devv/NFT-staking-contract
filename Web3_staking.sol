// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/token/ERC721/IERC721.sol";
import "@openzeppelin/contracts/token/ERC20/utils/SafeERC20.sol";
import "@openzeppelin/contracts/token/ERC721/utils/ERC721Holder.sol";



import "@openzeppelin/contracts/token/ERC721/IERC721Receiver.sol";
contract Staking is IERC721Receiver, ERC721Holder  {
    IERC721 immutable nft;
    IERC20 immutable token;

    mapping (address => mapping(uint256=>uint256)) public stakes;
    constructor(address _nft,address _token){

        nft=IERC721(_nft);
     token=IERC20(_token);


    }

    function calculateRate(uint256 time)public pure returns{
        if(time<1 minutes){
            return 0;
        }
        if(time<3 minutes){
            return 3;
        }
       else if(time < 5 minutes)
{
                return 3;
}else{
                return 10;

}
    }

    function stake(uint _tokenId) public {
        require(nft.ownerOf(_tokenId)==msg.sender,"you dont own this NFT");
        stakes[msg.sender][_tokenId]= block.timestamp;
        nft.transferFrom(msg.sender, address(this),_tokenId);
    }

    function calculateReward(uint256 _tokenId) public view returns (uint256 reward){
        require(stakes[msg.sender ][_tokenId]>0,"NFT has not been staked ");
        uint256 time =block.timestamp- stakes[msg.sender][_tokenId];
        uint256 reward = calculateRate(time) * time *(10**18)/1 minutes;
        return reward
    }

    functon unstake(uint256 _tokenId)public{
        //calculate reWARD

        uint256 reward= calculateReward(_tokenId);
        delete stakes[msg.sender][_tokenId];
        nft.safeTransferFrom(address(this),msg.sender,_tokenId);
        token.transfer(msg.sender,reward);
    }

} 
