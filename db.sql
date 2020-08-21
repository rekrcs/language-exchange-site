# create DB
DROP DATABASE IF EXISTS `le`;
CREATE DATABASE `le`;
USE `le`;

# create member table
 CREATE TABLE `member` (
    id INT(10) UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    regDate DATETIME NOT NULL,
    updateDate DATETIME NOT NULL,
    delDate DATETIME NOT NULL DEFAULT '1000-01-01 00:00:00',
    authStatus TINYINT(1) UNSIGNED NOT NULL DEFAULT 0,
    delStatus TINYINT(1) UNSIGNED NOT NULL DEFAULT 0,
    loginId CHAR(20) NOT NULL UNIQUE,
    loginPw CHAR(100) NOT NULL,
    `name` CHAR(20) NOT NULL,
    `nickname` CHAR(20) NOT NULL UNIQUE,
    email CHAR(100) NOT NULL,
    nativeLang CHAR(20) NOT NULL,
    practiceLang CHAR(20) NOT NULL
 );
 
 # create board table
 CREATE TABLE board (
 id INT(10) UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
 regDate DATETIME NOT NULL,
 updateDate DATETIME NOT NULL,
 delDate DATETIME NOT NULL DEFAULT '1000-01-01 00:00:00',
 displayStatus TINYINT(1) UNSIGNED NOT NULL DEFAULT 0,
 delStatus TINYINT(1) UNSIGNED NOT NULL DEFAULT 0,
 `code` CHAR(20) NOT NULL UNIQUE,
 `name` CHAR(20) NOT NULL UNIQUE
 );
 
 # create article table
 CREATE TABLE article (
    id INT(10) UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    memberId INT(10) UNSIGNED NOT NULL,
    boardCode CHAR(20) NOT NULL,
    regDate DATETIME NOT NULL,
    updateDate DATETIME NOT NULL,
    delDate DATETIME NOT NULL DEFAULT '1000-01-01 00:00:00',
    displayStatus TINYINT(1) UNSIGNED NOT NULL DEFAULT 0,
    delStatus TINYINT(1) UNSIGNED NOT NULL DEFAULT 0,
    title CHAR(200) NOT NULL,
    `body` LONGTEXT NOT NULL
 );
 
 
 # add board
INSERT INTO `board`
SET regDate = NOW(),
updateDAte = NOW(),
displayStatus = '1',
`code` = 'notice',
`name` = 'notice';

INSERT INTO `board`
SET regDate = NOW(),
updateDAte = NOW(),
displayStatus = '1',
`code` = 'free',
`name` = 'free';

INSERT INTO `member`
SET regDate = NOW(),
updateDAte = NOW(),
loginId = 'admin',
loginPw = 'admin',
`name` = 'admin',
nickname = 'admin',
email = 'admin@admin.admin',
nativeLang = 'english',
practiceLang = 'korean';

SELECT *
FROM `board`;

SELECT *
FROM `member`;

SELECT *
FROM article;

INSERT INTO `le`.`article` 
(`memberId`, `boardCode`, `regDate`, `updateDate`, `displayStatus`, `title`, `body`) 
VALUES ('1', 'notice', '2020-08-21 12:03:07', '2020-08-21 12:03:09', '1', '노티', '노티'); 

INSERT INTO `le`.`article` 
(`memberId`, `boardCode`, `regDate`, `updateDate`, `displayStatus`, `title`, `body`) 
VALUES ('1', 'notice', '2020-08-21 12:03:07', '2020-08-21 12:03:09', '1', '노티1', '노티1'); 

INSERT INTO `le`.`article` 
(`memberId`, `boardCode`, `regDate`, `updateDate`, `displayStatus`, `title`, `body`) 
VALUES ('1', 'notice', '2020-08-21 12:03:07', '2020-08-21 12:03:09', '1', '노티2', '노티2'); 

INSERT INTO `le`.`article` 
(`memberId`, `boardCode`, `regDate`, `updateDate`, `displayStatus`, `title`, `body`) 
VALUES ('1', 'notice', '2020-08-21 12:03:07', '2020-08-21 12:03:09', '1', '노티3', '노티3'); 

INSERT INTO `le`.`article` 
(`memberId`, `boardCode`, `regDate`, `updateDate`, `displayStatus`, `title`, `body`) 
VALUES ('1', 'free', '2020-08-21 12:03:07', '2020-08-21 12:03:09', '1', '프리', '프리'); 

INSERT INTO `le`.`article` 
(`memberId`, `boardCode`, `regDate`, `updateDate`, `displayStatus`, `title`, `body`) 
VALUES ('1', 'free', '2020-08-21 12:03:07', '2020-08-21 12:03:09', '1', '프리1', '프리1'); 

INSERT INTO `le`.`article` 
(`memberId`, `boardCode`, `regDate`, `updateDate`, `displayStatus`, `title`, `body`) 
VALUES ('1', 'free', '2020-08-21 12:03:07', '2020-08-21 12:03:09', '1', '프리2', '프리2'); 

INSERT INTO `le`.`article` 
(`memberId`, `boardCode`, `regDate`, `updateDate`, `displayStatus`, `title`, `body`) 
VALUES ('1', 'free', '2020-08-21 12:03:07', '2020-08-21 12:03:09', '1', '프리3', '프리3'); 

		SELECT *
		FROM article
		WHERE boardCode = 'free';