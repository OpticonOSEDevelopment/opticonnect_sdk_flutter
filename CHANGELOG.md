## 1.0.0

Initial release of the OptiConnect SDK, enabling seamless integration with Opticon's BLE OPN-2500 and OPN-6000 barcode scanners.

Key features:

-  Bluetooth Low Energy (BLE) management: Discover, connect, disconnect, and monitor BLE devices.
-  Barcode scanning: Stream barcode data and handle multiple barcode symbology types, including Codabar, Code 39, UPC, EAN, and many others.
-  Symbology settings: Enable, disable, and customize various barcode symbologies and their subtypes (e.g., add-on support for UPC-A, UPC-E, etc.).
-  Formatting options: Configure preambles, postambles, prefixes, and suffixes for scanned barcode data.
-  Indicator controls: Control device indicators, including buzzer, LED, and vibration feedback.
-  Command execution: Send commands to the device and receive command responses for customization the scanner configuration.
-  Connection pooling: Ensure stable device pairing in multi-device environments by managing connection pools. Prevent previously paired devices from taking over connections by assigning a new connection pool ID.

## [1.0.1] - 2024-10-01

### Changed

-  Updated documentation URL to GitHub Pages for hosting SDK documentation.

## [1.0.2] - 2024-10-01

### Changed

-  Added platform support entries in `pubspec.yaml` to indicate compatibility with Android, iOS, and Windows and MacOS.

## [1.0.3] - 2024-10-01

### Changed

-  Added hyperlinks and images for the OPN-2500 and OPN-6000 in the readme file.

## [1.0.4] - 2024-10-01

### Changed

-  Changed scanner image URLs in README to absolute paths for compatibility.

## [1.0.5] - 2024-10-01

### Changed

-  Extended README with MacOS section and added extra information to the introduction.

## [1.0.6] - 2024-10-02

### Changed

-  Shortened the `pubspec.yaml` description to meet pub.dev requirements.
-  Modified the example to ensure compatibility and functionality on macOS.

## [1.0.7] - 2024-10-02

### Changed

-  Improved example.

## [1.0.8] - 2024-10-02

### Changed

-  Renamed bleDeviceStream to bleDiscoveredDevicesStream for better naming.

## [1.0.9] - 2024-10-02

### Changed

-  Simplified the main example for easier usage and quick integration.
-  The 'advanced' example, showcasing more detailed functionality and configurations, is available in the [GitHub Repository](https://github.com/OpticonOSEDevelopment/opticonnect_sdk_flutter).

## [1.0.10] - 2024-10-02

### Changed

-  Improved the simple example.

## [1.0.11] - 2024-10-02

### Changed

-  Improved resource management for the simple example.
-  Improved error handling when the DataProcessor is disposed of, while a write to the device was still pending.
