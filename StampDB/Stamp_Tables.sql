USE STAMPS
GO
CREATE TABLE CATALOG
  (
    CATNR INT IDENTITY(1,1) NOT NULL
  , LFDNR_1 INT NULL
  , LFDNR_2 INT NULL
  , FATHER INT NOT NULL
  , LAYER INT NULL
  , ID NVARCHAR(10)
  , TITLE NVARCHAR(255)
  , ATTRIBUT NVARCHAR(10)  
  , CONSTRAINT PK_CATALOG PRIMARY KEY (CATNR)
  , CONSTRAINT SFK_CATALOG FOREIGN KEY (FATHER) REFERENCES CATALOG(CATNR)
  , INDEX IX_CATALOG_LFDNR_1 (LFDNR_1)
  )
  GO
CREATE TABLE LOCATION
  (
    LOCNR INT IDENTITY(1,1) NOT NULL
  , LFDNR_1 INT NULL
  , LFDNR_2 INT NULL
  , FATHER INT NOT NULL
  , LAYER INT NULL
  , ID NVARCHAR(10)
  , TITLE NVARCHAR(255)
  , CONSTRAINT PK_LOCATION PRIMARY KEY (LOCNR)
  , CONSTRAINT SFK_LOCATION FOREIGN KEY (FATHER) REFERENCES CATALOG(LOCNR)
  , INDEX IX_LOCATION_LFDNR_1 (LFDNR_1)
  )
  GO
CREATE TABLE STATE
  (
    STNR INT IDENTITY(1,1) NOT NULL
  , STID NVARCHAR(10) NULL
  , STATE_TITLE NVARCHAR(255) NULL
  , LOCNR INT NULL
  , ORIGINAL_STATE_TITLE NVARCHAR(255) NULL
  , POPULATION INT NULL
  , AREA INT NULL
  , INFO VARCHAR(MAX)
  , CONSTRAINT PK_STATE PRIMARY KEY (STNR)
  , CONSTRAINT FK_STATE_LOCNR FOREIGN KEY (LOCNR) REFERENCES LOCATION(LOCNR)
  ) 
  GO
CREATE TABLE PIC
  (
    PICNR INT IDENTITY(1,1) NOT NULL
  , PIC_PATH NVARCHAR(255) NULL
  , PIC_TITLE NVARCHAR(255) NULL
  , PIC VARBINARY(MAX) NULL   
  , CONSTRAINT PK_PIC PRIMARY KEY (PICNR)
  )
  GO
CREATE TABLE REGION
  (
    REGNR INT IDENTITY(1,1) NOT NULL
  , REGID NVARCHAR(10) NULL
  , REGION_TITLE NVARCHAR(255) NULL
  , ORIGINAL_REGION_TITLE NVARCHAR(255) NULL
  , CATNR INT NULL
  , CAT_PAGE INT NULL
  , MAIN_REGNR INT NULL
  , ALNR INT NULL
  , AL_PAGE INT NULL
  , MIN_JAHR INT NULL
  , MAX_JAHR INT NULL
  , MIN_MINR INT NULL
  , MAX_MINR INT NULL
  , FLAG_PICNR INT NULL
  , ARMS_PICNR INT NULL
  , IS_COLLECTED INT NULL
  , IS_NOT_PRINTED_CORRECT INT NULL
  , INFO VARCHAR(MAX)  
  , CONSTRAINT PK_REGION PRIMARY KEY (REGNR)
  , CONSTRAINT SFK_REGION FOREIGN KEY (MAIN_REGNR) REFERENCES REGION(REGNR) 
  , CONSTRAINT FK_REGION_CATALOG FOREIGN KEY (CATNR) REFERENCES CATALOG(CATNR)
  , CONSTRAINT FK_REGION_ALBUM FOREIGN KEY (ALNR) REFERENCES ALBUM(ALNR)
  , CONSTRAINT FK_REGION_FLAG_PIC FOREIGN KEY (FLAG_PICNR) REFERENCES PIC(PICNR)
  , CONSTRAINT FK_REGION_ARMS_PIC FOREIGN KEY (ARMS_PICNR) REFERENCES PIC(PICNR)
  )
  GO
CREATE TABLE STATE_REGION 
  (
    STREGNR INT IDENTITY(1,1) NOT NULL
  , REGNR INT NULL
  , STNR INT NULL
  , CONSTRAINT PK_STATE_REGION PRIMARY KEY (STREGNR)  
  , CONSTRAINT FK_STATE_REGION_REGION FOREIGN KEY (REGNR) REFERENCES REGION(REGNR)
  , CONSTRAINT FK_STATE_REGION_STATE FOREIGN KEY (STNR) REFERENCES STATE(STNR)
  , CONSTRAINT U_REGNR_STNR UNIQUE (REGNR, STNR)
  )
  GO 
CREATE TABLE ALBUM
  (
    ALNR INT IDENTITY(1,1) NOT NULL
  , ALNR_OLD INT NULL
  , LOCNR INT NOT NULL
  , REGAL INT NULL
  , REGALNR INT NULL
  , ALBUM_TITLE NVARCHAR(255) NOT NULL
  , CREATOR NVARCHAR(50) NULL
  , TYPE NVARCHAR(50) NULL
  , ALBUM_COLOR NVARCHAR(50) NULL
  , NUMBER_OF_SHEETS INT NULL
  , SHEET_COLOR NVARCHAR(50) NULL
  , NUMBER_OF_LINES INT NULL
  , COLLECTOR NVARCHAR(50) NULL
  , SORT INT NULL
  , CONSTRAINT PK_ALBUM PRIMARY KEY (ALNR)
  , CONSTRAINT FK_ALBUM_LOCNR FOREIGN KEY (LOCNR) REFERENCES LOCATION(LOCNR)
  )
  GO
CREATE TABLE CATALOG_ALBUM
  (
    CATALNR INT IDENTITY(1,1) NOT NULL
  , CATNR INT NULL
  , ALNR INT NULL
  , CONSTRAINT PK_CATALOG_ALBUM PRIMARY KEY (CATALNR)  
  , CONSTRAINT FK_CATALOG_ALBUM_CATALOG FOREIGN KEY (CATNR) REFERENCES CATALOG(CATNR)
  , CONSTRAINT FK_CATALOG_ALBUM_ALBUM FOREIGN KEY (ALNR) REFERENCES ALBUM(ALNR)
  , CONSTRAINT U_CATNR_ALNR UNIQUE (CATNR, ALNR)
  )
  GO
CREATE TABLE MARKER
  (
    MKNR INT IDENTITY(1,1) NOT NULL
  , MARKER_TITLE NVARCHAR(100) NOT NULL
  , CONSTRAINT PK_MARKER PRIMARY KEY (MKNR)  
  )
  GO
CREATE TABLE ALBUM_MARKER
  (
    ALMKNR INT IDENTITY(1,1) NOT NULL
  , ALNR INT NULL
  , MKNR INT NULL
  , CONSTRAINT PK_ALBUM_MARKER PRIMARY KEY (ALMKNR) 
  , CONSTRAINT FK_ALBUM_MARKER_MARKER FOREIGN KEY (MKNR) REFERENCES MARKER(MKNR)
  , CONSTRAINT FK_ALBUM_MARKER_ALBUM FOREIGN KEY (ALNR) REFERENCES ALBUM(ALNR) 
  , CONSTRAINT U_MKNR_ALNR UNIQUE (MKNR, ALNR)
  )
  GO
CREATE TABLE ALBUM_PAGE
  (
    ALPGNR INT IDENTITY(1,1) NOT NULL
  , ALNR INT NULL
  , PGNR INT NULL
  , CONSTRAINT PK_ALBUM_PAGE PRIMARY KEY (ALPGNR)  
  , CONSTRAINT FK_ALBUM_PAGE_PAGE FOREIGN KEY (PGNR) REFERENCES PAGE(MKNR)
  , CONSTRAINT FK_ALBUM_PAGE_ALBUM FOREIGN KEY (ALNR) REFERENCES ALBUM(ALNR) 
  , CONSTRAINT U_MKNR_ALNR UNIQUE (MKNR, ALNR)
  )
  GO
CREATE TABLE ALBUM_PAGE_PART
  (
    ALPGPTNR INT IDENTITY(1,1) NOT NULL
  , ALPGNR INT NULL
  , PARTNR INT NULL
  , SORT INT NULL
  , REGNR INT NULL
  , CONSTRAINT PK_ALBUM_PAGE_PART PRIMARY KEY (ALPGPTNR)  
  , CONSTRAINT FK_ALBUM_PAGE_PART_PAGE FOREIGN KEY (ALPGNR) REFERENCES ALBUM_PAGE(ALPGNR) 
  , CONSTRAINT FK_ALBUM_PAGE_PART_REGION FOREIGN KEY (REGNR) REFERENCES REGION(REGNR) 
  , CONSTRAINT U_PARTNR_ALPGNR UNIQUE (PARTNR, ALPGNR)
  )
  GO
CREATE TABLE CONDITION 
  (
    CONNR INT IDENTITY(1,1) NOT NULL
  , CONID NVARCHAR(10) NULL
  , ORIGINAL_CONNR INT NULL
  , CONDITION_TITLE NVARCHAR(255) 
  , CONSTRAINT PK_CONDITION PRIMARY KEY (CONNR)  
  )  
  GO
CREATE TABLE STAMP
  (
    STMNR INT IDENTITY(1,1) NOT NULL
  , MINR INT NULL
  , MINR_PRAE NVARCHAR(10) NULL
  , MINR_POST NVARCHAR(10) NULL
  , MiNR_SORT INT NULL
  , COPY_NR INT NULL
  , YEAR NVARCHAR(4) NULL
  , ENTRY_DATE DATETIME NULL
  , CONNR INT NULL
  , ALPGPTNR INT NULL
  , REGNR INT NULL
  , PICNR INT NULL
  , CONSTRAINT PK_STAMP PRIMARY KEY (STMNR)  
  , CONSTRAINT FK_STAMP_CONDITION FOREIGN KEY (CONNR) REFERENCES CONDITION(CONNR) 
  , CONSTRAINT FK_STAMP_ALBUM_PAGE_PART FOREIGN KEY (ALPGPTNR) REFERENCES ALBUM_PAGE_PART(ALPGPTNR) 
  , CONSTRAINT FK_STAMP_REGION FOREIGN KEY (REGNR) REFERENCES REGION(REGNR)  
  , CONSTRAINT FK_STAMP_PIC FOREIGN KEY (PICNR) REFERENCES PIC(PICNR)  
  )
  GO
CREATE TABLE DESIGN
  (
    DESNR INT IDENTITY(1,1) NOT NULL
  , LFDNR_1 INT NULL
  , LFDNR_2 INT NULL
  , FATHER INT NOT NULL
  , LAYER INT NULL
  , ID NVARCHAR(10)
  , TITLE NVARCHAR(255) 
  , CONSTRAINT PK_DESIGN PRIMARY KEY (DESNR)
  , CONSTRAINT SFK_DESIGN FOREIGN KEY (FATHER) REFERENCES DESIGN(DESNR)
  , INDEX IX_DESIGN_LFDNR_1 (LFDNR_1)
  )
  GO
CREATE TABLE STAMP_DESIGN
  (
    STMDESNR INT IDENTITY(1,1) NOT NULL
  , STMNR INT NULL
  , DESNR INT NULL
  , CONSTRAINT PK_STAMP_DESIGN PRIMARY KEY (STMDESNR)  
  , CONSTRAINT FK_STAMP_DESIGN_STAMP FOREIGN KEY (STMNR) REFERENCES STAMP(STMNR)
  , CONSTRAINT FK_STAMP_DESIGN_DESIGN FOREIGN KEY (DESNR) REFERENCES DESIGN(DESNR)
  , CONSTRAINT U_STMNR_DESNR UNIQUE (STMNR, DESNR)
  )
  GO