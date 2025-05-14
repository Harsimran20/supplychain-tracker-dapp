// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SupplyChain {
    enum State { Manufactured, InTransit, Delivered }

    struct Product {
        string name;
        address manufacturer;
        address distributor;
        address retailer;
        State state;
    }

    mapping(uint => Product) public products;
    uint public productCount;

    event ProductCreated(uint productId, string name, address manufacturer);
    event StateChanged(uint productId, State state);

    modifier onlyManufacturer(uint productId) {
        require(msg.sender == products[productId].manufacturer, "Not authorized");
        _;
    }

    modifier onlyDistributor(uint productId) {
        require(msg.sender == products[productId].distributor, "Not authorized");
        _;
    }

    modifier onlyRetailer(uint productId) {
        require(msg.sender == products[productId].retailer, "Not authorized");
        _;
    }

    function createProduct(string memory name, address distributor, address retailer) public {
        productCount++;
        products[productCount] = Product(name, msg.sender, distributor, retailer, State.Manufactured);
        emit ProductCreated(productCount, name, msg.sender);
    }

    function shipProduct(uint productId) public onlyManufacturer(productId) {
        products[productId].state = State.InTransit;
        emit StateChanged(productId, State.InTransit);
    }

    function receiveProduct(uint productId) public onlyDistributor(productId) {
        products[productId].state = State.Delivered;
        emit StateChanged(productId, State.Delivered);
    }
}
