var Switcher = { 
    switchAd: function (success, fail, resultType) { 
      return cordova.exec(success, fail, 'AdSwitcher', resultType, []);
    } 
    
};

