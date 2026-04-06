# GridWalker: Open-Source Search and Rescue (SAR)

**GridWalker** is an offline-first, decentralized mobile application designed for search and rescue operations in wilderness environments. It provides advanced mapping, GPS tracking, and peer-to-peer data synchronization without requiring a proprietary backend or internet connectivity.

---

## 📡 Core Architecture

GridWalker is built on a "Git-as-a-Backend" architecture to ensure data transparency, version control, and zero-cost infrastructure.

-   **Framework:** Flutter (Dart) targeting iOS and Android.
-   **Mapping:** `maplibre_gl` utilizing offline `.mbtiles` stored locally.
-   **Database:** `Isar` NoSQL database for high-performance spatial queries (State/County indexing).
-   **Serverless Cloud:** Data is stored hierarchically in a public GitHub repository (e.g., `/US/AZ/Yavapai/cases/`).
-   **Sync Engine:**
    -   **GitHub REST API:** Pulls JSON records and commits new tracks to feature branches.
    -   **P2P Mesh:** `flutter_p2p_connection` (Wi-Fi Direct) for wilderness syncing between responders.

---

## ✨ Key Features

1.  **Map Region Bounding:** Draw custom polygons to pre-cache vector/satellite tiles and community imagery before deployment.
2.  **Virtual Search Grid:** Real-time background GPS tracking that overlays a grid on the map. Cells change color based on "probability of detection" (POD) and area coverage.
3.  **Multi-County Jurisdictions:** Dynamic Isar schema allows responders to subscribe to multiple adjacent counties, merging regional datasets into a unified local view.
4.  **Decentralized Collaboration:** Sync your search tracks with other team members in the field via Wi-Fi Direct, ensuring the team leader has an up-to-date search map without LTE.

---

## 🚀 Getting Started

### Prerequisites
-   Flutter SDK: `^3.41.6`
-   Dart: `^3.11.4`
-   Android SDK (for Wi-Fi Direct testing)
-   MapLibre Offline Tiles (`.mbtiles`)

### Installation
1.  Clone the repository:
    ```bash
    git clone https://github.com/gridwalker-org/gridwalker.git
    cd gridwalker
    ```
2.  Install dependencies:
    ```bash
    flutter pub get
    ```
3.  Generate Isar local storage code:
    ```bash
    dart run build_runner build
    ```
4.  Run the application:
    ```bash
    flutter run
    ```

---

## 🗺️ Data Organization (Git Database)
The master records are organized by geographic hierarchy:
`/{COUNTRY_CODE}/{STATE_CODE}/{COUNTY}/cases/{CASE_ID}.json`

Contributing data involves committing GeoJSON features to feature branches, which are then merged after validation by the lead SAR agency.

---

## 🛡️ License
GridWalker is licensed under the MIT License. See `LICENSE` for details.
