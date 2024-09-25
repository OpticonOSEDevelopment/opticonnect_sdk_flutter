# OptiConnect SDK

OptiConnect SDK enables seamless integration with Opticon's BLE OPN-2500 and OPN-6000 barcode scanners. This SDK allows you to manage Bluetooth Low Energy (BLE) connections, handle scanner data streams, and programmatically control scanner settings via commands.

## Features
- Bluetooth discovery and connection management for OPN-2500 and OPN-6000 BLE scanners.
- Real-time data streaming, including barcode data reception and BLE device state monitoring.
- Programmatic control of scanner settings (e.g., scan modes, illumination, connection pooling, etc.).
- Exclusive Connection Management: Manage connection pools using 4-character hexadecimal IDs to ensure exclusive device pairing. Prevent previously paired devices from hijacking active connections by assigning unique connection pool IDs.
- Command management and customization for BLE services and scanner configurations.

## Getting Started

### Prerequisites
- Flutter SDK version 2.12.0 or above.
- Opticon BLE OPN-2500 or OPN-6000 barcode scanner(s).

### Installation

To install the SDK, add the following dependency to your `pubspec.yaml` file:

```yaml
dependencies:
  opticonnect_sdk: ^1.0.0
