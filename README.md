# xiaobaSQL

#数据字典

-----

- sys_user

|字段名|字段类型|字段含义|字段约束|备注|
|- | - | - | - | - |
| user_id| bigint| 用户id| primary key|与用户属性无关 | 
| user_name| varchar(40)| 用户名| not null,unique|用户通过用户名登录 | 
| user_password| char(8)| 用户密码| not null||用户密码为8位 | 
| user_role| varchar(40)| 用户角色| not null,default 'user'| 表示用户的权限，有三种角色，分别是super_admin,admin和user,默认为‘user’|
| user_avatar_path| varchar(100)| 用户头像|not null,default '1.jpg' |用户头像存储路径，默认头像为1.jpg |
| user_sex| tinyint| 用户性别|not null,default 0 | 0表示女性，1表示男性，默认为女|
|user_telephone |vchar(11) |电话号码 |not null,default '00000000000' |用户电话号码，注册时不指定则默认为‘00000000000’ |
|user_email |varchar(40) |用户邮箱 |not null,default ‘youemail@xx.xx’ | 用户邮箱，注册时不指定则默认为‘youemail@xx.xx’|


- message


|字段名|字段类型|字段含义|字段约束|备注| 
|- | - | - | - | - |
| message_id| bigint| 消息id| primary key| 与消息属性无关|
| message_sender| varchar(40)| 消息发送者| not null| |
| message_receiver| varchar(40)| 消息接收者||not null | |
| message_status| tinyint| 消息状态| not null|0表示未读，1表示已读，2表示已放入垃圾桶 |
| content| varchar(1000)| 消息内容|not null | 消息内容|
| send_time| datetime| 消息发送时间|not null | 发送消息的时间|


- essay


|字段名|字段类型|字段含义|字段约束|备注|
|- | - | - | - | - |
| essay_id| bigint| 文章id|primary_key | 唯一标识，无特殊含义|
| essay_title| varchar(100)| 文章标题|not null | |
| essay_abstract| varchar(1000)| 文章摘要| not null| 文章内容的简短说明|
| essay_author| varchar(40)| 文章作者名|not null | 作者名，一定可以在用户表中找到|
| essay_publish_time| datetime| 文章发布时间|not null | 编写文章上传到服务器的时间|
| save_path| varchar(100)| 文章在服务器上存储路径|unique,not null | |
|category |varchar(40) |文章的分类 |not null  |文章所属类别，非空 |
|comment_num |int |文章评论的数量 |not null,defult 0 |评论数量默认为0 |

- user_comment

|字段名 |字段类型 |字段含义 |字段约束 |备注 |
|- | - | - | - | - |
|comment_id | bigint| 评论id|primary key |唯一标识，无特殊含义 |
|parent_type | tinyint|评论的父对象类型 |not null |0表示文章，1表示问题，2表示回答，3表示父评论（即属于哪个评论下的子评论） |
|parent_id | bigint|父对象id |not null |根据父对象类型和父对象id定位该评论 |
|commentator_name |varchar(40) |评论者的名字 |not null |表示哪个用户发表了该评论，用户与评论为一对N的关系 |
|comment_time|datetime |发表评论时间 | not null|日期-时间 |
|comment_content |varchar(1000) |评论内容 |not null，default ‘’ |评论内容，最大长度为1000字符，默认值为‘’ |


- question 

|字段名 |字段类型 |字段含义 |字段约束 |备注 |
|- | - | - | - | - |
|question_id |bigint |问题的ID |primary key | 无特殊含义|
|question_title |varchar(100) |问题的标题 |not null | |
|questioner_name |varchar(40) ||提问者的名字 |not null | |
|question_time |datetime |提问时间 | not null| |
|save_path |varchar(100) |问题内容 |not null |提问内容，对问题的简短描述 |
|answer_num |int |这个问题的回答数 |not null,default 0 |回答问题的数量，默认为0 |


- answer 

|字段名 |字段类型 |字段含义 |字段约束 |备注 |
|- | - | - | - | - |
|answer_id |bigint | 回答的ID号|primary key |无特殊含义 |
|question_id |bigint | 对应问题的ID号|not null |问题的ID，即这个回答所对应的问题 |
|answerer |varchar(40) |回答者的名字 |not null | 回答者的用户名|
|answer_time |datetime |回答的时间 |not null |回答的时间 |
|save_path |varchar(100) |回答内容的存储路径 | not null,unique| 用md文件存储，仅存储md文件的路径|
|comment_num |int |这个回答的评论的数量 |not null,default 0 | 评论数量，默认为0|

- tag 

|字段名 |字段类型 |字段含义 |字段约束 |备注 |
|- | - | - | - | - |
|tag_id |bigint |标签ID |primary key |唯一标识，无特殊含义 |
|tag_name |varchar(40) | |not null,unique |标签名，标签名必须唯一 |

- t_essay_tag 

|字段名 |字段类型 |字段含义 |字段约束 |备注 |
|- | - | - | - | - |
|id |bigint |标识id |primary key |仅作为唯一标识，无特殊含义 |
|essay_id |bigint |文章ID |not null |文章id，一篇文章有多个标签 |
|tag_name |varchar(40) |标签名 |not null |标签名，一个标签可以属于多个文章 |






