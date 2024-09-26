#!/bin/bash

grep -rl "navigator.geolocation.*" . > geolocation.txt
grep -rl "navigator.camera.*" . > camera.txt
grep -rl "navigator.notification.*" . > notification.txt
grep -rl "cordova.file.*" . > file.txt
grep -rl "media.*" . > media.txt
grep -rl "navigator.connection.*" . > network.txt
grep -rl "cordova.plugins.barcodescanner.*" . > barcode.txt
grep -rl "sms.*" . > sms.txt
