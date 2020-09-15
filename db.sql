# create DB
DROP DATABASE IF EXISTS `st_n33_www`;
CREATE DATABASE `st_n33_www`;
USE `st_n33_www`;

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
    email CHAR(100) NOT NULL UNIQUE,
    `level` CHAR(20) NOT NULL DEFAULT 0,
    nativeLang CHAR(20) NOT NULL,
    practiceLang CHAR(20) NOT NULL
 );

 ALTER TABLE `member` ADD COLUMN `gender` CHAR(10) NOT NULL AFTER `name`; 
 
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

 ALTER TABLE `member` ADD COLUMN `introduce` LONGTEXT NULL AFTER `practiceLang`; 
 
 # create article table
 CREATE TABLE article (
    id INT(10) UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    memberId INT(10) UNSIGNED NOT NULL,
    boardId INT(10) UNSIGNED NOT NULL,
    regDate DATETIME NOT NULL,
    updateDate DATETIME NOT NULL,
    delDate DATETIME NOT NULL DEFAULT '1000-01-01 00:00:00',
    displayStatus TINYINT(1) UNSIGNED NOT NULL DEFAULT 0,
    delStatus TINYINT(1) UNSIGNED NOT NULL DEFAULT 0,
    title CHAR(200) NOT NULL,
    `body` LONGTEXT NOT NULL
 );

 # 부가정보테이블 
# 댓글 테이블 추가
CREATE TABLE attr (
    id INT(10) UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    regDate DATETIME NOT NULL,
    updateDate DATETIME NOT NULL,
    `relTypeCode` CHAR(20) NOT NULL,
    `relId` INT(10) UNSIGNED NOT NULL,
    `typeCode` CHAR(30) NOT NULL,
    `type2Code` CHAR(30) NOT NULL,
    `value` TEXT NOT NULL
);

# attr에 만료날짜 추가
ALTER TABLE `attr` ADD COLUMN `expireDate` DATETIME NULL AFTER `value`;

# attr 유니크 인덱스 걸기
## 중복변수 생성금지
## 변수찾는 속도 최적화
ALTER TABLE `attr` ADD UNIQUE INDEX (`relTypeCode`, `relId`, `typeCode`, `type2Code`); 

## 특정 조건을 만족하는 회원 또는 게시물(기타 데이터)를 빠르게 찾기 위해서
ALTER TABLE `attr` ADD INDEX (`relTypeCode`, `typeCode`, `type2Code`);
 
 
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

INSERT INTO `board`
SET regDate = NOW(),
updateDAte = NOW(),
displayStatus = '1',
`code` = 'live',
`name` = 'Live';

INSERT INTO `member`
SET regDate = NOW(),
updateDAte = NOW(),
loginId = 'admin',
loginPw = SHA2('admin', 256),
`name` = 'admin',
nickname = 'admin',
email = 'admin@admin.admin',
`level` = '10',
nativeLang = 'english',
practiceLang = 'korean';

INSERT INTO `member`
SET regDate = NOW(),
updateDAte = NOW(),
loginId = 'aaaaa',
loginPw = SHA2('aaaaa', 256),
`name` = 'aaaaa',
nickname = 'aaaaa',
email = 'aaaaa@aaaaa.aaaaa',
`level` = '10',
nativeLang = 'english',
practiceLang = 'korean';

 # create message table
CREATE TABLE message (
    id INT(10) UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    fromMemberId INT(10) UNSIGNED NOT NULL,
    toMemberId INT(10) UNSIGNED NOT NULL,
    regDate DATETIME NOT NULL,
    delDate DATETIME NOT NULL DEFAULT '1000-01-01 00:00:00',
    displayStatus TINYINT(1) UNSIGNED NOT NULL DEFAULT 0,
    delStatus TINYINT(1) UNSIGNED NOT NULL DEFAULT 0,
    message LONGTEXT NOT NULL
 );

 ALTER TABLE `message` ADD COLUMN `updateDate` DATETIME NOT NULL AFTER `regDate`; 


INSERT INTO article
SET regDate = NOW(),
updateDate = NOW(),
boardId = IF(RAND() > 0.5, 1, 2),
memberId = IF(RAND() > 0.5, 1, 2),
title = CONCAT('제목-', UUID()),
`body` = CONCAT('내용-', UUID()),
displayStatus = '1';

SELECT COUNT(*)
FROM article 
WHERE boardId = '2'
AND displayStatus = '1'
AND delStatus = '0';