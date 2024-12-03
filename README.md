# OptiConnect SDK

OptiConnect SDK enables seamless integration with [Opticon](https://opticon.com/)'s BLE [OPN-2500](https://opticon.com/product/opn-2500/) and [OPN-6000](https://opticon.com/product/opn-6000/) barcode scanners. This SDK allows you to manage Bluetooth Low Energy (BLE) connections, handle scanner data streams, and programmatically control scanner settings via commands.

**Note:** This package is independent of the [OptiConnect application](https://opticon.com/opticonnect/), which provides additional device management features. The SDK provides lower-level BLE functionality directly interacting with Opticon's BLE devices.

[SDK Manual](https://opticonosedevelopment.github.io/opticonnect_sdk_flutter/)

[OptiConnect Pub.dev package](https://pub.dev/packages/opticonnect_sdk/)

## Features

-  Bluetooth discovery and connection management for OPN-2500 and OPN-6000 BLE scanners.
-  Real-time data streaming, including barcode data reception and BLE device state monitoring.
-  Programmatic control of scanner settings (e.g., scan modes, illumination, connection pooling, etc.).
-  Exclusive connection management: Ensure stable device pairing in multi-device environments by assigning unique connection pool IDs, preventing previously paired devices from hijacking active connections.
-  Command management and customization for BLE services and scanner configurations.

## Getting Started

### Prerequisites

-  Flutter SDK version 2.12.0 or above.
-  Opticon BLE [OPN-2500](https://opticon.com/product/opn-2500/) or [OPN-6000](https://opticon.com/product/opn-6000/) barcode scanner(s).

| ![OPN-2500](https://raw.githubusercontent.com/opticonosedevelopment/opticonnect_sdk_flutter/main/assets/images/OPN-2500.png) | ![OPN-6000](https://raw.githubusercontent.com/opticonosedevelopment/opticonnect_sdk_flutter/main/assets/images/OPN-6000.png) |
| :--------------------------------------------------------------------------------------------------------------------------: | :--------------------------------------------------------------------------------------------------------------------------: |
|                                                         **OPN-2500**                                                         |                                                         **OPN-6000**                                                         |

### Installation

To install the SDK, add the following dependency to your `pubspec.yaml` file:

```yaml
dependencies:
   opticonnect_sdk: ^1.0.0
```

### Important

This SDK uses [flutter_blue_plus](https://pub.dev/packages/flutter_blue_plus) under the hood for Bluetooth Low Energy (BLE) communications. We have provided the necessary permission configurations for Android and iOS within this README. You can refer to the flutter_blue_plus documentation for additional BLE-specific settings or for more advanced usage scenarios.

### Android Setup

to enable Bluetooth discovery and connection on Android, add the following permissions to your AndroidManifest.xml file located at android/app/src/main/AndroidManifest.xml below the manifest entry at the top:

```xml
<uses-feature android:name="android.hardware.bluetooth_le" android:required="false" />

<!-- New Bluetooth permissions for Android 12 or higher -->
<uses-permission android:name="android.permission.BLUETOOTH_SCAN"/>
<uses-permission android:name="android.permission.BLUETOOTH_CONNECT" />
<uses-permission android:name="android.permission.ACCESS_FINE_LOCATION" />

<!-- Legacy permissions for Android 11 or lower -->
<uses-permission android:name="android.permission.BLUETOOTH" android:maxSdkVersion="30" />
<uses-permission android:name="android.permission.BLUETOOTH_ADMIN" android:maxSdkVersion="30" />

<!-- Legacy permission for Android 9 or lower -->
<uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION" android:maxSdkVersion="28" />
```

### iOS Setup

To enable Bluetooth and background functionality for BLE device scanning on iOS, you need to modify a few project files.

#### 1. Update Info.plist

Add the following keys to your ios/Runner/Info.plist file to request Bluetooth and location permissions:

```xml
<key>NSBluetoothAlwaysUsageDescription</key>
<string>This app needs Bluetooth to communicate with scanners and retrieve data.</string>

<key>NSLocationWhenInUseUsageDescription</key>
<string>This app requires location access to scan for BLE devices while in use.</string>

<key>NSLocationAlwaysUsageDescription</key>
<string>This app requires location access to scan for BLE devices even when in the background.</string>

<key>UIBackgroundModes</key>
<array>
   <string>bluetooth-central</string>
</array>
```

#### 2. Update Podfile

Ensure that the Podfile contains the required permissions for Bluetooth and location access by adding the following lines in your ios/Podfile:

```
post_install do |installer|
  installer.pods_project.targets.each do |target|
    flutter_additional_ios_build_settings(target)

    target.build_configurations.each do |config|
      config.build_settings['GCC_PREPROCESSOR_DEFINITIONS'] ||= [
        '$(inherited)',

        ## Enable required permissions
        'PERMISSION_LOCATION=1',  # Enable location permissions
        'PERMISSION_BLUETOOTH=1', # Enable Bluetooth permissions
      ]
    end
  end
end

```

#### 3. Enable Background Modes for Bluetooth LE Accessories in Xcode

To allow the app to use Bluetooth in the background, follow these steps:

1. Open your iOS project in Xcode.
2. Select the Runner target in the project navigator.
3. Go to the Signing & Capabilities tab.
4. Click the + Capability button in the top left.
5. Select Background Modes from the list.
6. Check the option for Uses Bluetooth LE Accessories.

### MacOS Setup

Make sure you have granted access to the Bluetooth hardware:

1. Open your MacOS project in Xcode.
2. Go to Runners -> Targets -> Runner.
3. Go to the Signing & Capabilities tab.
4. Under App Sandbox, ensure that Bluetooth is enabled by checking the Bluetooth box under Hardware.

You can refer to the image below for guidance:

![MacOSPermission](https://raw.githubusercontent.com/opticonosedevelopment/opticonnect_sdk_flutter/main/assets/images/macos_bluetooth_permission.png)
