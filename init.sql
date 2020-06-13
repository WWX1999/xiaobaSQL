drop database if exists cugbar;
create database cugbar;

use cugbar;
SET global  SQL_SAFE_UPDATES = 0;

drop table if exists sys_user;
create table sys_user
(
   user_id              bigint not null auto_increment,
   user_name            varchar(40) not null unique,
   user_password        char(16) not null,
   user_role            varchar(40) not null default 'user',
   user_avatar_path     varchar(100) not null default '1.jpg',
   user_sex             tinyint not null default 0,
   user_telephone       varchar(11) not null default '00000000000',
   user_email           varchar(40) not null default 'youremai@xx.xx',
   primary key (user_id)
);



drop table if exists message;
 create table message
 (
	message_id        bigint auto_increment,
    message_sender    varchar(40) not null,
    message_receiver  varchar(40) not null,
    message_status    tinyint not null,
    content           varchar(1000) not null,
    send_time         datetime not null,
    primary key (message_id)
);


drop table if exists essay;
create table essay
(
   essay_id             bigint  auto_increment,
   essay_title          varchar(100) not null ,
   essay_abstract       varchar(1000) not null,
   essay_author         varchar(40) not null,
   essay_publish_time   datetime not null,
   save_path            varchar(100) not null unique,
   category             varchar(40)  not null,
   comment_num          int not null default 0,
   primary key (essay_id)
);


drop table if exists question;
create table question
(
   question_id          bigint auto_increment,
   question_title       varchar(100) not null,
   questioner_name      varchar(40) not null,
   question_time        datetime not null,
   save_path            varchar(100) not null unique,
   answer_num           int not null default 0,
   primary key (question_id)
);


drop table if exists answer;
create table answer
(
   answer_id            bigint auto_increment,
   question_id          bigint not null,
   answerer             varchar(40) not null,
   answer_time          datetime not null,
   save_path            varchar(100) not null unique,
   comment_num          int not null default 0,
   primary key (answer_id)
);

drop table if exists user_comment;
create table user_comment
(
   comment_id           bigint not null auto_increment,
   parent_type          tinyint not null,
   parent_id            bigint not null,
   commentator_name     varchar(40) not null,
   comment_time         datetime not null,
   comment_content      varchar(1000) not null default '',
   primary key (comment_id)
);


drop table if exists tag;
create table tag 
(
    tag_id              bigint auto_increment,
    tag_name            varchar(40) not null unique,
    primary key(tag_id)
);


 drop table if exists t_essay_tag;
 create table t_essay_tag 
 (
    id             bigint  auto_increment,
    essay_id       bigInt  not null,
    tag_name       varchar(40) not null,
    primary key(id)
 );

 