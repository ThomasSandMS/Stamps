/* TYPEN INITIALISIEREN */
  INSERT INTO MARKER (MARKER_TITLE)
   VALUES('Eng');
  INSERT INTO CONDITION(CONID, CONDITION_TITLE, ORIGINAL_CONNR)
   VALUES ('**', 'Marke postfrisch', 1)
        , ('*', 'Marke ungestempelt', 2)
        , ('x', 'Marke gestempelt', 3)
        , ('~', 'Marke anders entwertet')
        , ('Bl **', 'Block postfrisch', 11)
        , ('Bl *', 'Block ungestempelt', 12)
        , ('BL x', 'Block gestempelt', 13)
        , ('BL SoSt', 'Block Sonderstempel', 14)
        , ('BL ESt', 'Block Ersttagsstempel', 15)
        , ('ZDr **', 'Zusammendruck postfrisch', 21)
        , ('ZDr *', 'Zusammendruck ungestempelt', 22)
        , ('ZDr x', 'Zusammendruck gestempelt', 23)
        , ('HBl **', 'Heftchenblatt postfrisch', 24)
        , ('HBl x', 'Heftchenblatt gestempelt', 25)
        , ('KB **', 'Kleinbogen postfrisch', 26)
        , ('KB x', 'Kleinbogen gestempelt', 27)
        , ('KB SoSt', 'Kleinbogen Sonderstempel', 28)
        , ('KB ESt', 'Kleinbogen Ersttagsstempel', 29)
        , ('GS *', 'Ganzsache ungestempelt', 32)
        , ('GS x', 'Ganzsache gestempelt', 33)
        , ('FDC', 'Ersttagsbrief', 34)
        , ('PK *', 'Postkarte ungestempelt', 35)
        , ('PK x', 'Postkarte gestempelt', 36)
        , ('Br x', 'Brief gestempelt', 37)
        , ('GB x', 'Gedenkblatt gestempelt', 38)
        , ('SoBr x', 'Sonderbrief gestempelt', 39)
        , ('GSA *', 'Ganzsachenausschnitt ungestempelt', 42)
        , ('GSA x', 'Ganzsachenausschnitt gestempelt', 43)
        , ('Bg **', 'Bogen postfrisch', 44)
        , ('Bg x', 'Bogen gestempelt', 45)
        , ('MH **', 'Markenheft postfrisch', 46)
        , ('MH x', 'Markenheft gestempelt', 47);
/* HIERARCHIEN INITIALISIEREN */
  INSERT INTO CATALOG (LFDNR_1, LFDNR_2, FATHER, LAYER
                      , ID, TITLE)
  VALUES(1, 2, 1, 1, 'Alle', 'Briefmarken');
  INSERT INTO LOCATION (LFDNR_1, LFDNR_2, FATHER, LAYER
                      , ID, TITLE)
  VALUES(1, 2, 1, 1, 'Alle', 'Standorte');
  INSERT INTO DESIGN (LFDNR_1, LFDNR_2, FATHER, LAYER
                      , ID, TITLE)
  VALUES(1, 2, 1, 1, 'Alle', 'Motive');
/* KATALOGE EINFUEGEN */
  EXEC SP_HIERACHY_ADD_CHILD ('CATALOG', 'Alle'   , 'n_Kat'  , 'nicht katalogisiert','');
  EXEC SP_HIERACHY_ADD_BEFORE('CATALOG', 'n_Kat'  , 'Kat'    , 'alle Kataloge','');
  EXEC SP_HIERACHY_ADD_CHILD ('CATALOG', 'n_Kat'  , 'Vig'    , 'Vignetten','');
  EXEC SP_HIERACHY_ADD_BEFORE('CATALOG', 'Vig'    , 'amtl'   , 'Ausgaben','');
  EXEC SP_HIERACHY_ADD_BEFORE('CATALOG', 'Vig'    , 'Cind'   , 'Cinderella','');
  EXEC SP_HIERACHY_ADD_BEFORE('CATALOG', 'Cind'   , 'Exil'   , 'Exilregierungen','');
  EXEC SP_HIERACHY_ADD_CHILD ('CATALOG', 'Kat'    , 'e_Kon'  , 'einzelne Kontinente','');
  EXEC SP_HIERACHY_ADD_BEFORE('CATALOG', 'e_Kon'  , 'm_Kon'  , 'mehrere Kontinente','');
  EXEC SP_HIERACHY_ADD_CHILD ('CATALOG', 'm_Kon'  , 'Mtv'    , 'Motive','');
  EXEC SP_HIERACHY_ADD_BEFORE('CATALOG', 'Mtv'    , 'Klas'   , 'Klassik','(vor 1900)');
  EXEC SP_HIERACHY_ADD_BEFORE('CATALOG', 'Klas'   , 'UNO'    , 'Vereinte Nationen','');
  EXEC SP_HIERACHY_ADD_CHILD ('CATALOG', 'Mtv'    , 'Gem'    , 'Gemälde','');
  EXEC SP_HIERACHY_ADD_CHILD ('CATALOG', 'Gem'    , 'Gem E'  , 'Gemälde Europa','');
  EXEC SP_HIERACHY_ADD_BEFORE('CATALOG', 'Gem'    , 'LuF'    , 'Meilensteine der Luftfahrt','');
  EXEC SP_HIERACHY_ADD_CHILD ('CATALOG', 'LuF'    , 'LUF Aus', 'Meilensteine der Luftfahrt Australien, Antarktis, Asien','');
  EXEC SP_HIERACHY_ADD_BEFORE('CATALOG', 'LUF Aus', 'LuF E'  , 'Meilensteine der Luftfahrt Europa','');
  EXEC SP_HIERACHY_ADD_BEFORE('CATALOG', 'LUF Aus', 'LuF Am' , 'Meilensteine der Luftfahrt Amerika','');
  EXEC SP_HIERACHY_ADD_BEFORE('CATALOG', 'LUF Aus', 'LuF Af' , 'Meilensteine der Luftfahrt Afrika','');
  EXEC SP_HIERACHY_ADD_CHILD ('CATALOG', 'Klas'   , 'Klas Au', 'Klassik Australien, Asien','(vor 1900)');
  EXEC SP_HIERACHY_ADD_BEFORE('CATALOG', 'Klas Au', 'Klas Af', 'Klassik Süd-Amerika, Afrika','(vor 1900)');
  EXEC SP_HIERACHY_ADD_BEFORE('CATALOG', 'Klas Af', 'Klas Am', 'Klassik Nord und Mittel-Amerika','(vor 1900)');
  EXEC SP_HIERACHY_ADD_BEFORE('CATALOG', 'Klas Am', 'Klas E' , 'Klassik Europa','(vor 1900)');
  EXEC SP_HIERACHY_ADD_BEFORE('CATALOG', 'LuF'    , 'Jubi'   , 'Jubiläen','');
  EXEC SP_HIERACHY_ADD_CHILD ('CATALOG', 'Jubi'   , '40 BRD' , '40 Jahre Bundesrepublik','');
  EXEC SP_HIERACHY_ADD_BEFORE('CATALOG', '40 BRD' , '50 TdB' , '50 Jahre Tag der Briefmarke','');
  EXEC SP_HIERACHY_ADD_BEFORE('CATALOG', '50 TdB' , '500 Po' , '500 Jahre Post','');
  EXEC SP_HIERACHY_ADD_BEFORE('CATALOG', 'Jubi'   , 'FehBr'  , 'Fehler auf Briefmarken','');
  EXEC SP_HIERACHY_ADD_CHILD ('CATALOG', 'FehBr'  , 'FehBr Ü', 'Briefmarken Fehler Übersee','');
  EXEC SP_HIERACHY_ADD_CHILD ('CATALOG', 'FehBr'  , 'FehBr E', 'Briefmarken Fehler Europa','');
  EXEC SP_HIERACHY_ADD_CHILD ('CATALOG', 'm_Kon'  , 'UNO'    , 'UNO-Spezial','2020');
  EXEC SP_HIERACHY_ADD_CHILD ('CATALOG', 'e_Kon'  , 'AS'     , 'Asien','');
  EXEC SP_HIERACHY_ADD_CHILD ('CATALOG', 'AS'     , 'Ü10'    , 'Naher Osten','2004');
  EXEC SP_HIERACHY_ADD_BEFORE('CATALOG', 'Ü10'    , 'Ü 9'    , 'Mittel- und Ostasien','2003');
  EXEC SP_HIERACHY_ADD_BEFORE('CATALOG', 'Ü10'    , 'Ü 8'    , 'Süd- und Südostasien','2003');
  EXEC SP_HIERACHY_ADD_BEFORE('CATALOG', 'AS'     , 'AUS'    , 'Australien','');
  EXEC SP_HIERACHY_ADD_CHILD ('CATALOG', 'AUS'    , 'Ü 7'    , 'Australien Ozeanien Antarktis','2002/2003');
  EXEC SP_HIERACHY_ADD_BEFORE('CATALOG', 'AUS'    , 'AF'     , 'Afrika','');
  EXEC SP_HIERACHY_ADD_CHILD ('CATALOG', 'AF'     , 'Ü 6'    , 'Süd- und Zentralafrika','2002');
  EXEC SP_HIERACHY_ADD_BEFORE('CATALOG', 'Ü 6'    , 'Ü 5'    , 'Westafrika','2001/2002');
  EXEC SP_HIERACHY_ADD_BEFORE('CATALOG', 'Ü 5'    , 'Ü 4'    , 'Nord- und Ostafrika','2002');
  EXEC SP_HIERACHY_ADD_BEFORE('CATALOG', 'AF'     , 'AM'     , 'Amerika','');
  EXEC SP_HIERACHY_ADD_CHILD ('CATALOG', 'AM'     , 'Ü 3'    , 'Südamerika','2001');
  EXEC SP_HIERACHY_ADD_BEFORE('CATALOG', 'Ü 3'    , 'Ü 2'    , 'Karibische Inseln','2000');
  EXEC SP_HIERACHY_ADD_BEFORE('CATALOG', 'Ü 2'    , 'Ü 1'    , 'Nord und Mittelamerika','2000');
  EXEC SP_HIERACHY_ADD_BEFORE('CATALOG', 'AM'     , 'E'      , 'Europa','');
  EXEC SP_HIERACHY_ADD_CHILD ('CATALOG', 'E'      , 'E 7'    , 'Osteuropa','2015');
  EXEC SP_HIERACHY_ADD_BEFORE('CATALOG', 'E 7'    , 'E 6'    , 'Westeuropa','2015');
  EXEC SP_HIERACHY_ADD_BEFORE('CATALOG', 'E 6'    , 'E 5'    , 'Nordeuropa','2015');
  EXEC SP_HIERACHY_ADD_BEFORE('CATALOG', 'E 5'    , 'E 4'    , 'Südosteuropa','2015');
  EXEC SP_HIERACHY_ADD_BEFORE('CATALOG', 'E 4'    , 'E 3'    , 'Südeuropa','2015');
  EXEC SP_HIERACHY_ADD_BEFORE('CATALOG', 'E 3'    , 'E 2'    , 'Südwesteuropa','2015');
  EXEC SP_HIERACHY_ADD_BEFORE('CATALOG', 'E 2'    , 'E 1'    , 'Mitteleuropa','2015');
  EXEC SP_HIERACHY_ADD_BEFORE('CATALOG', 'E 1'    , 'D'      , 'Deutschland','');
  EXEC SP_HIERACHY_ADD_CHILD ('CATALOG', 'D'      , 'DS1'    , 'Deutschland Spezial Band 1','2016');
  EXEC SP_HIERACHY_ADD_BEFORE('CATALOG', 'DS1'    , 'DS2'    , 'Deutschland Spezial Band 2','2016');
/* STANDORTE EINFUEGEN */
  EXEC SP_HIERACHY_ADD_CHILD ('LOCATION', 'Alle'   , 'KinZ'  , 'Kinderzimmer','');
  EXEC SP_HIERACHY_ADD_CHILD ('LOCATION', 'KinZ'   , 'RgFs'  , 'Regal am Fenster','');
  EXEC SP_HIERACHY_ADD_CHILD ('LOCATION', 'Alle'   , 'KinZ'  , 'Kinderzimmer','');
  EXEC SP_HIERACHY_ADD_BEFORE('LOCATION', 'BlK1'   , 'BlK2'  , 'Billy-Regal klein II','');
  EXEC SP_HIERACHY_ADD_BEFORE('LOCATION', 'BlK2'   , 'BlK3'  , 'Billy-Regal klein III','');
  EXEC SP_HIERACHY_ADD_BEFORE('LOCATION', 'KinZ'   , 'Flur'  , 'Flur','');
  EXEC SP_HIERACHY_ADD_CHILD ('LOCATION', 'Flur'   , 'Bl w'  , 'Billy-Regal weiß','');
  EXEC SP_HIERACHY_ADD_BEFORE('LOCATION', 'Flur'   , 'WhZi'  , 'Wohnzimmer','');
  EXEC SP_HIERACHY_ADD_CHILD ('LOCATION', 'WhZi'   , 'SchB'  , 'Schrank am Balkon','');
  EXEC SP_HIERACHY_ADD_BEFORE('LOCATION', 'SchB'   , 'SchF'  , 'Schrank zum Flur','');
  EXEC SP_HIERACHY_ADD_BEFORE('LOCATION', 'SchF'   , 'RgSw'  , 'Regal schwarz','');
  EXEC SP_HIERACHY_ADD_BEFORE('LOCATION', 'RgSw'   , 'DrRG'  , 'Regal unter dem Drucker','');
/* DESIGN EINFUEGEN */
  EXEC SP_HIERACHY_ADD_CHILD ('DESIGN', 'Alle'   , '9000'  , 'Post','');
  EXEC SP_HIERACHY_ADD_CHILD ('DESIGN', '9000'   , '9300'  , 'Posthorn','');
  EXEC SP_HIERACHY_ADD_BEFORE('DESIGN', '9300'   , '9200'  , 'Postgebäude','');
  EXEC SP_HIERACHY_ADD_BEFORE('DESIGN', '9200'   , '9100'  , 'Briefträger, Postbeamte','');
  EXEC SP_HIERACHY_ADD_BEFORE('DESIGN', '9000'   , '8000'  , 'Zusammenschlüsse, Bündnisse, Vereinigungen, Organisationen, Verbände','');
  EXEC SP_HIERACHY_ADD_CHILD ('DESIGN', '8000'   , '8400'  , 'andere Verbände','');
  EXEC SP_HIERACHY_ADD_CHILD ('DESIGN', '8400'   , '8410'  , 'Frauenverbände','');
  EXEC SP_HIERACHY_ADD_BEFORE('DESIGN', '8400'   , '8300'  , 'Wirtschaftsverbände','');
  EXEC SP_HIERACHY_ADD_CHILD ('DESIGN', '8300'   , '8320'  , 'RGB','');
  EXEC SP_HIERACHY_ADD_BEFORE('DESIGN', '8320'   , '8310'  , 'EG','');
  EXEC SP_HIERACHY_ADD_BEFORE('DESIGN', '8300'   , '8200'  , 'Postorganisationen','');
  EXEC SP_HIERACHY_ADD_CHILD ('DESIGN', '8200'   , '8240'  , 'UPU','');
  EXEC SP_HIERACHY_ADD_BEFORE('DESIGN', '8240'   , '8230'  , 'Gemeinschaftsausgaben','');
  EXEC SP_HIERACHY_ADD_BEFORE('DESIGN', '8230'   , '8220'  , 'Mitläufer','');
  EXEC SP_HIERACHY_ADD_BEFORE('DESIGN', '8220'   , '8210'  , 'CEPT','');
  EXEC SP_HIERACHY_ADD_BEFORE('DESIGN', '8200'   , '8100'  , 'politische Organisationen','');
  EXEC SP_HIERACHY_ADD_CHILD ('DESIGN', '8100'   , '8120'  , 'EU','');
  EXEC SP_HIERACHY_ADD_BEFORE('DESIGN', '8120'   , '8110'  , 'UNO','');
  EXEC SP_HIERACHY_ADD_CHILD ('DESIGN', '8110'   , '8111'  , 'UNICEF','');
  EXEC SP_HIERACHY_ADD_BEFORE('DESIGN', '8000'   , '7000'  , 'Geschichte, Politik, Staat, Gesellschaft, Religion, Kirche','');
  EXEC SP_HIERACHY_ADD_CHILD ('DESIGN', '7000'   , '7700'  , 'Staatliche Symbole','');
  EXEC SP_HIERACHY_ADD_CHILD ('DESIGN', '7700'   , '7740'  , 'Landkarten, Vermessung','');
  EXEC SP_HIERACHY_ADD_BEFORE('DESIGN', '7740'   , '7730'  , 'Symbole','');
  EXEC SP_HIERACHY_ADD_BEFORE('DESIGN', '7730'   , '7720'  , 'Wappen','');
  EXEC SP_HIERACHY_ADD_BEFORE('DESIGN', '7720'   , '7710'  , 'Flaggen','');
  EXEC SP_HIERACHY_ADD_BEFORE('DESIGN', '7700'   , '7600'  , 'Religionen','');
  EXEC SP_HIERACHY_ADD_CHILD ('DESIGN', '7600'   , '7630'  , 'Hinduismus','');
  EXEC SP_HIERACHY_ADD_BEFORE('DESIGN', '7630'   , '7620'  , 'Buddhismus','');
  EXEC SP_HIERACHY_ADD_BEFORE('DESIGN', '7620'   , '7610'  , 'Islam','');
  EXEC SP_HIERACHY_ADD_CHILD ('DESIGN', '7610'   , '7611'  , 'Koran','');
  EXEC SP_HIERACHY_ADD_BEFORE('DESIGN', '7600'   , '7500'  , 'staatliche und andere Organisationen','');
  EXEC SP_HIERACHY_ADD_CHILD ('DESIGN', '7500'   , '7550'  , 'Pfadfinder','');
  EXEC SP_HIERACHY_ADD_CHILD ('DESIGN', '7550'   , '7552'  , 'Pioniere','');
  EXEC SP_HIERACHY_ADD_BEFORE('DESIGN', '7552'   , '7551'  , 'Pfadfindertreffen und Embleme','');
  EXEC SP_HIERACHY_ADD_BEFORE('DESIGN', '7550'   , '7540'  , 'Hilfs- und Wohltätigkeitsorganisationen','');
  EXEC SP_HIERACHY_ADD_CHILD ('DESIGN', '7540'   , '7541'  , 'Malteser, Johanniter','');
  EXEC SP_HIERACHY_ADD_BEFORE('DESIGN', '7540'   , '7530'  , 'Rotes Kreuz / Roter Halbmond','');
  EXEC SP_HIERACHY_ADD_BEFORE('DESIGN', '7530'   , '7520'  , 'Feuerwehr','');
  EXEC SP_HIERACHY_ADD_BEFORE('DESIGN', '7520'   , '7510'  , 'Polizei','');
  EXEC SP_HIERACHY_ADD_BEFORE('DESIGN', '7500'   , '7400'  , 'Staat und Gesellschaft','');
  EXEC SP_HIERACHY_ADD_CHILD ('DESIGN', '7400'   , '7420'  , 'Sozialversicherung','');
  EXEC SP_HIERACHY_ADD_BEFORE('DESIGN', '7420'   , '7410'  , 'Gewaltenteilung','');
  EXEC SP_HIERACHY_ADD_BEFORE('DESIGN', '7400'   , '7300'  , 'Regierungen Parlamente','');
  EXEC SP_HIERACHY_ADD_CHILD ('DESIGN', '7300'   , '7310'  , 'Politiker','');
  EXEC SP_HIERACHY_ADD_BEFORE('DESIGN', '7300'   , '7200'  , 'Erklärungen, Vereinbarungen, Verträge, Konferenzen, Kongresse','');
  EXEC SP_HIERACHY_ADD_BEFORE('DESIGN', '7200'   , '7100'  , 'Jahrestage','');
  EXEC SP_HIERACHY_ADD_CHILD ('DESIGN', '7100'   , '7120'  , '100 Jahre Briefmarken','');
  EXEC SP_HIERACHY_ADD_BEFORE('DESIGN', '7120'   , '7110'  , 'Tag der Briefmarke','');
  EXEC SP_HIERACHY_ADD_BEFORE('DESIGN', '7000'   , '6000'  , 'Wirtschaft, Wissenschaft, Forschung und Technik','');
  EXEC SP_HIERACHY_ADD_CHILD ('DESIGN', '6000'   , '6800'  , 'Wehrtechnik','');
  EXEC SP_HIERACHY_ADD_CHILD ('DESIGN', '6800'   , '6810'  , 'Waffen','');
  EXEC SP_HIERACHY_ADD_BEFORE('DESIGN', '6800'   , '6700'  , 'Ingenieurwissenschaften','');
  EXEC SP_HIERACHY_ADD_BEFORE('DESIGN', '6700'   , '6600'  , 'Geisteswissenschaften','');
  EXEC SP_HIERACHY_ADD_CHILD ('DESIGN', '6600'   , '6630'  , 'Phlilologie','');
  EXEC SP_HIERACHY_ADD_BEFORE('DESIGN', '6630'   , '6620'  , 'Theologie','');
  EXEC SP_HIERACHY_ADD_BEFORE('DESIGN', '6620'   , '6610'  , 'Philosophie','');
  EXEC SP_HIERACHY_ADD_BEFORE('DESIGN', '6600'   , '6500'  , 'Medizin','');
  EXEC SP_HIERACHY_ADD_CHILD ('DESIGN', '6500'   , '6510'  , 'Gesundheitsdienste','');
  EXEC SP_HIERACHY_ADD_CHILD ('DESIGN', '6510'   , '6511'  , 'Tuberkolose','');
  EXEC SP_HIERACHY_ADD_BEFORE('DESIGN', '6500'   , '6400'  , 'Naturwissenschaften','');
  EXEC SP_HIERACHY_ADD_CHILD ('DESIGN', '6400'   , '6460'  , 'Geologie, Mineralogie, Paläontologie','');
  EXEC SP_HIERACHY_ADD_BEFORE('DESIGN', '6460'   , '6450'  , 'Biologie','');
  EXEC SP_HIERACHY_ADD_BEFORE('DESIGN', '6450'   , '6440'  , 'Chemie','');
  EXEC SP_HIERACHY_ADD_BEFORE('DESIGN', '6440'   , '6430'  , 'Physik','');
  EXEC SP_HIERACHY_ADD_BEFORE('DESIGN', '6430'   , '6420'  , 'Astrologie, Sternzeichen','');
  EXEC SP_HIERACHY_ADD_BEFORE('DESIGN', '6420'   , '6410'  , 'Mathematik','');
  EXEC SP_HIERACHY_ADD_BEFORE('DESIGN', '6400'   , '6300'  , 'Messen, Tagungen, Ausstellungen','');
  EXEC SP_HIERACHY_ADD_CHILD ('DESIGN', '6300'   , '6320'  , 'Leipziger Messe','');
  EXEC SP_HIERACHY_ADD_BEFORE('DESIGN', '6320'   , '6310'  , 'Briefmarkenausstellungen','');
  EXEC SP_HIERACHY_ADD_BEFORE('DESIGN', '6300'   , '6200'  , 'Geld, Siegel, Orden, Briefmarken','');
  EXEC SP_HIERACHY_ADD_CHILD ('DESIGN', '6200'   , '6250'  , 'Orden','');
  EXEC SP_HIERACHY_ADD_BEFORE('DESIGN', '6250'   , '6240'  , 'Siegel','');
  EXEC SP_HIERACHY_ADD_BEFORE('DESIGN', '6240'   , '6230'  , 'Stempel','');
  EXEC SP_HIERACHY_ADD_BEFORE('DESIGN', '6230'   , '6220'  , 'Briefmarken','');
  EXEC SP_HIERACHY_ADD_BEFORE('DESIGN', '6220'   , '6210'  , 'Geld','');
  EXEC SP_HIERACHY_ADD_BEFORE('DESIGN', '6200'   , '6100'  , 'wirtschaftliche Sektoren','');
  EXEC SP_HIERACHY_ADD_CHILD ('DESIGN', '6100'   , '6180'  , 'Presse, Journalismus, Druck','');
  EXEC SP_HIERACHY_ADD_CHILD ('DESIGN', '6180'   , '6183'  , 'Plakat','');
  EXEC SP_HIERACHY_ADD_BEFORE('DESIGN', '6183'   , '6182'  , 'Druck','');
  EXEC SP_HIERACHY_ADD_BEFORE('DESIGN', '6182'   , '6181'  , 'Zeitung','');
  EXEC SP_HIERACHY_ADD_BEFORE('DESIGN', '6180'   , '6170'  , 'Dienstleistungen','');
  EXEC SP_HIERACHY_ADD_CHILD ('DESIGN', '6170'   , '6176'  , 'EDV, Computer','');
  EXEC SP_HIERACHY_ADD_BEFORE('DESIGN', '6176'   , '6175'  , 'Kommunikation','');
  EXEC SP_HIERACHY_ADD_BEFORE('DESIGN', '6175'   , '6174'  , 'Transport','');
  EXEC SP_HIERACHY_ADD_BEFORE('DESIGN', '6174'   , '6173'  , 'Handel','');
  EXEC SP_HIERACHY_ADD_BEFORE('DESIGN', '6173'   , '6172'  , 'Versicherungen','');
  EXEC SP_HIERACHY_ADD_BEFORE('DESIGN', '6172'   , '6171'  , 'Banken','');
  EXEC SP_HIERACHY_ADD_BEFORE('DESIGN', '6170'   , '6160'  , 'Fischerei, Tierzucht','');
  EXEC SP_HIERACHY_ADD_BEFORE('DESIGN', '6160'   , '6150'  , 'Land- und Forstwirtschaft','');
  EXEC SP_HIERACHY_ADD_BEFORE('DESIGN', '6150'   , '6140'  , 'produzierendes Gewerbe','');
  EXEC SP_HIERACHY_ADD_CHILD ('DESIGN', '6140'   , '6142'  , 'Handwerk','');
  EXEC SP_HIERACHY_ADD_BEFORE('DESIGN', '6142'   , '6141'  , 'Industrie','');
  EXEC SP_HIERACHY_ADD_BEFORE('DESIGN', '6140'   , '6130'  , 'Erdöl','');
  EXEC SP_HIERACHY_ADD_BEFORE('DESIGN', '6130'   , '6120'  , 'Bergbau, Energietechnik','');
  EXEC SP_HIERACHY_ADD_CHILD ('DESIGN', '6120'   , '6122'  , 'Kraftwerk','');
  EXEC SP_HIERACHY_ADD_BEFORE('DESIGN', '6122'   , '6121'  , 'Bergbau','');
  EXEC SP_HIERACHY_ADD_BEFORE('DESIGN', '6120'   , '6110'  , 'Weinbau, Braukunst','');
  EXEC SP_HIERACHY_ADD_BEFORE('DESIGN', '6000'   , '5000'  , 'Sport, Spiel, Unterhaltung','');
  EXEC SP_HIERACHY_ADD_CHILD ('DESIGN', '5000'   , '5700'  , 'sonstige Unterhaltung','');
  EXEC SP_HIERACHY_ADD_CHILD ('DESIGN', '5700'   , '5720'  , 'Zirkus','');
  EXEC SP_HIERACHY_ADD_BEFORE('DESIGN', '5720'   , '5710'  , 'Tanz','');
  EXEC SP_HIERACHY_ADD_BEFORE('DESIGN', '5700'   , '5600'  , 'Spiele','');
  EXEC SP_HIERACHY_ADD_CHILD ('DESIGN', '5600'   , '5630'  , 'Kinderspiele','');
  EXEC SP_HIERACHY_ADD_BEFORE('DESIGN', '5630'   , '5620'  , 'Kartenspiele','');
  EXEC SP_HIERACHY_ADD_BEFORE('DESIGN', '5620'   , '5610'  , 'Brettspiele','');
  EXEC SP_HIERACHY_ADD_CHILD ('DESIGN', '5610'   , '5632'  , 'Mühle/Dame','');
  EXEC SP_HIERACHY_ADD_BEFORE('DESIGN', '5632'   , '5631'  , 'Schach','');
  EXEC SP_HIERACHY_ADD_BEFORE('DESIGN', '5600'   , '5500'  , 'Sonstige Sportarten','');
  EXEC SP_HIERACHY_ADD_CHILD ('DESIGN', '5500'   , '5520'  , 'Flugsport','');
  EXEC SP_HIERACHY_ADD_CHILD ('DESIGN', '5520'   , '5522'  , 'Modellfliegen','');
  EXEC SP_HIERACHY_ADD_BEFORE('DESIGN', '5522'   , '5521'  , 'Segelfliegen','');
  EXEC SP_HIERACHY_ADD_BEFORE('DESIGN', '5520'   , '5510'  , 'Fischen, Jagd, Schießen','');
  EXEC SP_HIERACHY_ADD_CHILD ('DESIGN', '5510'   , '5513'  , 'Jagd','');
  EXEC SP_HIERACHY_ADD_BEFORE('DESIGN', '5513'   , '5512'  , 'Sportschießen','');
  EXEC SP_HIERACHY_ADD_BEFORE('DESIGN', '5512'   , '5511'  , 'Angeln','');
  EXEC SP_HIERACHY_ADD_BEFORE('DESIGN', '5500'   , '5400'  , 'Wassersport','');
  EXEC SP_HIERACHY_ADD_CHILD ('DESIGN', '5400'   , '5450'  , 'Wasserski, Jetski','');
  EXEC SP_HIERACHY_ADD_BEFORE('DESIGN', '5450'   , '5440'  , 'Motorschnellboot','');
  EXEC SP_HIERACHY_ADD_BEFORE('DESIGN', '5440'   , '5430'  , 'Segeln','');
  EXEC SP_HIERACHY_ADD_BEFORE('DESIGN', '5430'   , '5420'  , 'Rudern, Kanu','');
  EXEC SP_HIERACHY_ADD_BEFORE('DESIGN', '5420'   , '5410'  , 'Schwimmen','');
  EXEC SP_HIERACHY_ADD_BEFORE('DESIGN', '5400'   , '5300'  , 'Wintersport','');
  EXEC SP_HIERACHY_ADD_CHILD ('DESIGN', '5300'   , '5330'  , 'Bob, Rodeln','');
  EXEC SP_HIERACHY_ADD_CHILD ('DESIGN', '5330'   , '5332'  , 'Rodeln','');
  EXEC SP_HIERACHY_ADD_BEFORE('DESIGN', '5332'   , '5331'  , 'Bob','');
  EXEC SP_HIERACHY_ADD_BEFORE('DESIGN', '5330'   , '5320'  , 'Eissport','');
  EXEC SP_HIERACHY_ADD_CHILD ('DESIGN', '5320'   , '5323'  , 'Eiskunstlauf','');
  EXEC SP_HIERACHY_ADD_BEFORE('DESIGN', '5323'   , '5322'  , 'Eishockey','');
  EXEC SP_HIERACHY_ADD_BEFORE('DESIGN', '5322'   , '5321'  , 'Eisschnelllauf','');
  EXEC SP_HIERACHY_ADD_BEFORE('DESIGN', '5320'   , '5310'  , 'Ski','');
  EXEC SP_HIERACHY_ADD_CHILD ('DESIGN', '5310'   , '5314'  , 'Biathlon','');
  EXEC SP_HIERACHY_ADD_BEFORE('DESIGN', '5314'   , '5313'  , 'Skispringen','');
  EXEC SP_HIERACHY_ADD_BEFORE('DESIGN', '5313'   , '5312'  , 'Ski-Abfahrt/Slalom','');
  EXEC SP_HIERACHY_ADD_BEFORE('DESIGN', '5312'   , '5311'  , 'Ski-Langlauf','');
  EXEC SP_HIERACHY_ADD_BEFORE('DESIGN', '5300'   , '5200'  , 'Sport im Freien oder in der Halle','');
  EXEC SP_HIERACHY_ADD_CHILD ('DESIGN', '5200'   , '5290'  , 'Reitsport','');
  EXEC SP_HIERACHY_ADD_CHILD ('DESIGN', '5290'   , '5292'  , 'Dressur','');
  EXEC SP_HIERACHY_ADD_BEFORE('DESIGN', '5292'   , '5291'  , 'Springreiten','');
  EXEC SP_HIERACHY_ADD_BEFORE('DESIGN', '5290'   , '5280'  , 'Kampfsport, Schwerathletik','');
  EXEC SP_HIERACHY_ADD_CHILD ('DESIGN', '5280'   , '5284'  , 'Boxen','');
  EXEC SP_HIERACHY_ADD_BEFORE('DESIGN', '5284'   , '5283'  , 'Ringen','');
  EXEC SP_HIERACHY_ADD_BEFORE('DESIGN', '5283'   , '5282'  , 'Judo, Karate','');
  EXEC SP_HIERACHY_ADD_BEFORE('DESIGN', '5282'   , '5281'  , 'Gewichtheben','');
  EXEC SP_HIERACHY_ADD_BEFORE('DESIGN', '5280'   , '5270'  , 'Motorsport','');
  EXEC SP_HIERACHY_ADD_CHILD ('DESIGN', '5270'   , '5273'  , 'Ralley','');
  EXEC SP_HIERACHY_ADD_BEFORE('DESIGN', '5273'   , '5272'  , 'Motorradsport','');
  EXEC SP_HIERACHY_ADD_BEFORE('DESIGN', '5272'   , '5271'  , 'Formel 1','');
  EXEC SP_HIERACHY_ADD_BEFORE('DESIGN', '5270'   , '5260'  , 'Radsport','');
  EXEC SP_HIERACHY_ADD_BEFORE('DESIGN', '5260'   , '5250'  , 'Wandern, Bergsteigen','');
  EXEC SP_HIERACHY_ADD_BEFORE('DESIGN', '5250'   , '5240'  , 'Gymnastik, Turnen, Leichtathletik','');
  EXEC SP_HIERACHY_ADD_CHILD ('DESIGN', '5240'   , '5244'  , 'Rollschuhlaufen','');
  EXEC SP_HIERACHY_ADD_BEFORE('DESIGN', '5244'   , '5243'  , 'Jogging','');
  EXEC SP_HIERACHY_ADD_BEFORE('DESIGN', '5243'   , '5242'  , 'Leichtathletik','');
  EXEC SP_HIERACHY_ADD_BEFORE('DESIGN', '5242'   , '5241'  , 'Gymnastik, Turnen','');
  EXEC SP_HIERACHY_ADD_BEFORE('DESIGN', '5240'   , '5230'  , 'Ballspiele','');
  EXEC SP_HIERACHY_ADD_CHILD ('DESIGN', '5230'   , '5238'  , 'Hockey','');
  EXEC SP_HIERACHY_ADD_BEFORE('DESIGN', '5238'   , '5237'  , 'Volleyball','');
  EXEC SP_HIERACHY_ADD_BEFORE('DESIGN', '5237'   , '5236'  , 'Baseball','');
  EXEC SP_HIERACHY_ADD_BEFORE('DESIGN', '5236'   , '5235'  , 'Tischtennis','');
  EXEC SP_HIERACHY_ADD_BEFORE('DESIGN', '5235'   , '5234'  , 'Tennis','');
  EXEC SP_HIERACHY_ADD_BEFORE('DESIGN', '5234'   , '5233'  , 'Basketball','');
  EXEC SP_HIERACHY_ADD_BEFORE('DESIGN', '5233'   , '5232'  , 'Handball','');
  EXEC SP_HIERACHY_ADD_BEFORE('DESIGN', '5232'   , '5231'  , 'Fußball','');
  EXEC SP_HIERACHY_ADD_BEFORE('DESIGN', '5230'   , '5220'  , 'Bewegungs- und Geschicklichkeitsspiele','');
  EXEC SP_HIERACHY_ADD_BEFORE('DESIGN', '5220'   , '5210'  , 'Spiele und Erholung im Freien allgemein','');
  EXEC SP_HIERACHY_ADD_BEFORE('DESIGN', '5200'   , '5100'  , 'Organisationen, Veranstaltungen, Wettbewerbe','');
  EXEC SP_HIERACHY_ADD_CHILD ('DESIGN', '5100'   , '5180'  , 'Sportorganisationen','');
  EXEC SP_HIERACHY_ADD_CHILD ('DESIGN', '5180'   , '5184'  , 'FIDE und andere Schachorganisationen','');
  EXEC SP_HIERACHY_ADD_BEFORE('DESIGN', '5184'   , '5183'  , 'DFB','');
  EXEC SP_HIERACHY_ADD_BEFORE('DESIGN', '5183'   , '5182'  , 'UEFA','');
  EXEC SP_HIERACHY_ADD_BEFORE('DESIGN', '5182'   , '5181'  , 'FIFA','');
  EXEC SP_HIERACHY_ADD_BEFORE('DESIGN', '5180'   , '5170'  , 'Nationale Sportwettbewerbe','');
  EXEC SP_HIERACHY_ADD_CHILD ('DESIGN', '5170'   , '5171'  , 'Deutsche Meisterschaft','');
  EXEC SP_HIERACHY_ADD_BEFORE('DESIGN', '5170'   , '5160'  , 'internationale Sportwettbewerbe','');
  EXEC SP_HIERACHY_ADD_CHILD ('DESIGN', '5160'   , '5165'  , 'Militärmeisterschaften','');
  EXEC SP_HIERACHY_ADD_BEFORE('DESIGN', '5165'   , '5164'  , 'Spartakiade','');
  EXEC SP_HIERACHY_ADD_BEFORE('DESIGN', '5164'   , '5163'  , 'Europameisterschaften','');
  EXEC SP_HIERACHY_ADD_BEFORE('DESIGN', '5163'   , '5162'  , 'Kontinentalmeisterschaften','');
  EXEC SP_HIERACHY_ADD_BEFORE('DESIGN', '5162'   , '5161'  , 'Weltmeistenschaften','');
  EXEC SP_HIERACHY_ADD_BEFORE('DESIGN', '5160'   , '5150'  , 'Sportstadien','');
  EXEC SP_HIERACHY_ADD_BEFORE('DESIGN', '5150'   , '5140'  , 'Regatten','');
  EXEC SP_HIERACHY_ADD_BEFORE('DESIGN', '5140'   , '5130'  , 'Europameisterschaften Fußball','');
  EXEC SP_HIERACHY_ADD_BEFORE('DESIGN', '5130'   , '5120'  , 'Weltmeisterschaften Fußball','');
  EXEC SP_HIERACHY_ADD_CHILD ('DESIGN', '5120'   , '5126'  , 'FIFA WM Mexiko 1970 1986','');
  EXEC SP_HIERACHY_ADD_BEFORE('DESIGN', '5126'   , '5125'  , 'FIFA WM England 1966','');
  EXEC SP_HIERACHY_ADD_BEFORE('DESIGN', '5125'   , '5124'  , 'FIFA WM Italien 1934 1990','');
  EXEC SP_HIERACHY_ADD_BEFORE('DESIGN', '5124'   , '5123'  , 'FIFA WM Spanien 1982','');
  EXEC SP_HIERACHY_ADD_BEFORE('DESIGN', '5123'   , '5122'  , 'FIFA WM Deutschland 1974 2006','');
  EXEC SP_HIERACHY_ADD_BEFORE('DESIGN', '5122'   , '5121'  , 'FIFA WM Argentinien 1978','');
  EXEC SP_HIERACHY_ADD_BEFORE('DESIGN', '5120'   , '5110'  , 'Olympia','');
  EXEC SP_HIERACHY_ADD_CHILD ('DESIGN', '5110'   , '5119'  , 'Winterolympiade','');
  EXEC SP_HIERACHY_ADD_BEFORE('DESIGN', '5119'   , '5118'  , 'Sommerolympiade','');
  EXEC SP_HIERACHY_ADD_BEFORE('DESIGN', '5118'   , '5117'  , 'Mexiko Sommer 1968','');
  EXEC SP_HIERACHY_ADD_BEFORE('DESIGN', '5117'   , '5116'  , 'Moskau Sommer 1980','');
  EXEC SP_HIERACHY_ADD_BEFORE('DESIGN', '5116'   , '5115'  , 'Montreal Sommer 1976','');
  EXEC SP_HIERACHY_ADD_BEFORE('DESIGN', '5115'   , '5114'  , 'Innsbruck Winter 1964, 1976','');
  EXEC SP_HIERACHY_ADD_BEFORE('DESIGN', '5114'   , '5113'  , 'Rom Sommer 1960','');
  EXEC SP_HIERACHY_ADD_BEFORE('DESIGN', '5113'   , '5112'  , 'Sapporo 1972 Winter','');
  EXEC SP_HIERACHY_ADD_BEFORE('DESIGN', '5112'   , '5111'  , 'M�nchen 1972 Sommer','');
  EXEC SP_HIERACHY_ADD_BEFORE('DESIGN', '5000'   , '4000'  , 'Kunst,Musik, Lebensformen','');
  EXEC SP_HIERACHY_ADD_CHILD ('DESIGN', '4000'   , '4900'  , 'Cartoons','');
  EXEC SP_HIERACHY_ADD_CHILD ('DESIGN', '4900'   , '4920'  , 'Cartoons von Warner Brothers','');
  EXEC SP_HIERACHY_ADD_BEFORE('DESIGN', '4920'   , '4910'  , 'Cartoons von Walt Disney','');
  EXEC SP_HIERACHY_ADD_CHILD ('DESIGN', '4910'   , '4911'  , 'Mickey Mouse / Donald Duck','');
  EXEC SP_HIERACHY_ADD_BEFORE('DESIGN', '4900'   , '4800'  , 'Christliche Motive','');
  EXEC SP_HIERACHY_ADD_CHILD ('DESIGN', '4800'   , '4840'  , 'Kichliche Treffen','');
  EXEC SP_HIERACHY_ADD_CHILD ('DESIGN', '4840'   , '4844'  , '�kumenische Treffen','');
  EXEC SP_HIERACHY_ADD_BEFORE('DESIGN', '4844'   , '4843'  , 'Evangelische Kirchentage','');
  EXEC SP_HIERACHY_ADD_BEFORE('DESIGN', '4843'   , '4842'  , 'Eucharistische Kongresse','');
  EXEC SP_HIERACHY_ADD_BEFORE('DESIGN', '4842'   , '4841'  , 'Katholikentage','');
  EXEC SP_HIERACHY_ADD_BEFORE('DESIGN', '4840'   , '4830'  , 'christliche Gem�lde','');
  EXEC SP_HIERACHY_ADD_BEFORE('DESIGN', '4830'   , '4820'  , 'christliche Feste','');
  EXEC SP_HIERACHY_ADD_CHILD ('DESIGN', '4820'   , '4822'  , 'Ostern','');
  EXEC SP_HIERACHY_ADD_BEFORE('DESIGN', '4822'   , '4821'  , 'Weihnachten','');
  EXEC SP_HIERACHY_ADD_BEFORE('DESIGN', '4820'   , '4810'  , 'christliche Motive/Skulpturen','');
  EXEC SP_HIERACHY_ADD_CHILD ('DESIGN', '4810'   , '4813'  , 'Heilige','');
  EXEC SP_HIERACHY_ADD_BEFORE('DESIGN', '4813'   , '4812'  , 'Engel','');
  EXEC SP_HIERACHY_ADD_BEFORE('DESIGN', '4812'   , '4811'  , 'Madonnen','');
  EXEC SP_HIERACHY_ADD_BEFORE('DESIGN', '4800'   , '4700'  , 'Weihnachten','');

  EXEC SP_HIERACHY_ADD_BEFORE('DESIGN', '4000'   , '3000'  , 'Immobilien','');
  EXEC SP_HIERACHY_ADD_BEFORE('DESIGN', '3000'   , '2000'  , 'Verkehrsmittel','');
  EXEC SP_HIERACHY_ADD_BEFORE('DESIGN', '2000'   , '1000'  , 'Menschen,Lebensräume','');
  EXEC SP_HIERACHY_ADD_BEFORE('DESIGN', '1000'   , '0000'  , 'Tiere, nicht menschl Lebensformen','');