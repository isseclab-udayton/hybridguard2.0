

var defaultLang = "hu";
function initLang(success) {
    logDisplay("initLang");
    Localization.initialize
    (
    // Dictionnary
    {
        "hu": {
            FIRSTAID_RES_REST_USER: "elsosegely",
            FIRSTAID_RES_REST_PWD: "FirstAid",
            FIRSTAID_RES_REST_URL: "http://elsosegely.webbeteg.hu",
            FIRSTAID_RES_GAKEY_PROD:"UA-48636962-9",
            FIRSTAID_RES_GAKEY_DEV:"UA-48636962-6",
            FIRSTAID_RES_0001: "Hiba!", //15
            FIRSTAID_RES_0002: "OK", //10
            FIRSTAID_RES_0003: "Vissza",
            FIRSTAID_RES_0004: "Ha tudja, mi történt, válasszon az alábbi menüből!",
            FIRSTAID_RES_0005: "Helyzetek",
            FIRSTAID_RES_0006: "Nem tudom, mi okozza",
            FIRSTAID_RES_0007: "Diagnosztika",
            FIRSTAID_RES_0008: "Figyelem! Bármilyen hirtelen fellépő komoly panasz, rosszullét esetén forduljon orvoshoz vagy hívjon mentőt! Az alkalmazásban feltüntetett információk nem teljes körűek.",
            FIRSTAID_RES_0009: "Újraélesztés",
            FIRSTAID_RES_0010: "Segélyhívó",
            FIRSTAID_RES_0011: "Mentő hívásakor ezekre a kérdésekre válaszoljon!",
            FIRSTAID_RES_0012: "104 hívása",
            FIRSTAID_RES_0013: "Továbbiak",
            FIRSTAID_RES_0014: "Defibrillátor és kórház kereső",
            FIRSTAID_RES_0015: "Celerus teszt",
            FIRSTAID_RES_0016: "Elsősegély videók",
            FIRSTAID_RES_0017: "Általános tennivalók",
            FIRSTAID_RES_0018: "Írjon nekünk",
            FIRSTAID_RES_0019: "Alkalmazás értékelése",
            FIRSTAID_RES_0020: "Alkalmazás megosztása",
            FIRSTAID_RES_0021: "Súgó",
            FIRSTAID_RES_0022: "Teszt",
            FIRSTAID_RES_0023: "Tovább",
            FIRSTAID_RES_0024: "Köszönjük, hogy kitöltötte tesztünket!",
            FIRSTAID_RES_0025: "Ön",
            FIRSTAID_RES_0026: "%-ot ért el!",
            FIRSTAID_RES_0027: "Elsősegély, sürgősségi betegellátás és munkavédelem",
            FIRSTAID_RES_0028: "Kérjük, jelölje be az egyik válaszlehetőséget!",
            FIRSTAID_RES_0029: "Információ",
            FIRSTAID_RES_0030: "back_button.png",
            FIRSTAID_RES_0031: "Vissza",
            FIRSTAID_RES_0032: "Sikertelen helymeghatározás!",
            FIRSTAID_RES_0033: "Keresők",
            FIRSTAID_RES_0034: "Keresés indítása",
            FIRSTAID_RES_0035: "A defibrillátor-kereső közösségi alkalmazásként működik. A H2Online Kft. nem vállal felelősséget, ha adott pillanatban nem áll rendelkezésre működő készülék.",
            FIRSTAID_RES_0036: "Kórház<span class=\"kek\">kereső</span>",
            FIRSTAID_RES_0037: "Az Önhöz <span class=\"kek\">legközelebbi kórház</span> keresése",
            FIRSTAID_RES_0038: "Defibrillátor<span class=\"kek\">kereső</span>",
            FIRSTAID_RES_0039: "Az Önhöz <span class=\"kek\">legközelebbi defibrillátor</span> keresése",
            FIRSTAID_RES_0040: "Fotó az épületről",
            FIRSTAID_RES_0041: "Mutasd a térképen",
            FIRSTAID_RES_0042: "Küldés",
            FIRSTAID_RES_0043: "Igen",
            FIRSTAID_RES_0044: "Nem",
            FIRSTAID_RES_0045: "Hasznosnak találta az alkalmazást?",
            FIRSTAID_RES_0046: "Milyen helyzetben használta az Elsősegély alkalmazást?",
            FIRSTAID_RES_0047: "Mit javasolna nekünk?",
            FIRSTAID_RES_0048: "Az Ön e-mail címe:",
            FIRSTAID_RES_0049: "Hibás a megadott e-mail cím!",
            FIRSTAID_RES_0050: "Üzenetét továbbítottuk!",
            FIRSTAID_RES_0051: "Köszönjük!",
            FIRSTAID_RES_0052: "Próbáld ki te is ezt az Elsősegély alkalmazást, szerintem nagyon hasznos! http://elsosegely.webbeteg.hu",
            FIRSTAID_RES_0053: "Elsősegély alkalmazás",
            FIRSTAID_RES_0054: "Életmentés első kézből, akár az Ön kezéből!",
            FIRSTAID_RES_0055: "Az Elsősegély alkalmazás egyszerre jelent könnyen felhasználható elsősegélynyújtási tananyagot, továbbá vészhelyzet esetén is egyszerűen, gyorsan elérhető információs bázist a mentők kiérkezéséig eltelt percekben.",
            FIRSTAID_RES_0056: "Az alkalmazás hat alapvető képernyőből áll, melyek az alsó navigációs gombsor segítségével és a továbbiak gomb lenyomásával érhetőek el.",
            FIRSTAID_RES_0057: "Helyzetek: útmutató arra az esetre, ha tudja vagy sejti, mi okozza a vészhelyzetet.",
            FIRSTAID_RES_0058: "Diagnosztika: útmutató arra az esetre, ha nem tudja, mi okozta a rosszullétet.",
            FIRSTAID_RES_0059: "Újraélesztés: újraélesztés lépésről-lépésre.",
            FIRSTAID_RES_0060: "Segélyhívó: hívja gyorsan a mentőket!",
            FIRSTAID_RES_0061: "Keresők: a tartózkodási helyéhez legközelebbi defibrillátor és kórház keresése.",
            FIRSTAID_RES_0062: "Teszt: ellenőrizze elsősegélynyújtási ismereteit!",
            FIRSTAID_RES_0063: "Figyelem! Bármilyen hirtelen fellépő komoly panasz, rosszullét esetén forduljon orvoshoz vagy hívjon mentőt! Az alkalmazásban feltüntetett információk nem teljes körűek.",
            FIRSTAID_RES_0064: "H2Online Kft.",
           	FIRSTAID_RES_0065: "Ügyvezető igazgató:",
       		FIRSTAID_RES_0066: "Komjáthy Krisztina",
       		FIRSTAID_RES_0067: "WEBBeteg főszerkesztő:",
       		FIRSTAID_RES_0068: "Sztankó Péter",
       		FIRSTAID_RES_0069: "Szakmai anyag előállítása:",
       		FIRSTAID_RES_0070: "Marsi Zoltán",
       		FIRSTAID_RES_0071: "Szakmai partner:",
       		FIRSTAID_RES_0072: "Országos Mentőszolgálat",
       		FIRSTAID_RES_0073: "Elérhetőségek:",
       		FIRSTAID_RES_0074: "Cím: 1145 Budapest, Szugló utca 9-15.<br /> Honlap: <a href=\"http://elsosegely.webbeteg.hu/\">http://elsosegely.webbeteg.hu/</a> <br />E-mail: <a href=\"mailto:info@webbeteg.hu\">info@webbeteg.hu</a><br />",
       		FIRSTAID_RES_0075: "Fotó készítése",
       		FIRSTAID_RES_0076: "Beküldés",
       		FIRSTAID_RES_0078: "Fotó csatolva",
       		FIRSTAID_RES_0079: "Intézmény neve*",
       		FIRSTAID_RES_0080: "Megye*",
       		FIRSTAID_RES_0081: "Település*",
       		FIRSTAID_RES_0082: "Irányítószám*",
       		FIRSTAID_RES_0083: "Intézmény pontos címe*",
       		FIRSTAID_RES_0084: "Készülék helye (pl. porta)*",
       		FIRSTAID_RES_0085: "Elérhetőség (pl. non-stop)*",
       		FIRSTAID_RES_0086: "Az Ön neve*",
       		FIRSTAID_RES_0087: "Az Ön e-mail címe",
       		FIRSTAID_RES_0088: "Elsősegély",
       		FIRSTAID_RES_0089: "Kérem, adja meg a csillaggal jelölt adatokat!",
            
        }								
    },
    // Fallback language
    "hu",
    success
    );
}

		/*
		 * Megjelenítés:
		 * js: Localization.trans("iii_elhizas");
		 * html: class="l10n-bmi_osztalyozas"
		 */
