import { Component } from '@angular/core';
import { Geolocation } from 'ionic-native';
import { Camera } from 'ionic-native';
import { Contact, Contacts } from 'ionic-native';
import { Network } from 'ionic-native';
import { ImagePicker } from 'ionic-native';
import { TouchID } from 'ionic-native';
import { SMS } from 'ionic-native';
import { Sim } from 'ionic-native';
import { MediaCapture, CaptureImageOptions, MediaFile, CaptureError } from 'ionic-native';
import { Vibration } from 'ionic-native';

import { NavController } from 'ionic-angular';

@Component({
  selector: 'page-home',
  templateUrl: 'home.html'
})
export class HomePage {

  getLocation() {
    Geolocation.getCurrentPosition().then(pos => {
      alert('lat: ' + pos.coords.latitude + ', lon: ' + pos.coords.longitude);
    });
  }

  takePicture() {
    Camera.getPicture().then((imageData) => {
      // imageData is either a base64 encoded string or a file URI
      // If it's base64:
      let base64Image = 'data:image/jpeg;base64,' + imageData;
    }, (err) => {
      alert(err);
    });
  }

  chooseContact() {
    Contacts.pickContact().then(contact => {
      alert('You selected: ' + contact.name);
    });
  }

  fetchNetwork() {
    alert('Network: ' + Network.connection);
  }

  pickImages() {
    ImagePicker.getPictures({}).then((results) => {
      for (var i = 0; i < results.length; i++) {
        console.log('Image URI: ' + results[i]);
      }
    }, (err) => { });
  }

  checkTouchID() {
      TouchID.verifyFingerprint('Scan your fingerprint please')
        .then(
          res => alert(res),
          err => alert(err)
        );
  }

  sendText() {
      SMS.send('12345678910', 'Hello world!');
  }

  getSimInfo() {
      Sim.getSimInfo().then(
          (info) => alert('Sim info: ' + info.carrierName),
          (err) => alert('Unable to get sim info: ' + err)
        );
  }

  captureMedia() {
      let options: CaptureImageOptions = { limit: 3 };
        MediaCapture.captureImage(options)
          .then(
            (data: MediaFile[]) => alert(data),
            (err: CaptureError) => alert(err)
          );
  }

  testVibration() {
      Vibration.vibrate(1000);
  }

  constructor(public navCtrl: NavController) {

  }

}
