var dao;




function GpgDAO() {
    var db;
    var db_favorites = 'favorites';
    var db_saved_searches = 'saved_searches';
    var db_user = 'user_data';
    var database_name = 'org.producersguild.gpg';
    var database_version = '1.0';
    var database_display_name = 'GreenProductionGuide app database';
    var database_size = 1000000;



    this.getDB = function() {
        return db;
    };

    this.onTransactionError = function(err) {
        console.log('DATABASE TRANSACTION ERROR ');
        console.log(err);
    };

    this.onSuccess = function(s) {
        console.log("TRANSACTION SUCCEEDED");
    };


    this.dropDatabase = function() {
        db.transaction(function(tx) {
            tx.executeSql('DROP TABLE ' + db_favorites);
            tx.executeSql('DROP TABLE ' + db_saved_searches);
            tx.executeSql('DROP TABLE ' + db_user);
        }, this.onTransactionError, this.onSuccess);
    };


    this.openDatabase = function() {
        // remember to drop database when changing schema!!!
        db = window.openDatabase(database_name, database_version,database_display_name, database_size);
        db.transaction(function(tx) {
            tx.executeSql('CREATE TABLE IF NOT EXISTS '+db_favorites+' (id INTEGER PRIMARY KEY AUTOINCREMENT, "phone_number","city","is_webbased", "description", "zip", "company_title",web_page,email,contact_person,country,is_nationwide,departments,slug,state,address,categories)');
            tx.executeSql('CREATE TABLE IF NOT EXISTS '+ db_saved_searches + '(id INTEGER PRIMARY KEY AUTOINCREMENT, "name", "keyword", "categories","departments", "creation_date")');
            tx.executeSql('CREATE TABLE IF NOT EXISTS ' + db_user + ' (id INTEGER PRIMARY KEY AUTOINCREMENT, "first_name", "last_name", "email", "token", "login_type")');
        }, this.onTransactionError, this.onSuccess);
    };

    this.getUser = function(callback) {
        db.transaction(function(tx) {
            tx.executeSql("SELECT * FROM "+db_user+" WHERE id = 1",[], function(tx, results) {
                if (results.rows.length == 1) {
                    callback(results.rows.item(0));
                } else {
                    callback(undefined);
                }
            }, this.onTransactionError);
        },  this.onTransactionError, this.onSuccess);
    };

    this.saveUser = function(first_name, last_name, email, token, login_type, callback) {
        this.getUser(function(resp) {
            var sql ='';
            if (resp) {
                sql = 'UPDATE '+ db_user+' set first_name = ?, last_name = ?, email=?, token=?, login_type=? WHERE id = 1';
            } else {
                sql = 'INSERT INTO ' + db_user + " (id, first_name, last_name, email, token, login_type) VALUES (1, ?, ?, ?, ?, ?)";
            }

            db.transaction(function(tx) {
                console.log(sql);
                tx.executeSql(sql, [first_name, last_name, email, token, login_type], this.onTransactionError);
                callback();
            });
        }, this.onTransactionError, this.onSuccess);
    };

    this.addFavorite = function(fav) {
        db.transaction(function(tx) {
            var sql = 'INSERT INTO ' + db_favorites + '(';
            for (var i=0; i < Object.keys(fav).length; i++) {
                var key = Object.keys(fav)[i];

                sql += key;
                if (i != Object.keys(fav).length -1) {
                    sql += ',';
                }
            }

            sql += ') VALUES (';
            for (var i=0; i < Object.keys(fav).length; i++) {
                var key = Object.keys(fav)[i];
                value = fav[key];

                if (value instanceof Array) {
                    value = value.join(';');
                }
                var value = escape(value);
                sql += '"' + value + '"';
                if (i != Object.keys(fav).length -1) {
                    sql += ',';
                }
            }

            sql += ')';

            console.log(sql);

            tx.executeSql(sql);
        }, this.onTransactionError, this.onSuccess);
    };

    this.removeFavorite = function(fav_id) {
        db.transaction(function(tx) {
            tx.executeSql('DELETE FROM ' + db_favorites + ' WHERE id = "' + fav_id + '"');
        }, this.onTransactionError , this.onSuccess);
    };

    this.listFavorites = function(callback) {
        db.transaction(function(tx) {
            tx.executeSql('SELECT * FROM ' + db_favorites, [], function(tx, results) {
                callback(results.rows);
//                var len = results.rows.length;
//                for(var i = 0; i < len; i++) {
//                    console.log(results.rows.item(i));
//                }

            }, this.onTransactionError);
        }, this.onTransactionError, this.onSuccess);
    };

    this.getFavoriteById = function(id, callback) {
        db.transaction(function(tx) {
            tx.executeSql('SELECT * FROM ' + db_favorites + " WHERE id = ?", [id], function(tx, results) {
                callback(results.rows);
            }, this.onTransactionError);
        }, this.onTransactionError, this.onSuccess);
    }

    this.isFavorite = function(fav_id, onTrue, onFalse) {
        db.transaction(function(tx) {
            tx.executeSql('SELECT * FROM ' + db_favorites + ' WHERE id = "' + fav_id + '"', [], function(tx, results) {
                if (results.rows.length == 1)
                    onTrue();
                else
                    onFalse();
            });
        }, this.onTransactionError, this.onSuccess);
    };


    this.addSavedSearch = function(name, keyword, categories, departments) {
        //keeps up to 20 previous searches, if another one is added, it removes old ones
        removeOldSearches();

        db.transaction(function(tx) {
            tx.executeSql('INSERT INTO ' + db_saved_searches + ' ("name", "keyword", "categories","departments", "creation_date") VALUES (?, ?, ?, ?, ?) ', [name, keyword, categories, departments, new Date().getTime()], function(tx, results) {

            });
        }, this.onTransactionError, this.onSuccess);
    };

    var removeOldSearches = function() {
        db.transaction(function(tx) {
            tx.executeSql('SELECT * FROM ' + db_saved_searches + " order by creation_date DESC", [], function(tx, results) {
                
                if (results.rows.length > 19 ) {
                    var id = results.rows.item(results.rows.length-1).id;
                    console.log('removing saved search with id ' + id);
                    tx.executeSql("DELETE FROM " +db_saved_searches +" WHERE id = ?", [id]);
                }

            }, this.onTransactionError);
        }, this.onTransactionError, this.onSuccess);
    };

    this.getSavedSearches = function(callback) {
        db.transaction(function(tx) {
            tx.executeSql('SELECT * FROM ' + db_saved_searches + " order by creation_date DESC", [], function(tx, results) {
                var savedSearches = new Array();
                for(var i=0; i < results.rows.length; i ++) {
                    var row = results.rows.item(i);
                    var ss = new SavedSearch(row.id, row.name, row.keyword, row.categories, row.departments);

                    savedSearches.push(ss);
                }
                callback(savedSearches);
            });
        }, this.onTransactionError, this.onSuccess);
    };

    this.getSavedSearchById = function(id, callback) {
        db.transaction(function(tx) {
            tx.executeSql('SELECT * FROM ' + db_saved_searches + " where id = ?", [id], function(tx, results) {
                var row = results.rows.item(0);
                var ss = new SavedSearch(row.id, row.name, row.keyword, row.categories, row.departments);

                callback(ss);
            });
        }, this.onTransactionError, this.onSuccess);
    }
}
//
//
////special implementation for windows phone 7
//function WP7CidDAO() {
//    var key_name = database_name+'_'+db_favorites;
//
//
//    this.onTransactionError = function(err) {
//        console.log('DATABASE TRANSACTION ERROR ');
//        console.log(err);
//    };
//
//    this.onSuccess = function(s) {
//        console.log("TRANSACTION SUCCEEDED");
//    };
//
//    this.dropDatabase = function() {
//        localStorage.removeItem(key_name);
//    };
//
//    this.openDatabase = function() {
//        console.log('localstorage name: ' + key_name);
//
//        if (localStorage == undefined) {
//            console.log('localstorage not defined!');
//        } else {
//            var favs = JSON.parse(localStorage.getItem(key_name));
//            if (favs == null) {
//                favs = new Array();
//
//                localStorage.setItem(key_name, JSON.stringify(favs));
//            }
//        }
//    };
//
//    this.addFavorite = function(fav_id, type, location) {
//        var favs = JSON.parse(localStorage.getItem(key_name));
//
//        favs.push({identifier: fav_id, type: type, location: location});
//        localStorage.setItem(key_name, JSON.stringify(favs));
//
//    };
//
//    this.removeFavorite = function(fav_id) {
//        var favs = JSON.parse(localStorage.getItem(key_name));
//
//        var tmp = new Array();
//        for(i=0; i < favs.length; i++) {
//            var item = favs[i];
//            if (item.identifier != fav_id) {
//                tmp.push(favs[i]);
//            }
//        }
//
//        localStorage.setItem(key_name, JSON.stringify(tmp));
//    };
//
//    this.listFavorites = function(callback) {
//        return JSON.parse(localStorage.getItem(key_name));
//    };
//
//    this.isFavorite = function(fav_id, onTrue, onFalse) {
//        var favs = JSON.parse(localStorage.getItem(key_name));
//
//        for(i=0; i < favs.length; i++) {
//            var item = favs[i];
//            if (item.identifier == fav_id) {
//                onTrue();
//                return;
//            }
//        }
//
//        onFalse();
//    };
//
//    this.debugList = function listAllItems(){
//        for (i=0; i<localStorage.length; i++)
//        {
//            key = localStorage.key(i);
//            val = localStorage.getItem(key);
//            console.log('>  ' + key + ' ' + val);
//        }
//    }
//
//}



GpgDAO.getDao = function() {
    if (dao == undefined) {
        dao = new GpgDAO();
        dao.openDatabase();
    }
    return dao;
};