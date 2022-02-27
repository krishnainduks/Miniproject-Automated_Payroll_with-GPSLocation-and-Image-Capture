/*
SQLyog Ultimate v11.11 (64 bit)
MySQL - 5.7.9 : Database - payroll
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`payroll` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `payroll`;

/*Table structure for table `assigned_works` */

DROP TABLE IF EXISTS `assigned_works`;

CREATE TABLE `assigned_works` (
  `assign_id` int(11) NOT NULL AUTO_INCREMENT,
  `work_id` int(11) DEFAULT NULL,
  `employee_id` int(11) DEFAULT NULL,
  `date_time` varchar(100) DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`assign_id`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

/*Data for the table `assigned_works` */

insert  into `assigned_works`(`assign_id`,`work_id`,`employee_id`,`date_time`,`status`) values (1,8,8,'2022-01-13 10:46:24','pending'),(2,8,6,'2022-01-13 10:47:03','pending'),(3,8,9,'2022-01-13 13:02:28','pending'),(4,9,10,'2022-01-14 09:20:51','pending'),(5,5,9,'2022-01-14 09:48:01','pending'),(6,9,12,'2022-01-16 10:22:25','completed'),(7,11,18,'2022-02-04 22:46:37','pending'),(8,12,18,'2022-02-07 09:32:12','pending'),(9,12,4,'2022-02-08 11:01:31','pending'),(10,12,18,'2022-02-08 11:01:47','pending'),(11,12,18,'2022-02-08 11:27:43','pending'),(12,12,18,'2022-02-08 11:31:18','pending'),(13,11,18,'2022-02-08 12:06:53','pending'),(14,14,19,'2022-02-11 10:26:17','pending'),(15,14,19,'2022-02-11 11:18:26','pending');

/*Table structure for table `attendances` */

DROP TABLE IF EXISTS `attendances`;

CREATE TABLE `attendances` (
  `attendance_id` int(11) NOT NULL AUTO_INCREMENT,
  `employee_id` int(11) DEFAULT NULL,
  `in_time` varchar(100) DEFAULT NULL,
  `out_time` varchar(100) DEFAULT NULL,
  `date_time` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`attendance_id`)
) ENGINE=MyISAM AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;

/*Data for the table `attendances` */

insert  into `attendances`(`attendance_id`,`employee_id`,`in_time`,`out_time`,`date_time`) values (24,12,'12/02/2022 13:23:20','12/02/2022 13:23:37','2022-02-12');

/*Table structure for table `designations` */

DROP TABLE IF EXISTS `designations`;

CREATE TABLE `designations` (
  `designation_id` int(11) NOT NULL AUTO_INCREMENT,
  `designation_name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`designation_id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

/*Data for the table `designations` */

insert  into `designations`(`designation_id`,`designation_name`) values (8,'Software Engineer'),(7,'Manager'),(3,'eeferr'),(4,'rfrgrg'),(6,'degree'),(9,'Developer'),(10,'tester'),(11,'Junior Developer'),(12,'Supervisor');

/*Table structure for table `employee` */

DROP TABLE IF EXISTS `employee`;

CREATE TABLE `employee` (
  `employee_id` int(11) NOT NULL AUTO_INCREMENT,
  `login_id` int(11) DEFAULT NULL,
  `first_name` varchar(100) DEFAULT NULL,
  `last_name` varchar(100) DEFAULT NULL,
  `house_name` varchar(100) DEFAULT NULL,
  `designation_id` int(11) DEFAULT NULL,
  `joined_date` varchar(100) DEFAULT NULL,
  `dob` varchar(100) DEFAULT NULL,
  `gender` varchar(100) DEFAULT NULL,
  `qualification` varchar(100) DEFAULT NULL,
  `phone` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `place` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`employee_id`)
) ENGINE=MyISAM AUTO_INCREMENT=24 DEFAULT CHARSET=latin1;

/*Data for the table `employee` */

insert  into `employee`(`employee_id`,`login_id`,`first_name`,`last_name`,`house_name`,`designation_id`,`joined_date`,`dob`,`gender`,`qualification`,`phone`,`email`,`place`) values (10,17,'anu','m','koikara',7,'2022-01-14','2022-01-17','Other','Degree','9786543214','anu@gmail.com','perumbaavoor'),(4,11,'KRISHNAINDU','K.S','KUTTIDA(H) THAMARACHAL , KIZHAKKAMBALAM P.O',3,'2021-12-14','2021-12-08','male','on','08848835478','krishnaindumalu48466@gmail.com','piravom'),(9,16,'darsana','prasad','jsfj',6,'2022-01-13','2022-01-17','Other','Degree','9876543256','darsana@gmail.com','tpra'),(8,15,'ammu','prbhakaran','sas',3,'2021-12-28','2021-12-07','Female','Degree','98776543','ammu@gmail.com','thamarachal'),(6,13,'indu','k.s','kuttida',3,'2021-12-20','2021-12-06','Female','Degree','+918848835478','krishnaindumalu48466@gmail.com','kzkm'),(12,19,'Sanchana','Sunny','sreevihar',10,'2022-01-16','2022-01-11','Female','SSLC','9388267966','saanju@gmail.com','kaloor'),(13,20,'Anandhu','s','sreevihar',7,'2022-01-17','2022-01-05','male','Degree','8848835478','anandhugmail.com','piravom'),(22,29,'Anakha','T A','asfghh',8,'2022-02-12','2022-02-02','Female','Degree','8848835478','krishnaindu1902@gmail.com','perumbaavoor'),(23,30,'adare','reatwt','dfestw',8,'2022-02-12','2022-02-10','Other','SSLC','9878976543','krishnaindu1902@gmail.com','hghgy'),(18,25,'Ameesh','Santhosh','Maliyakal',12,'2022-02-04','2022-02-08','male','Degree','9878675645','ameesh@gmail.com','Edayapuramm'),(19,26,'Krishnaja','KS','sreevihar',12,'2022-02-11','2005-12-27','Female','Degree','9087563456','malu@gmail.com','thamarachal'),(21,28,'Krishna','KS','Kuttida house ',12,'2022-02-11','1999-04-19','Other','Degree','8848835478','krishna@gmail.com','thamarachal');

/*Table structure for table `images` */

DROP TABLE IF EXISTS `images`;

CREATE TABLE `images` (
  `image_id` int(11) NOT NULL AUTO_INCREMENT,
  `employee_id` int(11) DEFAULT NULL,
  `path` varchar(100) DEFAULT NULL,
  `date_time` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`image_id`)
) ENGINE=MyISAM AUTO_INCREMENT=43 DEFAULT CHARSET=latin1;

/*Data for the table `images` */

insert  into `images`(`image_id`,`employee_id`,`path`,`date_time`) values (1,NULL,'static/uploads/cd7340ac-10b4-40a1-aa89-23b91a674a37abc.jpg','2022-01-29'),(2,NULL,'static/uploads/b8e0f65c-03a5-4354-8c74-e97739569d43abc.jpg','2022-01-29'),(3,12,'static/uploads/03da79da-bf21-48eb-b0b3-da9bc5cca7c6abc.jpg','2022-01-29'),(4,12,'static/uploads/98aec11e-8943-4507-bd39-eb884fc781f4abc.jpg','2022-01-29 11:59:49'),(5,12,'static/uploads/2ec773e1-b864-4235-85dd-377bedb54d86abc.jpg','2022-01-29 12:01:26'),(6,12,'static/uploads/80c200fa-dcd9-48c1-b0ae-fc7bc6de7a5aabc.jpg','2022-01-29 12:04:03'),(7,12,'static/uploads/14d9bb36-c7bb-4e50-90b5-cf799227d3a5abc.jpg','2022-01-29 12:06:25'),(8,12,'static/uploads/1f5e9769-d84c-4626-a06f-ea4fb24b242eabc.jpg','2022-01-29 12:19:12'),(9,12,'static/uploads/1d9ca020-663b-4075-b333-2ec1659b2546abc.jpg','2022-01-29 12:24:17'),(10,18,'static/uploads/3a80c861-4643-4bdf-93a6-d92bfe494a70abc.jpg','2022-02-05 10:54:51'),(11,18,'static/uploads/fb62bc76-0fa6-4af4-9cbc-a5bb1276f93cabc.jpg','2022-02-05 10:58:47'),(12,18,'static/uploads/b034d826-4fe9-4f9a-bb52-b7a36dba5038abc.jpg','2022-02-05 11:00:23'),(13,12,'static/uploads/24aa4a96-4324-4d9b-a609-82ea9ffa21f4abc.jpg','2022-02-05 11:26:15'),(14,12,'static/uploads/78342140-41be-4f04-baa9-ca6d14e514ecabc.jpg','2022-02-05 11:29:24'),(15,18,'static/uploads/25870a5f-cc30-4741-9018-8dc7fc0841f1abc.jpg','2022-02-05 11:32:25'),(16,18,'static/uploads/b50b0812-78a9-45a1-bb22-9c3e11398fc2abc.jpg','2022-02-05 11:41:45'),(17,12,'static/uploads/6f302f47-9926-49e9-8e5d-edd6ef8711dcabc.jpg','2022-02-05 13:37:39'),(18,18,'static/uploads/4778a120-af6f-4906-b4c2-c37d5d670bfcabc.jpg','2022-02-07 09:24:27'),(19,18,'static/uploads/d6e6ec0c-d9e2-4c0b-8c36-099c2bf7f259abc.jpg','2022-02-07 09:28:57'),(20,18,'static/uploads/d40d0425-d6e5-42ff-b82f-c844cc0691c9abc.jpg','2022-02-07 09:32:32'),(21,18,'static/uploads/65a48c10-01db-4f43-838a-0a74a51519d1abc.jpg','2022-02-07 10:13:31'),(22,18,'static/uploads/9b85acd3-8351-403f-be3c-fe441cc3cccdabc.jpg','2022-02-07 10:17:19'),(23,12,'static/uploads/3dd3ddb8-57d7-4836-8f2d-c5590ccaa208abc.jpg','2022-02-07 10:25:33'),(24,12,'static/uploads/2a1390d8-c47c-4b54-aa52-40b6f656c9acabc.jpg','2022-02-08 10:56:35'),(25,18,'static/uploads/62ce2bcc-498e-449f-b6fd-01d6890d0344abc.jpg','2022-02-08 11:35:14'),(26,12,'static/uploads/db3ef94b-36d0-4e1c-af09-89bf691505caabc.jpg','2022-02-08 11:39:18'),(27,18,'static/uploads/8fbadca7-d399-4636-90a9-6f12ac3434e1abc.jpg','2022-02-08 12:01:26'),(28,18,'static/uploads/fe653968-817e-410e-b0b3-efb69bdfa711abc.jpg','2022-02-08 12:16:29'),(29,8,'static/uploads/1ccbd828-8d74-46a6-bbd3-879764e9d33cabc.jpg','2022-02-08 12:19:47'),(30,8,'static/uploads/022a2f15-c6c2-40aa-b0bf-eb386444b84dabc.jpg','2022-02-08 12:40:21'),(31,19,'static/uploads/808dbac0-4d9b-4652-931c-d9578fc4be37abc.jpg','2022-02-11 10:19:32'),(32,NULL,'static/uploads/a251eb10-a1b0-4c41-b0e3-d47b467af0a9abc.jpg','2022-02-11 11:08:46'),(33,NULL,'static/uploads/6dbcc6c7-70c3-4296-9640-2981bb863100abc.jpg','2022-02-11 11:10:23'),(34,19,'static/uploads/12060578-7f46-4dee-8a18-f47cddaef323abc.jpg','2022-02-11 11:12:17'),(35,19,'static/uploads/756d1f6a-f5d6-495e-a129-13c9f74f5ae5abc.jpg','2022-02-11 11:13:55'),(36,18,'static/uploads/92ede914-0775-49d0-846b-e64ed72ac5c3abc.jpg','2022-02-12 10:47:28'),(37,8,'static/uploads/35b66359-37fb-4b87-a18a-719f1f428736abc.jpg','2022-02-12 10:50:43'),(38,12,'static/uploads/f1e4c0dd-e97f-4b79-812d-765dbb85bca1abc.jpg','2022-02-12 12:25:54'),(39,12,'static/uploads/3cd3ada8-e0d7-4ade-a2a3-d8a55064108babc.jpg','2022-02-12 12:29:10'),(40,12,'static/uploads/b4b96b52-0c56-46a7-84d1-60fdbe7fb2feabc.jpg','2022-02-12 13:04:46'),(41,12,'static/uploads/235de9b6-16e6-4f8a-9c67-1899d43592a3abc.jpg','2022-02-12 13:05:45'),(42,12,'static/uploads/f409db6b-971e-4da6-8508-a04617f08d9babc.jpg','2022-02-12 13:11:36');

/*Table structure for table `leave_applications` */

DROP TABLE IF EXISTS `leave_applications`;

CREATE TABLE `leave_applications` (
  `leave_app_id` int(11) NOT NULL AUTO_INCREMENT,
  `employee_id` int(11) DEFAULT NULL,
  `leave_type_id` int(11) DEFAULT NULL,
  `applied_date` varchar(100) DEFAULT NULL,
  `applied_to_date` varchar(100) DEFAULT NULL,
  `no_of_days` int(11) DEFAULT NULL,
  `reason` varchar(100) DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`leave_app_id`)
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;

/*Data for the table `leave_applications` */

insert  into `leave_applications`(`leave_app_id`,`employee_id`,`leave_type_id`,`applied_date`,`applied_to_date`,`no_of_days`,`reason`,`status`) values (1,12,3,'2022-01-28','20-02-2022',10,'sss','accept'),(2,12,3,'2022-01-28','18-02-2022',10,'sss','reject'),(3,12,3,'2022-01-28','15-02-2022',5,'ghjs','accept'),(4,8,5,'2022-01-28','12-02-2022',6,'fever ','accept'),(5,12,3,'2022-01-28','9-02-2022',10,'vshw','reject'),(7,18,6,'2022-02-07','10-01-2022',5,'Corona','accept'),(8,12,3,'2022-02-08','10-02-2022',2,'personal ','accept'),(13,18,3,'2022-02-08','2022-02-09',1,'vvb','pending'),(9,12,6,'2022-02-08','2022-02-08',2,'personal ','accept'),(10,12,5,'2022-02-08','2022-02-11',4,'sbnsns','accept'),(11,12,5,'2022-02-08','2022-02-14',9,'bsbsn','reject'),(12,18,6,'2022-02-08','2022-02-10',2,'bsnz','reject'),(14,18,5,'2022-02-08','2022-02-10',2,'fever ','accept'),(15,18,5,'2022-02-08','2022-02-11',2,'fever','accept'),(16,19,6,'2022-02-11','2022-02-14',4,'stomach ache','reject'),(17,19,6,'2022-02-11','2022-02-15',5,'corona','accept');

/*Table structure for table `leave_types` */

DROP TABLE IF EXISTS `leave_types`;

CREATE TABLE `leave_types` (
  `leave_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `leave_type_name` varchar(100) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`leave_type_id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

/*Data for the table `leave_types` */

insert  into `leave_types`(`leave_type_id`,`leave_type_name`,`description`) values (4,'aa','dwde'),(3,'first','fever'),(5,'two','cold'),(6,'Sick Leave','illness');

/*Table structure for table `locations` */

DROP TABLE IF EXISTS `locations`;

CREATE TABLE `locations` (
  `location_id` int(11) NOT NULL AUTO_INCREMENT,
  `employee_id` int(11) DEFAULT NULL,
  `latitude` varchar(100) DEFAULT NULL,
  `longitude` varchar(100) DEFAULT NULL,
  `date_time` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`location_id`)
) ENGINE=MyISAM AUTO_INCREMENT=42 DEFAULT CHARSET=latin1;

/*Data for the table `locations` */

insert  into `locations`(`location_id`,`employee_id`,`latitude`,`longitude`,`date_time`) values (3,12,'9.977156666666668','76.28602666666667','2022-01-29 11:59:49'),(2,12,'10.04884','76.37396','2022-01-29'),(4,12,'9.977156666666668','76.28602666666667','2022-01-29 12:01:26'),(5,12,'9.977156666666668','76.28602666666667','2022-01-29 12:04:03'),(6,12,'9.977156666666668','76.28602666666667','2022-01-29 12:06:25'),(7,12,'9.977156666666668','76.28602666666667','2022-01-29 12:19:12'),(8,12,'9.977156666666668','76.28602666666667','2022-01-29 12:24:17'),(9,18,'10.047896666666666','76.406535','2022-02-05 10:54:51'),(10,18,'9.976256666666666','76.286495','2022-02-05 10:58:47'),(11,18,'9.976735','76.28639166666667','2022-02-05 11:00:23'),(12,12,'9.976735','76.28639166666667','2022-02-05 11:26:15'),(13,12,'9.976593333333334','76.28636666666667','2022-02-05 11:29:24'),(14,18,'9.976593333333334','76.28636666666667','2022-02-05 11:32:25'),(15,18,'9.976593333333334','76.28636666666667','2022-02-05 11:41:45'),(16,12,'9.975896666666667','76.28647166666666','2022-02-05 13:37:39'),(17,18,'','','2022-02-07 09:24:27'),(18,18,'','','2022-02-07 09:28:57'),(19,18,'','','2022-02-07 09:32:32'),(20,18,'','','2022-02-07 10:13:31'),(21,18,'','','2022-02-07 10:17:19'),(22,12,'','','2022-02-07 10:25:33'),(23,12,'','','2022-02-08 10:56:35'),(24,18,'','','2022-02-08 11:35:14'),(25,12,'','','2022-02-08 11:39:18'),(26,18,'','','2022-02-08 12:01:26'),(27,18,'','','2022-02-08 12:16:29'),(28,8,'9.9767587','76.2871922','2022-02-08 12:19:47'),(29,8,'9.9767436','76.2868303','2022-02-08 12:40:21'),(30,19,'10.0210555','76.449982','2022-02-11 10:19:32'),(31,NULL,'10.0021562','76.4554048','2022-02-11 11:08:46'),(32,NULL,'10.0041602','76.4543203','2022-02-11 11:10:23'),(33,19,'10.0041602','76.4543203','2022-02-11 11:12:17'),(34,19,'10.0041602','76.4543203','2022-02-11 11:13:55'),(35,18,'9.9763874','76.2864683','2022-02-12 10:47:28'),(36,8,'9.9763874','76.2864683','2022-02-12 10:50:43'),(37,12,'9.9763874','76.2864683','2022-02-12 12:25:54'),(38,12,'9.9763874','76.2864683','2022-02-12 12:29:10'),(39,12,'9.9763874','76.2864683','2022-02-12 13:04:46'),(40,12,'9.9763874','76.2864683','2022-02-12 13:05:45'),(41,12,'9.9763874','76.2864683','2022-02-12 13:11:36');

/*Table structure for table `login` */

DROP TABLE IF EXISTS `login`;

CREATE TABLE `login` (
  `login_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(100) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `usertype` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`login_id`)
) ENGINE=MyISAM AUTO_INCREMENT=31 DEFAULT CHARSET=latin1;

/*Data for the table `login` */

insert  into `login`(`login_id`,`username`,`password`,`usertype`) values (8,'aaa','aaaa','employee'),(7,'aaa','aaaa','employee'),(6,'ee','www','employee'),(5,'admin','admin','admin'),(9,'kk','abcd','employee'),(10,'kk','123','employee'),(11,'aaaaaa','aaaaaaa','employee'),(12,'eee','345','employee'),(13,'mm','124','employee'),(14,'krishna','123','employee'),(15,'ammu','2233','employee'),(16,'darsana','Darsana@123','employee'),(17,'anu','Anumol@123','employee'),(18,'krishna','Krishna@123','employee'),(19,'saanju','Saanju@123','employee'),(20,'anandhu','Anandhu@123','employee'),(21,'swded','Anandhu@456','employee'),(22,'gyt69','Anan@678','employee'),(23,'sdcdc','SSsssdd@123','employee'),(24,'hgug','Adgjki@123','employee'),(25,'Ameesh','Ameesh@123','employee'),(26,'Krishnaja','Krishnaja@123','employee'),(27,'eer','Krishna@123','employee'),(28,'Krishna','Krishna@123','employee'),(29,'Anakha','Anakha@123','employee'),(30,'Krishnaindu','Krishna@123','employee');

/*Table structure for table `overtimes` */

DROP TABLE IF EXISTS `overtimes`;

CREATE TABLE `overtimes` (
  `overtime_id` int(11) NOT NULL AUTO_INCREMENT,
  `extra_hour` varchar(100) DEFAULT NULL,
  `date_time` varchar(100) DEFAULT NULL,
  `employee_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`overtime_id`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

/*Data for the table `overtimes` */

insert  into `overtimes`(`overtime_id`,`extra_hour`,`date_time`,`employee_id`) values (1,'8','one',20211227),(2,'9','2021-12-28',20211227),(5,'9','2021-12-28',3),(6,'5','2021-12-28',6),(7,'10','2022-01-13',4),(8,'1','2022-01-13',9),(9,'2','2022-01-14',10),(10,'7','2022-01-14',6),(11,'10','2022-01-28',12),(12,'2','2022-02-04',18),(13,'3','2022-02-11',19),(14,'2','2022-02-11',21),(15,'3','2022-02-11',21);

/*Table structure for table `salary` */

DROP TABLE IF EXISTS `salary`;

CREATE TABLE `salary` (
  `pay_id` int(11) NOT NULL AUTO_INCREMENT,
  `employee_id` int(11) DEFAULT NULL,
  `basic_salary` varchar(100) DEFAULT NULL,
  `house_rent` varchar(100) DEFAULT NULL,
  `special_allowance` varchar(100) DEFAULT NULL,
  `overtime_allowance` varchar(100) DEFAULT NULL,
  `travel_allowance` varchar(100) DEFAULT NULL,
  `income_tax` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`pay_id`)
) ENGINE=MyISAM AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;

/*Data for the table `salary` */

insert  into `salary`(`pay_id`,`employee_id`,`basic_salary`,`house_rent`,`special_allowance`,`overtime_allowance`,`travel_allowance`,`income_tax`) values (12,10,'4000','2000','500','900','500','400'),(11,9,'1000','200','600','123','890','344'),(10,8,'199','220','12','45','67','50'),(4,3,'gghb','srfsd','fsf','dde','dde','hh'),(13,6,'100','200','700','300','600','-99'),(14,12,'10000','500','800','200','800','100'),(15,18,'10000','500','300','400','800','300'),(16,18,'30.0','700','500','800','200','400'),(19,18,'490.0','400','500','300','200','800'),(18,18,'970.0','700','500','800','200','400'),(20,18,'490.0','400','500','300','200','800'),(21,18,'990.0','400','500','300','200','800');

/*Table structure for table `works` */

DROP TABLE IF EXISTS `works`;

CREATE TABLE `works` (
  `work_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  `place` varchar(100) DEFAULT NULL,
  `latitude` varchar(100) DEFAULT NULL,
  `longitude` varchar(100) DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL,
  `date_time` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`work_id`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

/*Data for the table `works` */

insert  into `works`(`work_id`,`title`,`description`,`place`,`latitude`,`longitude`,`status`,`date_time`) values (8,'aaa','ddd','thamarchal','fff','ee3','available','2022-01-08'),(5,'abcd','','hij','lmn','opuu','rst','uvpp'),(7,'we','we','wde','sxdccd','amb','available','2021-12-29'),(9,'as','hghh','erkm','nhj','fft','available','2022-01-14'),(10,'trt','qr','ewe','9.974496925341198','76.28467554867048','available','2022-01-16'),(11,'aa','aaa','kochi','9.978486876207926','76.27403254329938','available','2022-02-02'),(12,'abcd','hello','kzkm','9.976580137277375','76.27981645904829','available','2022-02-04'),(13,'abcd','hheur','kolenchery','10.084974871250713','76.25930956488443','available','2022-02-11'),(14,'supervisor','supervising the employees','Choornikara','10.07095262098172','76.33240699768066','available','2022-02-11');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
