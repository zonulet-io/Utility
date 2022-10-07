// ███████╗ ██████╗ ███╗   ██╗██╗   ██╗██╗     ███████╗████████╗
// ╚══███╔╝██╔═══██╗████╗  ██║██║   ██║██║     ██╔════╝╚══██╔══╝
//   ███╔╝ ██║   ██║██╔██╗ ██║██║   ██║██║     █████╗     ██║   
//  ███╔╝  ██║   ██║██║╚██╗██║██║   ██║██║     ██╔══╝     ██║   
// ███████╗╚██████╔╝██║ ╚████║╚██████╔╝███████╗███████╗   ██║   
// ╚══════╝ ╚═════╝ ╚═╝  ╚═══╝ ╚═════╝ ╚══════╝╚══════╝   ╚═╝                                                              
// zonulet.io
// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract ZonuletAvatars {
    mapping (address => string) private ipfsHashes;
    mapping (address => string) private mimeTypes;
    mapping (address => string) private names;
    mapping (address => string) private bios;
    
    address[] public updates;

    event SetAvatar(address indexed hashAddress, string hash, string mimetype);

    function setAvatar(string memory hash, string memory mimetype, string memory name, string memory bio) public {
        require(bytes(hash).length == 46);
        require(bytes(mimetype).length > 0);
        
        updates.push(msg.sender);
        
        ipfsHashes[msg.sender] = hash;
        mimeTypes[msg.sender] = mimetype;
        names[msg.sender] = name;
        bios[msg.sender] = bio;
        

        emit SetAvatar(msg.sender, hash, mimetype);
    }

    function getIPFSHash(address hashAddress) public view returns (string memory) {
        return ipfsHashes[hashAddress];
    }
    
    function getMIMEType(address hashAddress) public view returns (string memory) {
        return mimeTypes[hashAddress];
    }
    
    function getName(address hashAddress) public view returns (string memory) {
        return names[hashAddress];
    }
    
    function getBio(address hashAddress) public view returns (string memory) {
        return bios[hashAddress];
    }
    
    function UpdateCount() public view returns (uint) {
        return updates.length;
    }
}