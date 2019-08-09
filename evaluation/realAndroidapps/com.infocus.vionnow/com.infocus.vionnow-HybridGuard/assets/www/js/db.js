<!-- ------------------------------ STORAGE ----------------------------- -->
function populateDB(tx) {
    tx.executeSql('CREATE TABLE IF NOT EXISTS movie_storage (id unique, cover, title, comment, place, voting, storage_reason, modified, deleted)');
    tx.executeSql('CREATE TABLE IF NOT EXISTS storage_reason (id unique, css_class, name)');
    tx.executeSql("REPLACE INTO storage_reason (id, css_class, name) VALUES (0, '', 'Alle')");
    tx.executeSql("REPLACE INTO storage_reason (id, css_class, name) VALUES (1, 's', 'habe ich in meiner Sammlung')");
    tx.executeSql("REPLACE INTO storage_reason (id, css_class, name) VALUES (2, 'g', 'habe ich bereits gesehen')");
    tx.executeSql("REPLACE INTO storage_reason (id, css_class, name) VALUES (3, 'k', 'habe ich im Kino gesehen')");
    tx.executeSql("REPLACE INTO storage_reason (id, css_class, name) VALUES (4, 'w', 'möchte ich noch sehen')");
    tx.executeSql("REPLACE INTO storage_reason (id, css_class, name) VALUES (5, 'v', 'habe ich verliehen')");
    tx.executeSql('CREATE TABLE IF NOT EXISTS vionnow_genre (id unique, genre)');
    tx.executeSql("	REPLACE INTO `vionnow_genre` (`id`, `genre`) VALUES (1, 'Komödie');	");
    tx.executeSql("	REPLACE INTO `vionnow_genre` (`id`, `genre`) VALUES (2, 'Action');	");
    tx.executeSql("	REPLACE INTO `vionnow_genre` (`id`, `genre`) VALUES (3, 'Thriller');	");
    tx.executeSql("	REPLACE INTO `vionnow_genre` (`id`, `genre`) VALUES (5, 'Drama');	");
    tx.executeSql("	REPLACE INTO `vionnow_genre` (`id`, `genre`) VALUES (6, 'Horror');	");
    tx.executeSql("	REPLACE INTO `vionnow_genre` (`id`, `genre`) VALUES (7, 'Science Fiction');	");
    tx.executeSql("	REPLACE INTO `vionnow_genre` (`id`, `genre`) VALUES (9, 'Kinderfilm');	");
    tx.executeSql("	REPLACE INTO `vionnow_genre` (`id`, `genre`) VALUES (11, 'Animation');	");
    tx.executeSql("	REPLACE INTO `vionnow_genre` (`id`, `genre`) VALUES (12, 'Doku');	");
    tx.executeSql("	REPLACE INTO `vionnow_genre` (`id`, `genre`) VALUES (17, 'Fantasy');	");
    tx.executeSql('CREATE TABLE IF NOT EXISTS vn_settings (s_key unique, s_value)');
}

function errorCB(err) {
   
   if(err.code==1){
	   //alert("Dieser Titel ist bereits hinzugefügt")
	   openPopupInfo('Information', 'Dieser Titel ist bereits hinzugefügt');
   }
   else{
	   alert("Error processing SQL: "+err.code);
   }
}
function errorCB_none(err) {
   //alert("Error processing SQL in ?: "+err.code);
}
function successCB() {
   //alert("success!");
}

