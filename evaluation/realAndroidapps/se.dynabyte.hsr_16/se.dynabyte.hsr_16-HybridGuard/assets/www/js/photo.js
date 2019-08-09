var pictureSource;
var destinationType;

document.addEventListener("deviceready", onDeviceReadyInitPhoto, false);

function onDeviceReadyInitPhoto() {
    pictureSource = navigator.camera.PictureSourceType;
    destinationType = navigator.camera.DestinationType;
}

function capturePhoto() {
    navigator.camera.getPicture(onPhotoDataSuccess, onFail, {
        quality: 50,
        destinationType: destinationType.DATA_URL,
        encodingType: Camera.EncodingType.JPEG,
        allowEdit: false,
        targetWidth: 1280,
        targetHeight: 1280,
        correctOrientation: true,
        saveToPhotoAlbum: false
    });
}

function getPhoto() {
    navigator.camera.getPicture(onPhotoDataSuccess, onFail, {
        quality: 50,
        destinationType: destinationType.DATA_URL,
        sourceType: pictureSource.PHOTOLIBRARY,
        allowEdit: false,
        encodingType: Camera.EncodingType.JPEG,
        targetWidth: 1280,
        targetHeight: 1280,
        correctOrientation: true,
        saveToPhotoAlbum: false
    });
}

function onPhotoDataSuccess(imageData) {
    $("#imageEncode").val("data:image/jpeg;base64," + imageData);
    $("#image").attr("src", "data:image/jpeg;base64," + imageData);
    $("#image").fadeIn();
}

function onFail(message) {
    console.log('Photo Fail: ' + message)
}