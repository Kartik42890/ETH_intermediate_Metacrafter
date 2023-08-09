// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract DegenToken is ERC20, ERC20Burnable, Ownable {
    constructor() ERC20("DEGEN", "DGN") {}

    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }

    event successfulTransfer(address indexed from, address indexed to, string NftName );

    // NFT Structure
    struct NFT {
        uint ID;
        string NftName;
        uint Price;
    }

    // Mapping a NFT with ID
    mapping(uint => NFT) public NftList;
    uint NftListCount;  //Nft Count


    // Adding Nft
    function addNft(string memory _NftName, uint256 _Price) external onlyOwner {
        NftListCount+=1;
        NFT memory nft = NFT(NftListCount, _NftName, _Price);
        NftList[NftListCount] = nft;
    }

    // Redeeming Tokens
    function redeem(uint _ID) external {
        require(_ID > 0 && _ID <= NftListCount, "Please enter valid ID");
        NFT memory redeemNft = NftList[_ID];

        require(balanceOf(msg.sender) >= redeemNft.Price, "Not Enough Balance");

        _transfer(msg.sender, owner(), redeemNft.Price); //
        emit Transfer(msg.sender, address(0), redeemNft.Price);
    }
}