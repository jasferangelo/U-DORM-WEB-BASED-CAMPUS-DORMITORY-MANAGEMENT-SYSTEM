-- Adminer 4.7.8 MySQL dump

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

DROP TABLE IF EXISTS `add_property`;
CREATE TABLE `add_property` (
  `property_id` int(11) NOT NULL AUTO_INCREMENT,
  `country` varchar(50) NOT NULL,
  `province` varchar(50) NOT NULL,
  `zone` varchar(50) NOT NULL,
  `district` varchar(50) NOT NULL,
  `city` varchar(100) NOT NULL,
  `street_brgy` varchar(50) NOT NULL,
  `ward_no` int(10) NOT NULL,
  `tole` varchar(100) NOT NULL,
  `contact_no` bigint(11) NOT NULL,
  `property_type` varchar(50) NOT NULL,
  `price` bigint(10) NOT NULL,
  `total_rooms` int(10) NOT NULL,
  `bedroom` int(10) NOT NULL,
  `living_room` int(10) NOT NULL,
  `kitchen` int(10) NOT NULL,
  `bathroom` int(10) NOT NULL,
  `descriptions` varchar(2000) NOT NULL,
  `latitude` decimal(9,6) NOT NULL,
  `longitude` decimal(9,6) NOT NULL,
  `booked` tinyint(1) NOT NULL DEFAULT 0,
  `owner_id` int(11) NOT NULL,
  PRIMARY KEY (`property_id`),
  KEY `owner_id` (`owner_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

INSERT INTO `add_property` (`property_id`, `country`, `province`, `zone`, `district`, `city`, `street_brgy`, `ward_no`, `tole`, `contact_no`, `property_type`, `price`, `total_rooms`, `bedroom`, `living_room`, `kitchen`, `bathroom`, `descriptions`, `latitude`, `longitude`, `booked`, `owner_id`) VALUES
(126,	'',	'Batangas',	'',	'',	'Batangas City',	'Alangilan',	1,	'',	9888444343,	'Room Rent',	2000,	1,	1,	1,	1,	1,	'Mercury Street, Wifi Internet included, with parking lot',	13.621775,	123.194824,	1,	1),
(127,	'',	'Batangas',	'',	'',	'Batangas City',	'Alangilan',	1,	'',	9926672771,	'Room Rent',	4000,	1,	1,	1,	1,	1,	'Mercury Street, Wifi Internet included, with parking lot and cctv',	13.621775,	123.194824,	1,	1),
(128,	'',	'Batangas',	'',	'',	'Batangas',	'Alangilan',	1,	'',	9876543221,	'Room Rent',	4000,	1,	1,	1,	1,	1,	'Venus Street, Wifi Internet included, with parking lot',	13.621775,	123.194824,	0,	1),
(129,	'',	'Batangas',	'',	'',	'Batangas City',	'Alangilan',	1,	'',	9977552667,	'Room Rent',	3000,	1,	1,	1,	1,	1,	'Earth Street, Wifi Internet included, with parking lot',	13.621775,	123.194824,	0,	1),
(133,	'',	'Batangas',	'',	'',	'Batangas City',	'Mercury Street, Golden Country Homes, Alangilan',	0,	'',	99323234451,	'Room Rent',	2000,	12,	48,	0,	12,	12,	'Water and Electricity bill included, with Wifi Internet and 1 Parking garage for motors.',	13.783654,	121.074121,	0,	1),
(134,	'',	'Batangas',	'',	'',	'Batangas City',	'Neptune Street, Golden Country Homes, Alangilan',	0,	'',	9324567542,	'Room Rent',	2500,	8,	16,	2,	2,	8,	'Water and Electricity bill included, with Wifi Internet and Laundry service',	13.783507,	121.067896,	0,	1),
(135,	'',	'Batangas',	'',	'',	'Batangas City',	'Neptune Street, Golden Country Homes, Alangilan',	0,	'',	9658702337,	'Room Rent',	2500,	10,	10,	0,	10,	0,	'Water and Electricity bill included, with Wifi Internet',	13.783654,	121.074121,	0,	1),
(136,	'',	'Batangas',	'',	'',	'Batangas City',	'Mars Street, Golden Country Homes, Alangilan',	0,	'',	9956789341,	'Room Rent',	2000,	8,	8,	0,	8,	8,	'Water and Electricity bill included, with Wifi Internet',	13.783507,	121.067896,	0,	1),
(137,	'',	'Batangas',	'',	'',	'Batangas City',	'Neptune Street, Golden Country Homes, Alangilan',	0,	'',	9877863452,	'Room Rent',	1500,	4,	4,	0,	4,	2,	'Water and Electricity bill included, with Wifi Internet',	13.783507,	121.067896,	0,	1),
(140,	'',	'Batangas',	'',	'',	'Batangas City',	'Neptune Street, Golden Country Homes, Alangilan',	3,	'',	9953353238,	'Room Rent',	2000,	12,	12,	0,	12,	12,	'Water and Electricity bill included, with Wifi Internet and a Parking garage for motors and cars',	13.783779,	121.074111,	0,	1);

DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `admin_id` int(10) NOT NULL AUTO_INCREMENT,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  PRIMARY KEY (`admin_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

INSERT INTO `admin` (`admin_id`, `email`, `password`) VALUES
(1,	'jasfergarcia@gmail.com',	'12345');

DROP TABLE IF EXISTS `booking`;
CREATE TABLE `booking` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `property_id` int(11) NOT NULL,
  `tenant_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `property_id` (`property_id`),
  KEY `tenant_id` (`tenant_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

INSERT INTO `booking` (`id`, `property_id`, `tenant_id`) VALUES
(1,	127,	17),
(2,	126,	20);

DROP TABLE IF EXISTS `chat`;
CREATE TABLE `chat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `message` text NOT NULL,
  `tenant_id` int(11) NOT NULL,
  `owner_id` int(11) NOT NULL,
  `is_sender_tenant` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `owner_id` (`owner_id`),
  KEY `tenant_id` (`tenant_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

INSERT INTO `chat` (`id`, `message`, `tenant_id`, `owner_id`, `is_sender_tenant`, `created_at`, `updated_at`) VALUES
(1,	'test',	17,	1,	1,	'2022-11-27 06:35:09',	'2022-11-27 06:35:09'),
(2,	'yoo sup?',	17,	1,	0,	'2022-11-27 06:37:26',	'2022-11-27 06:37:26'),
(3,	'testteserract yoooo!',	17,	1,	1,	'2022-11-27 06:40:25',	'2022-11-27 06:40:25'),
(4,	'Hi',	20,	1,	1,	'2022-11-27 13:27:50',	'2022-11-27 13:27:50'),
(5,	'hello',	20,	1,	0,	'2022-11-27 13:54:00',	'2022-11-27 13:54:00'),
(6,	'eh',	20,	1,	0,	'2022-12-10 07:43:56',	'2022-12-10 07:43:56'),
(7,	'we',	17,	1,	0,	'2022-12-10 07:51:08',	'2022-12-10 07:51:08');

DROP TABLE IF EXISTS `month`;
CREATE TABLE `month` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mon` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

INSERT INTO `month` (`id`, `mon`) VALUES
(1,	'January'),
(2,	'February'),
(3,	'March'),
(4,	'April'),
(5,	'May'),
(6,	'June'),
(7,	'July'),
(8,	'August'),
(9,	'September'),
(10,	'October'),
(11,	'November'),
(12,	'December');

DROP TABLE IF EXISTS `owner`;
CREATE TABLE `owner` (
  `owner_id` int(11) NOT NULL AUTO_INCREMENT,
  `full_name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `phone_no` varchar(11) NOT NULL,
  `address` varchar(200) NOT NULL,
  `id_type` varchar(100) NOT NULL,
  `id_photo` varchar(1000) NOT NULL,
  PRIMARY KEY (`owner_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

INSERT INTO `owner` (`owner_id`, `full_name`, `email`, `password`, `phone_no`, `address`, `id_type`, `id_photo`) VALUES
(1,	'Kieth Stephen Aguba',	'kiethstephenaguba.ksa@gmail.com',	'827ccb0eea8a706c4c34a16891f84e7b',	'98765432111',	'Alangilan',	'Citizenship',	'owner-photo/Student ID.jpg'),
(2,	'testowners',	'testown@gmail.com',	'cc03e747a6afbbcbf8be7668acfebee5',	'',	'test123',	'Drivers Licence',	'owner-photo/Capture23.JPG'),
(3,	'Ramil Garcia',	'ramilgarcia@gmail.com',	'827ccb0eea8a706c4c34a16891f84e7b',	'',	'Santo Cristo, San Jose, Batangas',	'National ID',	'owner-photo/Student ID.jpg'),
(4,	'Kieth Aguba',	'kiethaguba@gmail.com',	'827ccb0eea8a706c4c34a16891f84e7b',	'09123456789',	'Kumintang Batangas City',	'Drivers Licence',	'owner-photo/logo.png'),
(5,	'Kieth Aguba',	'kiethaguba@gmail.com',	'827ccb0eea8a706c4c34a16891f84e7b',	'',	'Kumintang Batangas City',	'Drivers Licence',	'owner-photo/f419b4bf89fdfb5b47262e4c73e9158a.jpg');

DROP TABLE IF EXISTS `payment`;
CREATE TABLE `payment` (
  `id` int(50) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `amount` int(50) NOT NULL,
  `created_date` date NOT NULL DEFAULT current_timestamp(),
  `mon` varchar(50) NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

INSERT INTO `payment` (`id`, `name`, `amount`, `created_date`, `mon`, `email`) VALUES
(10,	'ramil',	5000,	'2022-11-24',	'November',	''),
(9,	'ramil',	5000,	'2022-11-24',	'November',	''),
(8,	'Kieth Aguba',	6000,	'2022-11-24',	'November',	''),
(11,	'Kieth Aguba',	6000,	'2022-11-24',	'November',	''),
(7,	'Kieth Aguba',	6000,	'2022-11-24',	'November',	''),
(12,	'test',	2000,	'2022-11-27',	'November',	''),
(13,	'test',	2000,	'2022-11-27',	'November',	''),
(14,	'testnew',	4000,	'2022-11-27',	'November',	''),
(15,	'sample',	5000,	'2022-11-27',	'November',	''),
(16,	'test',	2000,	'2022-11-27',	'November',	'kiethstephenaguba.ksa@gmail.com'),
(17,	'Kieth Aguba',	6000,	'2022-12-14',	'December',	'kiethstephenaguba.ksa@gmail.com');

DROP TABLE IF EXISTS `property_photo`;
CREATE TABLE `property_photo` (
  `property_photo_id` int(12) NOT NULL AUTO_INCREMENT,
  `p_photo` varchar(500) NOT NULL,
  `property_id` int(11) NOT NULL,
  PRIMARY KEY (`property_photo_id`),
  KEY `property_id` (`property_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

INSERT INTO `property_photo` (`property_photo_id`, `p_photo`, `property_id`) VALUES
(174,	'product-photo/a.jpg',	123),
(175,	'product-photo/b.jpg',	123),
(176,	'product-photo/b.jpg',	124),
(177,	'product-photo/a.jpg',	124),
(180,	'product-photo/sample dorm.jpg',	126),
(181,	'product-photo/roomrent1.jpg',	127),
(182,	'product-photo/roomrent.jpg',	128),
(183,	'product-photo/fullhouse.jpg',	129),
(187,	'product-photo/alegre.jpg',	133),
(188,	'product-photo/balai.jpg',	134),
(189,	'product-photo/studhostel.jpg',	135),
(190,	'product-photo/mars.jpg',	136),
(191,	'product-photo/otits.jpg',	137),
(194,	'product-photo/neptune.jpg',	140),
(195,	'product-photo/f419b4bf89fdfb5b47262e4c73e9158a.jpg',	0),
(196,	'product-photo/f419b4bf89fdfb5b47262e4c73e9158a.jpg',	0),
(197,	'product-photo/f419b4bf89fdfb5b47262e4c73e9158a.jpg',	0),
(198,	'product-photo/f419b4bf89fdfb5b47262e4c73e9158a.jpg',	0);

DROP TABLE IF EXISTS `review`;
CREATE TABLE `review` (
  `review_id` int(10) NOT NULL AUTO_INCREMENT,
  `comment` varchar(500) NOT NULL,
  `rating` int(5) NOT NULL,
  `property_id` int(11) NOT NULL,
  PRIMARY KEY (`review_id`),
  KEY `property_id` (`property_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

INSERT INTO `review` (`review_id`, `comment`, `rating`, `property_id`) VALUES
(5,	'This property is very nice.',	5,	123),
(6,	'I love this property.',	4,	124),
(7,	'Nice property!',	5,	126),
(8,	'NIce',	5,	133);

DROP TABLE IF EXISTS `tenant`;
CREATE TABLE `tenant` (
  `tenant_id` int(11) NOT NULL AUTO_INCREMENT,
  `full_name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `phone_no` varchar(50) NOT NULL,
  `address` varchar(200) NOT NULL,
  `id_type` varchar(100) NOT NULL,
  `id_photo` varchar(1000) NOT NULL,
  PRIMARY KEY (`tenant_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

INSERT INTO `tenant` (`tenant_id`, `full_name`, `email`, `password`, `phone_no`, `address`, `id_type`, `id_photo`) VALUES
(17,	'Jasfer Angelo Garcia',	'jasfergarcia@gmail.com',	'827ccb0eea8a706c4c34a16891f84e7b',	'98765432111',	'San Jose',	'Citizenship',	'tenant-photo/Student ID.jpg'),
(18,	'test',	'test@gmail.com',	'cc03e747a6afbbcbf8be7668acfebee5',	'',	'test',	'Student ID',	'tenant-photo/Capture23.JPG'),
(19,	'testn',	'testn@gmail.com',	'cc03e747a6afbbcbf8be7668acfebee5',	'',	'test',	'Citizenship',	'tenant-photo/Capture23.JPG'),
(20,	'Angelo Ramil',	'angelogarcia@gmail.com',	'827ccb0eea8a706c4c34a16891f84e7b',	'',	'Santo Cristo, San Jose, Batangas',	'Student ID',	'tenant-photo/Student ID.jpg');

-- 2022-12-16 09:56:27
