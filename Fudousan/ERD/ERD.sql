
/* Drop Triggers */

DROP TRIGGER TRI_AGENCY_ID;
DROP TRIGGER TRI_ESTATE_ID;
DROP TRIGGER TRI_ITEM_ID;
DROP TRIGGER TRI_ITEM_TYPE_ID;
DROP TRIGGER TRI_MEMBER_FILE_ID;
DROP TRIGGER TRI_Member_ID;
DROP TRIGGER TRI_PERMISSION_ID;
DROP TRIGGER TRI_REF_SITE_ID;
DROP TRIGGER TRI_REPLY_ID;
DROP TRIGGER TRI_ROOMITEM_ID;
DROP TRIGGER TRI_ROOM_ID;
DROP TRIGGER TRI_TEXTURE_ID;
DROP TRIGGER TRI_TEXTURE_TYPE_ID;
DROP TRIGGER TRI_WALL_CONNECTOR_ID;



/* Drop Tables */

DROP TABLE ADVICE CASCADE CONSTRAINTS;
DROP TABLE ENTRY CASCADE CONSTRAINTS;
DROP TABLE AGENCY CASCADE CONSTRAINTS;
DROP TABLE FAVORITE CASCADE CONSTRAINTS;
DROP TABLE REPLY CASCADE CONSTRAINTS;
DROP TABLE ROOMITEM CASCADE CONSTRAINTS;
DROP TABLE ROOM_WALL CASCADE CONSTRAINTS;
DROP TABLE ROOM CASCADE CONSTRAINTS;
DROP TABLE ESTATE CASCADE CONSTRAINTS;
DROP TABLE REF_SITE CASCADE CONSTRAINTS;
DROP TABLE ITEM CASCADE CONSTRAINTS;
DROP TABLE ITEM_TYPE CASCADE CONSTRAINTS;
DROP TABLE MEMBER_FILE CASCADE CONSTRAINTS;
DROP TABLE TEXTURE CASCADE CONSTRAINTS;
DROP TABLE MEMBER CASCADE CONSTRAINTS;
DROP TABLE MunicipalityCode CASCADE CONSTRAINTS;
DROP TABLE PERMISSION CASCADE CONSTRAINTS;
DROP TABLE ROOM_WALL_CONNECTOR CASCADE CONSTRAINTS;
DROP TABLE TEXTURE_TYPE CASCADE CONSTRAINTS;
DROP TABLE TRANS_TYPE CASCADE CONSTRAINTS;



/* Drop Sequences */

DROP SEQUENCE SEQ_AGENCY_ID;
DROP SEQUENCE SEQ_ESTATE_ID;
DROP SEQUENCE SEQ_ITEM_ID;
DROP SEQUENCE SEQ_ITEM_TYPE_ID;
DROP SEQUENCE SEQ_MEMBER_FILE_ID;
DROP SEQUENCE SEQ_Member_ID;
DROP SEQUENCE SEQ_PERMISSION_ID;
DROP SEQUENCE SEQ_REF_SITE_ID;
DROP SEQUENCE SEQ_REPLY_ID;
DROP SEQUENCE SEQ_ROOMITEM_ID;
DROP SEQUENCE SEQ_ROOM_ID;
DROP SEQUENCE SEQ_TEXTURE_ID;
DROP SEQUENCE SEQ_TEXTURE_TYPE_ID;
DROP SEQUENCE SEQ_WALL_CONNECTOR_ID;




/* Create Sequences */

CREATE SEQUENCE SEQ_AGENCY_ID INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_ESTATE_ID INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_ITEM_ID INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_ITEM_TYPE_ID INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_MEMBER_FILE_ID INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_Member_ID INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_PERMISSION_ID INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_REF_SITE_ID INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_REPLY_ID INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_ROOMITEM_ID INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_ROOM_ID INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_TEXTURE_ID INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_TEXTURE_TYPE_ID INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_WALL_CONNECTOR_ID INCREMENT BY 1 START WITH 1;



/* Create Tables */

CREATE TABLE ADVICE
(
	REQUEST_MEMBER_ID number NOT NULL,
	REQUESTED_MEMEBER_ID number NOT NULL,
	ROOM_ID number NOT NULL,
	CRE_DATE date DEFAULT SYSDATE NOT NULL,
	ID varchar2(100) NOT NULL UNIQUE,
	REQUEST_DATE date DEFAULT SYSDATE NOT NULL,
	PRIMARY KEY (REQUEST_MEMBER_ID, REQUESTED_MEMEBER_ID, ROOM_ID)
);


CREATE TABLE AGENCY
(
	AGENCY_ID number NOT NULL,
	MEMBER_ID number NOT NULL,
	NAME varchar2(100) NOT NULL,
	BIZNUM varchar2(50) NOT NULL,
	ADDRESS_MAIN varchar2(10) NOT NULL,
	ADDRESS_MIDDLE varchar2(10) NOT NULL,
	ADDRESS_SMALL varchar2(10) NOT NULL,
	ADDRESS_SUB varchar2(1000),
	TEXT varchar2(1000),
	TRANS_TYPE_ID number(3) NOT NULL UNIQUE,
	CONFIRM number(1) DEFAULT 0 NOT NULL,
	CRE_DATE date DEFAULT SYSDATE NOT NULL,
	DEL_DATE date,
	GPS_X number,
	GPS_Y number,
	PRIMARY KEY (AGENCY_ID)
);


CREATE TABLE ENTRY
(
	AGENCY_ID number NOT NULL,
	ESTATE_ID number NOT NULL,
	CRE_DATE date DEFAULT SYSDATE NOT NULL,
	PRICE number NOT NULL,
	PRIMARY KEY (AGENCY_ID, ESTATE_ID)
);


CREATE TABLE ESTATE
(
	ESTATE_ID number NOT NULL,
	TRANS_TYPE_ID number(3) NOT NULL,
	Region varchar2(10),
	MunicipalityCode_ID number NOT NULL,
	Prefecture varchar2(10),
	Municipality varchar2(10),
	DistrictName varchar2(10),
	NearestStation varchar2(50),
	TimeToNearestStation number,
	TradePrice number,
	PricePerUnit number,
	FloorPlan varchar2(10),
	Area number,
	UnitPrice number,
	LandShape varchar2(10),
	Frontage number,
	TotalFloorArea number,
	BuildingYear varchar2(10),
	Structure varchar2(10),
	Use varchar2(10),
	Purpose varchar2(50),
	Direction varchar2(10),
	Classification varchar2(10),
	Breadth number,
	CityPlanning varchar2(50),
	CoverageRatio number,
	FloorAreaRatio number,
	Period varchar2(50),
	Renovation varchar2(10),
	Remarks varchar2(100),
	DEL_DATE date,
	PRIMARY KEY (ESTATE_ID)
);


CREATE TABLE FAVORITE
(
	MEMBER_ID number NOT NULL,
	ESTATE_ID number NOT NULL,
	CRE_DATE date DEFAULT SYSDATE NOT NULL,
	PRIMARY KEY (MEMBER_ID, ESTATE_ID)
);


CREATE TABLE ITEM
(
	ITEM_ID number NOT NULL,
	ITEM_TYPE_ID number NOT NULL,
	ITEM_NAME varchar2(100) NOT NULL,
	TEXT varchar2(1000),
	TEXTURE_FILE varchar2(100) NOT NULL,
	PRIMARY KEY (ITEM_ID)
);


CREATE TABLE ITEM_TYPE
(
	ITEM_TYPE_ID number NOT NULL,
	ITME_TYPE_NAME varchar2(100),
	PRIMARY KEY (ITEM_TYPE_ID)
);


CREATE TABLE MEMBER
(
	MEMBER_ID number NOT NULL,
	EMAIL varchar2(50) NOT NULL UNIQUE,
	PASSWORD varchar2(20) NOT NULL,
	PHONE varchar2(30),
	PICTURE varchar2(100),
	TEXT varchar2(1000),
	CRE_DATE date DEFAULT SYSDATE NOT NULL,
	DEL_DATE date,
	PERMISSION_ID number NOT NULL,
	DESIGNER number(1) DEFAULT 0 NOT NULL,
	PRIMARY KEY (MEMBER_ID)
);


CREATE TABLE MEMBER_FILE
(
	MEMBER_FILE_ID number NOT NULL,
	MEMBER_ID number NOT NULL,
	ORIGIN_NAME varchar2(100) NOT NULL,
	SERVER_NAME varchar2(100) NOT NULL,
	CRE_DATE date DEFAULT SYSDATE NOT NULL,
	TITLE varchar2(100),
	TEXT varchar2(1000),
	PRIMARY KEY (MEMBER_FILE_ID)
);


CREATE TABLE MunicipalityCode
(
	MunicipalityCode_ID number NOT NULL,
	CODE_NAME varchar2(10) NOT NULL,
	PRIMARY KEY (MunicipalityCode_ID)
);


CREATE TABLE PERMISSION
(
	PERMISSION_ID number NOT NULL,
	NAME varchar2(10),
	PRIMARY KEY (PERMISSION_ID)
);


CREATE TABLE REF_SITE
(
	ID number NOT NULL,
	URL varchar2(1000) NOT NULL,
	CRE_DATE date DEFAULT SYSDATE NOT NULL,
	TEXT varchar2(1000),
	ITEM_ID number NOT NULL,
	PRIMARY KEY (ID)
);


CREATE TABLE REPLY
(
	REPLY_ID number NOT NULL,
	ESTATE_ID number NOT NULL,
	MEMBER_ID number NOT NULL,
	TEXT varchar2(1000),
	CRE_DATE date DEFAULT SYSDATE,
	PRIMARY KEY (REPLY_ID)
);


CREATE TABLE ROOM
(
	ROOM_ID number NOT NULL,
	ESTATE_ID number,
	SNAPSHOT varchar2(50),
	MAP varchar2(50),
	CRE_DATE date DEFAULT SYSDATE,
	DEL_DATE date,
	HEIGTH number,
	FLOOR_TEXTURE_ID number,
	CEILING_TEXTURE_ID number,
	MEMBER_ID number NOT NULL,
	PRIMARY KEY (ROOM_ID)
);


CREATE TABLE ROOMITEM
(
	ROOMITEM_ID number NOT NULL,
	ROOM_ID number NOT NULL,
	ITEM_ID number NOT NULL,
	X number,
	Y number,
	Z number,
	ROTATE_X number,
	ROTATE_Y number,
	ROTATE_Z number,
	COLOR number,
	PRIMARY KEY (ROOMITEM_ID)
);


CREATE TABLE ROOM_WALL
(
	ROOM_ID number NOT NULL,
	CONNECTOR_ID1 number NOT NULL,
	CONNECTOR_ID2 number NOT NULL,
	TYPE varchar2(10) NOT NULL,
	FRONT_TEXTURE_ID number NOT NULL,
	BACK_TEXTURE_ID number NOT NULL,
	PRIMARY KEY (ROOM_ID, CONNECTOR_ID1, CONNECTOR_ID2)
);


CREATE TABLE ROOM_WALL_CONNECTOR
(
	CONNECTOR_ID number NOT NULL,
	X number NOT NULL,
	Y number NOT NULL,
	PRIMARY KEY (CONNECTOR_ID)
);


CREATE TABLE TEXTURE
(
	TEXTURE_ID number NOT NULL,
	TEXTURE_TYPE_ID number NOT NULL,
	MEMBER_ID number NOT NULL,
	TEXTURE_NAME varchar2(100),
	TEXT varchar2(100),
	TEXTURE_FILE varchar2(100) NOT NULL,
	CRE_DATE date DEFAULT SYSDATE NOT NULL,
	DEL_DATE date,
	PRIMARY KEY (TEXTURE_ID)
);


CREATE TABLE TEXTURE_TYPE
(
	TEXTURE_TYPE_ID number NOT NULL,
	NAME varchar2(20),
	TEXT varchar2(1000),
	PRIMARY KEY (TEXTURE_TYPE_ID)
);


CREATE TABLE TRANS_TYPE
(
	TRANS_TYPE_ID number(3) NOT NULL,
	TRANS_NAME varchar2(100) NOT NULL,
	PRIMARY KEY (TRANS_TYPE_ID)
);



/* Create Foreign Keys */

ALTER TABLE ENTRY
	ADD FOREIGN KEY (AGENCY_ID)
	REFERENCES AGENCY (AGENCY_ID)
;


ALTER TABLE ENTRY
	ADD FOREIGN KEY (ESTATE_ID)
	REFERENCES ESTATE (ESTATE_ID)
;


ALTER TABLE FAVORITE
	ADD FOREIGN KEY (ESTATE_ID)
	REFERENCES ESTATE (ESTATE_ID)
;


ALTER TABLE REPLY
	ADD FOREIGN KEY (ESTATE_ID)
	REFERENCES ESTATE (ESTATE_ID)
;


ALTER TABLE ROOM
	ADD FOREIGN KEY (ESTATE_ID)
	REFERENCES ESTATE (ESTATE_ID)
;


ALTER TABLE REF_SITE
	ADD FOREIGN KEY (ITEM_ID)
	REFERENCES ITEM (ITEM_ID)
;


ALTER TABLE ROOMITEM
	ADD FOREIGN KEY (ITEM_ID)
	REFERENCES ITEM (ITEM_ID)
;


ALTER TABLE ITEM
	ADD FOREIGN KEY (ITEM_TYPE_ID)
	REFERENCES ITEM_TYPE (ITEM_TYPE_ID)
;


ALTER TABLE ADVICE
	ADD FOREIGN KEY (REQUEST_MEMBER_ID)
	REFERENCES MEMBER (MEMBER_ID)
;


ALTER TABLE ADVICE
	ADD FOREIGN KEY (REQUESTED_MEMEBER_ID)
	REFERENCES MEMBER (MEMBER_ID)
;


ALTER TABLE AGENCY
	ADD FOREIGN KEY (MEMBER_ID)
	REFERENCES MEMBER (MEMBER_ID)
;


ALTER TABLE FAVORITE
	ADD FOREIGN KEY (MEMBER_ID)
	REFERENCES MEMBER (MEMBER_ID)
;


ALTER TABLE MEMBER_FILE
	ADD FOREIGN KEY (MEMBER_ID)
	REFERENCES MEMBER (MEMBER_ID)
;


ALTER TABLE REPLY
	ADD FOREIGN KEY (MEMBER_ID)
	REFERENCES MEMBER (MEMBER_ID)
;


ALTER TABLE ROOM
	ADD FOREIGN KEY (MEMBER_ID)
	REFERENCES MEMBER (MEMBER_ID)
;


ALTER TABLE TEXTURE
	ADD FOREIGN KEY (MEMBER_ID)
	REFERENCES MEMBER (MEMBER_ID)
;


ALTER TABLE ESTATE
	ADD FOREIGN KEY (MunicipalityCode_ID)
	REFERENCES MunicipalityCode (MunicipalityCode_ID)
;


ALTER TABLE MEMBER
	ADD FOREIGN KEY (PERMISSION_ID)
	REFERENCES PERMISSION (PERMISSION_ID)
;


ALTER TABLE ADVICE
	ADD FOREIGN KEY (ROOM_ID)
	REFERENCES ROOM (ROOM_ID)
;


ALTER TABLE ROOMITEM
	ADD FOREIGN KEY (ROOM_ID)
	REFERENCES ROOM (ROOM_ID)
;


ALTER TABLE ROOM_WALL
	ADD FOREIGN KEY (ROOM_ID)
	REFERENCES ROOM (ROOM_ID)
;


ALTER TABLE ROOM_WALL
	ADD FOREIGN KEY (CONNECTOR_ID2)
	REFERENCES ROOM_WALL_CONNECTOR (CONNECTOR_ID)
;


ALTER TABLE ROOM_WALL
	ADD FOREIGN KEY (CONNECTOR_ID1)
	REFERENCES ROOM_WALL_CONNECTOR (CONNECTOR_ID)
;


ALTER TABLE ROOM
	ADD FOREIGN KEY (CEILING_TEXTURE_ID)
	REFERENCES TEXTURE (TEXTURE_ID)
;


ALTER TABLE ROOM
	ADD FOREIGN KEY (FLOOR_TEXTURE_ID)
	REFERENCES TEXTURE (TEXTURE_ID)
;


ALTER TABLE ROOM_WALL
	ADD FOREIGN KEY (FRONT_TEXTURE_ID)
	REFERENCES TEXTURE (TEXTURE_ID)
;


ALTER TABLE ROOM_WALL
	ADD FOREIGN KEY (BACK_TEXTURE_ID)
	REFERENCES TEXTURE (TEXTURE_ID)
;


ALTER TABLE TEXTURE
	ADD FOREIGN KEY (TEXTURE_TYPE_ID)
	REFERENCES TEXTURE_TYPE (TEXTURE_TYPE_ID)
;


ALTER TABLE AGENCY
	ADD FOREIGN KEY (TRANS_TYPE_ID)
	REFERENCES TRANS_TYPE (TRANS_TYPE_ID)
;


ALTER TABLE ESTATE
	ADD FOREIGN KEY (TRANS_TYPE_ID)
	REFERENCES TRANS_TYPE (TRANS_TYPE_ID)
;



/* Create Triggers */

CREATE OR REPLACE TRIGGER TRI_AGENCY_ID BEFORE INSERT ON AGENCY
FOR EACH ROW
BEGIN
	SELECT SEQ_AGENCY_ID.nextval
	INTO :new.AGENCY_ID
	FROM dual;
END;

/

CREATE OR REPLACE TRIGGER TRI_ESTATE_ID BEFORE INSERT ON ESTATE
FOR EACH ROW
BEGIN
	SELECT SEQ_ESTATE_ID.nextval
	INTO :new.ESTATE_ID
	FROM dual;
END;

/

CREATE OR REPLACE TRIGGER TRI_ITEM_ID BEFORE INSERT ON ITEM
FOR EACH ROW
BEGIN
	SELECT SEQ_ITEM_ID.nextval
	INTO :new.ITEM_ID
	FROM dual;
END;

/

CREATE OR REPLACE TRIGGER TRI_ITEM_TYPE_ID BEFORE INSERT ON ITEM_TYPE
FOR EACH ROW
BEGIN
	SELECT SEQ_ITEM_TYPE_ID.nextval
	INTO :new.ITEM_TYPE_ID
	FROM dual;
END;

/

CREATE OR REPLACE TRIGGER TRI_MEMBER_FILE_ID BEFORE INSERT ON MEMBER_FILE
FOR EACH ROW
BEGIN
	SELECT SEQ_MEMBER_FILE_ID.nextval
	INTO :new.MEMBER_FILE_ID
	FROM dual;
END;

/

CREATE OR REPLACE TRIGGER TRI_Member_ID BEFORE INSERT ON Member
FOR EACH ROW
BEGIN
	SELECT SEQ_Member_ID.nextval
	INTO :new.Member_ID
	FROM dual;
END;

/

CREATE OR REPLACE TRIGGER TRI_PERMISSION_ID BEFORE INSERT ON PERMISSION
FOR EACH ROW
BEGIN
	SELECT SEQ_PERMISSION_ID.nextval
	INTO :new.PERMISSION_ID
	FROM dual;
END;

/

CREATE OR REPLACE TRIGGER TRI_REF_SITE_ID BEFORE INSERT ON REF_SITE
FOR EACH ROW
BEGIN
	SELECT SEQ_REF_SITE_ID.nextval
	INTO :new.ID
	FROM dual;
END;

/

CREATE OR REPLACE TRIGGER TRI_REPLY_ID BEFORE INSERT ON REPLY
FOR EACH ROW
BEGIN
	SELECT SEQ_REPLY_ID.nextval
	INTO :new.REPLY_ID
	FROM dual;
END;

/

CREATE OR REPLACE TRIGGER TRI_ROOMITEM_ID BEFORE INSERT ON ROOMITEM
FOR EACH ROW
BEGIN
	SELECT SEQ_ROOMITEM_ID.nextval
	INTO :new.ROOMITEM_ID
	FROM dual;
END;

/

CREATE OR REPLACE TRIGGER TRI_ROOM_ID BEFORE INSERT ON ROOM
FOR EACH ROW
BEGIN
	SELECT SEQ_ROOM_ID.nextval
	INTO :new.ROOM_ID
	FROM dual;
END;

/

CREATE OR REPLACE TRIGGER TRI_TEXTURE_ID BEFORE INSERT ON TEXTURE
FOR EACH ROW
BEGIN
	SELECT SEQ_TEXTURE_ID.nextval
	INTO :new.TEXTURE_ID
	FROM dual;
END;

/

CREATE OR REPLACE TRIGGER TRI_TEXTURE_TYPE_ID BEFORE INSERT ON TEXTURE_TYPE
FOR EACH ROW
BEGIN
	SELECT SEQ_TEXTURE_TYPE_ID.nextval
	INTO :new.TEXTURE_TYPE_ID
	FROM dual;
END;

/

CREATE OR REPLACE TRIGGER TRI_WALL_CONNECTOR_ID BEFORE INSERT ON ROOM_WALL_CONNECTOR
FOR EACH ROW
BEGIN
	SELECT SEQ_WALL_CONNECTOR_ID.nextval
	INTO :new.CONNECTOR_ID
	FROM dual;
END;

/




