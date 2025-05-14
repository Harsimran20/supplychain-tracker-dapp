# 🏗️ Supply Chain Management System (Solidity)

A decentralized Supply Chain Management DApp built using **Solidity**, focusing on transparency and traceability—**without the use of tokens or ethers**. The system tracks products through different lifecycle stages: from manufacturing to delivery, ensuring secure state transitions through role-based permissions.

---

## 🚀 Features

- ✅ Create and manage products
- 🔐 Role-based access (Manufacturer, Distributor, Retailer)
- 📦 Product lifecycle tracking:
  - Manufactured → In Transit → Delivered
- 🧾 Transparent state transitions using events
- 🛠️ No tokens or monetary transactions—pure logic

---

## 🧠 Smart Contract Overview

### 🗂️ Product Structure

```solidity
struct Product {
  string name;
  address manufacturer;
  address distributor;
  address retailer;
  State state;
}
```

### 🔁 States

```solidity
enum State { Manufactured, InTransit, Delivered }
```

## 🧪 How to Use (Remix IDE)

1. Deploy the Contract using a Remix environment (e.g., JavaScript VM).
2. Call `createProduct("ProductName", "0xDistributorAddress")`
   - Ensure you are using a valid Ethereum address.
3. Use `shipProduct(productId)` as the distributor.
4. Use `receiveProduct(productId)` as the retailer.

📝 Use different accounts in Remix to simulate roles (manufacturer, distributor, retailer).

## 🧰 Tech Stack

- Solidity v0.8.x
- Remix IDE for development/testing
- Ethereum-compatible blockchain (no gas usage if using Remix JS VM)

## 📜 License

This project is licensed under the MIT License.

