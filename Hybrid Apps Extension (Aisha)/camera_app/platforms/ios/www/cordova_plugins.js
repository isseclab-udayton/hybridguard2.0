cordova.define('cordova/plugin_list', function(require, exports, module) {
module.exports = [
    {
        "id": "cordova-plugin-geolocation.Coordinates",
        "file": "plugins/cordova-plugin-geolocation/www/Coordinates.js",
        "pluginId": "cordova-plugin-geolocation",
        "clobbers": [
            "Coordinates"
        ]
    },
    {
        "id": "cordova-plugin-geolocation.PositionError",
        "file": "plugins/cordova-plugin-geolocation/www/PositionError.js",
        "pluginId": "cordova-plugin-geolocation",
        "clobbers": [
            "PositionError"
        ]
    },
    {
        "id": "cordova-plugin-geolocation.Position",
        "file": "plugins/cordova-plugin-geolocation/www/Position.js",
        "pluginId": "cordova-plugin-geolocation",
        "clobbers": [
            "Position"
        ]
    },
    {
        "id": "cordova-plugin-geolocation.geolocation",
        "file": "plugins/cordova-plugin-geolocation/www/geolocation.js",
        "pluginId": "cordova-plugin-geolocation",
        "clobbers": [
            "navigator.geolocation"
        ]
    },
    {
        "id": "cordova-plugin-device-orientation.CompassError",
        "file": "plugins/cordova-plugin-device-orientation/www/CompassError.js",
        "pluginId": "cordova-plugin-device-orientation",
        "clobbers": [
            "CompassError"
        ]
    },
    {
        "id": "cordova-plugin-device-orientation.CompassHeading",
        "file": "plugins/cordova-plugin-device-orientation/www/CompassHeading.js",
        "pluginId": "cordova-plugin-device-orientation",
        "clobbers": [
            "CompassHeading"
        ]
    },
    {
        "id": "cordova-plugin-device-orientation.compass",
        "file": "plugins/cordova-plugin-device-orientation/www/compass.js",
        "pluginId": "cordova-plugin-device-orientation",
        "clobbers": [
            "navigator.compass"
        ]
    },
    {
        "id": "cordova-plugin-battery-status.battery",
        "file": "plugins/cordova-plugin-battery-status/www/battery.js",
        "pluginId": "cordova-plugin-battery-status",
        "clobbers": [
            "navigator.battery"
        ]
    },
    {
        "id": "cordova-plugin-camera.Camera",
        "file": "plugins/cordova-plugin-camera/www/CameraConstants.js",
        "pluginId": "cordova-plugin-camera",
        "clobbers": [
            "Camera"
        ]
    },
    {
        "id": "cordova-plugin-camera.CameraPopoverOptions",
        "file": "plugins/cordova-plugin-camera/www/CameraPopoverOptions.js",
        "pluginId": "cordova-plugin-camera",
        "clobbers": [
            "CameraPopoverOptions"
        ]
    },
    {
        "id": "cordova-plugin-camera.camera",
        "file": "plugins/cordova-plugin-camera/www/Camera.js",
        "pluginId": "cordova-plugin-camera",
        "clobbers": [
            "navigator.camera"
        ]
    },
    {
        "id": "cordova-plugin-camera.CameraPopoverHandle",
        "file": "plugins/cordova-plugin-camera/www/ios/CameraPopoverHandle.js",
        "pluginId": "cordova-plugin-camera",
        "clobbers": [
            "CameraPopoverHandle"
        ]
    },
    {
        "id": "cordova-plugin-dialogs.notification",
        "file": "plugins/cordova-plugin-dialogs/www/notification.js",
        "pluginId": "cordova-plugin-dialogs",
        "merges": [
            "navigator.notification"
        ]
    },
    {
        "id": "cordova-plugin-device-motion.Acceleration",
        "file": "plugins/cordova-plugin-device-motion/www/Acceleration.js",
        "pluginId": "cordova-plugin-device-motion",
        "clobbers": [
            "Acceleration"
        ]
    },
    {
        "id": "cordova-plugin-device-motion.accelerometer",
        "file": "plugins/cordova-plugin-device-motion/www/accelerometer.js",
        "pluginId": "cordova-plugin-device-motion",
        "clobbers": [
            "navigator.accelerometer"
        ]
    },
    {
        "id": "cordova-plugin-network-information.network",
        "file": "plugins/cordova-plugin-network-information/www/network.js",
        "pluginId": "cordova-plugin-network-information",
        "clobbers": [
            "navigator.connection",
            "navigator.network.connection"
        ]
    },
    {
        "id": "cordova-plugin-network-information.Connection",
        "file": "plugins/cordova-plugin-network-information/www/Connection.js",
        "pluginId": "cordova-plugin-network-information",
        "clobbers": [
            "Connection"
        ]
    },
    {
        "id": "cordova-plugin-globalization.GlobalizationError",
        "file": "plugins/cordova-plugin-globalization/www/GlobalizationError.js",
        "pluginId": "cordova-plugin-globalization",
        "clobbers": [
            "window.GlobalizationError"
        ]
    },
    {
        "id": "cordova-plugin-globalization.globalization",
        "file": "plugins/cordova-plugin-globalization/www/globalization.js",
        "pluginId": "cordova-plugin-globalization",
        "clobbers": [
            "navigator.globalization"
        ]
    },
    {
        "id": "cordova-plugin-contacts.contacts",
        "file": "plugins/cordova-plugin-contacts/www/contacts.js",
        "pluginId": "cordova-plugin-contacts",
        "clobbers": [
            "navigator.contacts"
        ]
    },
    {
        "id": "cordova-plugin-contacts.Contact",
        "file": "plugins/cordova-plugin-contacts/www/Contact.js",
        "pluginId": "cordova-plugin-contacts",
        "clobbers": [
            "Contact"
        ]
    },
    {
        "id": "cordova-plugin-contacts.convertUtils",
        "file": "plugins/cordova-plugin-contacts/www/convertUtils.js",
        "pluginId": "cordova-plugin-contacts"
    },
    {
        "id": "cordova-plugin-contacts.ContactAddress",
        "file": "plugins/cordova-plugin-contacts/www/ContactAddress.js",
        "pluginId": "cordova-plugin-contacts",
        "clobbers": [
            "ContactAddress"
        ]
    },
    {
        "id": "cordova-plugin-contacts.ContactError",
        "file": "plugins/cordova-plugin-contacts/www/ContactError.js",
        "pluginId": "cordova-plugin-contacts",
        "clobbers": [
            "ContactError"
        ]
    },
    {
        "id": "cordova-plugin-contacts.ContactField",
        "file": "plugins/cordova-plugin-contacts/www/ContactField.js",
        "pluginId": "cordova-plugin-contacts",
        "clobbers": [
            "ContactField"
        ]
    },
    {
        "id": "cordova-plugin-contacts.ContactFindOptions",
        "file": "plugins/cordova-plugin-contacts/www/ContactFindOptions.js",
        "pluginId": "cordova-plugin-contacts",
        "clobbers": [
            "ContactFindOptions"
        ]
    },
    {
        "id": "cordova-plugin-contacts.ContactName",
        "file": "plugins/cordova-plugin-contacts/www/ContactName.js",
        "pluginId": "cordova-plugin-contacts",
        "clobbers": [
            "ContactName"
        ]
    },
    {
        "id": "cordova-plugin-contacts.ContactOrganization",
        "file": "plugins/cordova-plugin-contacts/www/ContactOrganization.js",
        "pluginId": "cordova-plugin-contacts",
        "clobbers": [
            "ContactOrganization"
        ]
    },
    {
        "id": "cordova-plugin-contacts.ContactFieldType",
        "file": "plugins/cordova-plugin-contacts/www/ContactFieldType.js",
        "pluginId": "cordova-plugin-contacts",
        "merges": [
            ""
        ]
    },
    {
        "id": "cordova-plugin-contacts.contacts-ios",
        "file": "plugins/cordova-plugin-contacts/www/ios/contacts.js",
        "pluginId": "cordova-plugin-contacts",
        "merges": [
            "navigator.contacts"
        ]
    },
    {
        "id": "cordova-plugin-contacts.Contact-iOS",
        "file": "plugins/cordova-plugin-contacts/www/ios/Contact.js",
        "pluginId": "cordova-plugin-contacts",
        "merges": [
            "Contact"
        ]
    },
    {
        "id": "cordova-plugin-inappbrowser.inappbrowser",
        "file": "plugins/cordova-plugin-inappbrowser/www/inappbrowser.js",
        "pluginId": "cordova-plugin-inappbrowser",
        "clobbers": [
            "cordova.InAppBrowser.open",
            "window.open"
        ]
    },
    {
        "id": "cordova-native-camera.NativeCamera",
        "file": "plugins/cordova-native-camera/www/index-ios.js",
        "pluginId": "cordova-native-camera",
        "clobbers": [
            "cordova.plugins.NativeCamera"
        ]
    },
    {
        "id": "cordova-plugin-device.device",
        "file": "plugins/cordova-plugin-device/www/device.js",
        "pluginId": "cordova-plugin-device",
        "clobbers": [
            "device"
        ]
    },
    {
        "id": "com.manateeworks.barcodescanner.Scanner",
        "file": "plugins/com.manateeworks.barcodescanner/www/MWBScanner.js",
        "pluginId": "com.manateeworks.barcodescanner",
        "clobbers": [
            "scanner"
        ]
    },
    {
        "id": "cordova-plugin-barcodescanner.BarcodeScanner",
        "file": "plugins/cordova-plugin-barcodescanner/www/barcodescanner.js",
        "pluginId": "cordova-plugin-barcodescanner",
        "clobbers": [
            "cordova.plugins.barcodeScanner"
        ]
    }
];
module.exports.metadata = 
// TOP OF METADATA
{
    "cordova-plugin-whitelist": "1.3.2",
    "cordova-plugin-compat": "1.1.0",
    "cordova-plugin-geolocation": "2.4.3",
    "cordova-plugin-device-orientation": "1.0.7",
    "cordova-plugin-battery-status": "1.2.4",
    "cordova-plugin-camera": "2.4.1",
    "cordova-plugin-dialogs": "1.3.3",
    "cordova-plugin-device-motion": "1.2.5",
    "cordova-plugin-network-information": "1.3.3",
    "cordova-plugin-globalization": "1.0.7",
    "cordova-plugin-contacts": "2.3.1",
    "cordova-plugin-inappbrowser": "1.7.1",
    "cordova-native-camera": "1.0.0",
    "cordova-plugin-device": "1.1.6",
    "com.manateeworks.barcodescanner": "1.8.1",
    "cordova-plugin-barcodescanner": "0.7.0"
};
// BOTTOM OF METADATA
});