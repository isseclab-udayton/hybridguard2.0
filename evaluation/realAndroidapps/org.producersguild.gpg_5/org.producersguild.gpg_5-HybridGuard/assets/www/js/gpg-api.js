$.jsonRPC.setup({
    endPoint: 'http://www.greenproductionguide.com/api/',
    namespace:'gpg'
});

var DEBUG = 1;


function GPGAPI() {
    this.error_method = null;

    var execute = function(method, params, callback) {
        $.jsonRPC.request(method, {
          params: params,
          success: function(result) {
            // Do something with the result here
            // It comes back as an RPC 2.0 compatible response object
            //  if (DEBUG == 1)
                console.log(result);

              if (callback != undefined)
                callback(result);
          },
          error: function(result) {
            // Result is an RPC 2.0 compatible response object
              onError(result);
          }
        });

    };

    this.testMethod = function() {
        execute('sayHello', {name: 'Rafal'}, function(result) {$("#result").html(result)});
    };

    this.searchVendors = function(lat, lng, keyword, categories, departments, callback) {
        execute('searchVendors', {lat: lat, lng: lng, keyword: keyword, categories: categories, departments: departments}, callback);
    };

    this.getDepartments = function(callback) {
        execute('getDepartments',{}, function(result) {
            callback(result);
        });
    };

    this.getCategories = function(callback) {
        execute('getCategories',{}, function(result) {
            callback(result);
        });
    };

    this.getArticles = function(callback) {
        execute('getArticles',{}, callback);
    };

    this.connect = function(authToken, callback) {
        execute('connect', {authToken: authToken}, callback);
    };

    this.authenticate = function(username, password, callback) {
        execute('authenticate', {username: username, password: password}, callback);
    };

    this.registerUser = function(username, first_name, last_name, email, password, confirmpassword, callback) {
        execute('register_user', {username: username, firstname: first_name, lastname:last_name, email: email, password: password, confirmpassword: confirmpassword}, callback);
    };

    this.getUser = function(token, callback ) {
        execute('get_user', {hash: token}, callback);
    };

    this.saveUser = function(token, first_name, last_name, email, callback) {
        execute('save_user', {hash: token, first_name: first_name, last_name: last_name, email: email}, callback);
    }

    this.synchronizeFavorites = function(uid, favorites, callback) {
        execute('synchronize_favorites',{hash: uid, favs: favorites}, callback);
    };

    this.suggestVendor = function(token, company_name, contact_first_name, contact_last_name, contact_email, message, callback) {
        execute('suggest_vendor', {
            hash: token,
            company_name: company_name,
            contact_first_name: contact_first_name,
            contact_last_name: contact_last_name,
            contact_email: contact_email,
            message: message}, callback);
    };

    this.suggestVendorWithoutAccount = function(first_name, last_name, email, company_name, contact_first_name, contact_last_name, contact_email, message, callback) {
        execute('suggest_vendor_without_account', {
            user_name: first_name,
            user_lastname: last_name,
            user_email: email,
            company_name: company_name,
            contact_first_name: contact_first_name,
            contact_last_name: contact_last_name,
            contact_email: contact_email,
            message: message}, callback);
    }

}
