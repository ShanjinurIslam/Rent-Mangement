/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 80013
 Source Host           : localhost:3306
 Source Schema         : rent_management

 Target Server Type    : MySQL
 Target Server Version : 80013
 File Encoding         : 65001

 Date: 04/08/2019 22:05:59
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for flats
-- ----------------------------
DROP TABLE IF EXISTS `flats`;
CREATE TABLE `flats` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `house_id` int(10) unsigned NOT NULL DEFAULT '12',
  `flat_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'text',
  `vacancy_status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `flats_house_id_foreign` (`house_id`),
  CONSTRAINT `flats_house_id_foreign` FOREIGN KEY (`house_id`) REFERENCES `houses` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of flats
-- ----------------------------
BEGIN;
INSERT INTO `flats` VALUES (1, 1, 'AB1', 1, '2019-08-04 15:41:02', '2019-08-04 15:41:02');
COMMIT;

-- ----------------------------
-- Table structure for houses
-- ----------------------------
DROP TABLE IF EXISTS `houses`;
CREATE TABLE `houses` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `house_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'text',
  `address_line_1` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'text',
  `address_line_2` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT 'text',
  `city` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT 'text',
  `country` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT 'text',
  `zipcode` int(10) unsigned NOT NULL DEFAULT '12',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of houses
-- ----------------------------
BEGIN;
INSERT INTO `houses` VALUES (1, 'Silverleaf', 'House #25, Road#15, Sector #04', 'Uttara', 'Dhaka', 'Bangladesh', 1231, '2019-08-04 15:40:44', '2019-08-04 15:40:44');
COMMIT;

-- ----------------------------
-- Table structure for invoices
-- ----------------------------
DROP TABLE IF EXISTS `invoices`;
CREATE TABLE `invoices` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rent_issue_id` int(10) unsigned NOT NULL DEFAULT '12',
  `month` int(10) unsigned NOT NULL DEFAULT '12',
  `year` int(10) unsigned NOT NULL DEFAULT '12',
  `electricity_bill` double(8,2) NOT NULL DEFAULT '123.45',
  `gas_bill` double(8,2) NOT NULL DEFAULT '123.45',
  `water_bill` double(8,2) NOT NULL DEFAULT '123.45',
  `service_charge` double(8,2) NOT NULL DEFAULT '123.45',
  `previous_due` double(8,2) NOT NULL DEFAULT '123.45',
  `total_payable` double(8,2) NOT NULL DEFAULT '123.45',
  `payment_status` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `invoices_rent_issue_id_foreign` (`rent_issue_id`),
  CONSTRAINT `invoices_rent_issue_id_foreign` FOREIGN KEY (`rent_issue_id`) REFERENCES `rent_issues` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of invoices
-- ----------------------------
BEGIN;
INSERT INTO `invoices` VALUES (6, 1, 7, 2019, 5000.00, 800.00, 0.00, 5000.00, 0.00, 0.00, 0, '2019-08-04 15:52:41', '2019-08-04 15:52:41');
COMMIT;

-- ----------------------------
-- Table structure for migrations
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of migrations
-- ----------------------------
BEGIN;
INSERT INTO `migrations` VALUES (1, '2014_10_12_000000_create_users_table', 1);
INSERT INTO `migrations` VALUES (2, '2014_10_12_100000_create_password_resets_table', 1);
INSERT INTO `migrations` VALUES (3, '2016_06_01_000001_create_oauth_auth_codes_table', 1);
INSERT INTO `migrations` VALUES (4, '2016_06_01_000002_create_oauth_access_tokens_table', 1);
INSERT INTO `migrations` VALUES (5, '2016_06_01_000003_create_oauth_refresh_tokens_table', 1);
INSERT INTO `migrations` VALUES (6, '2016_06_01_000004_create_oauth_clients_table', 1);
INSERT INTO `migrations` VALUES (7, '2016_06_01_000005_create_oauth_personal_access_clients_table', 1);
INSERT INTO `migrations` VALUES (8, '2019_08_03_032010_create_renters_table', 1);
INSERT INTO `migrations` VALUES (9, '2019_08_04_003726_create_houses_table', 1);
INSERT INTO `migrations` VALUES (10, '2019_08_04_004102_create_flats_table', 1);
INSERT INTO `migrations` VALUES (11, '2019_08_04_023153_create_rent_issues_table', 1);
INSERT INTO `migrations` VALUES (12, '2019_08_04_023759_create_invoices_table', 1);
INSERT INTO `migrations` VALUES (13, '2019_08_04_025008_create_payment_details_table', 1);
COMMIT;

-- ----------------------------
-- Table structure for oauth_access_tokens
-- ----------------------------
DROP TABLE IF EXISTS `oauth_access_tokens`;
CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `client_id` int(10) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_access_tokens_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of oauth_access_tokens
-- ----------------------------
BEGIN;
INSERT INTO `oauth_access_tokens` VALUES ('7d1e543358aa921bb729273f0d00543fe003577f65fc28248c1d50ee04e8c426b1f4d3cac642fa57', 1, 1, 'Personal Access Token', '[]', 0, '2019-08-04 15:29:05', '2019-08-04 15:29:05', '2020-08-04 15:29:05');
INSERT INTO `oauth_access_tokens` VALUES ('c6866132fa04ff37fed557b284dbe39e83898a54c3a23ac7e86a24e443834313d3ba29b2d4b95574', 1, 1, 'Personal Access Token', '[]', 0, '2019-08-04 15:39:27', '2019-08-04 15:39:27', '2020-08-04 15:39:27');
INSERT INTO `oauth_access_tokens` VALUES ('d7e97da10ed0b19f976c519c610cbbc68e740cb80640d6999332e848c5fa0bc44cf2483d9aa8e6ef', 1, 1, 'Personal Access Token', '[]', 0, '2019-08-04 15:28:53', '2019-08-04 15:28:53', '2020-08-04 15:28:53');
COMMIT;

-- ----------------------------
-- Table structure for oauth_auth_codes
-- ----------------------------
DROP TABLE IF EXISTS `oauth_auth_codes`;
CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `client_id` int(10) unsigned NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for oauth_clients
-- ----------------------------
DROP TABLE IF EXISTS `oauth_clients`;
CREATE TABLE `oauth_clients` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_clients_user_id_index` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of oauth_clients
-- ----------------------------
BEGIN;
INSERT INTO `oauth_clients` VALUES (1, NULL, 'Laravel Personal Access Client', 'zFkP30i0mYVnVe0lqaH7KkEUb2wNzmDZDGn6JMR7', 'http://localhost', 1, 0, 0, '2019-08-04 15:26:49', '2019-08-04 15:26:49');
INSERT INTO `oauth_clients` VALUES (2, NULL, 'Laravel Password Grant Client', 'w0yxp8t92nqu34bq3DEzmwQzMGgAyXFfowBzbHt5', 'http://localhost', 0, 1, 0, '2019-08-04 15:26:49', '2019-08-04 15:26:49');
COMMIT;

-- ----------------------------
-- Table structure for oauth_personal_access_clients
-- ----------------------------
DROP TABLE IF EXISTS `oauth_personal_access_clients`;
CREATE TABLE `oauth_personal_access_clients` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `client_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_personal_access_clients_client_id_index` (`client_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of oauth_personal_access_clients
-- ----------------------------
BEGIN;
INSERT INTO `oauth_personal_access_clients` VALUES (1, 1, '2019-08-04 15:26:49', '2019-08-04 15:26:49');
COMMIT;

-- ----------------------------
-- Table structure for oauth_refresh_tokens
-- ----------------------------
DROP TABLE IF EXISTS `oauth_refresh_tokens`;
CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for password_resets
-- ----------------------------
DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for payment_details
-- ----------------------------
DROP TABLE IF EXISTS `payment_details`;
CREATE TABLE `payment_details` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `invoice_id` int(10) unsigned NOT NULL DEFAULT '12',
  `payment_type` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'text',
  `bank_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT 'text',
  `cheque_number` int(10) unsigned DEFAULT '12',
  `paid_amount` double(8,2) NOT NULL DEFAULT '123.45',
  `due_amount` double(8,2) DEFAULT '123.45',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of payment_details
-- ----------------------------
BEGIN;
INSERT INTO `payment_details` VALUES (1, 1, 'cash', 'text', 12, 40000.00, 0.00, '2019-08-04 15:53:39', '2019-08-04 15:53:39');
COMMIT;

-- ----------------------------
-- Table structure for rent_issues
-- ----------------------------
DROP TABLE IF EXISTS `rent_issues`;
CREATE TABLE `rent_issues` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `renter_id` int(10) unsigned NOT NULL DEFAULT '12',
  `flat_id` int(10) unsigned NOT NULL DEFAULT '12',
  `start_month` int(10) unsigned NOT NULL DEFAULT '12',
  `start_year` int(10) unsigned NOT NULL DEFAULT '12',
  `initial_rent` double(8,2) NOT NULL DEFAULT '123.45',
  `increase_per_year` double(8,2) DEFAULT '123.45',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `rent_issues_renter_id_foreign` (`renter_id`),
  KEY `rent_issues_flat_id_foreign` (`flat_id`),
  CONSTRAINT `rent_issues_flat_id_foreign` FOREIGN KEY (`flat_id`) REFERENCES `flats` (`id`) ON DELETE CASCADE,
  CONSTRAINT `rent_issues_renter_id_foreign` FOREIGN KEY (`renter_id`) REFERENCES `renters` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of rent_issues
-- ----------------------------
BEGIN;
INSERT INTO `rent_issues` VALUES (1, 1, 1, 7, 2019, 37000.00, 0.00, '2019-08-04 15:44:58', '2019-08-04 15:44:58');
COMMIT;

-- ----------------------------
-- Table structure for renters
-- ----------------------------
DROP TABLE IF EXISTS `renters`;
CREATE TABLE `renters` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nid` int(11) DEFAULT NULL,
  `passport` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `profile_image_link` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile_number` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nationality` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gender` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address_line_1` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `address_line_2` text COLLATE utf8mb4_unicode_ci,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `zipcode` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of renters
-- ----------------------------
BEGIN;
INSERT INTO `renters` VALUES (1, 'Shanjinur Islam', NULL, NULL, NULL, NULL, '01780499787', 'Bangladeshi', 'Male', 'House #25, Road#15, Sector #04', 'Uttara', 'Dhaka', 'Bangladesh', 1231, '2019-08-04 15:41:29', '2019-08-04 15:41:29');
COMMIT;

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of users
-- ----------------------------
BEGIN;
INSERT INTO `users` VALUES (1, 'Shanjinur', 'spondoncsebuet@gmail.com', NULL, '$2y$10$i7soUEQcBMMV3lK4ECTpD.rj0dPYgrYo.PgGotbfknzU2hMdGLP1C', NULL, '2019-08-04 15:28:53', '2019-08-04 15:28:53');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
