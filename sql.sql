DROP TABLE IF EXISTS `teacher`;
CREATE TABLE `teacher`(
	   `teacher_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '教师ID',
`teacher_job_number` varchar(64) NOT NULL UNIQUE comment '教师工号',
`teacher_name` varchar(64) comment '教师姓名',
`examine_state` varchar(16) DEFAULT '已通过' NOT NULL comment '审核状态',
`recommend` int(11) DEFAULT '0' NOT NULL comment '智能推荐',
`user_id` int(11) DEFAULT '0' NOT NULL comment '用户ID',
`create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
 `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',

	   PRIMARY KEY (teacher_id)
	)ENGINE=InnoDB DEFAULT CHARSET=utf8 comment '教师';

DROP TABLE IF EXISTS `student`;
CREATE TABLE `student`(
	   `student_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '学生ID',
`student_number` varchar(64) NOT NULL UNIQUE comment '学号',
`student_name` varchar(64) comment '学生姓名',
`class_name` varchar(64) comment '班级名称',
`examine_state` varchar(16) DEFAULT '已通过' NOT NULL comment '审核状态',
`recommend` int(11) DEFAULT '0' NOT NULL comment '智能推荐',
`user_id` int(11) DEFAULT '0' NOT NULL comment '用户ID',
`create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
 `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',

	   PRIMARY KEY (student_id)
	)ENGINE=InnoDB DEFAULT CHARSET=utf8 comment '学生';

DROP TABLE IF EXISTS `academic_staff`;
CREATE TABLE `academic_staff`(
	   `academic_staff_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '教务人员ID',
`academic_staff_no` varchar(64) NOT NULL UNIQUE comment '教务员工号',
`name_of_academic_administrator` varchar(64) comment '教务员姓名',
`examine_state` varchar(16) DEFAULT '已通过' NOT NULL comment '审核状态',
`recommend` int(11) DEFAULT '0' NOT NULL comment '智能推荐',
`user_id` int(11) DEFAULT '0' NOT NULL comment '用户ID',
`create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
 `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',

	   PRIMARY KEY (academic_staff_id)
	)ENGINE=InnoDB DEFAULT CHARSET=utf8 comment '教务人员';

DROP TABLE IF EXISTS `course_information`;
CREATE TABLE `course_information`(
	   `course_information_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '课程信息ID',
`course_number` varchar(64) comment '课程编号',
`course_name` varchar(64) comment '课程名称',
`teacher` int(11) DEFAULT 0 comment '任课老师',
`class_time` varchar(64) comment '上课时间',
`class_place` varchar(64) comment '上课地点',
`class_name` varchar(64) comment '班级名称',
`examine_state` varchar(16) DEFAULT '已通过' NOT NULL comment '审核状态',
`recommend` int(11) DEFAULT '0' NOT NULL comment '智能推荐',
`create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
 `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',

	   PRIMARY KEY (course_information_id)
	)ENGINE=InnoDB DEFAULT CHARSET=utf8 comment '课程信息';
insert into `course_information` values (1,'课程编号1','课程名称1',0,'上课时间1','上课地点1','班级名称1','已通过','0','2022-03-06 20:38:07','2022-03-06 20:38:07');
insert into `course_information` values (2,'课程编号2','课程名称2',0,'上课时间2','上课地点2','班级名称2','已通过','0','2022-03-06 20:38:07','2022-03-06 20:38:07');
insert into `course_information` values (3,'课程编号3','课程名称3',0,'上课时间3','上课地点3','班级名称3','已通过','0','2022-03-06 20:38:07','2022-03-06 20:38:07');
insert into `course_information` values (4,'课程编号4','课程名称4',0,'上课时间4','上课地点4','班级名称4','已通过','0','2022-03-06 20:38:07','2022-03-06 20:38:07');
insert into `course_information` values (5,'课程编号5','课程名称5',0,'上课时间5','上课地点5','班级名称5','已通过','0','2022-03-06 20:38:07','2022-03-06 20:38:07');
insert into `course_information` values (6,'课程编号6','课程名称6',0,'上课时间6','上课地点6','班级名称6','已通过','0','2022-03-06 20:38:07','2022-03-06 20:38:07');
insert into `course_information` values (7,'课程编号7','课程名称7',0,'上课时间7','上课地点7','班级名称7','已通过','0','2022-03-06 20:38:07','2022-03-06 20:38:07');
insert into `course_information` values (8,'课程编号8','课程名称8',0,'上课时间8','上课地点8','班级名称8','已通过','0','2022-03-06 20:38:07','2022-03-06 20:38:07');

DROP TABLE IF EXISTS `student_rating`;
CREATE TABLE `student_rating`(
	   `student_rating_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '学生评分ID',
`course_number` varchar(64) comment '课程编号',
`course_name` varchar(64) comment '课程名称',
`teacher` int(11) DEFAULT 0 comment '任课老师',
`class_name` varchar(64) comment '班级名称',
`evaluation_name` varchar(64) comment '测评名称',
`content_of_courses` int(11) DEFAULT 0 comment '教学内容',
`teaching_level_` int(11) DEFAULT 0 comment '教学水平',
`teaching_method` int(11) DEFAULT 0 comment '教学方法',
`teaching_effectiveness` int(11) DEFAULT 0 comment '教学效果',
`total_score` varchar(64) comment '总分',
`student_number` int(11) DEFAULT 0 comment '学号',
`student_name` varchar(64) comment '学生姓名',
`teaching_suggestions` text comment '教学建议',
`examine_state` varchar(16) DEFAULT '已通过' NOT NULL comment '审核状态',
`recommend` int(11) DEFAULT '0' NOT NULL comment '智能推荐',
`create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
 `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',

	   PRIMARY KEY (student_rating_id)
	)ENGINE=InnoDB DEFAULT CHARSET=utf8 comment '学生评分';
insert into `student_rating` values (1,'课程编号1','课程名称1',0,'班级名称1','测评名称1',5,5,5,5,'总分1',0,'学生姓名1','教学建议1','已通过','0','2022-03-06 20:38:07','2022-03-06 20:38:07');
insert into `student_rating` values (2,'课程编号2','课程名称2',0,'班级名称2','测评名称2',10,10,10,10,'总分2',0,'学生姓名2','教学建议2','已通过','0','2022-03-06 20:38:07','2022-03-06 20:38:07');
insert into `student_rating` values (3,'课程编号3','课程名称3',0,'班级名称3','测评名称3',15,15,15,15,'总分3',0,'学生姓名3','教学建议3','已通过','0','2022-03-06 20:38:07','2022-03-06 20:38:07');
insert into `student_rating` values (4,'课程编号4','课程名称4',0,'班级名称4','测评名称4',20,20,20,20,'总分4',0,'学生姓名4','教学建议4','已通过','0','2022-03-06 20:38:07','2022-03-06 20:38:07');
insert into `student_rating` values (5,'课程编号5','课程名称5',0,'班级名称5','测评名称5',25,25,25,25,'总分5',0,'学生姓名5','教学建议5','已通过','0','2022-03-06 20:38:07','2022-03-06 20:38:07');
insert into `student_rating` values (6,'课程编号6','课程名称6',0,'班级名称6','测评名称6',30,30,30,30,'总分6',0,'学生姓名6','教学建议6','已通过','0','2022-03-06 20:38:07','2022-03-06 20:38:07');
insert into `student_rating` values (7,'课程编号7','课程名称7',0,'班级名称7','测评名称7',35,35,35,35,'总分7',0,'学生姓名7','教学建议7','已通过','0','2022-03-06 20:38:07','2022-03-06 20:38:07');
insert into `student_rating` values (8,'课程编号8','课程名称8',0,'班级名称8','测评名称8',40,40,40,40,'总分8',0,'学生姓名8','教学建议8','已通过','0','2022-03-06 20:38:07','2022-03-06 20:38:07');

DROP TABLE IF EXISTS `evaluation_results`;
CREATE TABLE `evaluation_results`(
	   `evaluation_results_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '测评结果ID',
`course_number` varchar(64) comment '课程编号',
`course_name` varchar(64) comment '课程名称',
`teacher` int(11) DEFAULT 0 comment '任课老师',
`evaluation_name` varchar(64) comment '测评名称',
`class_name` varchar(64) comment '班级名称',
`content_of_courses` varchar(64) comment '教学内容',
`teaching_level_` varchar(64) comment '教学水平',
`teaching_method` varchar(64) comment '教学方法',
`teaching_effectiveness` varchar(64) comment '教学效果',
`grade` varchar(64) comment '等级',
`student_suggestions` text comment '学生建议',
`examine_state` varchar(16) DEFAULT '已通过' NOT NULL comment '审核状态',
`recommend` int(11) DEFAULT '0' NOT NULL comment '智能推荐',
`create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
 `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',

	   PRIMARY KEY (evaluation_results_id)
	)ENGINE=InnoDB DEFAULT CHARSET=utf8 comment '测评结果';
insert into `evaluation_results` values (1,'课程编号1','课程名称1',0,'测评名称1','班级名称1','教学内容1','教学水平1','教学方法1','教学效果1','等级1','学生建议1','已通过','0','2022-03-06 20:38:07','2022-03-06 20:38:07');
insert into `evaluation_results` values (2,'课程编号2','课程名称2',0,'测评名称2','班级名称2','教学内容2','教学水平2','教学方法2','教学效果2','等级2','学生建议2','已通过','0','2022-03-06 20:38:07','2022-03-06 20:38:07');
insert into `evaluation_results` values (3,'课程编号3','课程名称3',0,'测评名称3','班级名称3','教学内容3','教学水平3','教学方法3','教学效果3','等级3','学生建议3','已通过','0','2022-03-06 20:38:07','2022-03-06 20:38:07');
insert into `evaluation_results` values (4,'课程编号4','课程名称4',0,'测评名称4','班级名称4','教学内容4','教学水平4','教学方法4','教学效果4','等级4','学生建议4','已通过','0','2022-03-06 20:38:07','2022-03-06 20:38:07');
insert into `evaluation_results` values (5,'课程编号5','课程名称5',0,'测评名称5','班级名称5','教学内容5','教学水平5','教学方法5','教学效果5','等级5','学生建议5','已通过','0','2022-03-06 20:38:07','2022-03-06 20:38:07');
insert into `evaluation_results` values (6,'课程编号6','课程名称6',0,'测评名称6','班级名称6','教学内容6','教学水平6','教学方法6','教学效果6','等级6','学生建议6','已通过','0','2022-03-06 20:38:07','2022-03-06 20:38:07');
insert into `evaluation_results` values (7,'课程编号7','课程名称7',0,'测评名称7','班级名称7','教学内容7','教学水平7','教学方法7','教学效果7','等级7','学生建议7','已通过','0','2022-03-06 20:38:07','2022-03-06 20:38:07');
insert into `evaluation_results` values (8,'课程编号8','课程名称8',0,'测评名称8','班级名称8','教学内容8','教学水平8','教学方法8','教学效果8','等级8','学生建议8','已通过','0','2022-03-06 20:38:07','2022-03-06 20:38:07');

DROP TABLE IF EXISTS `notice_announcement`;
CREATE TABLE `notice_announcement`(
	   `notice_announcement_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '通知公告ID',
`title` varchar(64) comment '标题',
`relevant_attachments` varchar(255) comment '相关附件',
`publisher` varchar(64) comment '发布人',
`release_date` date comment '发布日期',
`content` text comment '内容',
`examine_state` varchar(16) DEFAULT '已通过' NOT NULL comment '审核状态',
`recommend` int(11) DEFAULT '0' NOT NULL comment '智能推荐',
`create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
 `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',

	   PRIMARY KEY (notice_announcement_id)
	)ENGINE=InnoDB DEFAULT CHARSET=utf8 comment '通知公告';
insert into `notice_announcement` values (1,'标题1','点此下载','发布人1','2022-3-6','内容1','已通过','0','2022-03-06 20:38:07','2022-03-06 20:38:07');
insert into `notice_announcement` values (2,'标题2','点此下载','发布人2','2022-3-6','内容2','已通过','0','2022-03-06 20:38:07','2022-03-06 20:38:07');
insert into `notice_announcement` values (3,'标题3','点此下载','发布人3','2022-3-6','内容3','已通过','0','2022-03-06 20:38:07','2022-03-06 20:38:07');
insert into `notice_announcement` values (4,'标题4','点此下载','发布人4','2022-3-6','内容4','已通过','0','2022-03-06 20:38:07','2022-03-06 20:38:07');
insert into `notice_announcement` values (5,'标题5','点此下载','发布人5','2022-3-6','内容5','已通过','0','2022-03-06 20:38:07','2022-03-06 20:38:07');
insert into `notice_announcement` values (6,'标题6','点此下载','发布人6','2022-3-6','内容6','已通过','0','2022-03-06 20:38:07','2022-03-06 20:38:07');
insert into `notice_announcement` values (7,'标题7','点此下载','发布人7','2022-3-6','内容7','已通过','0','2022-03-06 20:38:07','2022-03-06 20:38:07');
insert into `notice_announcement` values (8,'标题8','点此下载','发布人8','2022-3-6','内容8','已通过','0','2022-03-06 20:38:07','2022-03-06 20:38:07');

DROP TABLE IF EXISTS `evaluation_information`;
CREATE TABLE `evaluation_information`(
	   `evaluation_information_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '测评信息ID',
`course_number` varchar(64) comment '课程编号',
`course_name` varchar(64) comment '课程名称',
`teacher` int(11) DEFAULT 0 comment '任课老师',
`class_name` varchar(64) comment '班级名称',
`evaluation_name` varchar(64) comment '测评名称',
`evaluation_start_time` datetime comment '测评开始时间',
`evaluation_end_time` datetime comment '测评结束时间',
`examine_state` varchar(16) DEFAULT '已通过' NOT NULL comment '审核状态',
`recommend` int(11) DEFAULT '0' NOT NULL comment '智能推荐',
`create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
 `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',

	   PRIMARY KEY (evaluation_information_id)
	)ENGINE=InnoDB DEFAULT CHARSET=utf8 comment '测评信息';
insert into `evaluation_information` values (1,'课程编号1','课程名称1',0,'班级名称1','测评名称1','2022-3-6 20:38:7','2022-3-6 20:38:7','已通过','0','2022-03-06 20:38:07','2022-03-06 20:38:07');
insert into `evaluation_information` values (2,'课程编号2','课程名称2',0,'班级名称2','测评名称2','2022-3-6 20:38:7','2022-3-6 20:38:7','已通过','0','2022-03-06 20:38:07','2022-03-06 20:38:07');
insert into `evaluation_information` values (3,'课程编号3','课程名称3',0,'班级名称3','测评名称3','2022-3-6 20:38:7','2022-3-6 20:38:7','已通过','0','2022-03-06 20:38:07','2022-03-06 20:38:07');
insert into `evaluation_information` values (4,'课程编号4','课程名称4',0,'班级名称4','测评名称4','2022-3-6 20:38:7','2022-3-6 20:38:7','已通过','0','2022-03-06 20:38:07','2022-03-06 20:38:07');
insert into `evaluation_information` values (5,'课程编号5','课程名称5',0,'班级名称5','测评名称5','2022-3-6 20:38:7','2022-3-6 20:38:7','已通过','0','2022-03-06 20:38:07','2022-03-06 20:38:07');
insert into `evaluation_information` values (6,'课程编号6','课程名称6',0,'班级名称6','测评名称6','2022-3-6 20:38:7','2022-3-6 20:38:7','已通过','0','2022-03-06 20:38:07','2022-03-06 20:38:07');
insert into `evaluation_information` values (7,'课程编号7','课程名称7',0,'班级名称7','测评名称7','2022-3-6 20:38:7','2022-3-6 20:38:7','已通过','0','2022-03-06 20:38:07','2022-03-06 20:38:07');
insert into `evaluation_information` values (8,'课程编号8','课程名称8',0,'班级名称8','测评名称8','2022-3-6 20:38:7','2022-3-6 20:38:7','已通过','0','2022-03-06 20:38:07','2022-03-06 20:38:07');

DROP TABLE IF EXISTS `access_token`;
CREATE TABLE `access_token` (
  `token_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '临时访问牌ID',
  `token` varchar(64) DEFAULT NULL COMMENT '临时访问牌',
  `info` text,
  `maxage` int(2) NOT NULL DEFAULT '2' COMMENT '最大寿命：默认2小时',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间：',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间：',
  `user_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '用户编号:',
  PRIMARY KEY (`token_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='临时访问牌';
insert into `access_token` values ('57','5accf85cb6a7f06f0aa2968deadaec1b',null,'2',"2022-01-14 07:32:09.000 ","2022-01-14 07:32:09.000 ",'1');
insert into `access_token` values ('58','46ff1d4d07714f046ba07b34bffe0af9',null,'2',"2022-01-14 07:32:09.000 ","2022-01-14 07:32:09.000 ",'1');
insert into `access_token` values ('59','ed9d6cba9826fda1beafcd9326be7a86',null,'2',"2022-01-14 07:32:09.000 ","2022-01-14 07:32:09.000 ",'1');
insert into `access_token` values ('60','c99763c1833ea0785d9e2b81da3fd28f',null,'2',"2022-01-14 07:32:09.000 ","2022-01-14 07:32:09.000 ",'1');
insert into `access_token` values ('61','33fbfaccd6d1cb9143e4129bd919d4b0',null,'2',"2022-01-14 07:32:09.000 ","2022-01-14 07:32:09.000 ",'1');
insert into `access_token` values ('62','493e13da5f293ba67a56a0fe3e1fa6cf',null,'2',"2022-01-14 07:32:09.000 ","2022-01-14 07:32:09.000 ",'1');
insert into `access_token` values ('63','c4b48e9e2160db09c703041a8fee0a1f',null,'2',"2022-01-14 07:32:09.000 ","2022-01-14 07:32:09.000 ",'1');
insert into `access_token` values ('64','d13cdaefd3823c360c959a02a262f71d',null,'2',"2022-01-14 07:32:09.000 ","2022-01-14 07:32:09.000 ",'1');
insert into `access_token` values ('65','6c6ff426fd77ea5a2025ce5ed2e42c8a',null,'2',"2022-01-14 07:32:09.000 ","2022-01-14 07:32:09.000 ",'1');
insert into `access_token` values ('66','80930065a61ffcdd5cbb75f60932973c',null,'2',"2022-01-14 07:32:09.000 ","2022-01-14 07:32:09.000 ",'1');
insert into `access_token` values ('67','94114763cf2e3b020495d8a27096d4ef',null,'2',"2022-01-14 07:32:09.000 ","2022-01-14 07:32:09.000 ",'1');
insert into `access_token` values ('68','761052c551c97c9317bc3aa475c85b84',null,'2',"2022-01-14 07:32:09.000 ","2022-01-14 07:32:09.000 ",'1');
insert into `access_token` values ('69','7c44ef14131a0ba7c16aa16cef104065',null,'2',"2022-01-14 07:32:09.000 ","2022-01-14 07:32:09.000 ",'1');
insert into `access_token` values ('70','96380f3d9542c80d04bdade1cf7635a5',null,'2',"2022-01-14 07:32:09.000 ","2022-01-14 07:32:09.000 ",'1');
insert into `access_token` values ('71','bfdc7acfcbf5763fda81945b60961222',null,'2',"2022-01-14 07:32:09.000 ","2022-01-14 07:32:09.000 ",'1');
insert into `access_token` values ('72','170a598e51ae8ae2badde20a42fe171d',null,'2',"2022-01-14 07:32:09.000 ","2022-01-14 07:32:09.000 ",'1');
insert into `access_token` values ('73','c82c357488c75926a92d8a9608d4b367',null,'2',"2022-01-14 07:32:09.000 ","2022-01-14 07:32:09.000 ",'1');
insert into `access_token` values ('74','4d35290c023f407a820f37dbbb1ceb09',null,'2',"2022-01-14 07:32:09.000 ","2022-01-14 07:32:09.000 ",'1');
insert into `access_token` values ('75','8d19162776682b695c0f62f3c7a92fec',null,'2',"2022-01-14 07:32:09.000 ","2022-01-14 07:32:09.000 ",'1');
insert into `access_token` values ('76','a7ea2cdc9a2be179e19200e593ad5a69',null,'2',"2022-01-14 07:32:09.000 ","2022-01-14 07:32:09.000 ",'1');
insert into `access_token` values ('77','c79a554f9832adc01f19682c5d576bc4',null,'2',"2022-01-14 07:32:09.000 ","2022-01-14 07:32:09.000 ",'1');
insert into `access_token` values ('78','1c7d95001fa09951a679841c8100ad1f',null,'2',"2022-01-14 07:32:09.000 ","2022-01-14 07:32:09.000 ",'1');
insert into `access_token` values ('79','776da1bcdd01ddb3cbf0a37fa13fc5b0',null,'2',"2022-01-14 07:32:09.000 ","2022-01-14 07:32:09.000 ",'1');
insert into `access_token` values ('80','d336e88e57c329d0166931292c1fac41',null,'2',"2022-01-14 07:32:09.000 ","2022-01-14 07:32:09.000 ",'1');
insert into `access_token` values ('81','37a40f526a6c82fc6110b512802d35bf',null,'2',"2022-01-14 07:32:09.000 ","2022-01-14 07:32:09.000 ",'1');
insert into `access_token` values ('82','691ad331771f4109206d58aeee572371',null,'2',"2022-01-14 07:32:09.000 ","2022-01-14 07:32:09.000 ",'1');
insert into `access_token` values ('83','9942e458886219960d3344b4a6a6fbec',null,'2',"2022-01-14 07:32:09.000 ","2022-01-14 07:32:09.000 ",'1');
insert into `access_token` values ('84','e9939a8b7ccf9f548f0bbb5664981f96',null,'2',"2022-01-14 07:32:09.000 ","2022-01-14 07:32:09.000 ",'1');
insert into `access_token` values ('85','f5b27912060d1909bef61fab9d96faae',null,'2',"2022-01-14 07:32:09.000 ","2022-01-14 07:32:09.000 ",'1');
insert into `access_token` values ('86','7c5888682f1d449eb1b62f0054a79fbf',null,'2',"2022-01-14 07:32:09.000 ","2022-01-14 07:32:09.000 ",'1');
insert into `access_token` values ('87','00dfdc6ac21c4a9da80fd71c990764d1',null,'2',"2022-01-14 07:32:09.000 ","2022-01-14 07:32:09.000 ",'1');
insert into `access_token` values ('88','3cce592bc72840ab932ce96d85a194da',null,'2',"2022-01-14 07:32:09.000 ","2022-01-14 07:32:09.000 ",'1');
insert into `access_token` values ('89','43fdaa989a644ad683ef4b4d488e8629',null,'2',"2022-01-14 07:32:09.000 ","2022-01-14 07:32:09.000 ",'1');
insert into `access_token` values ('90','d6a3cecadacff0dbd6b43b25372cc2a2',null,'2',"2022-01-14 07:32:09.000 ","2022-01-14 07:32:09.000 ",'1');
insert into `access_token` values ('91','5570bc5b07b3589f4ef8553bd46eb0d1',null,'2',"2022-01-14 07:32:09.000 ","2022-01-14 07:32:09.000 ",'1');
insert into `access_token` values ('92','5570bc5b07b3589f4ef8553bd46eb0d1',null,'2',"2022-01-14 07:32:09.000 ","2022-01-14 07:32:09.000 ",'1');
insert into `access_token` values ('93','26c553bd2ee2ab6605d18dfd310d85f9',null,'2',"2022-01-14 07:32:09.000 ","2022-01-14 07:32:09.000 ",'1');
insert into `access_token` values ('94','3fd52f81236ed2c37ff91a6696d4e47a',null,'2',"2022-01-14 07:32:09.000 ","2022-01-14 07:32:09.000 ",'1');
insert into `access_token` values ('95','893332e9ee67d60d8312b3700c58a359',null,'2',"2022-01-14 07:32:09.000 ","2022-01-14 07:32:09.000 ",'1');
insert into `access_token` values ('96','b7844068ade535b2e517df4a40948703',null,'2',"2022-01-14 07:32:09.000 ","2022-01-14 07:32:09.000 ",'1');
insert into `access_token` values ('97','179b37a5e1893c3af6b946bd5a1c8625',null,'2',"2022-01-14 07:32:09.000 ","2022-01-14 07:32:09.000 ",'1');
insert into `access_token` values ('98','3a47b8a040a83ebbc9194cb255dc668c',null,'2',"2022-01-14 07:32:09.000 ","2022-01-14 07:32:09.000 ",'1');
insert into `access_token` values ('99','afa60196afb77dcc2b520ed13a817560',null,'2',"2022-01-14 07:32:09.000 ","2022-01-14 07:32:09.000 ",'1');
insert into `access_token` values ('100','7fc6d9b324f8c0a3a1784d04ef132692',null,'2',"2022-01-14 07:32:09.000 ","2022-01-14 07:32:09.000 ",'1');
DROP TABLE IF EXISTS `auth`;
CREATE TABLE `auth` (
  `auth_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '授权ID：',
  `user_group` varchar(64) DEFAULT NULL COMMENT '用户组：',
  `mod_name` varchar(64) DEFAULT NULL COMMENT '模块名：',
  `table_name` varchar(64) DEFAULT NULL COMMENT '表名：',
  `page_title` varchar(255) DEFAULT NULL COMMENT '页面标题：',
  `path` varchar(255) DEFAULT NULL COMMENT '路由路径：',
  `position` varchar(32) DEFAULT NULL COMMENT '位置：',
  `mode` varchar(32) NOT NULL DEFAULT '_blank' COMMENT '跳转方式：',
  `add` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否可增加：',
  `del` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否可删除：',
  `set` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否可修改：',
  `get` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否可查看：',
  `field_add` varchar(500) DEFAULT NULL COMMENT '添加字段：',
  `field_set` varchar(500) DEFAULT NULL COMMENT '修改字段：',
  `field_get` varchar(500) DEFAULT NULL COMMENT '查询字段：',
  `table_nav_name` varchar(255) DEFAULT NULL COMMENT '跨表导航名称：',
  `table_nav` varchar(255) DEFAULT NULL COMMENT '跨表导航：',
  `option` text COMMENT '配置：',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间：',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间：',
  PRIMARY KEY (`auth_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='定制授权';
DROP TABLE IF EXISTS `upload`;
CREATE TABLE `upload` (
  `upload_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '上传ID',
  `name` varchar(64) DEFAULT NULL COMMENT '文件名',
  `path` varchar(255) DEFAULT NULL COMMENT '访问路径',
  `file` varchar(255) DEFAULT NULL COMMENT '文件路径',
  `display` varchar(255) DEFAULT NULL COMMENT '显示顺序',
  `father_id` int(11) DEFAULT '0' COMMENT '父级ID',
  `dir` varchar(255) DEFAULT NULL COMMENT '文件夹',
  `type` varchar(32) DEFAULT NULL COMMENT '文件类型',
  PRIMARY KEY (`upload_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
insert into `upload` values ('1','movie.mp4','/upload/movie.mp4','',null,'0',null,'video');
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `user_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户ID：[0,8388607]用户获取其他与用户相关的数据',
  `state` smallint(1) unsigned NOT NULL DEFAULT '1' COMMENT '账户状态：[0,10](1可用|2异常|3已冻结|4已注销)',
  `user_group` varchar(32) DEFAULT NULL COMMENT '所在用户组：[0,32767]决定用户身份和权限',
  `login_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '上次登录时间：',
  `phone` varchar(11) DEFAULT NULL COMMENT '手机号码：[0,11]用户的手机号码，用于找回密码时或登录时',
  `phone_state` smallint(1) unsigned NOT NULL DEFAULT '0' COMMENT '手机认证：[0,1](0未认证|1审核中|2已认证)',
  `username` varchar(16) NOT NULL DEFAULT '' COMMENT '用户名：[0,16]用户登录时所用的账户名称',
  `nickname` varchar(16) DEFAULT '' COMMENT '昵称：[0,16]',
  `password` varchar(64) NOT NULL DEFAULT '' COMMENT '密码：[0,32]用户登录所需的密码，由6-16位数字或英文组成',
  `email` varchar(64) DEFAULT '' COMMENT '邮箱：[0,64]用户的邮箱，用于找回密码时或登录时',
  `email_state` smallint(1) unsigned NOT NULL DEFAULT '0' COMMENT '邮箱认证：[0,1](0未认证|1审核中|2已认证)',
  `avatar` varchar(255) DEFAULT NULL COMMENT '头像地址：[0,255]',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间：',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='用户账户：用于保存用户登录信息';
insert into `user` values ('1','1','管理员',"2022-02-19 01:04:49.000 ",null,'0','admin','admin','bfd59291e825b5f2bbf1eb76569f8fe7','','0','/api/upload/avatar.jpg',"2022-02-19 07:32:09.000 ");
DROP TABLE IF EXISTS `user_group`;
CREATE TABLE `user_group` (
  `group_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户组ID：[0,8388607]',
  `display` smallint(4) unsigned NOT NULL DEFAULT '100' COMMENT '显示顺序：[0,1000]',
  `name` varchar(16) NOT NULL DEFAULT '' COMMENT '名称：[0,16]',
  `description` varchar(255) DEFAULT NULL COMMENT '描述：[0,255]描述该用户组的特点或权限范围',
  `source_table` varchar(255) DEFAULT NULL COMMENT '来源表：',
  `source_field` varchar(255) DEFAULT NULL COMMENT '来源字段：',
  `source_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '来源ID：',
  `register` smallint(1) unsigned DEFAULT '0' COMMENT '注册位置:',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间：',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间：',
  PRIMARY KEY (`group_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='用户组：用于用户前端身份和鉴权';
DROP TABLE IF EXISTS `hits`;
CREATE TABLE `hits` (
  `hits_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '点赞ID：',
  `user_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '点赞人：',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间：',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间：',
  `source_table` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '来源表：',
  `source_field` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '来源字段：',
  `source_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '来源ID：',
  PRIMARY KEY (`hits_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;
insert into `auth` values ('1','管理员','教师','teacher','教师','/teacher/table','','_blank','1','1','1','1','teacher_job_number,teacher_name','teacher_job_number,teacher_name','teacher_job_number,teacher_name',null,'0','{}',"2022-03-06 12:38:07.000 ","2022-03-06 12:38:07.000 ");
insert into `auth` values ('2','管理员','教师','teacher','教师详情','/teacher/view','','_blank','1','1','1','1','teacher_job_number,teacher_name','teacher_job_number,teacher_name','teacher_job_number,teacher_name',null,'0','{}',"2022-03-06 12:38:07.000 ","2022-03-06 12:38:07.000 ");
insert into `auth` values ('3','管理员','学生','student','学生','/student/table','','_blank','1','1','1','1','student_number,student_name,class_name','student_number,student_name,class_name','student_number,student_name,class_name',null,'0','{}',"2022-03-06 12:38:07.000 ","2022-03-06 12:38:07.000 ");
insert into `auth` values ('4','管理员','学生','student','学生详情','/student/view','','_blank','1','1','1','1','student_number,student_name,class_name','student_number,student_name,class_name','student_number,student_name,class_name',null,'0','{}',"2022-03-06 12:38:07.000 ","2022-03-06 12:38:07.000 ");
insert into `auth` values ('5','管理员','教务人员','academic_staff','教务人员','/academic_staff/table','','_blank','1','1','1','1','academic_staff_no,name_of_academic_administrator','academic_staff_no,name_of_academic_administrator','academic_staff_no,name_of_academic_administrator',null,'0','{}',"2022-03-06 12:38:07.000 ","2022-03-06 12:38:07.000 ");
insert into `auth` values ('6','管理员','教务人员','academic_staff','教务人员详情','/academic_staff/view','','_blank','1','1','1','1','academic_staff_no,name_of_academic_administrator','academic_staff_no,name_of_academic_administrator','academic_staff_no,name_of_academic_administrator',null,'0','{}',"2022-03-06 12:38:07.000 ","2022-03-06 12:38:07.000 ");
insert into `auth` values ('7','管理员','课程信息','course_information','课程信息','/course_information/table','','_blank','1','1','1','1','course_number,course_name,teacher,class_time,class_place,class_name','course_number,course_name,teacher,class_time,class_place,class_name','course_number,course_name,teacher,class_time,class_place,class_name',null,'0','{}',"2022-03-06 12:38:07.000 ","2022-03-06 12:38:07.000 ");
insert into `auth` values ('8','管理员','课程信息','course_information','课程信息详情','/course_information/view','','_blank','1','1','1','1','course_number,course_name,teacher,class_time,class_place,class_name','course_number,course_name,teacher,class_time,class_place,class_name','course_number,course_name,teacher,class_time,class_place,class_name',null,'0','{}',"2022-03-06 12:38:07.000 ","2022-03-06 12:38:07.000 ");
insert into `auth` values ('9','管理员','学生评分','student_rating','学生评分','/student_rating/table','','_blank','1','1','1','1','course_number,course_name,teacher,class_name,evaluation_name,content_of_courses,teaching_level_,teaching_method,teaching_effectiveness,total_score,student_number,student_name,teaching_suggestions','course_number,course_name,teacher,class_name,evaluation_name,content_of_courses,teaching_level_,teaching_method,teaching_effectiveness,total_score,student_number,student_name,teaching_suggestions','course_number,course_name,teacher,class_name,evaluation_name,content_of_courses,teaching_level_,teaching_method,teaching_effectiveness,total_score,student_number,student_name,teaching_suggestions',null,'0','{"figure":true}',"2022-03-06 12:38:07.000 ","2022-03-06 12:38:07.000 ");
insert into `auth` values ('10','管理员','学生评分','student_rating','学生评分详情','/student_rating/view','','_blank','1','1','1','1','course_number,course_name,teacher,class_name,evaluation_name,content_of_courses,teaching_level_,teaching_method,teaching_effectiveness,total_score,student_number,student_name,teaching_suggestions','course_number,course_name,teacher,class_name,evaluation_name,content_of_courses,teaching_level_,teaching_method,teaching_effectiveness,total_score,student_number,student_name,teaching_suggestions','course_number,course_name,teacher,class_name,evaluation_name,content_of_courses,teaching_level_,teaching_method,teaching_effectiveness,total_score,student_number,student_name,teaching_suggestions',null,'0','{}',"2022-03-06 12:38:07.000 ","2022-03-06 12:38:07.000 ");
insert into `auth` values ('11','管理员','测评结果','evaluation_results','测评结果','/evaluation_results/table','','_blank','1','1','1','1','course_number,course_name,teacher,evaluation_name,class_name,content_of_courses,teaching_level_,teaching_method,teaching_effectiveness,grade,student_suggestions','course_number,course_name,teacher,evaluation_name,class_name,content_of_courses,teaching_level_,teaching_method,teaching_effectiveness,grade,student_suggestions','course_number,course_name,teacher,evaluation_name,class_name,content_of_courses,teaching_level_,teaching_method,teaching_effectiveness,grade,student_suggestions',null,'0','{"figure":true}',"2022-03-06 12:38:07.000 ","2022-03-06 12:38:07.000 ");
insert into `auth` values ('12','管理员','测评结果','evaluation_results','测评结果详情','/evaluation_results/view','','_blank','1','1','1','1','course_number,course_name,teacher,evaluation_name,class_name,content_of_courses,teaching_level_,teaching_method,teaching_effectiveness,grade,student_suggestions','course_number,course_name,teacher,evaluation_name,class_name,content_of_courses,teaching_level_,teaching_method,teaching_effectiveness,grade,student_suggestions','course_number,course_name,teacher,evaluation_name,class_name,content_of_courses,teaching_level_,teaching_method,teaching_effectiveness,grade,student_suggestions',null,'0','{}',"2022-03-06 12:38:07.000 ","2022-03-06 12:38:07.000 ");
insert into `auth` values ('13','管理员','通知公告','notice_announcement','通知公告','/notice_announcement/table','','_blank','1','1','1','1','title,relevant_attachments,publisher,release_date,content','title,relevant_attachments,publisher,release_date,content','title,relevant_attachments,publisher,release_date,content',null,'0','{}',"2022-03-06 12:38:07.000 ","2022-03-06 12:38:07.000 ");
insert into `auth` values ('14','管理员','通知公告','notice_announcement','通知公告详情','/notice_announcement/view','','_blank','1','1','1','1','title,relevant_attachments,publisher,release_date,content','title,relevant_attachments,publisher,release_date,content','title,relevant_attachments,publisher,release_date,content',null,'0','{}',"2022-03-06 12:38:07.000 ","2022-03-06 12:38:07.000 ");
insert into `auth` values ('15','管理员','测评信息','evaluation_information','测评信息','/evaluation_information/table','','_blank','1','1','1','1','course_number,course_name,teacher,class_name,evaluation_name,evaluation_start_time,evaluation_end_time','course_number,course_name,teacher,class_name,evaluation_name,evaluation_start_time,evaluation_end_time','course_number,course_name,teacher,class_name,evaluation_name,evaluation_start_time,evaluation_end_time',null,'0','{}',"2022-03-06 12:38:07.000 ","2022-03-06 12:38:07.000 ");
insert into `auth` values ('16','管理员','测评信息','evaluation_information','测评信息详情','/evaluation_information/view','','_blank','1','1','1','1','course_number,course_name,teacher,class_name,evaluation_name,evaluation_start_time,evaluation_end_time','course_number,course_name,teacher,class_name,evaluation_name,evaluation_start_time,evaluation_end_time','course_number,course_name,teacher,class_name,evaluation_name,evaluation_start_time,evaluation_end_time',null,'0','{}',"2022-03-06 12:38:07.000 ","2022-03-06 12:38:07.000 ");
insert into `auth` values ('17','管理员','评论','comment','评论列表','/comment/table','','_blank','0','0','0','0','','','',null,'0','{}',"2022-03-06 12:38:07.000 ","2022-03-06 12:38:07.000 ");
insert into `auth` values ('18','管理员','评论','comment','评论详情','/comment/view','','_blank','0','0','0','0','','','',null,'0','{}',"2022-03-06 12:38:07.000 ","2022-03-06 12:38:07.000 ");
insert into `auth` values ('19','管理员','评论','comment','我的评论','/comment/list','','_blank','0','0','0','0','','','',null,'0','{}',"2022-03-06 12:38:07.000 ","2022-03-06 12:38:07.000 ");
insert into `auth` values ('20','管理员','评论','comment','评论详情','/comment/details','','_blank','0','0','0','0','','','',null,'0','{}',"2022-03-06 12:38:07.000 ","2022-03-06 12:38:07.000 ");
insert into `auth` values ('21','游客','教师','teacher','教师','/teacher/table','','_blank','0','0','0','0','teacher_job_number,teacher_name','teacher_job_number,teacher_name','teacher_job_number,teacher_name',null,'0','{}',"2022-03-06 12:38:07.000 ","2022-03-06 12:38:07.000 ");
insert into `auth` values ('22','游客','教师','teacher','教师详情','/teacher/view','','_blank','0','0','0','0','teacher_job_number,teacher_name','teacher_job_number,teacher_name','teacher_job_number,teacher_name',null,'0','{}',"2022-03-06 12:38:07.000 ","2022-03-06 12:38:07.000 ");
insert into `auth` values ('23','游客','学生','student','学生','/student/table','','_blank','1','0','0','0','student_number,student_name,class_name','student_number,student_name,class_name','student_number,student_name,class_name',null,'0','{}',"2022-03-06 12:38:07.000 ","2022-03-06 12:38:07.000 ");
insert into `auth` values ('24','游客','学生','student','学生详情','/student/view','','_blank','1','0','0','0','student_number,student_name,class_name','student_number,student_name,class_name','student_number,student_name,class_name',null,'0','{}',"2022-03-06 12:38:07.000 ","2022-03-06 12:38:07.000 ");
insert into `auth` values ('25','游客','教务人员','academic_staff','教务人员','/academic_staff/table','','_blank','0','0','0','0','academic_staff_no,name_of_academic_administrator','academic_staff_no,name_of_academic_administrator','academic_staff_no,name_of_academic_administrator',null,'0','{}',"2022-03-06 12:38:07.000 ","2022-03-06 12:38:07.000 ");
insert into `auth` values ('26','游客','教务人员','academic_staff','教务人员详情','/academic_staff/view','','_blank','0','0','0','0','academic_staff_no,name_of_academic_administrator','academic_staff_no,name_of_academic_administrator','academic_staff_no,name_of_academic_administrator',null,'0','{}',"2022-03-06 12:38:07.000 ","2022-03-06 12:38:07.000 ");
insert into `auth` values ('27','游客','课程信息','course_information','课程信息','/course_information/table','','_blank','0','0','0','0','course_number,course_name,teacher,class_time,class_place,class_name','course_number,course_name,teacher,class_time,class_place,class_name','course_number,course_name,teacher,class_time,class_place,class_name',null,'0','{}',"2022-03-06 12:38:07.000 ","2022-03-06 12:38:07.000 ");
insert into `auth` values ('28','游客','课程信息','course_information','课程信息详情','/course_information/view','','_blank','0','0','0','0','course_number,course_name,teacher,class_time,class_place,class_name','course_number,course_name,teacher,class_time,class_place,class_name','course_number,course_name,teacher,class_time,class_place,class_name',null,'0','{}',"2022-03-06 12:38:07.000 ","2022-03-06 12:38:07.000 ");
insert into `auth` values ('29','游客','学生评分','student_rating','学生评分','/student_rating/table','','_blank','0','0','0','0','course_number,course_name,teacher,class_name,evaluation_name,content_of_courses,teaching_level_,teaching_method,teaching_effectiveness,total_score,student_number,student_name,teaching_suggestions','course_number,course_name,teacher,class_name,evaluation_name,content_of_courses,teaching_level_,teaching_method,teaching_effectiveness,total_score,student_number,student_name,teaching_suggestions','course_number,course_name,teacher,class_name,evaluation_name,content_of_courses,teaching_level_,teaching_method,teaching_effectiveness,total_score,student_number,student_name,teaching_suggestions',null,'0','{"figure":false}',"2022-03-06 12:38:07.000 ","2022-03-06 12:38:07.000 ");
insert into `auth` values ('30','游客','学生评分','student_rating','学生评分详情','/student_rating/view','','_blank','0','0','0','0','course_number,course_name,teacher,class_name,evaluation_name,content_of_courses,teaching_level_,teaching_method,teaching_effectiveness,total_score,student_number,student_name,teaching_suggestions','course_number,course_name,teacher,class_name,evaluation_name,content_of_courses,teaching_level_,teaching_method,teaching_effectiveness,total_score,student_number,student_name,teaching_suggestions','course_number,course_name,teacher,class_name,evaluation_name,content_of_courses,teaching_level_,teaching_method,teaching_effectiveness,total_score,student_number,student_name,teaching_suggestions',null,'0','{}',"2022-03-06 12:38:07.000 ","2022-03-06 12:38:07.000 ");
insert into `auth` values ('31','游客','测评结果','evaluation_results','测评结果','/evaluation_results/table','','_blank','0','0','0','0','course_number,course_name,teacher,evaluation_name,class_name,content_of_courses,teaching_level_,teaching_method,teaching_effectiveness,grade,student_suggestions','course_number,course_name,teacher,evaluation_name,class_name,content_of_courses,teaching_level_,teaching_method,teaching_effectiveness,grade,student_suggestions','course_number,course_name,teacher,evaluation_name,class_name,content_of_courses,teaching_level_,teaching_method,teaching_effectiveness,grade,student_suggestions',null,'0','{"figure":false}',"2022-03-06 12:38:07.000 ","2022-03-06 12:38:07.000 ");
insert into `auth` values ('32','游客','测评结果','evaluation_results','测评结果详情','/evaluation_results/view','','_blank','0','0','0','0','course_number,course_name,teacher,evaluation_name,class_name,content_of_courses,teaching_level_,teaching_method,teaching_effectiveness,grade,student_suggestions','course_number,course_name,teacher,evaluation_name,class_name,content_of_courses,teaching_level_,teaching_method,teaching_effectiveness,grade,student_suggestions','course_number,course_name,teacher,evaluation_name,class_name,content_of_courses,teaching_level_,teaching_method,teaching_effectiveness,grade,student_suggestions',null,'0','{}',"2022-03-06 12:38:07.000 ","2022-03-06 12:38:07.000 ");
insert into `auth` values ('33','游客','通知公告','notice_announcement','通知公告','/notice_announcement/table','','_blank','0','0','0','0','title,relevant_attachments,publisher,release_date,content','title,relevant_attachments,publisher,release_date,content','title,relevant_attachments,publisher,release_date,content',null,'0','{}',"2022-03-06 12:38:07.000 ","2022-03-06 12:38:07.000 ");
insert into `auth` values ('34','游客','通知公告','notice_announcement','通知公告详情','/notice_announcement/view','','_blank','0','0','0','0','title,relevant_attachments,publisher,release_date,content','title,relevant_attachments,publisher,release_date,content','title,relevant_attachments,publisher,release_date,content',null,'0','{}',"2022-03-06 12:38:07.000 ","2022-03-06 12:38:07.000 ");
insert into `auth` values ('35','游客','测评信息','evaluation_information','测评信息','/evaluation_information/table','','_blank','0','0','0','0','course_number,course_name,teacher,class_name,evaluation_name,evaluation_start_time,evaluation_end_time','course_number,course_name,teacher,class_name,evaluation_name,evaluation_start_time,evaluation_end_time','course_number,course_name,teacher,class_name,evaluation_name,evaluation_start_time,evaluation_end_time',null,'0','{}',"2022-03-06 12:38:07.000 ","2022-03-06 12:38:07.000 ");
insert into `auth` values ('36','游客','测评信息','evaluation_information','测评信息详情','/evaluation_information/view','','_blank','0','0','0','0','course_number,course_name,teacher,class_name,evaluation_name,evaluation_start_time,evaluation_end_time','course_number,course_name,teacher,class_name,evaluation_name,evaluation_start_time,evaluation_end_time','course_number,course_name,teacher,class_name,evaluation_name,evaluation_start_time,evaluation_end_time',null,'0','{}',"2022-03-06 12:38:07.000 ","2022-03-06 12:38:07.000 ");
insert into `auth` values ('37','游客','评论','comment','评论列表','/comment/table','','_blank','0','0','0','0','','','',null,'0','{}',"2022-03-06 12:38:07.000 ","2022-03-06 12:38:07.000 ");
insert into `auth` values ('38','游客','评论','comment','评论详情','/comment/view','','_blank','0','0','0','0','','','',null,'0','{}',"2022-03-06 12:38:07.000 ","2022-03-06 12:38:07.000 ");
insert into `auth` values ('39','游客','评论','comment','我的评论','/comment/list','','_blank','0','0','0','0','','','',null,'0','{}',"2022-03-06 12:38:07.000 ","2022-03-06 12:38:07.000 ");
insert into `auth` values ('40','游客','评论','comment','评论详情','/comment/details','','_blank','0','0','0','0','','','',null,'0','{}',"2022-03-06 12:38:07.000 ","2022-03-06 12:38:07.000 ");
insert into `auth` values ('41','教师','教师','teacher','教师','/teacher/table','','_blank','0','0','0','0','teacher_job_number,teacher_name','teacher_job_number,teacher_name','teacher_job_number,teacher_name',null,'0','{}',"2022-03-06 12:38:07.000 ","2022-03-06 12:38:07.000 ");
insert into `auth` values ('42','教师','教师','teacher','教师详情','/teacher/view','','_blank','0','0','0','0','teacher_job_number,teacher_name','teacher_job_number,teacher_name','teacher_job_number,teacher_name',null,'0','{}',"2022-03-06 12:38:07.000 ","2022-03-06 12:38:07.000 ");
insert into `auth` values ('43','教师','学生','student','学生','/student/table','','_blank','0','0','0','1','student_number,student_name,class_name','student_number,student_name,class_name','student_number,student_name,class_name',null,'0','{}',"2022-03-06 12:38:07.000 ","2022-03-06 12:38:07.000 ");
insert into `auth` values ('44','教师','学生','student','学生详情','/student/view','','_blank','0','0','0','1','student_number,student_name,class_name','student_number,student_name,class_name','student_number,student_name,class_name',null,'0','{}',"2022-03-06 12:38:07.000 ","2022-03-06 12:38:07.000 ");
insert into `auth` values ('45','教师','教务人员','academic_staff','教务人员','/academic_staff/table','','_blank','0','0','0','0','academic_staff_no,name_of_academic_administrator','academic_staff_no,name_of_academic_administrator','academic_staff_no,name_of_academic_administrator',null,'0','{}',"2022-03-06 12:38:07.000 ","2022-03-06 12:38:07.000 ");
insert into `auth` values ('46','教师','教务人员','academic_staff','教务人员详情','/academic_staff/view','','_blank','0','0','0','0','academic_staff_no,name_of_academic_administrator','academic_staff_no,name_of_academic_administrator','academic_staff_no,name_of_academic_administrator',null,'0','{}',"2022-03-06 12:38:07.000 ","2022-03-06 12:38:07.000 ");
insert into `auth` values ('47','教师','课程信息','course_information','课程信息','/course_information/table','','_blank','0','0','0','1','course_number,course_name,teacher,class_time,class_place,class_name','course_number,course_name,teacher,class_time,class_place,class_name','course_number,course_name,teacher,class_time,class_place,class_name',null,'0','{}',"2022-03-06 12:38:07.000 ","2022-03-06 12:38:07.000 ");
insert into `auth` values ('48','教师','课程信息','course_information','课程信息详情','/course_information/view','','_blank','0','0','0','1','course_number,course_name,teacher,class_time,class_place,class_name','course_number,course_name,teacher,class_time,class_place,class_name','course_number,course_name,teacher,class_time,class_place,class_name',null,'0','{}',"2022-03-06 12:38:07.000 ","2022-03-06 12:38:07.000 ");
insert into `auth` values ('49','教师','学生评分','student_rating','学生评分','/student_rating/table','','_blank','0','0','0','1','course_number,course_name,teacher,class_name,evaluation_name,content_of_courses,teaching_level_,teaching_method,teaching_effectiveness,total_score,student_number,student_name,teaching_suggestions','course_number,course_name,teacher,class_name,evaluation_name,content_of_courses,teaching_level_,teaching_method,teaching_effectiveness,total_score,student_number,student_name,teaching_suggestions','course_number,course_name,teacher,class_name,evaluation_name,content_of_courses,teaching_level_,teaching_method,teaching_effectiveness,total_score,student_number,student_name,teaching_suggestions',null,'0','{"figure":true}',"2022-03-06 12:38:07.000 ","2022-03-06 12:38:07.000 ");
insert into `auth` values ('50','教师','学生评分','student_rating','学生评分详情','/student_rating/view','','_blank','0','0','0','1','course_number,course_name,teacher,class_name,evaluation_name,content_of_courses,teaching_level_,teaching_method,teaching_effectiveness,total_score,student_number,student_name,teaching_suggestions','course_number,course_name,teacher,class_name,evaluation_name,content_of_courses,teaching_level_,teaching_method,teaching_effectiveness,total_score,student_number,student_name,teaching_suggestions','course_number,course_name,teacher,class_name,evaluation_name,content_of_courses,teaching_level_,teaching_method,teaching_effectiveness,total_score,student_number,student_name,teaching_suggestions',null,'0','{}',"2022-03-06 12:38:07.000 ","2022-03-06 12:38:07.000 ");
insert into `auth` values ('51','教师','测评结果','evaluation_results','测评结果','/evaluation_results/table','','_blank','0','0','0','1','course_number,course_name,teacher,evaluation_name,class_name,content_of_courses,teaching_level_,teaching_method,teaching_effectiveness,grade,student_suggestions','course_number,course_name,teacher,evaluation_name,class_name,content_of_courses,teaching_level_,teaching_method,teaching_effectiveness,grade,student_suggestions','course_number,course_name,teacher,evaluation_name,class_name,content_of_courses,teaching_level_,teaching_method,teaching_effectiveness,grade,student_suggestions',null,'0','{"figure":true}',"2022-03-06 12:38:07.000 ","2022-03-06 12:38:07.000 ");
insert into `auth` values ('52','教师','测评结果','evaluation_results','测评结果详情','/evaluation_results/view','','_blank','0','0','0','1','course_number,course_name,teacher,evaluation_name,class_name,content_of_courses,teaching_level_,teaching_method,teaching_effectiveness,grade,student_suggestions','course_number,course_name,teacher,evaluation_name,class_name,content_of_courses,teaching_level_,teaching_method,teaching_effectiveness,grade,student_suggestions','course_number,course_name,teacher,evaluation_name,class_name,content_of_courses,teaching_level_,teaching_method,teaching_effectiveness,grade,student_suggestions',null,'0','{}',"2022-03-06 12:38:07.000 ","2022-03-06 12:38:07.000 ");
insert into `auth` values ('53','教师','通知公告','notice_announcement','通知公告','/notice_announcement/table','','_blank','0','0','0','1','title,relevant_attachments,publisher,release_date,content','title,relevant_attachments,publisher,release_date,content','title,relevant_attachments,publisher,release_date,content',null,'0','{}',"2022-03-06 12:38:07.000 ","2022-03-06 12:38:07.000 ");
insert into `auth` values ('54','教师','通知公告','notice_announcement','通知公告详情','/notice_announcement/view','','_blank','0','0','0','1','title,relevant_attachments,publisher,release_date,content','title,relevant_attachments,publisher,release_date,content','title,relevant_attachments,publisher,release_date,content',null,'0','{}',"2022-03-06 12:38:07.000 ","2022-03-06 12:38:07.000 ");
insert into `auth` values ('55','教师','测评信息','evaluation_information','测评信息','/evaluation_information/table','','_blank','0','0','0','1','course_number,course_name,teacher,class_name,evaluation_name,evaluation_start_time,evaluation_end_time','course_number,course_name,teacher,class_name,evaluation_name,evaluation_start_time,evaluation_end_time','course_number,course_name,teacher,class_name,evaluation_name,evaluation_start_time,evaluation_end_time',null,'0','{}',"2022-03-06 12:38:07.000 ","2022-03-06 12:38:07.000 ");
insert into `auth` values ('56','教师','测评信息','evaluation_information','测评信息详情','/evaluation_information/view','','_blank','0','0','0','1','course_number,course_name,teacher,class_name,evaluation_name,evaluation_start_time,evaluation_end_time','course_number,course_name,teacher,class_name,evaluation_name,evaluation_start_time,evaluation_end_time','course_number,course_name,teacher,class_name,evaluation_name,evaluation_start_time,evaluation_end_time',null,'0','{}',"2022-03-06 12:38:07.000 ","2022-03-06 12:38:07.000 ");
insert into `auth` values ('57','教师','评论','comment','评论列表','/comment/table','','_blank','0','0','0','0','','','',null,'0','{}',"2022-03-06 12:38:07.000 ","2022-03-06 12:38:07.000 ");
insert into `auth` values ('58','教师','评论','comment','评论详情','/comment/view','','_blank','0','0','0','0','','','',null,'0','{}',"2022-03-06 12:38:07.000 ","2022-03-06 12:38:07.000 ");
insert into `auth` values ('59','教师','评论','comment','我的评论','/comment/list','','_blank','0','0','0','0','','','',null,'0','{}',"2022-03-06 12:38:07.000 ","2022-03-06 12:38:07.000 ");
insert into `auth` values ('60','教师','评论','comment','评论详情','/comment/details','','_blank','0','0','0','0','','','',null,'0','{}',"2022-03-06 12:38:07.000 ","2022-03-06 12:38:07.000 ");
insert into `auth` values ('61','学生','教师','teacher','教师','/teacher/table','','_blank','0','0','0','0','teacher_job_number,teacher_name','teacher_job_number,teacher_name','teacher_job_number,teacher_name',null,'0','{}',"2022-03-06 12:38:07.000 ","2022-03-06 12:38:07.000 ");
insert into `auth` values ('62','学生','教师','teacher','教师详情','/teacher/view','','_blank','0','0','0','0','teacher_job_number,teacher_name','teacher_job_number,teacher_name','teacher_job_number,teacher_name',null,'0','{}',"2022-03-06 12:38:07.000 ","2022-03-06 12:38:07.000 ");
insert into `auth` values ('63','学生','学生','student','学生','/student/table','','_blank','0','0','0','0','student_number,student_name,class_name','student_number,student_name,class_name','student_number,student_name,class_name',null,'0','{}',"2022-03-06 12:38:07.000 ","2022-03-06 12:38:07.000 ");
insert into `auth` values ('64','学生','学生','student','学生详情','/student/view','','_blank','0','0','0','0','student_number,student_name,class_name','student_number,student_name,class_name','student_number,student_name,class_name',null,'0','{}',"2022-03-06 12:38:07.000 ","2022-03-06 12:38:07.000 ");
insert into `auth` values ('65','学生','教务人员','academic_staff','教务人员','/academic_staff/table','','_blank','0','0','0','0','academic_staff_no,name_of_academic_administrator','academic_staff_no,name_of_academic_administrator','academic_staff_no,name_of_academic_administrator',null,'0','{}',"2022-03-06 12:38:07.000 ","2022-03-06 12:38:07.000 ");
insert into `auth` values ('66','学生','教务人员','academic_staff','教务人员详情','/academic_staff/view','','_blank','0','0','0','0','academic_staff_no,name_of_academic_administrator','academic_staff_no,name_of_academic_administrator','academic_staff_no,name_of_academic_administrator',null,'0','{}',"2022-03-06 12:38:07.000 ","2022-03-06 12:38:07.000 ");
insert into `auth` values ('67','学生','课程信息','course_information','课程信息','/course_information/table','','_blank','0','0','0','1','course_number,course_name,teacher,class_time,class_place,class_name','course_number,course_name,teacher,class_time,class_place,class_name','course_number,course_name,teacher,class_time,class_place,class_name',null,'0','{}',"2022-03-06 12:38:07.000 ","2022-03-06 12:38:07.000 ");
insert into `auth` values ('68','学生','课程信息','course_information','课程信息详情','/course_information/view','','_blank','0','0','0','1','course_number,course_name,teacher,class_time,class_place,class_name','course_number,course_name,teacher,class_time,class_place,class_name','course_number,course_name,teacher,class_time,class_place,class_name',null,'0','{}',"2022-03-06 12:38:07.000 ","2022-03-06 12:38:07.000 ");
insert into `auth` values ('69','学生','学生评分','student_rating','学生评分','/student_rating/table','','_blank','1','1','0','1','course_number,course_name,teacher,class_name,evaluation_name,content_of_courses,teaching_level_,teaching_method,teaching_effectiveness,total_score,student_number,student_name,teaching_suggestions','course_number,course_name,teacher,class_name,evaluation_name,content_of_courses,teaching_level_,teaching_method,teaching_effectiveness,total_score,student_number,student_name,teaching_suggestions','course_number,course_name,teacher,class_name,evaluation_name,content_of_courses,teaching_level_,teaching_method,teaching_effectiveness,total_score,student_number,student_name,teaching_suggestions',null,'0','{"figure":false}',"2022-03-06 12:38:07.000 ","2022-03-06 12:38:07.000 ");
insert into `auth` values ('70','学生','学生评分','student_rating','学生评分详情','/student_rating/view','','_blank','1','1','0','1','course_number,course_name,teacher,class_name,evaluation_name,content_of_courses,teaching_level_,teaching_method,teaching_effectiveness,total_score,student_number,student_name,teaching_suggestions','course_number,course_name,teacher,class_name,evaluation_name,content_of_courses,teaching_level_,teaching_method,teaching_effectiveness,total_score,student_number,student_name,teaching_suggestions','course_number,course_name,teacher,class_name,evaluation_name,content_of_courses,teaching_level_,teaching_method,teaching_effectiveness,total_score,student_number,student_name,teaching_suggestions',null,'0','{}',"2022-03-06 12:38:07.000 ","2022-03-06 12:38:07.000 ");
insert into `auth` values ('71','学生','测评结果','evaluation_results','测评结果','/evaluation_results/table','','_blank','0','0','0','0','course_number,course_name,teacher,evaluation_name,class_name,content_of_courses,teaching_level_,teaching_method,teaching_effectiveness,grade,student_suggestions','course_number,course_name,teacher,evaluation_name,class_name,content_of_courses,teaching_level_,teaching_method,teaching_effectiveness,grade,student_suggestions','course_number,course_name,teacher,evaluation_name,class_name,content_of_courses,teaching_level_,teaching_method,teaching_effectiveness,grade,student_suggestions',null,'0','{"figure":false}',"2022-03-06 12:38:07.000 ","2022-03-06 12:38:07.000 ");
insert into `auth` values ('72','学生','测评结果','evaluation_results','测评结果详情','/evaluation_results/view','','_blank','0','0','0','0','course_number,course_name,teacher,evaluation_name,class_name,content_of_courses,teaching_level_,teaching_method,teaching_effectiveness,grade,student_suggestions','course_number,course_name,teacher,evaluation_name,class_name,content_of_courses,teaching_level_,teaching_method,teaching_effectiveness,grade,student_suggestions','course_number,course_name,teacher,evaluation_name,class_name,content_of_courses,teaching_level_,teaching_method,teaching_effectiveness,grade,student_suggestions',null,'0','{}',"2022-03-06 12:38:07.000 ","2022-03-06 12:38:07.000 ");
insert into `auth` values ('73','学生','通知公告','notice_announcement','通知公告','/notice_announcement/table','','_blank','0','0','0','1','title,relevant_attachments,publisher,release_date,content','title,relevant_attachments,publisher,release_date,content','title,relevant_attachments,publisher,release_date,content',null,'0','{}',"2022-03-06 12:38:07.000 ","2022-03-06 12:38:07.000 ");
insert into `auth` values ('74','学生','通知公告','notice_announcement','通知公告详情','/notice_announcement/view','','_blank','0','0','0','1','title,relevant_attachments,publisher,release_date,content','title,relevant_attachments,publisher,release_date,content','title,relevant_attachments,publisher,release_date,content',null,'0','{}',"2022-03-06 12:38:07.000 ","2022-03-06 12:38:07.000 ");
insert into `auth` values ('75','学生','测评信息','evaluation_information','测评信息','/evaluation_information/table','','_blank','0','0','0','1','course_number,course_name,teacher,class_name,evaluation_name,evaluation_start_time,evaluation_end_time','course_number,course_name,teacher,class_name,evaluation_name,evaluation_start_time,evaluation_end_time','course_number,course_name,teacher,class_name,evaluation_name,evaluation_start_time,evaluation_end_time',null,'0','{}',"2022-03-06 12:38:07.000 ","2022-03-06 12:38:07.000 ");
insert into `auth` values ('76','学生','测评信息','evaluation_information','测评信息详情','/evaluation_information/view','','_blank','0','0','0','1','course_number,course_name,teacher,class_name,evaluation_name,evaluation_start_time,evaluation_end_time','course_number,course_name,teacher,class_name,evaluation_name,evaluation_start_time,evaluation_end_time','course_number,course_name,teacher,class_name,evaluation_name,evaluation_start_time,evaluation_end_time',null,'0','{}',"2022-03-06 12:38:07.000 ","2022-03-06 12:38:07.000 ");
insert into `auth` values ('77','学生','评论','comment','评论列表','/comment/table','','_blank','0','0','0','0','','','',null,'0','{}',"2022-03-06 12:38:07.000 ","2022-03-06 12:38:07.000 ");
insert into `auth` values ('78','学生','评论','comment','评论详情','/comment/view','','_blank','0','0','0','0','','','',null,'0','{}',"2022-03-06 12:38:07.000 ","2022-03-06 12:38:07.000 ");
insert into `auth` values ('79','学生','评论','comment','我的评论','/comment/list','','_blank','0','0','0','0','','','',null,'0','{}',"2022-03-06 12:38:07.000 ","2022-03-06 12:38:07.000 ");
insert into `auth` values ('80','学生','评论','comment','评论详情','/comment/details','','_blank','0','0','0','0','','','',null,'0','{}',"2022-03-06 12:38:07.000 ","2022-03-06 12:38:07.000 ");
insert into `auth` values ('81','教务人员','教师','teacher','教师','/teacher/table','','_blank','0','0','0','1','teacher_job_number,teacher_name','teacher_job_number,teacher_name','teacher_job_number,teacher_name',null,'0','{}',"2022-03-06 12:38:07.000 ","2022-03-06 12:38:07.000 ");
insert into `auth` values ('82','教务人员','教师','teacher','教师详情','/teacher/view','','_blank','0','0','0','1','teacher_job_number,teacher_name','teacher_job_number,teacher_name','teacher_job_number,teacher_name',null,'0','{}',"2022-03-06 12:38:07.000 ","2022-03-06 12:38:07.000 ");
insert into `auth` values ('83','教务人员','学生','student','学生','/student/table','','_blank','0','0','0','1','student_number,student_name,class_name','student_number,student_name,class_name','student_number,student_name,class_name',null,'0','{}',"2022-03-06 12:38:07.000 ","2022-03-06 12:38:07.000 ");
insert into `auth` values ('84','教务人员','学生','student','学生详情','/student/view','','_blank','0','0','0','1','student_number,student_name,class_name','student_number,student_name,class_name','student_number,student_name,class_name',null,'0','{}',"2022-03-06 12:38:07.000 ","2022-03-06 12:38:07.000 ");
insert into `auth` values ('85','教务人员','教务人员','academic_staff','教务人员','/academic_staff/table','','_blank','0','0','0','0','academic_staff_no,name_of_academic_administrator','academic_staff_no,name_of_academic_administrator','academic_staff_no,name_of_academic_administrator',null,'0','{}',"2022-03-06 12:38:07.000 ","2022-03-06 12:38:07.000 ");
insert into `auth` values ('86','教务人员','教务人员','academic_staff','教务人员详情','/academic_staff/view','','_blank','0','0','0','0','academic_staff_no,name_of_academic_administrator','academic_staff_no,name_of_academic_administrator','academic_staff_no,name_of_academic_administrator',null,'0','{}',"2022-03-06 12:38:07.000 ","2022-03-06 12:38:07.000 ");
insert into `auth` values ('87','教务人员','课程信息','course_information','课程信息','/course_information/table','','_blank','0','0','0','1','course_number,course_name,teacher,class_time,class_place,class_name','course_number,course_name,teacher,class_time,class_place,class_name','course_number,course_name,teacher,class_time,class_place,class_name',null,'0','{}',"2022-03-06 12:38:07.000 ","2022-03-06 12:38:07.000 ");
insert into `auth` values ('88','教务人员','课程信息','course_information','课程信息详情','/course_information/view','','_blank','0','0','0','1','course_number,course_name,teacher,class_time,class_place,class_name','course_number,course_name,teacher,class_time,class_place,class_name','course_number,course_name,teacher,class_time,class_place,class_name',null,'0','{}',"2022-03-06 12:38:07.000 ","2022-03-06 12:38:07.000 ");
insert into `auth` values ('89','教务人员','学生评分','student_rating','学生评分','/student_rating/table','','_blank','0','0','0','1','course_number,course_name,teacher,class_name,evaluation_name,content_of_courses,teaching_level_,teaching_method,teaching_effectiveness,total_score,student_number,student_name,teaching_suggestions','course_number,course_name,teacher,class_name,evaluation_name,content_of_courses,teaching_level_,teaching_method,teaching_effectiveness,total_score,student_number,student_name,teaching_suggestions','course_number,course_name,teacher,class_name,evaluation_name,content_of_courses,teaching_level_,teaching_method,teaching_effectiveness,total_score,student_number,student_name,teaching_suggestions',null,'0','{"figure":true}',"2022-03-06 12:38:07.000 ","2022-03-06 12:38:07.000 ");
insert into `auth` values ('90','教务人员','学生评分','student_rating','学生评分详情','/student_rating/view','','_blank','0','0','0','1','course_number,course_name,teacher,class_name,evaluation_name,content_of_courses,teaching_level_,teaching_method,teaching_effectiveness,total_score,student_number,student_name,teaching_suggestions','course_number,course_name,teacher,class_name,evaluation_name,content_of_courses,teaching_level_,teaching_method,teaching_effectiveness,total_score,student_number,student_name,teaching_suggestions','course_number,course_name,teacher,class_name,evaluation_name,content_of_courses,teaching_level_,teaching_method,teaching_effectiveness,total_score,student_number,student_name,teaching_suggestions',null,'0','{}',"2022-03-06 12:38:07.000 ","2022-03-06 12:38:07.000 ");
insert into `auth` values ('91','教务人员','测评结果','evaluation_results','测评结果','/evaluation_results/table','','_blank','1','1','1','1','course_number,course_name,teacher,evaluation_name,class_name,content_of_courses,teaching_level_,teaching_method,teaching_effectiveness,grade,student_suggestions','course_number,course_name,teacher,evaluation_name,class_name,content_of_courses,teaching_level_,teaching_method,teaching_effectiveness,grade,student_suggestions','course_number,course_name,teacher,evaluation_name,class_name,content_of_courses,teaching_level_,teaching_method,teaching_effectiveness,grade,student_suggestions',null,'0','{"figure":true}',"2022-03-06 12:38:07.000 ","2022-03-06 12:38:07.000 ");
insert into `auth` values ('92','教务人员','测评结果','evaluation_results','测评结果详情','/evaluation_results/view','','_blank','1','1','1','1','course_number,course_name,teacher,evaluation_name,class_name,content_of_courses,teaching_level_,teaching_method,teaching_effectiveness,grade,student_suggestions','course_number,course_name,teacher,evaluation_name,class_name,content_of_courses,teaching_level_,teaching_method,teaching_effectiveness,grade,student_suggestions','course_number,course_name,teacher,evaluation_name,class_name,content_of_courses,teaching_level_,teaching_method,teaching_effectiveness,grade,student_suggestions',null,'0','{}',"2022-03-06 12:38:07.000 ","2022-03-06 12:38:07.000 ");
insert into `auth` values ('93','教务人员','通知公告','notice_announcement','通知公告','/notice_announcement/table','','_blank','0','0','0','1','title,relevant_attachments,publisher,release_date,content','title,relevant_attachments,publisher,release_date,content','title,relevant_attachments,publisher,release_date,content',null,'0','{}',"2022-03-06 12:38:07.000 ","2022-03-06 12:38:07.000 ");
insert into `auth` values ('94','教务人员','通知公告','notice_announcement','通知公告详情','/notice_announcement/view','','_blank','0','0','0','1','title,relevant_attachments,publisher,release_date,content','title,relevant_attachments,publisher,release_date,content','title,relevant_attachments,publisher,release_date,content',null,'0','{}',"2022-03-06 12:38:07.000 ","2022-03-06 12:38:07.000 ");
insert into `auth` values ('95','教务人员','测评信息','evaluation_information','测评信息','/evaluation_information/table','','_blank','0','0','0','1','course_number,course_name,teacher,class_name,evaluation_name,evaluation_start_time,evaluation_end_time','course_number,course_name,teacher,class_name,evaluation_name,evaluation_start_time,evaluation_end_time','course_number,course_name,teacher,class_name,evaluation_name,evaluation_start_time,evaluation_end_time',null,'0','{}',"2022-03-06 12:38:07.000 ","2022-03-06 12:38:07.000 ");
insert into `auth` values ('96','教务人员','测评信息','evaluation_information','测评信息详情','/evaluation_information/view','','_blank','0','0','0','1','course_number,course_name,teacher,class_name,evaluation_name,evaluation_start_time,evaluation_end_time','course_number,course_name,teacher,class_name,evaluation_name,evaluation_start_time,evaluation_end_time','course_number,course_name,teacher,class_name,evaluation_name,evaluation_start_time,evaluation_end_time',null,'0','{}',"2022-03-06 12:38:07.000 ","2022-03-06 12:38:07.000 ");
insert into `auth` values ('97','教务人员','评论','comment','评论列表','/comment/table','','_blank','0','0','0','0','','','',null,'0','{}',"2022-03-06 12:38:07.000 ","2022-03-06 12:38:07.000 ");
insert into `auth` values ('98','教务人员','评论','comment','评论详情','/comment/view','','_blank','0','0','0','0','','','',null,'0','{}',"2022-03-06 12:38:07.000 ","2022-03-06 12:38:07.000 ");
insert into `auth` values ('99','教务人员','评论','comment','我的评论','/comment/list','','_blank','0','0','0','0','','','',null,'0','{}',"2022-03-06 12:38:07.000 ","2022-03-06 12:38:07.000 ");
insert into `auth` values ('100','教务人员','评论','comment','评论详情','/comment/details','','_blank','0','0','0','0','','','',null,'0','{}',"2022-03-06 12:38:07.000 ","2022-03-06 12:38:07.000 ");
insert into `user_group` values ('1','100','管理员',null,'','','0',null,"2022-03-06 12:38:07.000 ","2022-03-06 12:38:07.000 ");
insert into `user_group` values ('2','100','游客',null,'','','0','0',"2022-03-06 12:38:07.000 ","2022-03-06 12:38:07.000 ");
insert into `user_group` values ('3','100','教师',null,'teacher','teacher_id','0','0',"2022-03-06 12:38:07.000 ","2022-03-06 12:38:07.000 ");
insert into `user_group` values ('4','100','学生',null,'student','student_id','0','1',"2022-03-06 12:38:07.000 ","2022-03-06 12:38:07.000 ");
insert into `user_group` values ('5','100','教务人员',null,'academic_staff','academic_staff_id','0','0',"2022-03-06 12:38:07.000 ","2022-03-06 12:38:07.000 ");
