-- SMT Database and Table server 
DROP DATABASE IF EXISTS SMT;
CREATE DATABASE SMT;
USE SMT;
CREATE TABLE IF NOT EXISTS Users
(
	user_id		INT		PRIMARY KEY 	AUTO_INCREMENT,
	username	VARCHAR(255)	NOT NULL,
	password	VARCHAR(255)	NOT NULL,
	first_name	VARCHAR(50)		DEFAULT NULL,
	last_name	VARCHAR(50)		DEFAULT NULL,
	email		VARCHAR(100)	DEFAULT NULL,
	phone		VARCHAR(14)		DEFAULT NULL
);

CREATE TABLE IF NOT EXISTS Players
(
	player_id	INT		PRIMARY KEY	AUTO_INCREMENT,
	name		VARCHAR(100)	NOT NULL,
	user_id		 INT			NOT NULL,
	lvl			 INT			DEFAULT 1,
	race		 VARCHAR(50)	DEFAULT "Human",
	hp			 INT			DEFAULT 30,
	mp			 INT			DEFAULT 30,
	st			 INT			DEFAULT 10,
	dx			 INT			DEFAULT 10, 
	ma			 INT			DEFAULT 10,  
	ag			 INT			DEFAULT 10,
	lu			 INT			DEFAULT 10,
    NeutRank     INT 			DEFAULT 0,
    notes        VARCHAR(40000)	DEFAULT " ",
	FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

CREATE TABLE IF NOT EXISTS Demons
(
	demon_id	INT	PRIMARY KEY	AUTO_INCREMENT,
	race		VARCHAR(50)	NOT NULL,
	lvl			INT			NOT NULL,
	name		VARCHAR(50)	NOT NULL,
	hp			INT			NOT NULL,
	mp			INT			NOT NULL,
	st			INT			NOT NULL,
	dx			INT			NOT NULL,
	ma			INT			NOT NULL,
	ag			INT			NOT NULL,
	lu			INT			NOT NULL
--	player_id	INT,
--	FOREIGN KEY (player_id) REFERENCES Players(player_id)		
);

CREATE TABLE IF NOT EXISTS Resistances
(
    res_id      INT PRIMARY KEY AUTO_INCREMENT,
	demon_id    INT			DEFAULT NULL,
    player_id   INT			DEFAULT NULL,
	dark		VARCHAR(10) DEFAULT '-',
	elec		VARCHAR(10) DEFAULT '-',
	fire		VARCHAR(10) DEFAULT '-',
	theforce	VARCHAR(10) DEFAULT '-',
	gun 		VARCHAR(10) DEFAULT '-',
	ice 		VARCHAR(10) DEFAULT '-',
	light		VARCHAR(10) DEFAULT '-',
	phys		VARCHAR(10) DEFAULT '-',
	FOREIGN KEY (demon_id) REFERENCES Demons(demon_id),
	FOREIGN KEY (player_id) REFERENCES Players(player_id)
);

CREATE TABLE IF NOT EXISTS Affinities
(
  aff_id    INT PRIMARY KEY AUTO_INCREMENT,
	demon_id	INT NOT NULL,
	ailment		INT	DEFAULT 0,
	almighty	INT DEFAULT 0,
	auxilary	INT DEFAULT 0,
	dark    	INT DEFAULT 0,
	elec		INT DEFAULT 0,
	fire		INT DEFAULT 0,
	theforce	INT DEFAULT 0,
	gun			INT DEFAULT 0,
	ice			INT DEFAULT 0,
	light		INT DEFAULT 0,
	phys		INT DEFAULT 0,
	recovery	INT DEFAULT 0,
	FOREIGN KEY (demon_id) REFERENCES Demons(demon_id)
);

CREATE TABLE IF NOT EXISTS Skills
(
  skill_id	      INT		PRIMARY KEY	AUTO_INCREMENT,
  name		      VARCHAR(100)	 default '',
  first_icon      VARCHAR(100)   default '',
  hits            VARCHAR(20)    default '',
  mp_cost         INT            default 0,
  power_lvl       VARCHAR(100)   default '',
  skill_rank      INT            default 0,
  second_icon     VARCHAR(100)   default '',
  smirk_effect    VARCHAR(100)   default '',
  target          VARCHAR(100)   default '',
  uni_cost        VARCHAR(100)   default '',
  comments        VARCHAR(40000) default ''
);

CREATE TABLE IF NOT EXISTS Demon_Skills
(
	demon_id	INT	NOT NULL,
	skill_id	INT	NOT NULL,
    skill_lvl   INT DEFAULT 0,
	FOREIGN KEY (demon_id) REFERENCES Demons(demon_id),
	FOREIGN KEY (skill_id) REFERENCES Skills(skill_id)
);