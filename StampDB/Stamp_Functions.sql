CREATE PROCEDURE SP_HIERACHY_ADD_ITEM
  (
    @TABLE SYSNAME = 'DESIGN'
  , @IS_CHILD INT = 0
  , @INSERT_NR INT = 0
  , @NEW_ID NVARCHAR(10) = '_'
  , @NEW_TITLE NVARCHAR(255) = 'neu'
  , @NEW_ATTRIBUT NVARCHAR(10) = ''
  )
  AS
  BEGIN
    DECLARE @SQL NVARCHAR(MAX);
    /* verschieben der Nachfolger */
    SET @SQL  = CONCAT('UPDATE ',@TABLE);
    SET @SQL += CONCAT(' SET LFDNR_1 = LFDNR_1 + CASE WHEN LFDNR_1 > ', @INSERT_NR, ' THEN 2 ');
    SET @SQL += CONCAT('      WHEN LFDNR_1 = ', @INSERT_NR, ' AND ', @IS_CHILD, ' = 0 THEN 1 ');
    SET @SQL += ' ELSE 0 END ';
    SET @SQL += ' , LFDNR_2 = LFDNR_2 + 2 ';
    SET @SQL += CONCAT('WHERE LFDNR_2 > ', @INSERT_NR);
    EXEC (@SQL);
    /* Einfügen des Elementes */
    SET @SQL = CONCAT('INSERT INTO ',@Hierarchietabelle);
    SET @SQL +='(LFDNR_1, LFDNR_2, FATHER, LAYER, ID, TITLE');
    IF @TABLE = 'CATALOG' 
     BEGIN
       SET @SQL +=',ATTRIBUT';
    END;
    SET @SQL +=') SELECT ';
    SET @SQL += CONCAT(@INSERT_NR + @IS_CHILD, ', ', @INSERT_NR + @IS_CHILD + 1, ', SEQ, LAYER + 1, ');
    SET @SQL += CONCAT(@NEW_ID, ', ', @NEW_TITLE);
    IF @TABLE = 'CATALOG' 
     BEGIN
      SET @SQL += CONCAT(', ', @NEW_ATTRIBUT);
    END;
    SET @SQL += CONCAT(' FROM ' + @TABLE);
    IF @IS_CHILD = 0 
     BEGIN
      SET @SQL += ' WHERE SEQ =(SELECT SEQ ';
      SET @SQL += CONCAT(' FROM ' + @TABLE);
      SET @SQL += ' WHERE LFDNR_1 = (SELECT MAX(LFDNR_1) ';
      SET @SQL += CONCAT(' FROM ' + @TABLE);
      SET @SQL += CONCAT(' WHERE LFDNR_1 < '. @INSERT_NR);
      SET @SQL += CONCAT('   AND LFDNR_2 > '. @INSERT_NR);
      SET @SQL += '))';
     END;
    ELSE
     BEGIN
      SET @SQL += CONCAT(' WHERE LFDNR_1 = '. @INSERT_NR);
    END; 
    EXEC (@SQL);
  END;
CREATE PROCEDURE SP_HIERACHY_ADD_CHILD
  (
    @TABLE SYSNAME = 'DESIGN'
  , @FATHER_ID NVARCHAR(10) = '_'   
  , @NEW_ID NVARCHAR(10) = '_'
  , @NEW_TITLE NVARCHAR(255) = 'neu'
  , @NEW_ATTRIBUT NVARCHAR(10) = ''
  )
  AS
  BEGIN
    DECLARE @SQL NVARCHAR(MAX)
          , @IS_CHILD INT = 1
          , @INSERT_NR INT = 0;
    SET @SQL  = 'DECLARE CUR_NR CURSOR FOR ';
    SET @SQL += ' SELECT LFDNR_1 ';
    SET @SQL += CONCAT(' FROM ' + @TABLE);
    SET @SQL += CONCAT(' WHERE ID = '''. @FATHER_ID,'''');
    OPEN CUR_NR;
    FETCH NEXT FROM CUR_NR INTO @INSERT_NR,
    CLOSE CUR_NR;
    DEALLOCATE CUR_NR;
    IF @INSERT_NR > 0
     BEGIN
      EXEC SP_HIERACHY_ADD_ITEM(@TABLE, @IS_CHILD, @INSERT_NR, @NEW_ID, @NEW_TITLE, @NEW_ATTRIBUT);
    END;
  END;  
CREATE PROCEDURE SP_HIERACHY_ADD_BEFORE
  (
    @TABLE SYSNAME = 'DESIGN'
  , @INSERT_ID NVARCHAR(10) = '_'   
  , @NEW_ID NVARCHAR(10) = '_'
  , @NEW_TITLE NVARCHAR(255) = 'neu'
  , @NEW_ATTRIBUT NVARCHAR(10) = ''
  )
  AS
  BEGIN
    DECLARE @SQL NVARCHAR(MAX)
          , @IS_CHILD INT = 0
          , @INSERT_NR INT = 0;
    SET @SQL  = 'DECLARE CUR_NR CURSOR FOR ';
    SET @SQL += ' SELECT LFDNR_1 ';
    SET @SQL += CONCAT(' FROM ' + @TABLE);
    SET @SQL += CONCAT(' WHERE ID = '''. @INSERT_ID,'''');
    OPEN CUR_NR;
    FETCH NEXT FROM CUR_NR INTO @INSERT_NR,
    CLOSE CUR_NR;
    DEALLOCATE CUR_NR;
    IF @INSERT_NR > 0
     BEGIN
      EXEC SP_HIERACHY_ADD_ITEM(@TABLE, @IS_CHILD, @INSERT_NR, @NEW_ID, @NEW_TITLE, @NEW_ATTRIBUT);
    END;
  END;  
CREATE VIEW CATALOG_TREE 
  AS
  SELECT CONCAT(Replicate(' ',3 * LAYER),TITLE) AS CATALOG_TREE_ITEM
       , ID, TITLE, ATTRIBUT
       , LAYER, LFDNR_1 AS SORT, LFDNR_2 AS BRANCH_END
       , LAYER, SEQ AS IDENT, FATHER AS FATHER_IDENT
    FROM CATALOG
   ORDER BY LFDNR_1;
CREATE VIEW LOCATION_TREE 
  AS
  SELECT CONCAT(Replicate(' ',3 * LAYER),TITLE) AS LOCATION_TREE_ITEM
       , ID, TITLE
       , LAYER, LFDNR_1 AS SORT, LFDNR_2 AS BRANCH_END
       , LAYER, SEQ AS IDENT, FATHER AS FATHER_IDENT
    FROM LOCATION
   ORDER BY LFDNR_1;
CREATE VIEW DESIGN_TREE 
  AS
  SELECT CONCAT(Replicate(' ',3 * LAYER),TITLE) AS DESIGN_TREE_ITEM
       , ID, TITLE
       , LAYER, LFDNR_1 AS SORT, LFDNR_2 AS BRANCH_END
       , LAYER, SEQ AS IDENT, FATHER AS FATHER_IDENT
    FROM DESIGN
   ORDER BY LFDNR_1;