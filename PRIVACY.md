# Privacy Policy for GridWalker SAR

**Last Updated: February 2026**

GridWalker SAR is built with a "Privacy by Design" philosophy. As an offline-first, decentralized tool for Search and Rescue, we believe your data belongs to you and your team, not a central server.

---

## 1. Data Collection
- **Personal Information:** GridWalker SAR **does not** require you to create an account, provide an email address, or share your name to use the application.
- **Location Data:** The app requires access to your GPS location to provide search tracking and grid clearing functionality. This data is processed and stored **locally on your device** in a private database (Isar).
- **Sensitive Data:** We do not collect, store, or transmit any other sensitive information from your device.

## 2. Data Usage and Sharing
- **No Selling of Data:** We **do not sell**, rent, or trade any data collected by the application to third parties.
- **Local Storage:** All search tracks, markers, and grid data remain on your device unless you explicitly choose to share them.
- **User-Initiated Sharing:** Data is only shared when you manually perform one of the following actions:
    - **Export:** You manually export a JSON/GeoJSON file to share with a teammate.
    - **GitHub Sync:** You configure and trigger a sync to a GitHub repository. Note that data synced to a *public* GitHub repository will be visible to the public.
    - **P2P Sync:** You explicitly connect to another responder's device via Wi-Fi Direct or Bluetooth.

## 3. Transparency
GridWalker SAR is an **Open Source** project. Our source code is fully available for audit on GitHub. You can verify exactly how your data is handled by reviewing the code at: [https://github.com/ceakins/gridwalker](https://github.com/ceakins/gridwalker).

## 4. Third-Party Services
The application uses the following third-party mapping services:
- **ArcGIS/OpenFreeMap:** To provide satellite and vector map tiles. These providers receive standard technical requests (like your IP address and the map area being viewed) to serve the tiles, but they do not receive your search data or markers.

## 5. Contact
If you have any questions about this Privacy Policy, please open an issue on our GitHub repository.
