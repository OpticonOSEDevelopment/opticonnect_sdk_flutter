import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:opticonnect_sdk/constants.dart';
import 'package:opticonnect_sdk/entities.dart';
import 'package:opticonnect_sdk/enums.dart';
import 'package:opticonnect_sdk/opticonnect.dart';

import 'bluetooth_test_helper.dart';

class BluetoothIntegrationTest with BluetoothTestHelper {
  // Any additional setup or methods can go here if needed.
}

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  final bluetoothTest = BluetoothIntegrationTest();

  setUpAll(() async {
    await bluetoothTest.globalSetup();
  });

  tearDownAll(() async {
    await bluetoothTest.globalTeardown();
  });

  group('Bluetooth integration tests', () {
    setUp(() async {
      await bluetoothTest.setup();
    });

    tearDown(() async {
      await bluetoothTest.teardown();
    });

    testWidgets('Test Barcode Data Stream', (WidgetTester tester) async {
      final foundDevice = await bluetoothTest
          .discoverDevice(BluetoothTestHelper.testDeviceMacAddress);
      expect(foundDevice, isNotNull, reason: "Expected device was not found.");

      bool isDeviceConnected = await bluetoothTest.toggleDeviceConnectionState(
        BluetoothTestHelper.testDeviceMacAddress,
        BleDeviceConnectionState.connected,
        timeout: const Duration(seconds: 20),
      );

      if (isDeviceConnected) {
        OptiConnect.scannerSettings
            .resetSettings(BluetoothTestHelper.testDeviceMacAddress);

        final deferredBarcodeData = Completer<BarcodeData>();
        final subscription = (await OptiConnect.bluetoothManager
                .subscribeToBarcodeDataStream(
                    BluetoothTestHelper.testDeviceMacAddress))
            .listen((barcodeData) {
          if (!deferredBarcodeData.isCompleted) {
            deferredBarcodeData.complete(barcodeData);
          }
        });

        BarcodeData? receivedBarcodeData;
        try {
          receivedBarcodeData = await deferredBarcodeData.future
              .timeout(const Duration(seconds: 20));
        } catch (e) {
          // Handle timeout if necessary
        }
        expect(receivedBarcodeData, isNotNull,
            reason: "Expected barcode data was not received.");

        await subscription.cancel();
      } else {
        fail(
            "Failed to connect to device with MAC address ${BluetoothTestHelper.testDeviceMacAddress}.");
      }
    });

    testWidgets('Test Buzzer Command', (WidgetTester tester) async {
      final foundDevice = await bluetoothTest
          .discoverDevice(BluetoothTestHelper.testDeviceMacAddress);
      expect(foundDevice, isNotNull,
          reason:
              "Expected device with MAC address ${BluetoothTestHelper.testDeviceMacAddress} was not found.");

      final isDeviceConnected = await bluetoothTest.toggleDeviceConnectionState(
        BluetoothTestHelper.testDeviceMacAddress,
        BleDeviceConnectionState.connected,
        timeout: const Duration(seconds: 20),
      );
      if (isDeviceConnected) {
        print('Sending buzzer command');

        final response = await OptiConnect.scannerSettings.executeCommand(
          BluetoothTestHelper.testDeviceMacAddress,
          ScannerCommand(goodReadBuzzer),
        );

        print('Buzzer command response: $response');

        await Future.delayed(const Duration(seconds: 1));

        expect(response.succeeded, isTrue, reason: "Buzzer command failed.");
      } else {
        fail(
            "Failed to connect to device with MAC address ${BluetoothTestHelper.testDeviceMacAddress}.");
      }
    });

    testWidgets('Test Fetch Device Info', (WidgetTester tester) async {
      // Discover the device first
      final foundDevice = await bluetoothTest
          .discoverDevice(BluetoothTestHelper.testDeviceMacAddress);
      expect(foundDevice, isNotNull,
          reason:
              "Expected device with MAC address ${BluetoothTestHelper.testDeviceMacAddress} was not found.");

      // Attempt to connect to the device
      final isDeviceConnected = await bluetoothTest.toggleDeviceConnectionState(
        BluetoothTestHelper.testDeviceMacAddress,
        BleDeviceConnectionState.connected,
        timeout: const Duration(seconds: 20),
      );

      if (isDeviceConnected) {
        print(
            "Fetching device info for device with MAC address ${BluetoothTestHelper.testDeviceMacAddress}.");

        // Fetch device information
        final DeviceInfo deviceInfo = OptiConnect.scannerInfo
            .getInfo(BluetoothTestHelper.testDeviceMacAddress);

        // Logging the fetched information
        print("Device MAC: ${deviceInfo.macAddress}");
        print("Device Local Name: ${deviceInfo.localName}");
        print("Device Serial Number: ${deviceInfo.serialNumber}");
        print("Device Firmware Version: ${deviceInfo.firmwareVersion}");

        // Assertions to ensure the device info is correct and not empty
        expect(deviceInfo.macAddress, BluetoothTestHelper.testDeviceMacAddress,
            reason: "MAC address does not match the expected device.");
        expect(deviceInfo.localName.isNotEmpty, isTrue,
            reason: "Local name of the device should not be empty.");
        expect(deviceInfo.serialNumber.isNotEmpty, isTrue,
            reason: "Serial number of the device should not be empty.");
        expect(deviceInfo.firmwareVersion.isNotEmpty, isTrue,
            reason: "Firmware version of the device should not be empty.");
      } else {
        fail(
            "Failed to connect to device with MAC address ${BluetoothTestHelper.testDeviceMacAddress}.");
      }
    });

    testWidgets('Test Settings Compression', (WidgetTester tester) async {
      // Discover the device first
      final foundDevice = await bluetoothTest
          .discoverDevice(BluetoothTestHelper.testDeviceMacAddress);
      expect(foundDevice, isNotNull,
          reason:
              "Expected device with MAC address ${BluetoothTestHelper.testDeviceMacAddress} was not found.");

      // Attempt to connect to the device
      final isDeviceConnected = await bluetoothTest.toggleDeviceConnectionState(
        BluetoothTestHelper.testDeviceMacAddress,
        BleDeviceConnectionState.connected,
        timeout: const Duration(seconds: 20),
      );

      if (isDeviceConnected) {
        // Reset scanner settings before running commands
        await OptiConnect.scannerSettings
            .resetSettings(BluetoothTestHelper.testDeviceMacAddress);

        // Execute multiple commands
        await OptiConnect.scannerSettings.executeCommand(
            BluetoothTestHelper.testDeviceMacAddress,
            ScannerCommand(enableQRCodeOnly,
                ledFeedback: true,
                buzzerFeedback: true,
                vibrationFeedback: true));

        await OptiConnect.scannerSettings.executeCommand(
            BluetoothTestHelper.testDeviceMacAddress,
            ScannerCommand(enableEAN13Only,
                ledFeedback: true,
                buzzerFeedback: true,
                vibrationFeedback: true));

        await OptiConnect.scannerSettings.executeCommand(
            BluetoothTestHelper.testDeviceMacAddress,
            ScannerCommand(enableDataMatrixOnly,
                ledFeedback: true,
                buzzerFeedback: true,
                vibrationFeedback: true));

        await OptiConnect.scannerSettings.executeCommand(
            BluetoothTestHelper.testDeviceMacAddress,
            ScannerCommand(enableEAN13Plus2Only,
                ledFeedback: true,
                buzzerFeedback: true,
                vibrationFeedback: true));

        await OptiConnect.scannerSettings.executeCommand(
            BluetoothTestHelper.testDeviceMacAddress,
            ScannerCommand(enableAll2DCodesOnly,
                ledFeedback: true,
                buzzerFeedback: true,
                vibrationFeedback: true));

        // Wait to allow settings commands to apply
        await Future.delayed(const Duration(seconds: 6));

        // Retrieve and log the settings
        final List<CommandData> settings = await OptiConnect.scannerSettings
            .getSettings(BluetoothTestHelper.testDeviceMacAddress);

        print("Compressed settings: $settings");

        // Assertions for the compressed settings
        expect(settings.length, 2,
            reason:
                "Settings compression test failed. Expected 2 settings but got ${settings.length}.");

        expect(
            settings
                .any((setting) => setting.command == bluetoothLowEnergyDefault),
            isTrue,
            reason:
                "Settings compression test failed: Bluetooth Low Energy Default not found.");

        expect(
            settings.any((setting) => setting.command == enableAll2DCodesOnly),
            isTrue,
            reason:
                "Settings compression test failed: ENABLE_ALL_2D_CODES_ONLY not found.");
      } else {
        fail(
            "Failed to connect to device with MAC address ${BluetoothTestHelper.testDeviceMacAddress}.");
      }
    });

    testWidgets('Test Settings Compression 2', (WidgetTester tester) async {
      // Discover the device first
      final foundDevice = await bluetoothTest
          .discoverDevice(BluetoothTestHelper.testDeviceMacAddress);
      expect(foundDevice, isNotNull,
          reason:
              "Expected device with MAC address ${BluetoothTestHelper.testDeviceMacAddress} was not found.");

      // Attempt to connect to the device
      final isDeviceConnected = await bluetoothTest.toggleDeviceConnectionState(
        BluetoothTestHelper.testDeviceMacAddress,
        BleDeviceConnectionState.connected,
        timeout: const Duration(seconds: 20),
      );

      if (isDeviceConnected) {
        // Reset scanner settings before running commands
        await OptiConnect.scannerSettings
            .resetSettings(BluetoothTestHelper.testDeviceMacAddress);

        // Execute multiple commands
        await OptiConnect.scannerSettings.executeCommand(
            BluetoothTestHelper.testDeviceMacAddress,
            ScannerCommand(singleToneBuzzer));
        await OptiConnect.scannerSettings.executeCommand(
            BluetoothTestHelper.testDeviceMacAddress,
            ScannerCommand(highLowBuzzer));
        await OptiConnect.scannerSettings.executeCommand(
            BluetoothTestHelper.testDeviceMacAddress,
            ScannerCommand(msiPlesseyCheck2CdsMod10Mod11));
        await OptiConnect.scannerSettings.executeCommand(
            BluetoothTestHelper.testDeviceMacAddress,
            ScannerCommand(msiPlesseyCheck2CdsMod10Mod10));
        await OptiConnect.scannerSettings.executeCommand(
            BluetoothTestHelper.testDeviceMacAddress,
            ScannerCommand(lowHighBuzzer));
        await OptiConnect.scannerSettings.executeCommand(
            BluetoothTestHelper.testDeviceMacAddress,
            ScannerCommand(msiPlesseyCheck2CdsMod11Mod10));
        await OptiConnect.scannerSettings.executeCommand(
            BluetoothTestHelper.testDeviceMacAddress,
            ScannerCommand(highLowBuzzer));
        await OptiConnect.scannerSettings.executeCommand(
            BluetoothTestHelper.testDeviceMacAddress,
            ScannerCommand(code39MinLength1Digit));
        await OptiConnect.scannerSettings.executeCommand(
            BluetoothTestHelper.testDeviceMacAddress,
            ScannerCommand(code39MinLength3Digits));
        await OptiConnect.scannerSettings.executeCommand(
            BluetoothTestHelper.testDeviceMacAddress,
            ScannerCommand(telepenNumericMode));
        await OptiConnect.scannerSettings.executeCommand(
            BluetoothTestHelper.testDeviceMacAddress,
            ScannerCommand(telepenASCIIMode));
        await OptiConnect.scannerSettings.executeCommand(
            BluetoothTestHelper.testDeviceMacAddress,
            ScannerCommand(code39MinLength1Digit));

        // Wait to allow settings commands to apply
        await Future.delayed(const Duration(seconds: 6));

        // Retrieve and log the settings
        final List<CommandData> settings = await OptiConnect.scannerSettings
            .getSettings(BluetoothTestHelper.testDeviceMacAddress);

        print("Compressed settings: $settings");

        // Assertions for the compressed settings
        expect(settings.length, 5,
            reason:
                "Settings compression test failed. Expected 5 settings but got ${settings.length}.");
        expect(
            settings
                .any((setting) => setting.command == bluetoothLowEnergyDefault),
            isTrue,
            reason:
                "Settings compression test failed: Bluetooth Low Energy Default not found.");
        expect(
            settings.any((setting) => setting.command == highLowBuzzer), isTrue,
            reason:
                "Settings compression test failed: HIGH_LOW_BUZZER not found.");
        expect(
            settings.any(
                (setting) => setting.command == msiPlesseyCheck2CdsMod11Mod10),
            isTrue,
            reason:
                "Settings compression test failed: MSI_PLESSEY_CHECK_2_CDS_MOD_11_MOD_10 not found.");
        expect(
            settings.any((setting) => setting.command == code39MinLength1Digit),
            isTrue,
            reason:
                "Settings compression test failed: CODE_39_MIN_LENGTH_1_DIGIT not found.");
        expect(settings.any((setting) => setting.command == telepenASCIIMode),
            isTrue,
            reason:
                "Settings compression test failed: TELEPEN_ASCII_MODE not found.");
      } else {
        fail(
            "Failed to connect to device with MAC address ${BluetoothTestHelper.testDeviceMacAddress}.");
      }
    });

    testWidgets('Code Specific Test', (WidgetTester tester) async {
      // Discover the device first
      final foundDevice = await bluetoothTest
          .discoverDevice(BluetoothTestHelper.testDeviceMacAddress);
      expect(foundDevice, isNotNull,
          reason:
              "Expected device with MAC address ${BluetoothTestHelper.testDeviceMacAddress} was not found.");

      // Attempt to connect to the device
      final isDeviceConnected = await bluetoothTest.toggleDeviceConnectionState(
        BluetoothTestHelper.testDeviceMacAddress,
        BleDeviceConnectionState.connected,
        timeout: const Duration(seconds: 20),
      );

      if (isDeviceConnected) {
        // Reset scanner settings before running commands
        await OptiConnect.scannerSettings
            .resetSettings(BluetoothTestHelper.testDeviceMacAddress);

        // Set different Codabar modes
        await OptiConnect.scannerSettings.codeSpecific.codabar.setMode(
            deviceId: BluetoothTestHelper.testDeviceMacAddress,
            mode: CodabarMode.abcCodeOnly);
        await OptiConnect.scannerSettings.codeSpecific.codabar.setMode(
            deviceId: BluetoothTestHelper.testDeviceMacAddress,
            mode: CodabarMode.codabarABCAndCX);
        await OptiConnect.scannerSettings.codeSpecific.codabar.setMode(
            deviceId: BluetoothTestHelper.testDeviceMacAddress,
            mode: CodabarMode.cxCodeOnly);

        // Wait for settings to be applied
        await Future.delayed(const Duration(seconds: 6));

        // Retrieve and log the settings
        final List<CommandData> settings = await OptiConnect.scannerSettings
            .getSettings(BluetoothTestHelper.testDeviceMacAddress);

        print("Codabar Mode settings: $settings");

        // Assertions for the codabar mode settings
        expect(settings.length, 2,
            reason:
                "Settings compression test failed. Expected 2 settings but got ${settings.length}.");
        expect(
            settings
                .any((setting) => setting.command == bluetoothLowEnergyDefault),
            isTrue,
            reason:
                "Settings compression test failed: Bluetooth Low Energy Default not found.");
        expect(settings.any((setting) => setting.command == codabarCXCodeOnly),
            isTrue,
            reason:
                "Settings compression test failed: CODABAR_CX_CODE_ONLY not found.");
      } else {
        fail(
            "Failed to connect to device with MAC address ${BluetoothTestHelper.testDeviceMacAddress}.");
      }
    });

    testWidgets('Test Get Latest Battery Percentage',
        (WidgetTester tester) async {
      final foundDevice = await bluetoothTest
          .discoverDevice(BluetoothTestHelper.testDeviceMacAddress);
      expect(foundDevice, isNotNull,
          reason:
              "Expected device with MAC address ${BluetoothTestHelper.testDeviceMacAddress} was not found.");

      bool isDeviceConnected = await bluetoothTest.toggleDeviceConnectionState(
        BluetoothTestHelper.testDeviceMacAddress,
        BleDeviceConnectionState.connected,
        timeout: const Duration(seconds: 20),
      );

      if (isDeviceConnected) {
        final batteryPercentage = OptiConnect.bluetoothManager
            .getLatestBatteryPercentage(
                BluetoothTestHelper.testDeviceMacAddress);
        print("Battery percentage: $batteryPercentage%");
        expect(batteryPercentage >= 0 && batteryPercentage <= 100, isTrue,
            reason: "Battery percentage should be between 0 and 100.");
      } else {
        fail(
            "Failed to connect to device with MAC address ${BluetoothTestHelper.testDeviceMacAddress}.");
      }
    });

    testWidgets('Test Get Latest Battery Status', (WidgetTester tester) async {
      final foundDevice = await bluetoothTest
          .discoverDevice(BluetoothTestHelper.testDeviceMacAddress);
      expect(foundDevice, isNotNull,
          reason:
              "Expected device with MAC address ${BluetoothTestHelper.testDeviceMacAddress} was not found.");

      bool isDeviceConnected = await bluetoothTest.toggleDeviceConnectionState(
        BluetoothTestHelper.testDeviceMacAddress,
        BleDeviceConnectionState.connected,
        timeout: const Duration(seconds: 20),
      );

      if (isDeviceConnected) {
        final batteryStatus = OptiConnect.bluetoothManager
            .getLatestBatteryStatus(BluetoothTestHelper.testDeviceMacAddress);
        print(
            "Latest battery status: ${batteryStatus.percentage}% - Charging: ${batteryStatus.isCharging}");
        expect(batteryStatus.percentage >= 0 && batteryStatus.percentage <= 100,
            isTrue,
            reason: "Battery percentage should be between 0 and 100.");
      } else {
        fail(
            "Failed to connect to device with MAC address ${BluetoothTestHelper.testDeviceMacAddress}.");
      }
    });

    testWidgets('Test Battery Status Stream', (WidgetTester tester) async {
      final foundDevice = await bluetoothTest
          .discoverDevice(BluetoothTestHelper.testDeviceMacAddress);
      expect(foundDevice, isNotNull,
          reason:
              "Expected device with MAC address ${BluetoothTestHelper.testDeviceMacAddress} was not found.");

      bool isDeviceConnected = await bluetoothTest.toggleDeviceConnectionState(
        BluetoothTestHelper.testDeviceMacAddress,
        BleDeviceConnectionState.connected,
        timeout: const Duration(seconds: 20),
      );

      if (isDeviceConnected) {
        final deferredBatteryStatus = Completer<BatteryLevelStatus>();

        final batteryStatusSubscription = (await OptiConnect.bluetoothManager
                .subscribeToBatteryStatusStream(
                    BluetoothTestHelper.testDeviceMacAddress))
            .listen((batteryStatus) {
          print(
              "Battery status received: ${batteryStatus.percentage}% for device ${BluetoothTestHelper.testDeviceMacAddress}. Is charging: ${batteryStatus.isCharging}");
          if (!deferredBatteryStatus.isCompleted) {
            deferredBatteryStatus.complete(batteryStatus);
          }
        });

        BatteryLevelStatus? receivedBatteryStatus;
        try {
          receivedBatteryStatus = await deferredBatteryStatus.future
              .timeout(const Duration(seconds: 20));
        } catch (e) {
          // Handle timeout if necessary
        }

        expect(receivedBatteryStatus, isNotNull,
            reason: "Expected battery status data was not received.");

        // Clean up the subscription
        await batteryStatusSubscription.cancel();
      } else {
        fail(
            "Failed to connect to device with MAC address ${BluetoothTestHelper.testDeviceMacAddress}.");
      }
    });

    testWidgets('Test Connection Pool Set', (WidgetTester tester) async {
      final foundDevice = await bluetoothTest
          .discoverDevice(BluetoothTestHelper.testDeviceMacAddress);
      expect(foundDevice, isNotNull,
          reason:
              "Expected device with MAC address ${BluetoothTestHelper.testDeviceMacAddress} was not found.");

      bool isDeviceConnected = await bluetoothTest.toggleDeviceConnectionState(
        BluetoothTestHelper.testDeviceMacAddress,
        BleDeviceConnectionState.connected,
        timeout: const Duration(seconds: 20),
      );

      if (isDeviceConnected) {
        // Reset scanner settings before running commands
        await OptiConnect.scannerSettings
            .resetSettings(BluetoothTestHelper.testDeviceMacAddress);

        // Set connection pool ID
        const connectionPoolIdTarget = "4567";
        final CommandResponse response =
            await OptiConnect.scannerSettings.connectionPool.setId(
          deviceId: BluetoothTestHelper.testDeviceMacAddress,
          poolId: connectionPoolIdTarget,
        );
        expect(response.succeeded, isTrue,
            reason:
                "Failed to set connection pool ID to $connectionPoolIdTarget.");

        print('Connection pool ID set to $connectionPoolIdTarget');

        // Disconnect the device
        bool isDeviceDisconnected =
            await bluetoothTest.toggleDeviceConnectionState(
          BluetoothTestHelper.testDeviceMacAddress,
          BleDeviceConnectionState.disconnected,
          timeout: const Duration(seconds: 20),
        );

        print('Device disconnected');

        if (isDeviceDisconnected) {
          print('Discovering and reconnecting to the device');

          // Discover the device again
          final rediscoveredDevice = await bluetoothTest
              .discoverDevice(BluetoothTestHelper.testDeviceMacAddress);
          expect(rediscoveredDevice, isNotNull,
              reason:
                  "Expected device with MAC address ${BluetoothTestHelper.testDeviceMacAddress} was not found after disconnection.");

          // Log the found device with its connection pool ID
          print(
              "Found device with MAC address ${BluetoothTestHelper.testDeviceMacAddress} and connection pool ${rediscoveredDevice?.connectionPoolId}.");

          // Reconnect to the device
          bool isReconnected = await bluetoothTest.toggleDeviceConnectionState(
            BluetoothTestHelper.testDeviceMacAddress,
            BleDeviceConnectionState.connected,
            timeout: const Duration(seconds: 20),
          );

          if (isReconnected) {
            // Verify that the connection pool ID is correctly set
            final connectionPoolId = OptiConnect.scannerSettings.connectionPool
                .getId(BluetoothTestHelper.testDeviceMacAddress);
            expect(connectionPoolId, connectionPoolIdTarget,
                reason:
                    "Connection pool ID does not match the expected value after reconnection.");
          } else {
            fail(
                "Failed to reconnect to device with MAC address ${BluetoothTestHelper.testDeviceMacAddress}.");
          }
        } else {
          fail(
              "Failed to disconnect the device with MAC address ${BluetoothTestHelper.testDeviceMacAddress}.");
        }
      } else {
        fail(
            "Failed to connect to device with MAC address ${BluetoothTestHelper.testDeviceMacAddress}.");
      }
    });
  });
}
