-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 09, 2021 at 03:28 PM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.4.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hrms1`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `reset_code` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_login` datetime DEFAULT NULL,
  `email_verified` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no',
  `email_token` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `type` enum('admin','superadmin') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'admin',
  `manager` tinyint(1) NOT NULL DEFAULT 0,
  `number_of_logins` int(11) NOT NULL DEFAULT 0,
  `last_activity` datetime DEFAULT NULL,
  `accepted_gdpr` tinyint(1) DEFAULT NULL,
  `isAnonymized` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `company_id`, `name`, `email`, `password`, `reset_code`, `last_login`, `email_verified`, `email_token`, `remember_token`, `created_at`, `updated_at`, `type`, `manager`, `number_of_logins`, `last_activity`, `accepted_gdpr`, `isAnonymized`) VALUES
(1, NULL, 'SuperAdmin', 'superadmin@example.com', '$2y$10$NZK.6qT8mdtPYatxXqNRM.h9u8I09bQ0wYIb.juZ1H8aJ4GjBwo8.', NULL, '2021-10-26 15:44:59', 'yes', NULL, NULL, '2021-09-27 10:59:28', '2021-10-26 10:14:59', 'superadmin', 0, 5, NULL, NULL, 0),
(2, 1, 'sathishgt', 'sgt@s.com', '$2y$10$ecSVJ0QcACC6JRz9zKuvB.uf7V.6U2AhLclL/wdMJkIO3apxyCXnm', NULL, '2021-11-01 11:05:38', 'yes', NULL, NULL, '2021-09-27 11:01:11', '2021-11-01 05:35:38', 'admin', 0, 18, NULL, NULL, 0),
(3, 2, 'GT', 'gt@gt.com', '$2y$10$ecSVJ0QcACC6JRz9zKuvB.uf7V.6U2AhLclL/wdMJkIO3apxyCXnm', NULL, '2021-09-28 05:24:07', 'yes', NULL, NULL, '2021-09-27 23:53:44', '2021-09-27 23:54:07', 'admin', 0, 1, NULL, NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `attendance`
--

CREATE TABLE `attendance` (
  `id` int(10) UNSIGNED NOT NULL,
  `employee_id` int(10) UNSIGNED NOT NULL,
  `date` date NOT NULL,
  `status` enum('absent','present') COLLATE utf8_unicode_ci NOT NULL,
  `leaveType` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `halfDayType` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_updated_by` int(10) UNSIGNED DEFAULT NULL,
  `reason` text COLLATE utf8_unicode_ci NOT NULL,
  `application_status` enum('approved','rejected','pending') COLLATE utf8_unicode_ci DEFAULT NULL,
  `applied_on` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `clock_in` time DEFAULT NULL,
  `clock_out` time DEFAULT NULL,
  `clock_in_ip_address` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  `clock_out_ip_address` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  `working_from` varchar(100) COLLATE utf8_unicode_ci DEFAULT 'Office',
  `notes` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_late` tinyint(1) NOT NULL DEFAULT 0,
  `office_start_time` time DEFAULT NULL,
  `office_end_time` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `attendance`
--

INSERT INTO `attendance` (`id`, `employee_id`, `date`, `status`, `leaveType`, `halfDayType`, `last_updated_by`, `reason`, `application_status`, `applied_on`, `created_at`, `updated_at`, `clock_in`, `clock_out`, `clock_in_ip_address`, `clock_out_ip_address`, `working_from`, `notes`, `is_late`, `office_start_time`, `office_end_time`) VALUES
(1, 1, '2021-08-01', 'present', NULL, NULL, 2, '', NULL, NULL, '2021-09-27 11:09:20', '2021-09-27 11:09:41', '03:30:00', '12:30:00', NULL, NULL, 'Office', '', 0, '03:30:00', '12:30:00'),
(2, 1, '2021-08-02', 'present', NULL, NULL, 2, '', NULL, NULL, '2021-09-27 11:09:58', '2021-09-27 11:10:00', '03:30:00', '12:30:00', NULL, NULL, 'Office', '', 0, '03:30:00', '12:30:00'),
(3, 1, '2021-08-03', 'present', NULL, NULL, 2, '', NULL, NULL, '2021-09-27 11:10:06', '2021-09-27 11:10:10', '03:30:00', '12:30:00', NULL, NULL, 'Office', '', 0, '03:30:00', '12:30:00'),
(4, 2, '2021-09-28', 'present', NULL, NULL, NULL, '', NULL, NULL, '2021-09-28 00:01:30', '2021-09-28 00:01:30', '05:31:30', NULL, '127.0.0.1', NULL, 'Home', NULL, 0, '12:00:00', '21:00:00'),
(5, 2, '2021-08-01', 'present', NULL, 'no', 3, '', NULL, NULL, '2021-09-28 00:02:23', '2021-09-28 00:02:23', '10:30:00', '18:30:00', NULL, NULL, NULL, NULL, 0, '12:00:00', '21:00:00'),
(6, 2, '2021-08-02', 'present', NULL, 'no', 3, '', NULL, NULL, '2021-09-28 00:02:47', '2021-09-28 00:02:47', '08:30:00', '17:30:00', NULL, NULL, NULL, NULL, 0, '12:00:00', '21:00:00'),
(7, 1, '2021-10-24', 'present', NULL, 'no', 2, '', NULL, NULL, '2021-10-24 07:24:18', '2021-10-24 07:25:28', '15:30:00', '23:30:00', NULL, NULL, 'Office', 'Not Set', 0, '03:30:00', '12:30:00'),
(8, 4, '2021-10-01', 'absent', 'CL', 'no', 2, '123', NULL, NULL, '2021-10-30 04:47:55', '2021-10-30 04:48:18', NULL, NULL, NULL, NULL, '', '', 0, '03:30:00', '12:30:00'),
(9, 3, '2021-10-01', 'present', NULL, NULL, 2, '', NULL, NULL, '2021-10-30 04:48:30', '2021-10-30 04:48:38', '03:30:00', '12:30:00', NULL, NULL, 'Office', '', 0, '03:30:00', '12:30:00'),
(10, 1, '2021-10-01', 'absent', 'ML', 'yes', 2, 'free', NULL, NULL, '2021-10-30 04:48:38', '2021-10-30 04:48:38', NULL, NULL, NULL, NULL, '', '', 0, '03:30:00', '12:30:00'),
(11, 1, '2021-10-02', 'present', NULL, NULL, 2, '', NULL, NULL, '2021-10-30 04:49:17', '2021-10-30 04:49:17', '03:30:00', '12:30:00', NULL, NULL, 'Office', '', 0, '03:30:00', '12:30:00'),
(12, 3, '2021-10-02', 'present', NULL, NULL, 2, '', NULL, NULL, '2021-10-30 04:49:17', '2021-10-30 04:49:17', '03:30:00', '12:30:00', NULL, NULL, 'Office', '', 0, '03:30:00', '12:30:00'),
(13, 4, '2021-10-02', 'present', NULL, NULL, 2, '', NULL, NULL, '2021-10-30 04:49:17', '2021-10-30 04:49:17', '03:30:00', '12:30:00', NULL, NULL, 'Office', '', 0, '03:30:00', '12:30:00'),
(14, 1, '2021-10-04', 'present', NULL, NULL, 2, '', NULL, NULL, '2021-10-30 04:49:29', '2021-10-30 04:49:29', '03:30:00', '12:30:00', NULL, NULL, 'Office', '', 0, '03:30:00', '12:30:00'),
(15, 3, '2021-10-04', 'present', NULL, NULL, 2, '', NULL, NULL, '2021-10-30 04:49:29', '2021-10-30 04:49:29', '03:30:00', '12:30:00', NULL, NULL, 'Office', '', 0, '03:30:00', '12:30:00'),
(16, 4, '2021-10-04', 'present', NULL, NULL, 2, '', NULL, NULL, '2021-10-30 04:49:29', '2021-10-30 04:49:29', '03:30:00', '12:30:00', NULL, NULL, 'Office', '', 0, '03:30:00', '12:30:00'),
(17, 1, '2021-10-05', 'present', NULL, NULL, 2, '', NULL, NULL, '2021-10-30 04:49:38', '2021-10-30 04:49:38', '03:30:00', '12:30:00', NULL, NULL, 'Office', '', 0, '03:30:00', '12:30:00'),
(18, 3, '2021-10-05', 'absent', 'ML', 'yes', 2, 'lop', NULL, NULL, '2021-10-30 04:49:38', '2021-10-30 04:49:38', NULL, NULL, NULL, NULL, '', '', 0, '03:30:00', '12:30:00'),
(19, 4, '2021-10-05', 'present', NULL, NULL, 2, '', NULL, NULL, '2021-10-30 04:49:38', '2021-10-30 04:49:38', '03:30:00', '12:30:00', NULL, NULL, 'Office', '', 0, '03:30:00', '12:30:00'),
(20, 1, '2021-10-06', 'absent', 'ML', 'yes', 2, '', NULL, NULL, '2021-10-30 04:50:21', '2021-10-30 04:50:21', NULL, NULL, NULL, NULL, '', '', 0, '03:30:00', '12:30:00'),
(21, 3, '2021-10-06', 'present', NULL, NULL, 2, '', NULL, NULL, '2021-10-30 04:50:21', '2021-10-30 04:50:21', '03:30:00', '12:30:00', NULL, NULL, 'Office', '', 0, '03:30:00', '12:30:00'),
(22, 4, '2021-10-06', 'present', NULL, NULL, 2, '', NULL, NULL, '2021-10-30 04:50:21', '2021-10-30 04:50:21', '03:30:00', '12:30:00', NULL, NULL, 'Office', '', 0, '03:30:00', '12:30:00');

-- --------------------------------------------------------

--
-- Table structure for table `awards`
--

CREATE TABLE `awards` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED NOT NULL,
  `employee_id` int(10) UNSIGNED NOT NULL,
  `award_name` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `gift` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `cash_price` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `month` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `year` varchar(4) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bank_details`
--

CREATE TABLE `bank_details` (
  `id` int(10) UNSIGNED NOT NULL,
  `employee_id` int(10) UNSIGNED NOT NULL,
  `account_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `account_number` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `bank` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `tax_payer_id` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `branch` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `bin` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `browse_history`
--

CREATE TABLE `browse_history` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED NOT NULL,
  `admin_id` int(10) UNSIGNED NOT NULL,
  `ip` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `route` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `url` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `browse_history`
--

INSERT INTO `browse_history` (`id`, `company_id`, `admin_id`, `ip`, `route`, `url`, `created_at`, `updated_at`) VALUES
(1, 1, 2, '127.0.0.1', 'admin.dashboard.index', 'http://localhost/try/hrms/Human-Resource-Management-System/public/admin/dashboard', '2021-09-27 11:02:36', '2021-09-27 11:02:36'),
(2, 1, 2, '127.0.0.1', 'admin.attendance.ajax_load_calender', 'http://localhost/try/hrms/Human-Resource-Management-System/public/admin/attendances/ajax_load_calender', '2021-09-27 11:02:37', '2021-09-27 11:02:37'),
(3, 1, 2, '127.0.0.1', 'admin.departments.index', 'http://localhost/try/hrms/Human-Resource-Management-System/public/admin/departments', '2021-09-27 11:02:58', '2021-09-27 11:02:58'),
(4, 1, 2, '127.0.0.1', 'admin.departments.create', 'http://localhost/try/hrms/Human-Resource-Management-System/public/admin/departments/create', '2021-09-27 11:03:00', '2021-09-27 11:03:00'),
(5, 1, 2, '127.0.0.1', 'admin.departments.store', 'http://localhost/try/hrms/Human-Resource-Management-System/public/admin/departments', '2021-09-27 11:03:26', '2021-09-27 11:03:26'),
(6, 1, 2, '127.0.0.1', 'admin.departments.index', 'http://localhost/try/hrms/Human-Resource-Management-System/public/admin/departments', '2021-09-27 11:03:27', '2021-09-27 11:03:27'),
(7, 1, 2, '127.0.0.1', 'admin.payrolls.index', 'http://localhost/try/hrms/Human-Resource-Management-System/public/admin/payrolls', '2021-09-27 11:03:35', '2021-09-27 11:03:35'),
(8, 1, 2, '127.0.0.1', 'admin.ajax_payrolls', 'http://localhost/try/hrms/Human-Resource-Management-System/public/admin/ajax_payrolls', '2021-09-27 11:03:36', '2021-09-27 11:03:36'),
(9, 1, 2, '127.0.0.1', 'admin.payrolls.create', 'http://localhost/try/hrms/Human-Resource-Management-System/public/admin/payrolls/create', '2021-09-27 11:03:38', '2021-09-27 11:03:38'),
(10, 1, 2, '127.0.0.1', 'admin.employees.index', 'http://localhost/try/hrms/Human-Resource-Management-System/public/admin/employees', '2021-09-27 11:03:44', '2021-09-27 11:03:44'),
(11, 1, 2, '127.0.0.1', 'admin.ajax_employees', 'http://localhost/try/hrms/Human-Resource-Management-System/public/admin/employees/ajax_employees', '2021-09-27 11:03:45', '2021-09-27 11:03:45'),
(12, 1, 2, '127.0.0.1', 'admin.employees.create', 'http://localhost/try/hrms/Human-Resource-Management-System/public/admin/employees/create', '2021-09-27 11:03:46', '2021-09-27 11:03:46'),
(13, 1, 2, '127.0.0.1', 'admin.departments.ajax_designation', 'http://localhost/try/hrms/Human-Resource-Management-System/public/admin/departments/ajax_designation', '2021-09-27 11:03:47', '2021-09-27 11:03:47'),
(14, 1, 2, '127.0.0.1', 'admin.employees.store', 'http://localhost/try/hrms/Human-Resource-Management-System/public/admin/employees', '2021-09-27 11:04:58', '2021-09-27 11:04:58'),
(15, 1, 2, '127.0.0.1', 'admin.ajax_update_notification', 'http://localhost/try/hrms/Human-Resource-Management-System/public/admin/ajax_update_notification', '2021-09-27 11:05:09', '2021-09-27 11:05:09'),
(16, 1, 2, '127.0.0.1', 'admin.employees.store', 'http://localhost/try/hrms/Human-Resource-Management-System/public/admin/employees', '2021-09-27 11:05:12', '2021-09-27 11:05:12'),
(17, 1, 2, '127.0.0.1', 'admin.employees.index', 'http://localhost/try/hrms/Human-Resource-Management-System/public/admin/employees', '2021-09-27 11:05:13', '2021-09-27 11:05:13'),
(18, 1, 2, '127.0.0.1', 'admin.ajax_employees', 'http://localhost/try/hrms/Human-Resource-Management-System/public/admin/employees/ajax_employees', '2021-09-27 11:05:14', '2021-09-27 11:05:14'),
(19, 1, 2, '127.0.0.1', 'admin.employees.import', 'http://localhost/try/hrms/Human-Resource-Management-System/public/admin/employees/import', '2021-09-27 11:05:28', '2021-09-27 11:05:28'),
(20, 1, 2, '127.0.0.1', 'admin.employees.create', 'http://localhost/try/hrms/Human-Resource-Management-System/public/admin/employees/create', '2021-09-27 11:05:40', '2021-09-27 11:05:40'),
(21, 1, 2, '127.0.0.1', 'admin.departments.ajax_designation', 'http://localhost/try/hrms/Human-Resource-Management-System/public/admin/departments/ajax_designation', '2021-09-27 11:05:41', '2021-09-27 11:05:41'),
(22, 1, 2, '127.0.0.1', 'admin.attendances.create', 'http://localhost/try/hrms/Human-Resource-Management-System/public/admin/attendances/create', '2021-09-27 11:05:45', '2021-09-27 11:05:45'),
(23, 1, 2, '127.0.0.1', 'admin.attendances.create', 'http://localhost/try/hrms/Human-Resource-Management-System/public/admin/attendances/create', '2021-09-27 11:05:45', '2021-09-27 11:05:45'),
(24, 1, 2, '127.0.0.1', 'admin.general_setting.edit', 'http://localhost/try/hrms/Human-Resource-Management-System/public/admin/general-setting', '2021-09-27 11:06:16', '2021-09-27 11:06:16'),
(25, 1, 2, '127.0.0.1', 'admin.general_setting.update', 'http://localhost/try/hrms/Human-Resource-Management-System/public/admin/general-setting', '2021-09-27 11:06:40', '2021-09-27 11:06:40'),
(26, 1, 2, '127.0.0.1', 'admin.attendance_settings.edit', 'http://localhost/try/hrms/Human-Resource-Management-System/public/admin/attendance_settings', '2021-09-27 11:06:46', '2021-09-27 11:06:46'),
(27, 1, 2, '127.0.0.1', 'admin.attendance_settings.update', 'http://localhost/try/hrms/Human-Resource-Management-System/public/admin/attendance_settings/mark_attendance', '2021-09-27 11:07:28', '2021-09-27 11:07:28'),
(28, 1, 2, '127.0.0.1', 'admin.company_setting.theme', 'http://localhost/try/hrms/Human-Resource-Management-System/public/admin/company_setting_theme', '2021-09-27 11:07:33', '2021-09-27 11:07:33'),
(29, 1, 2, '127.0.0.1', 'admin.notification.edit', 'http://localhost/try/hrms/Human-Resource-Management-System/public/admin/notification-settings', '2021-09-27 11:07:43', '2021-09-27 11:07:43'),
(30, 1, 2, '127.0.0.1', 'admin.notification.update', 'http://localhost/try/hrms/Human-Resource-Management-System/public/admin/notification-settings', '2021-09-27 11:07:59', '2021-09-27 11:07:59'),
(31, 1, 2, '127.0.0.1', 'admin.general_setting.edit', 'http://localhost/try/hrms/Human-Resource-Management-System/public/admin/general-setting', '2021-09-27 11:08:02', '2021-09-27 11:08:02'),
(32, 1, 2, '127.0.0.1', 'admin.profile_settings.edit', 'http://localhost/try/hrms/Human-Resource-Management-System/public/admin/profile-settings', '2021-09-27 11:08:06', '2021-09-27 11:08:06'),
(33, 1, 2, '127.0.0.1', 'admin.admin_users.index', 'http://localhost/try/hrms/Human-Resource-Management-System/public/admin/admin_users', '2021-09-27 11:08:10', '2021-09-27 11:08:10'),
(34, 1, 2, '127.0.0.1', 'admin.ajax_admin_users', 'http://localhost/try/hrms/Human-Resource-Management-System/public/admin/ajax_admin_users', '2021-09-27 11:08:11', '2021-09-27 11:08:11'),
(35, 1, 2, '127.0.0.1', 'admin.attendances.create', 'http://localhost/try/hrms/Human-Resource-Management-System/public/admin/attendances/create', '2021-09-27 11:08:17', '2021-09-27 11:08:17'),
(36, 1, 2, '127.0.0.1', 'admin.attendances.edit', 'http://localhost/try/hrms/Human-Resource-Management-System/public/admin/attendances/2021-09-27/edit', '2021-09-27 11:08:18', '2021-09-27 11:08:18'),
(37, 1, 2, '127.0.0.1', 'admin.leavetypes.index', 'http://localhost/try/hrms/Human-Resource-Management-System/public/admin/leavetypes', '2021-09-27 11:08:28', '2021-09-27 11:08:28'),
(38, 1, 2, '127.0.0.1', 'admin.leavetypes.ajax_list', 'http://localhost/try/hrms/Human-Resource-Management-System/public/admin/leavetypes/ajax_list', '2021-09-27 11:08:28', '2021-09-27 11:08:28'),
(39, 1, 2, '127.0.0.1', 'admin.leavetypes.create', 'http://localhost/try/hrms/Human-Resource-Management-System/public/admin/leavetypes/create', '2021-09-27 11:08:30', '2021-09-27 11:08:30'),
(40, 1, 2, '127.0.0.1', 'admin.leavetypes.store', 'http://localhost/try/hrms/Human-Resource-Management-System/public/admin/leavetypes', '2021-09-27 11:08:36', '2021-09-27 11:08:36'),
(41, 1, 2, '127.0.0.1', 'admin.leavetypes.ajax_list', 'http://localhost/try/hrms/Human-Resource-Management-System/public/admin/leavetypes/ajax_list', '2021-09-27 11:08:37', '2021-09-27 11:08:37'),
(42, 1, 2, '127.0.0.1', 'admin.leavetypes.create', 'http://localhost/try/hrms/Human-Resource-Management-System/public/admin/leavetypes/create', '2021-09-27 11:08:38', '2021-09-27 11:08:38'),
(43, 1, 2, '127.0.0.1', 'admin.leavetypes.store', 'http://localhost/try/hrms/Human-Resource-Management-System/public/admin/leavetypes', '2021-09-27 11:08:43', '2021-09-27 11:08:43'),
(44, 1, 2, '127.0.0.1', 'admin.leavetypes.ajax_list', 'http://localhost/try/hrms/Human-Resource-Management-System/public/admin/leavetypes/ajax_list', '2021-09-27 11:08:44', '2021-09-27 11:08:44'),
(45, 1, 2, '127.0.0.1', 'admin.attendances.create', 'http://localhost/try/hrms/Human-Resource-Management-System/public/admin/attendances/create', '2021-09-27 11:08:47', '2021-09-27 11:08:47'),
(46, 1, 2, '127.0.0.1', 'admin.attendances.edit', 'http://localhost/try/hrms/Human-Resource-Management-System/public/admin/attendances/2021-09-27/edit', '2021-09-27 11:08:47', '2021-09-27 11:08:47'),
(47, 1, 2, '127.0.0.1', 'admin.attendance.ajax_attendance', 'http://localhost/try/hrms/Human-Resource-Management-System/public/admin/attendances/ajax_attendance', '2021-09-27 11:08:48', '2021-09-27 11:08:48'),
(48, 1, 2, '127.0.0.1', 'admin.attendances.edit', 'http://localhost/try/hrms/Human-Resource-Management-System/public/admin/attendances/2021-08-01/edit', '2021-09-27 11:09:03', '2021-09-27 11:09:03'),
(49, 1, 2, '127.0.0.1', 'admin.attendance.ajax_attendance', 'http://localhost/try/hrms/Human-Resource-Management-System/public/admin/attendances/ajax_attendance', '2021-09-27 11:09:04', '2021-09-27 11:09:04'),
(50, 1, 2, '127.0.0.1', 'admin.attendances.create', 'http://localhost/try/hrms/Human-Resource-Management-System/public/admin/attendances/create', '2021-09-27 11:09:06', '2021-09-27 11:09:06'),
(51, 1, 2, '127.0.0.1', 'admin.attendances.edit', 'http://localhost/try/hrms/Human-Resource-Management-System/public/admin/attendances/2021-09-27/edit', '2021-09-27 11:09:07', '2021-09-27 11:09:07'),
(52, 1, 2, '127.0.0.1', 'admin.attendance.ajax_attendance', 'http://localhost/try/hrms/Human-Resource-Management-System/public/admin/attendances/ajax_attendance', '2021-09-27 11:09:07', '2021-09-27 11:09:07'),
(53, 1, 2, '127.0.0.1', 'admin.attendances.edit', 'http://localhost/try/hrms/Human-Resource-Management-System/public/admin/attendances/2021-08-01/edit', '2021-09-27 11:09:12', '2021-09-27 11:09:12'),
(54, 1, 2, '127.0.0.1', 'admin.attendance.ajax_attendance', 'http://localhost/try/hrms/Human-Resource-Management-System/public/admin/attendances/ajax_attendance', '2021-09-27 11:09:12', '2021-09-27 11:09:12'),
(55, 1, 2, '127.0.0.1', 'admin.attendance.update.row', 'http://localhost/try/hrms/Human-Resource-Management-System/public/admin/attendance/update/row', '2021-09-27 11:09:20', '2021-09-27 11:09:20'),
(56, 1, 2, '127.0.0.1', 'admin.attendances.update', 'http://localhost/try/hrms/Human-Resource-Management-System/public/admin/attendances/01-08-2021', '2021-09-27 11:09:41', '2021-09-27 11:09:41'),
(57, 1, 2, '127.0.0.1', 'admin.attendances.edit', 'http://localhost/try/hrms/Human-Resource-Management-System/public/admin/attendances/2021-08-01/edit', '2021-09-27 11:09:41', '2021-09-27 11:09:41'),
(58, 1, 2, '127.0.0.1', 'admin.attendance.ajax_attendance', 'http://localhost/try/hrms/Human-Resource-Management-System/public/admin/attendances/ajax_attendance', '2021-09-27 11:09:42', '2021-09-27 11:09:42'),
(59, 1, 2, '127.0.0.1', 'admin.attendances.edit', 'http://localhost/try/hrms/Human-Resource-Management-System/public/admin/attendances/2021-08-02/edit', '2021-09-27 11:09:53', '2021-09-27 11:09:53'),
(60, 1, 2, '127.0.0.1', 'admin.attendance.ajax_attendance', 'http://localhost/try/hrms/Human-Resource-Management-System/public/admin/attendances/ajax_attendance', '2021-09-27 11:09:54', '2021-09-27 11:09:54'),
(61, 1, 2, '127.0.0.1', 'admin.attendance.update.row', 'http://localhost/try/hrms/Human-Resource-Management-System/public/admin/attendance/update/row', '2021-09-27 11:09:58', '2021-09-27 11:09:58'),
(62, 1, 2, '127.0.0.1', 'admin.attendances.update', 'http://localhost/try/hrms/Human-Resource-Management-System/public/admin/attendances/02-08-2021', '2021-09-27 11:10:00', '2021-09-27 11:10:00'),
(63, 1, 2, '127.0.0.1', 'admin.attendances.edit', 'http://localhost/try/hrms/Human-Resource-Management-System/public/admin/attendances/2021-08-02/edit', '2021-09-27 11:10:00', '2021-09-27 11:10:00'),
(64, 1, 2, '127.0.0.1', 'admin.attendance.ajax_attendance', 'http://localhost/try/hrms/Human-Resource-Management-System/public/admin/attendances/ajax_attendance', '2021-09-27 11:10:01', '2021-09-27 11:10:01'),
(65, 1, 2, '127.0.0.1', 'admin.attendances.edit', 'http://localhost/try/hrms/Human-Resource-Management-System/public/admin/attendances/2021-08-03/edit', '2021-09-27 11:10:04', '2021-09-27 11:10:04'),
(66, 1, 2, '127.0.0.1', 'admin.attendance.ajax_attendance', 'http://localhost/try/hrms/Human-Resource-Management-System/public/admin/attendances/ajax_attendance', '2021-09-27 11:10:04', '2021-09-27 11:10:04'),
(67, 1, 2, '127.0.0.1', 'admin.attendance.update.row', 'http://localhost/try/hrms/Human-Resource-Management-System/public/admin/attendance/update/row', '2021-09-27 11:10:06', '2021-09-27 11:10:06'),
(68, 1, 2, '127.0.0.1', 'admin.attendances.update', 'http://localhost/try/hrms/Human-Resource-Management-System/public/admin/attendances/03-08-2021', '2021-09-27 11:10:10', '2021-09-27 11:10:10'),
(69, 1, 2, '127.0.0.1', 'admin.attendances.edit', 'http://localhost/try/hrms/Human-Resource-Management-System/public/admin/attendances/2021-08-03/edit', '2021-09-27 11:10:11', '2021-09-27 11:10:11'),
(70, 1, 2, '127.0.0.1', 'admin.attendance.ajax_attendance', 'http://localhost/try/hrms/Human-Resource-Management-System/public/admin/attendances/ajax_attendance', '2021-09-27 11:10:11', '2021-09-27 11:10:11'),
(71, 1, 2, '127.0.0.1', 'admin.attendances.index', 'http://localhost/try/hrms/Human-Resource-Management-System/public/admin/attendances', '2021-09-27 11:10:13', '2021-09-27 11:10:13'),
(72, 1, 2, '127.0.0.1', 'admin.attendance.filter', 'http://localhost/try/hrms/Human-Resource-Management-System/public/admin/attendances/filter', '2021-09-27 11:10:13', '2021-09-27 11:10:13'),
(73, 1, 2, '127.0.0.1', 'admin.attendance.filter', 'http://localhost/try/hrms/Human-Resource-Management-System/public/admin/attendances/filter', '2021-09-27 11:10:19', '2021-09-27 11:10:19'),
(74, 1, 2, '127.0.0.1', 'admin.payrolls.index', 'http://localhost/try/hrms/Human-Resource-Management-System/public/admin/payrolls', '2021-09-27 11:10:32', '2021-09-27 11:10:32'),
(75, 1, 2, '127.0.0.1', 'admin.ajax_payrolls', 'http://localhost/try/hrms/Human-Resource-Management-System/public/admin/ajax_payrolls', '2021-09-27 11:10:32', '2021-09-27 11:10:32'),
(76, 1, 2, '127.0.0.1', 'admin.payrolls.create', 'http://localhost/try/hrms/Human-Resource-Management-System/public/admin/payrolls/create', '2021-09-27 11:10:36', '2021-09-27 11:10:36'),
(77, 1, 2, '127.0.0.1', 'admin.payrolls.check', 'http://localhost/try/hrms/Human-Resource-Management-System/public/admin/payrolls/check', '2021-09-27 11:10:40', '2021-09-27 11:10:40'),
(78, 1, 2, '127.0.0.1', 'admin.billing.index', 'http://localhost/try/hrms/Human-Resource-Management-System/public/admin/billing', '2021-09-27 11:12:09', '2021-09-27 11:12:09'),
(79, 1, 2, '127.0.0.1', 'admin.general_setting.edit', 'http://localhost/try/hrms/Human-Resource-Management-System/public/admin/general-setting', '2021-09-27 11:12:12', '2021-09-27 11:12:12'),
(80, 1, 2, '127.0.0.1', 'admin.general_setting.update', 'http://localhost/try/hrms/Human-Resource-Management-System/public/admin/general-setting', '2021-09-27 11:13:06', '2021-09-27 11:13:06'),
(81, 1, 2, '127.0.0.1', 'admin.payrolls.index', 'http://localhost/try/hrms/Human-Resource-Management-System/public/admin/payrolls', '2021-09-27 11:13:12', '2021-09-27 11:13:12'),
(82, 1, 2, '127.0.0.1', 'admin.ajax_payrolls', 'http://localhost/try/hrms/Human-Resource-Management-System/public/admin/ajax_payrolls', '2021-09-27 11:13:13', '2021-09-27 11:13:13'),
(83, 1, 2, '127.0.0.1', 'admin.payrolls.create', 'http://localhost/try/hrms/Human-Resource-Management-System/public/admin/payrolls/create', '2021-09-27 11:13:14', '2021-09-27 11:13:14'),
(84, 1, 2, '127.0.0.1', 'admin.payrolls.check', 'http://localhost/try/hrms/Human-Resource-Management-System/public/admin/payrolls/check', '2021-09-27 11:13:18', '2021-09-27 11:13:18'),
(85, 1, 2, '127.0.0.1', 'admin.payrolls.store', 'http://localhost/try/hrms/Human-Resource-Management-System/public/admin/payrolls', '2021-09-27 11:14:07', '2021-09-27 11:14:07'),
(86, 1, 2, '127.0.0.1', 'admin.payrolls.index', 'http://localhost/try/hrms/Human-Resource-Management-System/public/admin/payrolls', '2021-09-27 11:14:07', '2021-09-27 11:14:07'),
(87, 1, 2, '127.0.0.1', 'admin.ajax_payrolls', 'http://localhost/try/hrms/Human-Resource-Management-System/public/admin/ajax_payrolls', '2021-09-27 11:14:08', '2021-09-27 11:14:08'),
(88, 1, 2, '127.0.0.1', 'admin.payrolls.downloadpdf', 'http://localhost/try/hrms/Human-Resource-Management-System/public/admin/payrolls/downloadpdf/1', '2021-09-27 11:14:25', '2021-09-27 11:14:25'),
(89, 1, 2, '127.0.0.1', 'admin.payrolls.show', 'http://localhost/try/hrms/Human-Resource-Management-System/public/admin/payrolls/1', '2021-09-27 11:14:38', '2021-09-27 11:14:38'),
(90, 1, 2, '127.0.0.1', 'admin.payrolls.edit', 'http://localhost/try/hrms/Human-Resource-Management-System/public/admin/payrolls/1/edit', '2021-09-27 11:14:43', '2021-09-27 11:14:43'),
(91, 1, 2, '127.0.0.1', 'admin.billing.index', 'http://localhost/try/hrms/Human-Resource-Management-System/public/admin/billing', '2021-09-27 11:15:25', '2021-09-27 11:15:25'),
(92, 1, 2, '127.0.0.1', 'admin.general_setting.edit', 'http://localhost/try/hrms/Human-Resource-Management-System/public/admin/general-setting', '2021-09-27 11:15:29', '2021-09-27 11:15:29'),
(93, 1, 2, '127.0.0.1', 'admin.employees.index', 'http://localhost/try/hrms/Human-Resource-Management-System/public/admin/employees', '2021-09-27 11:15:37', '2021-09-27 11:15:37'),
(94, 1, 2, '127.0.0.1', 'admin.ajax_employees', 'http://localhost/try/hrms/Human-Resource-Management-System/public/admin/employees/ajax_employees', '2021-09-27 11:15:38', '2021-09-27 11:15:38'),
(95, 1, 2, '127.0.0.1', 'admin.employees.edit', 'http://localhost/try/hrms/Human-Resource-Management-System/public/admin/employees/1/edit', '2021-09-27 11:15:40', '2021-09-27 11:15:40'),
(96, 1, 2, '127.0.0.1', 'admin.departments.ajax_designation', 'http://localhost/try/hrms/Human-Resource-Management-System/public/admin/departments/ajax_designation', '2021-09-27 11:15:40', '2021-09-27 11:15:40'),
(97, 1, 2, '127.0.0.1', 'admin.add-salary-modal', 'http://localhost/try/hrms/Human-Resource-Management-System/public/admin/add-salary-modal/1', '2021-09-27 11:16:12', '2021-09-27 11:16:12'),
(98, 1, 2, '127.0.0.1', 'admin.employees.update', 'http://localhost/try/hrms/Human-Resource-Management-System/public/admin/employees/1', '2021-09-27 11:16:19', '2021-09-27 11:16:19'),
(99, 1, 2, '127.0.0.1', 'admin.employees.update', 'http://localhost/try/hrms/Human-Resource-Management-System/public/admin/employees/1', '2021-09-27 11:16:25', '2021-09-27 11:16:25'),
(100, 1, 2, '127.0.0.1', 'admin.payrolls.index', 'http://localhost/try/hrms/Human-Resource-Management-System/public/admin/payrolls', '2021-09-27 11:16:48', '2021-09-27 11:16:48'),
(101, 1, 2, '127.0.0.1', 'admin.ajax_payrolls', 'http://localhost/try/hrms/Human-Resource-Management-System/public/admin/ajax_payrolls', '2021-09-27 11:16:49', '2021-09-27 11:16:49'),
(102, 1, 2, '127.0.0.1', 'admin.payrolls.edit', 'http://localhost/try/hrms/Human-Resource-Management-System/public/admin/payrolls/1/edit', '2021-09-27 11:16:50', '2021-09-27 11:16:50'),
(103, 1, 2, '127.0.0.1', 'admin.payrolls.edit', 'http://localhost/try/hrms/Human-Resource-Management-System/public/admin/payrolls/1/edit', '2021-09-27 11:17:32', '2021-09-27 11:17:32'),
(104, 1, 2, '127.0.0.1', 'admin.employees.index', 'http://localhost/try/hrms/Human-Resource-Management-System/public/admin/employees', '2021-09-27 11:17:39', '2021-09-27 11:17:39'),
(105, 1, 2, '127.0.0.1', 'admin.ajax_employees', 'http://localhost/try/hrms/Human-Resource-Management-System/public/admin/employees/ajax_employees', '2021-09-27 11:17:39', '2021-09-27 11:17:39'),
(106, 1, 2, '127.0.0.1', 'admin.employees.edit', 'http://localhost/try/hrms/Human-Resource-Management-System/public/admin/employees/1/edit', '2021-09-27 11:17:41', '2021-09-27 11:17:41'),
(107, 1, 2, '127.0.0.1', 'admin.departments.ajax_designation', 'http://localhost/try/hrms/Human-Resource-Management-System/public/admin/departments/ajax_designation', '2021-09-27 11:17:41', '2021-09-27 11:17:41'),
(108, 1, 2, '127.0.0.1', 'admin.salary.destroy', 'http://localhost/try/hrms/Human-Resource-Management-System/public/admin/salary/1', '2021-09-27 11:17:51', '2021-09-27 11:17:51'),
(109, 1, 2, '127.0.0.1', 'admin.employees.update', 'http://localhost/try/hrms/Human-Resource-Management-System/public/admin/employees/1', '2021-09-27 11:17:57', '2021-09-27 11:17:57'),
(110, 1, 2, '127.0.0.1', 'admin.payrolls.edit', 'http://localhost/try/hrms/Human-Resource-Management-System/public/admin/payrolls/1/edit', '2021-09-27 11:18:00', '2021-09-27 11:18:00'),
(111, 1, 2, '127.0.0.1', 'admin.payrolls.edit', 'http://localhost/try/hrms/Human-Resource-Management-System/public/admin/payrolls/1/edit', '2021-09-27 11:18:05', '2021-09-27 11:18:05'),
(112, 1, 2, '127.0.0.1', 'admin.payrolls.index', 'http://localhost/try/hrms/Human-Resource-Management-System/public/admin/payrolls', '2021-09-27 11:18:15', '2021-09-27 11:18:15'),
(113, 1, 2, '127.0.0.1', 'admin.ajax_payrolls', 'http://localhost/try/hrms/Human-Resource-Management-System/public/admin/ajax_payrolls', '2021-09-27 11:18:16', '2021-09-27 11:18:16'),
(114, 1, 2, '127.0.0.1', 'admin.payrolls.destroy', 'http://localhost/try/hrms/Human-Resource-Management-System/public/admin/payrolls/1', '2021-09-27 11:18:19', '2021-09-27 11:18:19'),
(115, 1, 2, '127.0.0.1', 'admin.payrolls.index', 'http://localhost/try/hrms/Human-Resource-Management-System/public/admin/payrolls', '2021-09-27 11:18:24', '2021-09-27 11:18:24'),
(116, 1, 2, '127.0.0.1', 'admin.ajax_payrolls', 'http://localhost/try/hrms/Human-Resource-Management-System/public/admin/ajax_payrolls', '2021-09-27 11:18:25', '2021-09-27 11:18:25'),
(117, 1, 2, '127.0.0.1', 'admin.payrolls.create', 'http://localhost/try/hrms/Human-Resource-Management-System/public/admin/payrolls/create', '2021-09-27 11:18:26', '2021-09-27 11:18:26'),
(118, 1, 2, '127.0.0.1', 'admin.payrolls.check', 'http://localhost/try/hrms/Human-Resource-Management-System/public/admin/payrolls/check', '2021-09-27 11:18:31', '2021-09-27 11:18:31'),
(119, 1, 2, '127.0.0.1', 'admin.add-salary-modal', 'http://localhost/try/hrms/Human-Resource-Management-System/public/admin/add-salary-modal/1', '2021-09-27 11:18:59', '2021-09-27 11:18:59'),
(120, 1, 2, '127.0.0.1', 'admin.payrolls.store', 'http://localhost/try/hrms/Human-Resource-Management-System/public/admin/payrolls', '2021-09-27 11:19:25', '2021-09-27 11:19:25'),
(121, 1, 2, '127.0.0.1', 'admin.payrolls.index', 'http://localhost/try/hrms/Human-Resource-Management-System/public/admin/payrolls', '2021-09-27 11:19:26', '2021-09-27 11:19:26'),
(122, 1, 2, '127.0.0.1', 'admin.ajax_payrolls', 'http://localhost/try/hrms/Human-Resource-Management-System/public/admin/ajax_payrolls', '2021-09-27 11:19:27', '2021-09-27 11:19:27'),
(123, 1, 2, '127.0.0.1', 'admin.payrolls.downloadpdf', 'http://localhost/try/hrms/Human-Resource-Management-System/public/admin/payrolls/downloadpdf/2', '2021-09-27 11:19:29', '2021-09-27 11:19:29'),
(124, 1, 2, '127.0.0.1', 'admin.attendances.create', 'http://localhost/try/hrms/Human-Resource-Management-System/public/admin/attendances/create', '2021-09-27 11:22:00', '2021-09-27 11:22:00'),
(125, 1, 2, '127.0.0.1', 'admin.attendances.edit', 'http://localhost/try/hrms/Human-Resource-Management-System/public/admin/attendances/2021-09-27/edit', '2021-09-27 11:22:00', '2021-09-27 11:22:00'),
(126, 1, 2, '127.0.0.1', 'admin.attendance.ajax_attendance', 'http://localhost/try/hrms/Human-Resource-Management-System/public/admin/attendances/ajax_attendance', '2021-09-27 11:22:01', '2021-09-27 11:22:01'),
(127, 1, 2, '127.0.0.1', 'admin.general_setting.edit', 'http://localhost/try/hrms/Human-Resource-Management-System/public/admin/general-setting', '2021-09-27 11:22:13', '2021-09-27 11:22:13'),
(128, 1, 2, '127.0.0.1', 'admin.attendance_settings.edit', 'http://localhost/try/hrms/Human-Resource-Management-System/public/admin/attendance_settings', '2021-09-27 11:22:16', '2021-09-27 11:22:16'),
(129, 1, 2, '127.0.0.1', 'admin.attendance_settings.edit', 'http://localhost/try/hrms/Human-Resource-Management-System/public/admin/attendance_settings', '2021-09-27 11:22:55', '2021-09-27 11:22:55'),
(130, 1, 2, '127.0.0.1', 'admin.admin_users.index', 'http://localhost/try/hrms/Human-Resource-Management-System/public/admin/admin_users', '2021-09-27 11:24:52', '2021-09-27 11:24:52'),
(131, 1, 2, '127.0.0.1', 'admin.ajax_admin_users', 'http://localhost/try/hrms/Human-Resource-Management-System/public/admin/ajax_admin_users', '2021-09-27 11:24:53', '2021-09-27 11:24:53'),
(132, 2, 3, '127.0.0.1', 'admin.dashboard.index', 'http://localhost/try/hrms/Human-Resource-Management-System/public/admin/dashboard', '2021-09-27 23:54:07', '2021-09-27 23:54:07'),
(133, 2, 3, '127.0.0.1', 'admin.attendance.ajax_load_calender', 'http://localhost/try/hrms/Human-Resource-Management-System/public/admin/attendances/ajax_load_calender', '2021-09-27 23:54:08', '2021-09-27 23:54:08'),
(134, 2, 3, '127.0.0.1', 'admin.departments.index', 'http://localhost/try/hrms/Human-Resource-Management-System/public/admin/departments', '2021-09-27 23:54:12', '2021-09-27 23:54:12'),
(135, 2, 3, '127.0.0.1', 'admin.departments.create', 'http://localhost/try/hrms/Human-Resource-Management-System/public/admin/departments/create', '2021-09-27 23:54:14', '2021-09-27 23:54:14'),
(136, 2, 3, '127.0.0.1', 'admin.departments.store', 'http://localhost/try/hrms/Human-Resource-Management-System/public/admin/departments', '2021-09-27 23:54:25', '2021-09-27 23:54:25'),
(137, 2, 3, '127.0.0.1', 'admin.departments.index', 'http://localhost/try/hrms/Human-Resource-Management-System/public/admin/departments', '2021-09-27 23:54:26', '2021-09-27 23:54:26'),
(138, 2, 3, '127.0.0.1', 'admin.employees.index', 'http://localhost/try/hrms/Human-Resource-Management-System/public/admin/employees', '2021-09-27 23:54:28', '2021-09-27 23:54:28'),
(139, 2, 3, '127.0.0.1', 'admin.ajax_employees', 'http://localhost/try/hrms/Human-Resource-Management-System/public/admin/employees/ajax_employees', '2021-09-27 23:54:29', '2021-09-27 23:54:29'),
(140, 2, 3, '127.0.0.1', 'admin.employees.create', 'http://localhost/try/hrms/Human-Resource-Management-System/public/admin/employees/create', '2021-09-27 23:54:30', '2021-09-27 23:54:30'),
(141, 2, 3, '127.0.0.1', 'admin.departments.ajax_designation', 'http://localhost/try/hrms/Human-Resource-Management-System/public/admin/departments/ajax_designation', '2021-09-27 23:54:31', '2021-09-27 23:54:31'),
(142, 2, 3, '127.0.0.1', 'admin.employees.store', 'http://localhost/try/hrms/Human-Resource-Management-System/public/admin/employees', '2021-09-27 23:55:26', '2021-09-27 23:55:26'),
(143, 2, 3, '127.0.0.1', 'admin.employees.store', 'http://localhost/try/hrms/Human-Resource-Management-System/public/admin/employees', '2021-09-27 23:55:36', '2021-09-27 23:55:36'),
(144, 2, 3, '127.0.0.1', 'admin.ajax_update_notification', 'http://localhost/try/hrms/Human-Resource-Management-System/public/admin/ajax_update_notification', '2021-09-27 23:55:42', '2021-09-27 23:55:42'),
(145, 2, 3, '127.0.0.1', 'admin.employees.store', 'http://localhost/try/hrms/Human-Resource-Management-System/public/admin/employees', '2021-09-27 23:55:45', '2021-09-27 23:55:45'),
(146, 2, 3, '127.0.0.1', 'admin.employees.index', 'http://localhost/try/hrms/Human-Resource-Management-System/public/admin/employees', '2021-09-27 23:55:46', '2021-09-27 23:55:46'),
(147, 2, 3, '127.0.0.1', 'admin.ajax_employees', 'http://localhost/try/hrms/Human-Resource-Management-System/public/admin/employees/ajax_employees', '2021-09-27 23:55:47', '2021-09-27 23:55:47'),
(148, 2, 3, '127.0.0.1', 'admin.noticeboards.index', 'http://localhost/try/hrms/Human-Resource-Management-System/public/admin/noticeboards', '2021-09-27 23:57:45', '2021-09-27 23:57:45'),
(149, 2, 3, '127.0.0.1', 'admin.ajax_notices', 'http://localhost/try/hrms/Human-Resource-Management-System/public/admin/ajax_notices', '2021-09-27 23:57:45', '2021-09-27 23:57:45'),
(150, 2, 3, '127.0.0.1', 'admin.ajax_update_notification', 'http://localhost/try/hrms/Human-Resource-Management-System/public/admin/ajax_update_notification', '2021-09-27 23:57:47', '2021-09-27 23:57:47'),
(151, 2, 3, '127.0.0.1', 'admin.noticeboards.create', 'http://localhost/try/hrms/Human-Resource-Management-System/public/admin/noticeboards/create', '2021-09-27 23:57:48', '2021-09-27 23:57:48'),
(152, 2, 3, '127.0.0.1', 'admin.noticeboards.store', 'http://localhost/try/hrms/Human-Resource-Management-System/public/admin/noticeboards', '2021-09-27 23:57:54', '2021-09-27 23:57:54'),
(153, 2, 3, '127.0.0.1', 'admin.noticeboards.index', 'http://localhost/try/hrms/Human-Resource-Management-System/public/admin/noticeboards', '2021-09-27 23:57:55', '2021-09-27 23:57:55'),
(154, 2, 3, '127.0.0.1', 'admin.ajax_notices', 'http://localhost/try/hrms/Human-Resource-Management-System/public/admin/ajax_notices', '2021-09-27 23:57:56', '2021-09-27 23:57:56'),
(155, 2, 3, '127.0.0.1', 'admin.holidays.index', 'http://localhost/try/hrms/Human-Resource-Management-System/public/admin/holidays', '2021-09-27 23:58:06', '2021-09-27 23:58:06'),
(156, 2, 3, '127.0.0.1', 'admin.holidays.store', 'http://localhost/try/hrms/Human-Resource-Management-System/public/admin/holidays', '2021-09-27 23:58:27', '2021-09-27 23:58:27'),
(157, 2, 3, '127.0.0.1', 'admin.holidays.index', 'http://localhost/try/hrms/Human-Resource-Management-System/public/admin/holidays', '2021-09-27 23:58:28', '2021-09-27 23:58:28'),
(158, 2, 3, '127.0.0.1', 'admin.attendances.create', 'http://localhost/try/hrms/Human-Resource-Management-System/public/admin/attendances/create', '2021-09-27 23:59:33', '2021-09-27 23:59:33'),
(159, 2, 3, '127.0.0.1', 'admin.attendances.create', 'http://localhost/try/hrms/Human-Resource-Management-System/public/admin/attendances/create', '2021-09-27 23:59:33', '2021-09-27 23:59:33'),
(160, 2, 3, '127.0.0.1', 'admin.general_setting.edit', 'http://localhost/try/hrms/Human-Resource-Management-System/public/admin/general-setting', '2021-09-27 23:59:47', '2021-09-27 23:59:47'),
(161, 2, 3, '127.0.0.1', 'admin.general_setting.update', 'http://localhost/try/hrms/Human-Resource-Management-System/public/admin/general-setting', '2021-09-27 23:59:53', '2021-09-27 23:59:53'),
(162, 2, 3, '127.0.0.1', 'admin.attendances.create', 'http://localhost/try/hrms/Human-Resource-Management-System/public/admin/attendances/create', '2021-09-27 23:59:56', '2021-09-27 23:59:56'),
(163, 2, 3, '127.0.0.1', 'admin.attendances.edit', 'http://localhost/try/hrms/Human-Resource-Management-System/public/admin/attendances/2021-09-28/edit', '2021-09-27 23:59:56', '2021-09-27 23:59:56'),
(164, 2, 3, '127.0.0.1', 'admin.leavetypes.index', 'http://localhost/try/hrms/Human-Resource-Management-System/public/admin/leavetypes', '2021-09-27 23:59:59', '2021-09-27 23:59:59'),
(165, 2, 3, '127.0.0.1', 'admin.leavetypes.ajax_list', 'http://localhost/try/hrms/Human-Resource-Management-System/public/admin/leavetypes/ajax_list', '2021-09-28 00:00:00', '2021-09-28 00:00:00'),
(166, 2, 3, '127.0.0.1', 'admin.leavetypes.create', 'http://localhost/try/hrms/Human-Resource-Management-System/public/admin/leavetypes/create', '2021-09-28 00:00:01', '2021-09-28 00:00:01'),
(167, 2, 3, '127.0.0.1', 'admin.leavetypes.store', 'http://localhost/try/hrms/Human-Resource-Management-System/public/admin/leavetypes', '2021-09-28 00:00:06', '2021-09-28 00:00:06'),
(168, 2, 3, '127.0.0.1', 'admin.leavetypes.ajax_list', 'http://localhost/try/hrms/Human-Resource-Management-System/public/admin/leavetypes/ajax_list', '2021-09-28 00:00:07', '2021-09-28 00:00:07'),
(169, 2, 3, '127.0.0.1', 'admin.attendances.create', 'http://localhost/try/hrms/Human-Resource-Management-System/public/admin/attendances/create', '2021-09-28 00:00:09', '2021-09-28 00:00:09'),
(170, 2, 3, '127.0.0.1', 'admin.attendances.edit', 'http://localhost/try/hrms/Human-Resource-Management-System/public/admin/attendances/2021-09-28/edit', '2021-09-28 00:00:09', '2021-09-28 00:00:09'),
(171, 2, 3, '127.0.0.1', 'admin.attendance_settings.edit', 'http://localhost/try/hrms/Human-Resource-Management-System/public/admin/attendance_settings', '2021-09-28 00:00:14', '2021-09-28 00:00:14'),
(172, 2, 3, '127.0.0.1', 'admin.attendance_settings.update', 'http://localhost/try/hrms/Human-Resource-Management-System/public/admin/attendance_settings/mark_attendance', '2021-09-28 00:00:31', '2021-09-28 00:00:31'),
(173, 2, 3, '127.0.0.1', 'admin.attendance_settings.update', 'http://localhost/try/hrms/Human-Resource-Management-System/public/admin/attendance_settings/mark_attendance', '2021-09-28 00:00:56', '2021-09-28 00:00:56'),
(174, 2, 3, '127.0.0.1', 'admin.general_setting.edit', 'http://localhost/try/hrms/Human-Resource-Management-System/public/admin/general-setting', '2021-09-28 00:01:08', '2021-09-28 00:01:08'),
(175, 2, 3, '127.0.0.1', 'admin.general_setting.update', 'http://localhost/try/hrms/Human-Resource-Management-System/public/admin/general-setting', '2021-09-28 00:01:15', '2021-09-28 00:01:15'),
(176, 2, 3, '127.0.0.1', 'admin.attendances.create', 'http://localhost/try/hrms/Human-Resource-Management-System/public/admin/attendances/create', '2021-09-28 00:01:44', '2021-09-28 00:01:44'),
(177, 2, 3, '127.0.0.1', 'admin.attendances.edit', 'http://localhost/try/hrms/Human-Resource-Management-System/public/admin/attendances/2021-09-28/edit', '2021-09-28 00:01:45', '2021-09-28 00:01:45'),
(178, 2, 3, '127.0.0.1', 'admin.attendance.ajax_attendance', 'http://localhost/try/hrms/Human-Resource-Management-System/public/admin/attendances/ajax_attendance', '2021-09-28 00:01:45', '2021-09-28 00:01:45'),
(179, 2, 3, '127.0.0.1', 'admin.attendances.edit', 'http://localhost/try/hrms/Human-Resource-Management-System/public/admin/attendances/2021-08-01/edit', '2021-09-28 00:02:03', '2021-09-28 00:02:03'),
(180, 2, 3, '127.0.0.1', 'admin.attendance.ajax_attendance', 'http://localhost/try/hrms/Human-Resource-Management-System/public/admin/attendances/ajax_attendance', '2021-09-28 00:02:03', '2021-09-28 00:02:03'),
(181, 2, 3, '127.0.0.1', 'admin.attendance.update.row', 'http://localhost/try/hrms/Human-Resource-Management-System/public/admin/attendance/update/row', '2021-09-28 00:02:23', '2021-09-28 00:02:23'),
(182, 2, 3, '127.0.0.1', 'admin.attendances.edit', 'http://localhost/try/hrms/Human-Resource-Management-System/public/admin/attendances/2021-08-02/edit', '2021-09-28 00:02:34', '2021-09-28 00:02:34'),
(183, 2, 3, '127.0.0.1', 'admin.attendance.ajax_attendance', 'http://localhost/try/hrms/Human-Resource-Management-System/public/admin/attendances/ajax_attendance', '2021-09-28 00:02:35', '2021-09-28 00:02:35'),
(184, 2, 3, '127.0.0.1', 'admin.attendance.update.row', 'http://localhost/try/hrms/Human-Resource-Management-System/public/admin/attendance/update/row', '2021-09-28 00:02:47', '2021-09-28 00:02:47'),
(185, 2, 3, '127.0.0.1', 'admin.payrolls.index', 'http://localhost/try/hrms/Human-Resource-Management-System/public/admin/payrolls', '2021-09-28 00:02:54', '2021-09-28 00:02:54'),
(186, 2, 3, '127.0.0.1', 'admin.ajax_payrolls', 'http://localhost/try/hrms/Human-Resource-Management-System/public/admin/ajax_payrolls', '2021-09-28 00:02:54', '2021-09-28 00:02:54'),
(187, 2, 3, '127.0.0.1', 'admin.payrolls.create', 'http://localhost/try/hrms/Human-Resource-Management-System/public/admin/payrolls/create', '2021-09-28 00:02:57', '2021-09-28 00:02:57'),
(188, 2, 3, '127.0.0.1', 'admin.payrolls.check', 'http://localhost/try/hrms/Human-Resource-Management-System/public/admin/payrolls/check', '2021-09-28 00:03:02', '2021-09-28 00:03:02'),
(189, 2, 3, '127.0.0.1', 'admin.payrolls.store', 'http://localhost/try/hrms/Human-Resource-Management-System/public/admin/payrolls', '2021-09-28 00:04:06', '2021-09-28 00:04:06'),
(190, 2, 3, '127.0.0.1', 'admin.payrolls.store', 'http://localhost/try/hrms/Human-Resource-Management-System/public/admin/payrolls', '2021-09-28 00:04:27', '2021-09-28 00:04:27'),
(191, 2, 3, '127.0.0.1', 'admin.payrolls.store', 'http://localhost/try/hrms/Human-Resource-Management-System/public/admin/payrolls', '2021-09-28 00:05:07', '2021-09-28 00:05:07'),
(192, 2, 3, '127.0.0.1', 'admin.payrolls.create', 'http://localhost/try/hrms/Human-Resource-Management-System/public/admin/payrolls/create', '2021-09-28 00:05:16', '2021-09-28 00:05:16'),
(193, 2, 3, '127.0.0.1', 'admin.billing.index', 'http://localhost/try/hrms/Human-Resource-Management-System/public/admin/billing', '2021-09-28 00:05:18', '2021-09-28 00:05:18'),
(194, 2, 3, '127.0.0.1', 'admin.general_setting.edit', 'http://localhost/try/hrms/Human-Resource-Management-System/public/admin/general-setting', '2021-09-28 00:05:25', '2021-09-28 00:05:25'),
(195, 2, 3, '127.0.0.1', 'admin.general_setting.update', 'http://localhost/try/hrms/Human-Resource-Management-System/public/admin/general-setting', '2021-09-28 00:05:32', '2021-09-28 00:05:32'),
(196, 2, 3, '127.0.0.1', 'admin.profile_settings.edit', 'http://localhost/try/hrms/Human-Resource-Management-System/public/admin/profile-settings', '2021-09-28 00:05:35', '2021-09-28 00:05:35'),
(197, 2, 3, '127.0.0.1', 'admin.notification.edit', 'http://localhost/try/hrms/Human-Resource-Management-System/public/admin/notification-settings', '2021-09-28 00:05:38', '2021-09-28 00:05:38'),
(198, 2, 3, '127.0.0.1', 'admin.notification.update', 'http://localhost/try/hrms/Human-Resource-Management-System/public/admin/notification-settings', '2021-09-28 00:05:45', '2021-09-28 00:05:45'),
(199, 2, 3, '127.0.0.1', 'admin.payrolls.store', 'http://localhost/try/hrms/Human-Resource-Management-System/public/admin/payrolls', '2021-09-28 00:05:47', '2021-09-28 00:05:47'),
(200, 2, 3, '127.0.0.1', 'admin.payrolls.index', 'http://localhost/try/hrms/Human-Resource-Management-System/public/admin/payrolls', '2021-09-28 00:05:48', '2021-09-28 00:05:48'),
(201, 2, 3, '127.0.0.1', 'admin.ajax_payrolls', 'http://localhost/try/hrms/Human-Resource-Management-System/public/admin/ajax_payrolls', '2021-09-28 00:05:48', '2021-09-28 00:05:48'),
(202, 2, 3, '127.0.0.1', 'admin.payrolls.downloadpdf', 'http://localhost/try/hrms/Human-Resource-Management-System/public/admin/payrolls/downloadpdf/3', '2021-09-28 00:05:53', '2021-09-28 00:05:53'),
(203, 1, 2, '127.0.0.1', 'admin.dashboard.index', 'http://localhost/try/hrms/Human-Resource-Management-System/public/admin/dashboard', '2021-09-30 21:22:11', '2021-09-30 21:22:11'),
(204, 1, 2, '127.0.0.1', 'admin.attendance.ajax_load_calender', 'http://localhost/try/hrms/Human-Resource-Management-System/public/admin/attendances/ajax_load_calender', '2021-09-30 21:22:12', '2021-09-30 21:22:12'),
(205, 1, 2, '127.0.0.1', 'admin.attendances.index', 'http://localhost/try/hrms/Human-Resource-Management-System/public/admin/attendances', '2021-09-30 21:22:22', '2021-09-30 21:22:22'),
(206, 1, 2, '127.0.0.1', 'admin.attendance.filter', 'http://localhost/try/hrms/Human-Resource-Management-System/public/admin/attendances/filter', '2021-09-30 21:22:23', '2021-09-30 21:22:23'),
(207, 1, 2, '127.0.0.1', 'admin.attendance.filter', 'http://localhost/try/hrms/Human-Resource-Management-System/public/admin/attendances/filter', '2021-09-30 21:22:31', '2021-09-30 21:22:31'),
(208, 1, 2, '127.0.0.1', 'admin.attendance.filter', 'http://localhost/try/hrms/Human-Resource-Management-System/public/admin/attendances/filter', '2021-09-30 21:22:38', '2021-09-30 21:22:38'),
(209, 1, 2, '127.0.0.1', 'admin.noticeboards.index', 'http://localhost/try/hrms/Human-Resource-Management-System/public/admin/noticeboards', '2021-09-30 21:25:03', '2021-09-30 21:25:03'),
(210, 1, 2, '127.0.0.1', 'admin.ajax_notices', 'http://localhost/try/hrms/Human-Resource-Management-System/public/admin/ajax_notices', '2021-09-30 21:25:05', '2021-09-30 21:25:05'),
(211, 1, 2, '127.0.0.1', 'admin.screenlock.modal', 'http://localhost/try/hrms/Human-Resource-Management-System/public/screenlock/modal', '2021-09-30 21:50:12', '2021-09-30 21:50:12'),
(212, 1, 2, '127.0.0.1', 'admin.dashboard.index', 'http://localhost/try/hrms/Human-Resource-Management-System/public/admin/dashboard', '2021-10-24 00:57:30', '2021-10-24 00:57:30'),
(213, 1, 2, '127.0.0.1', 'admin.attendance.ajax_load_calender', 'http://localhost/try/hrms/Human-Resource-Management-System/public/admin/attendances/ajax_load_calender', '2021-10-24 00:57:31', '2021-10-24 00:57:31'),
(214, 1, 2, '127.0.0.1', 'admin.attendances.index', 'http://localhost/try/hrms/Human-Resource-Management-System/public/admin/attendances', '2021-10-24 00:57:47', '2021-10-24 00:57:47'),
(215, 1, 2, '127.0.0.1', 'admin.attendance.filter', 'http://localhost/try/hrms/Human-Resource-Management-System/public/admin/attendances/filter', '2021-10-24 00:57:48', '2021-10-24 00:57:48'),
(216, 1, 2, '127.0.0.1', 'admin.attendance.filter', 'http://localhost/try/hrms/Human-Resource-Management-System/public/admin/attendances/filter', '2021-10-24 00:57:57', '2021-10-24 00:57:57'),
(217, 1, 2, '127.0.0.1', 'admin.attendance.filter', 'http://localhost/try/hrms/Human-Resource-Management-System/public/admin/attendances/filter', '2021-10-24 00:58:00', '2021-10-24 00:58:00'),
(218, 1, 2, '127.0.0.1', 'admin.attendances.create', 'http://localhost/try/hrms/Human-Resource-Management-System/public/admin/attendances/create', '2021-10-24 01:03:11', '2021-10-24 01:03:11'),
(219, 1, 2, '127.0.0.1', 'admin.attendances.edit', 'http://localhost/try/hrms/Human-Resource-Management-System/public/admin/attendances/2021-10-24/edit', '2021-10-24 01:03:11', '2021-10-24 01:03:11'),
(220, 1, 2, '127.0.0.1', 'admin.attendance.ajax_attendance', 'http://localhost/try/hrms/Human-Resource-Management-System/public/admin/attendances/ajax_attendance', '2021-10-24 01:03:13', '2021-10-24 01:03:13'),
(221, 1, 2, '127.0.0.1', 'admin.dashboard.index', 'http://localhost/try/hrms/Human-Resource-Management-System/public/admin/dashboard', '2021-10-24 01:50:08', '2021-10-24 01:50:08'),
(222, 1, 2, '127.0.0.1', 'admin.attendance.ajax_load_calender', 'http://localhost/try/hrms/Human-Resource-Management-System/public/admin/attendances/ajax_load_calender', '2021-10-24 01:50:10', '2021-10-24 01:50:10'),
(223, 1, 2, '127.0.0.1', 'admin.screenlock.modal', 'http://localhost/try/hrms/Human-Resource-Management-System/public/screenlock/modal', '2021-10-24 02:26:46', '2021-10-24 02:26:46'),
(224, 1, 2, '127.0.0.1', 'admin.screenlock.modal', 'http://localhost/try/hrms/Human-Resource-Management-System/public/screenlock/modal', '2021-10-24 02:44:46', '2021-10-24 02:44:46'),
(225, 1, 2, '127.0.0.1', 'admin.screenlock.modal', 'http://localhost/try/hrms/Human-Resource-Management-System/public/screenlock/modal', '2021-10-24 03:02:46', '2021-10-24 03:02:46'),
(226, 1, 2, '127.0.0.1', 'admin.screenlock.modal', 'http://localhost/try/hrms/Human-Resource-Management-System/public/screenlock/modal', '2021-10-24 03:20:51', '2021-10-24 03:20:51'),
(227, 1, 2, '127.0.0.1', 'admin.screenlock.modal', 'http://localhost/try/hrms/Human-Resource-Management-System/public/screenlock/modal', '2021-10-24 03:38:46', '2021-10-24 03:38:46'),
(228, 1, 2, '127.0.0.1', 'admin.screenlock.modal', 'http://localhost/try/hrms/Human-Resource-Management-System/public/screenlock/modal', '2021-10-24 03:56:46', '2021-10-24 03:56:46'),
(229, 1, 2, '127.0.0.1', 'admin.screenlock.modal', 'http://localhost/try/hrms/Human-Resource-Management-System/public/screenlock/modal', '2021-10-24 04:14:46', '2021-10-24 04:14:46'),
(230, 1, 2, '127.0.0.1', 'admin.screenlock.modal', 'http://localhost/try/hrms/Human-Resource-Management-System/public/screenlock/modal', '2021-10-24 04:32:46', '2021-10-24 04:32:46'),
(231, 1, 2, '127.0.0.1', 'admin.screenlock.modal', 'http://localhost/try/hrms/Human-Resource-Management-System/public/screenlock/modal', '2021-10-24 04:50:46', '2021-10-24 04:50:46'),
(232, 1, 2, '127.0.0.1', 'admin.screenlock.modal', 'http://localhost/try/hrms/Human-Resource-Management-System/public/screenlock/modal', '2021-10-24 05:08:47', '2021-10-24 05:08:47'),
(233, 1, 2, '127.0.0.1', 'admin.screenlock.modal', 'http://localhost/try/hrms/Human-Resource-Management-System/public/screenlock/modal', '2021-10-24 05:26:47', '2021-10-24 05:26:47'),
(234, 1, 2, '127.0.0.1', 'admin.screenlock.modal', 'http://localhost/try/hrms/Human-Resource-Management-System/public/screenlock/modal', '2021-10-24 05:44:47', '2021-10-24 05:44:47'),
(235, 1, 2, '127.0.0.1', 'admin.screenlock.modal', 'http://localhost/try/hrms/Human-Resource-Management-System/public/screenlock/modal', '2021-10-24 06:02:47', '2021-10-24 06:02:47'),
(236, 1, 2, '127.0.0.1', 'admin.screenlock.modal', 'http://localhost/try/hrms/Human-Resource-Management-System/public/screenlock/modal', '2021-10-24 06:20:47', '2021-10-24 06:20:47'),
(237, 1, 2, '127.0.0.1', 'admin.screenlock.modal', 'http://localhost/try/hrms/Human-Resource-Management-System/public/screenlock/modal', '2021-10-24 06:38:47', '2021-10-24 06:38:47'),
(238, 1, 2, '127.0.0.1', 'admin.screenlock.modal', 'http://localhost/try/hrms/Human-Resource-Management-System/public/screenlock/modal', '2021-10-24 06:56:47', '2021-10-24 06:56:47'),
(239, 1, 2, '127.0.0.1', 'admin.screenlock.modal', 'http://localhost/try/hrms/Human-Resource-Management-System/public/screenlock/modal', '2021-10-24 07:14:47', '2021-10-24 07:14:47'),
(240, 1, 2, '127.0.0.1', 'admin.login', 'http://localhost/try/hrms/Human-Resource-Management-System/public/admin/login', '2021-10-24 07:23:58', '2021-10-24 07:23:58'),
(241, 1, 2, '127.0.0.1', 'admin.attendances.create', 'http://localhost/try/hrms/Human-Resource-Management-System/public/admin/attendances/create', '2021-10-24 07:24:03', '2021-10-24 07:24:03'),
(242, 1, 2, '127.0.0.1', 'admin.attendances.edit', 'http://localhost/try/hrms/Human-Resource-Management-System/public/admin/attendances/2021-10-24/edit', '2021-10-24 07:24:04', '2021-10-24 07:24:04'),
(243, 1, 2, '127.0.0.1', 'admin.attendance.ajax_attendance', 'http://localhost/try/hrms/Human-Resource-Management-System/public/admin/attendances/ajax_attendance', '2021-10-24 07:24:07', '2021-10-24 07:24:07'),
(244, 1, 2, '127.0.0.1', 'admin.attendance.update.row', 'http://localhost/try/hrms/Human-Resource-Management-System/public/admin/attendance/update/row', '2021-10-24 07:24:18', '2021-10-24 07:24:18'),
(245, 1, 2, '127.0.0.1', 'admin.attendance.update.row', 'http://localhost/try/hrms/Human-Resource-Management-System/public/admin/attendance/update/row', '2021-10-24 07:24:43', '2021-10-24 07:24:43'),
(246, 1, 2, '127.0.0.1', 'admin.attendances.create', 'http://localhost/try/hrms/Human-Resource-Management-System/public/admin/attendances/create', '2021-10-24 07:25:04', '2021-10-24 07:25:04'),
(247, 1, 2, '127.0.0.1', 'admin.attendances.edit', 'http://localhost/try/hrms/Human-Resource-Management-System/public/admin/attendances/2021-10-24/edit', '2021-10-24 07:25:04', '2021-10-24 07:25:04'),
(248, 1, 2, '127.0.0.1', 'admin.attendance.ajax_attendance', 'http://localhost/try/hrms/Human-Resource-Management-System/public/admin/attendances/ajax_attendance', '2021-10-24 07:25:07', '2021-10-24 07:25:07'),
(249, 1, 2, '127.0.0.1', 'admin.attendance.update.row', 'http://localhost/try/hrms/Human-Resource-Management-System/public/admin/attendance/update/row', '2021-10-24 07:25:28', '2021-10-24 07:25:28'),
(250, 1, 2, '127.0.0.1', 'admin.attendances.edit', 'http://localhost/try/hrms/Human-Resource-Management-System/public/admin/attendances/2021-10-24/edit', '2021-10-24 07:25:33', '2021-10-24 07:25:33'),
(251, 1, 2, '127.0.0.1', 'admin.attendance.ajax_attendance', 'http://localhost/try/hrms/Human-Resource-Management-System/public/admin/attendances/ajax_attendance', '2021-10-24 07:25:33', '2021-10-24 07:25:33'),
(252, 1, 2, '127.0.0.1', 'admin.payrolls.index', 'http://localhost/try/hrms/Human-Resource-Management-System/public/admin/payrolls', '2021-10-24 07:25:54', '2021-10-24 07:25:54'),
(253, 1, 2, '127.0.0.1', 'admin.ajax_payrolls', 'http://localhost/try/hrms/Human-Resource-Management-System/public/admin/ajax_payrolls', '2021-10-24 07:25:55', '2021-10-24 07:25:55'),
(254, 1, 2, '127.0.0.1', 'admin.payrolls.create', 'http://localhost/try/hrms/Human-Resource-Management-System/public/admin/payrolls/create', '2021-10-24 07:26:00', '2021-10-24 07:26:00'),
(255, 1, 2, '127.0.0.1', 'admin.payrolls.check', 'http://localhost/try/hrms/Human-Resource-Management-System/public/admin/payrolls/check', '2021-10-24 07:26:06', '2021-10-24 07:26:06'),
(256, 1, 2, '127.0.0.1', 'admin.payrolls.store', 'http://localhost/try/hrms/Human-Resource-Management-System/public/admin/payrolls', '2021-10-24 07:26:13', '2021-10-24 07:26:13'),
(257, 1, 2, '127.0.0.1', 'admin.payrolls.index', 'http://localhost/try/hrms/Human-Resource-Management-System/public/admin/payrolls', '2021-10-24 07:26:14', '2021-10-24 07:26:14'),
(258, 1, 2, '127.0.0.1', 'admin.ajax_payrolls', 'http://localhost/try/hrms/Human-Resource-Management-System/public/admin/ajax_payrolls', '2021-10-24 07:26:14', '2021-10-24 07:26:14'),
(259, 1, 2, '127.0.0.1', 'admin.payrolls.create', 'http://localhost/try/hrms/Human-Resource-Management-System/public/admin/payrolls/create', '2021-10-24 07:26:21', '2021-10-24 07:26:21'),
(260, 1, 2, '127.0.0.1', 'admin.payrolls.check', 'http://localhost/try/hrms/Human-Resource-Management-System/public/admin/payrolls/check', '2021-10-24 07:26:25', '2021-10-24 07:26:25'),
(261, 1, 2, '127.0.0.1', 'admin.payrolls.store', 'http://localhost/try/hrms/Human-Resource-Management-System/public/admin/payrolls', '2021-10-24 07:26:28', '2021-10-24 07:26:28'),
(262, 1, 2, '127.0.0.1', 'admin.payrolls.index', 'http://localhost/try/hrms/Human-Resource-Management-System/public/admin/payrolls', '2021-10-24 07:26:28', '2021-10-24 07:26:28');
INSERT INTO `browse_history` (`id`, `company_id`, `admin_id`, `ip`, `route`, `url`, `created_at`, `updated_at`) VALUES
(263, 1, 2, '127.0.0.1', 'admin.ajax_payrolls', 'http://localhost/try/hrms/Human-Resource-Management-System/public/admin/ajax_payrolls', '2021-10-24 07:26:29', '2021-10-24 07:26:29'),
(264, 1, 2, '127.0.0.1', 'admin.payrolls.create', 'http://localhost/try/hrms/Human-Resource-Management-System/public/admin/payrolls/create', '2021-10-24 07:26:35', '2021-10-24 07:26:35'),
(265, 1, 2, '127.0.0.1', 'admin.payrolls.check', 'http://localhost/try/hrms/Human-Resource-Management-System/public/admin/payrolls/check', '2021-10-24 07:26:37', '2021-10-24 07:26:37'),
(266, 1, 2, '127.0.0.1', 'admin.payrolls.index', 'http://localhost/try/hrms/Human-Resource-Management-System/public/admin/payrolls', '2021-10-24 07:26:44', '2021-10-24 07:26:44'),
(267, 1, 2, '127.0.0.1', 'admin.ajax_payrolls', 'http://localhost/try/hrms/Human-Resource-Management-System/public/admin/ajax_payrolls', '2021-10-24 07:26:45', '2021-10-24 07:26:45'),
(268, 1, 2, '127.0.0.1', 'admin.payrolls.edit', 'http://localhost/try/hrms/Human-Resource-Management-System/public/admin/payrolls/5/edit', '2021-10-24 07:26:50', '2021-10-24 07:26:50'),
(269, 1, 2, '127.0.0.1', 'admin.screenlock.modal', 'http://localhost/try/hrms/Human-Resource-Management-System/public/screenlock/modal', '2021-10-24 07:45:55', '2021-10-24 07:45:55'),
(270, 1, 2, '127.0.0.1', 'admin.screenlock.modal', 'http://localhost/try/hrms/Human-Resource-Management-System/public/screenlock/modal', '2021-10-24 08:03:55', '2021-10-24 08:03:55'),
(271, 1, 2, '127.0.0.1', 'admin.screenlock.modal', 'http://localhost/try/hrms/Human-Resource-Management-System/public/screenlock/modal', '2021-10-24 08:21:55', '2021-10-24 08:21:55'),
(272, 1, 2, '127.0.0.1', 'admin.login', 'http://localhost/try/hrms/Human-Resource-Management-System/public/admin/login', '2021-10-24 08:30:04', '2021-10-24 08:30:04'),
(273, 1, 2, '127.0.0.1', 'admin.employees.index', 'http://localhost/try/hrms/Human-Resource-Management-System/public/admin/employees', '2021-10-24 08:30:16', '2021-10-24 08:30:16'),
(274, 1, 2, '127.0.0.1', 'admin.ajax_employees', 'http://localhost/try/hrms/Human-Resource-Management-System/public/admin/employees/ajax_employees', '2021-10-24 08:30:17', '2021-10-24 08:30:17'),
(275, 1, 2, '127.0.0.1', 'admin.employees.edit', 'http://localhost/try/hrms/Human-Resource-Management-System/public/admin/employees/1/edit', '2021-10-24 08:30:21', '2021-10-24 08:30:21'),
(276, 1, 2, '127.0.0.1', 'admin.departments.ajax_designation', 'http://localhost/try/hrms/Human-Resource-Management-System/public/admin/departments/ajax_designation', '2021-10-24 08:30:22', '2021-10-24 08:30:22'),
(277, 1, 2, '127.0.0.1', 'admin.jobs.index', 'http://localhost/try/hrms/Human-Resource-Management-System/public/admin/jobs', '2021-10-24 08:31:40', '2021-10-24 08:31:40'),
(278, 1, 2, '127.0.0.1', 'admin.ajax_jobs', 'http://localhost/try/hrms/Human-Resource-Management-System/public/admin/ajax_jobs', '2021-10-24 08:31:40', '2021-10-24 08:31:40'),
(279, 1, 2, '127.0.0.1', 'admin.job_applications.index', 'http://localhost/try/hrms/Human-Resource-Management-System/public/admin/job_applications', '2021-10-24 08:31:43', '2021-10-24 08:31:43'),
(280, 1, 2, '127.0.0.1', 'admin.ajax_jobs_applications', 'http://localhost/try/hrms/Human-Resource-Management-System/public/admin/ajax_jobs_applications', '2021-10-24 08:31:44', '2021-10-24 08:31:44'),
(281, 1, 2, '127.0.0.1', 'admin.jobs.index', 'http://localhost/try/hrms/Human-Resource-Management-System/public/admin/jobs', '2021-10-24 08:31:50', '2021-10-24 08:31:50'),
(282, 1, 2, '127.0.0.1', 'admin.ajax_jobs', 'http://localhost/try/hrms/Human-Resource-Management-System/public/admin/ajax_jobs', '2021-10-24 08:31:50', '2021-10-24 08:31:50'),
(283, 1, 2, '127.0.0.1', 'admin.jobs.create', 'http://localhost/try/hrms/Human-Resource-Management-System/public/admin/jobs/create', '2021-10-24 08:31:51', '2021-10-24 08:31:51'),
(284, 1, 2, '127.0.0.1', 'admin.jobs.store', 'http://localhost/try/hrms/Human-Resource-Management-System/public/admin/jobs', '2021-10-24 08:32:18', '2021-10-24 08:32:18'),
(285, 1, 2, '127.0.0.1', 'admin.jobs.store', 'http://localhost/try/hrms/Human-Resource-Management-System/public/admin/jobs', '2021-10-24 08:32:25', '2021-10-24 08:32:25'),
(286, 1, 2, '127.0.0.1', 'admin.jobs.index', 'http://localhost/try/hrms/Human-Resource-Management-System/public/admin/jobs', '2021-10-24 08:32:25', '2021-10-24 08:32:25'),
(287, 1, 2, '127.0.0.1', 'admin.ajax_jobs', 'http://localhost/try/hrms/Human-Resource-Management-System/public/admin/ajax_jobs', '2021-10-24 08:32:26', '2021-10-24 08:32:26'),
(288, 1, 2, '127.0.0.1', 'admin.jobs.edit', 'http://localhost/try/hrms/Human-Resource-Management-System/public/admin/jobs/1/edit', '2021-10-24 08:32:28', '2021-10-24 08:32:28'),
(289, 1, 2, '127.0.0.1', 'admin.jobs.index', 'http://localhost/try/hrms/Human-Resource-Management-System/public/admin/jobs', '2021-10-24 08:32:32', '2021-10-24 08:32:32'),
(290, 1, 2, '127.0.0.1', 'admin.ajax_jobs', 'http://localhost/try/hrms/Human-Resource-Management-System/public/admin/ajax_jobs', '2021-10-24 08:32:32', '2021-10-24 08:32:32'),
(291, 1, 2, '127.0.0.1', 'admin.job_applications.index', 'http://localhost/try/hrms/Human-Resource-Management-System/public/admin/job_applications', '2021-10-24 08:32:37', '2021-10-24 08:32:37'),
(292, 1, 2, '127.0.0.1', 'admin.ajax_jobs_applications', 'http://localhost/try/hrms/Human-Resource-Management-System/public/admin/ajax_jobs_applications', '2021-10-24 08:32:37', '2021-10-24 08:32:37'),
(293, 1, 2, '127.0.0.1', 'admin.attendance_settings.edit', 'http://localhost/try/hrms/Human-Resource-Management-System/public/admin/attendance_settings', '2021-10-24 08:32:45', '2021-10-24 08:32:45'),
(294, 1, 2, '127.0.0.1', 'admin.employees.index', 'http://localhost/try/hrms/Human-Resource-Management-System/public/admin/employees', '2021-10-24 08:33:59', '2021-10-24 08:33:59'),
(295, 1, 2, '127.0.0.1', 'admin.ajax_employees', 'http://localhost/try/hrms/Human-Resource-Management-System/public/admin/employees/ajax_employees', '2021-10-24 08:33:59', '2021-10-24 08:33:59'),
(296, 1, 2, '127.0.0.1', 'admin.employees.edit', 'http://localhost/try/hrms/Human-Resource-Management-System/public/admin/employees/1/edit', '2021-10-24 08:34:06', '2021-10-24 08:34:06'),
(297, 1, 2, '127.0.0.1', 'admin.departments.ajax_designation', 'http://localhost/try/hrms/Human-Resource-Management-System/public/admin/departments/ajax_designation', '2021-10-24 08:34:07', '2021-10-24 08:34:07'),
(298, 1, 2, '127.0.0.1', 'admin.notification.edit', 'http://localhost/try/hrms/Human-Resource-Management-System/public/admin/notification-settings', '2021-10-24 08:36:08', '2021-10-24 08:36:08'),
(299, 1, 2, '127.0.0.1', 'admin.job_applications.index', 'http://localhost/try/hrms/Human-Resource-Management-System/public/admin/job_applications', '2021-10-24 08:36:29', '2021-10-24 08:36:29'),
(300, 1, 2, '127.0.0.1', 'admin.ajax_jobs_applications', 'http://localhost/try/hrms/Human-Resource-Management-System/public/admin/ajax_jobs_applications', '2021-10-24 08:36:30', '2021-10-24 08:36:30'),
(301, 1, 2, '127.0.0.1', 'admin.billing.index', 'http://localhost/try/hrms/Human-Resource-Management-System/public/admin/billing', '2021-10-24 08:36:34', '2021-10-24 08:36:34'),
(302, 1, 2, '127.0.0.1', 'admin.holidays.index', 'http://localhost/try/hrms/Human-Resource-Management-System/public/admin/holidays', '2021-10-24 08:36:47', '2021-10-24 08:36:47'),
(303, 1, 2, '127.0.0.1', 'admin.holidays.store', 'http://localhost/try/hrms/Human-Resource-Management-System/public/admin/holidays', '2021-10-24 08:37:18', '2021-10-24 08:37:18'),
(304, 1, 2, '127.0.0.1', 'admin.holidays.index', 'http://localhost/try/hrms/Human-Resource-Management-System/public/admin/holidays', '2021-10-24 08:37:19', '2021-10-24 08:37:19'),
(305, 1, 2, '127.0.0.1', 'admin.holidays.store', 'http://localhost/try/hrms/Human-Resource-Management-System/public/admin/holidays', '2021-10-24 08:37:42', '2021-10-24 08:37:42'),
(306, 1, 2, '127.0.0.1', 'admin.holidays.index', 'http://localhost/try/hrms/Human-Resource-Management-System/public/admin/holidays', '2021-10-24 08:37:42', '2021-10-24 08:37:42'),
(307, 1, 2, '127.0.0.1', 'admin.awards.index', 'http://localhost/try/hrms/Human-Resource-Management-System/public/admin/awards', '2021-10-24 08:38:38', '2021-10-24 08:38:38'),
(308, 1, 2, '127.0.0.1', 'admin.ajax_awards', 'http://localhost/try/hrms/Human-Resource-Management-System/public/admin/ajax_awards', '2021-10-24 08:38:39', '2021-10-24 08:38:39'),
(309, 1, 2, '127.0.0.1', 'admin.screenlock.modal', 'http://localhost/try/hrms/Human-Resource-Management-System/public/screenlock/modal', '2021-10-24 08:56:45', '2021-10-24 08:56:45'),
(310, 1, 2, '127.0.0.1', 'admin.screenlock.modal', 'http://localhost/try/hrms/Human-Resource-Management-System/public/screenlock/modal', '2021-10-24 09:14:42', '2021-10-24 09:14:42'),
(311, 1, 2, '127.0.0.1', 'admin.screenlock.modal', 'http://localhost/try/hrms/Human-Resource-Management-System/public/screenlock/modal', '2021-10-24 09:32:44', '2021-10-24 09:32:44'),
(312, 1, 2, '127.0.0.1', 'admin.screenlock.modal', 'http://localhost/try/hrms/Human-Resource-Management-System/public/screenlock/modal', '2021-10-24 09:50:45', '2021-10-24 09:50:45'),
(313, 1, 2, '127.0.0.1', 'admin.screenlock.modal', 'http://localhost/try/hrms/Human-Resource-Management-System/public/screenlock/modal', '2021-10-24 10:08:46', '2021-10-24 10:08:46'),
(314, 1, 2, '127.0.0.1', 'admin.login', 'http://localhost/try/hrms/Human-Resource-Management-System/public/admin/login', '2021-10-24 10:26:06', '2021-10-24 10:26:06'),
(315, 1, 2, '127.0.0.1', 'admin.employees.index', 'http://localhost/try/hrms/Human-Resource-Management-System/public/admin/employees', '2021-10-24 10:26:23', '2021-10-24 10:26:23'),
(316, 1, 2, '127.0.0.1', 'admin.ajax_employees', 'http://localhost/try/hrms/Human-Resource-Management-System/public/admin/employees/ajax_employees', '2021-10-24 10:26:24', '2021-10-24 10:26:24'),
(317, 1, 2, '127.0.0.1', 'admin.employees.edit', 'http://localhost/try/hrms/Human-Resource-Management-System/public/admin/employees/1/edit', '2021-10-24 10:26:26', '2021-10-24 10:26:26'),
(318, 1, 2, '127.0.0.1', 'admin.departments.ajax_designation', 'http://localhost/try/hrms/Human-Resource-Management-System/public/admin/departments/ajax_designation', '2021-10-24 10:26:27', '2021-10-24 10:26:27'),
(319, 1, 2, '127.0.0.1', 'admin.dashboard.index', 'http://localhost/try/ss/hrms/public/admin/dashboard', '2021-10-30 04:22:35', '2021-10-30 04:22:35'),
(320, 1, 2, '127.0.0.1', 'admin.attendance.ajax_load_calender', 'http://localhost/try/ss/hrms/public/admin/attendances/ajax_load_calender', '2021-10-30 04:22:37', '2021-10-30 04:22:37'),
(321, 1, 2, '127.0.0.1', 'admin.attendances.index', 'http://localhost/try/ss/hrms/public/admin/attendances', '2021-10-30 04:23:29', '2021-10-30 04:23:29'),
(322, 1, 2, '127.0.0.1', 'admin.attendance.filter', 'http://localhost/try/ss/hrms/public/admin/attendances/filter', '2021-10-30 04:23:30', '2021-10-30 04:23:30'),
(323, 1, 2, '127.0.0.1', 'admin.attendance.filter', 'http://localhost/try/ss/hrms/public/admin/attendances/filter', '2021-10-30 04:24:45', '2021-10-30 04:24:45'),
(324, 1, 2, '127.0.0.1', 'admin.attendances.index', 'http://localhost/try/ss/hrms/public/admin/attendances', '2021-10-30 04:25:30', '2021-10-30 04:25:30'),
(325, 1, 2, '127.0.0.1', 'admin.attendances.index', 'http://localhost/try/ss/hrms/public/admin/attendances', '2021-10-30 04:25:38', '2021-10-30 04:25:38'),
(326, 1, 2, '127.0.0.1', 'admin.attendance.filter', 'http://localhost/try/ss/hrms/public/admin/attendances/filter', '2021-10-30 04:25:39', '2021-10-30 04:25:39'),
(327, 1, 2, '127.0.0.1', 'admin.attendances.index', 'http://localhost/try/ss/hrms/public/admin/attendances', '2021-10-30 04:26:54', '2021-10-30 04:26:54'),
(328, 1, 2, '127.0.0.1', 'admin.attendance.filter', 'http://localhost/try/ss/hrms/public/admin/attendances/filter', '2021-10-30 04:26:55', '2021-10-30 04:26:55'),
(329, 1, 2, '127.0.0.1', 'admin.attendances.index', 'http://localhost/try/ss/hrms/public/admin/attendances', '2021-10-30 04:28:43', '2021-10-30 04:28:43'),
(330, 1, 2, '127.0.0.1', 'admin.attendance.filter', 'http://localhost/try/ss/hrms/public/admin/attendances/filter', '2021-10-30 04:28:44', '2021-10-30 04:28:44'),
(331, 1, 2, '127.0.0.1', 'admin.attendances.index', 'http://localhost/try/ss/hrms/public/admin/attendances', '2021-10-30 04:29:08', '2021-10-30 04:29:08'),
(332, 1, 2, '127.0.0.1', 'admin.attendance.filter', 'http://localhost/try/ss/hrms/public/admin/attendances/filter', '2021-10-30 04:29:09', '2021-10-30 04:29:09'),
(333, 1, 2, '127.0.0.1', 'admin.attendances.index', 'http://localhost/try/ss/hrms/public/admin/attendances', '2021-10-30 04:32:27', '2021-10-30 04:32:27'),
(334, 1, 2, '127.0.0.1', 'admin.attendance.filter', 'http://localhost/try/ss/hrms/public/admin/attendances/filter', '2021-10-30 04:32:28', '2021-10-30 04:32:28'),
(335, 1, 2, '127.0.0.1', 'admin.attendances.index', 'http://localhost/try/ss/hrms/public/admin/attendances', '2021-10-30 04:38:21', '2021-10-30 04:38:21'),
(336, 1, 2, '127.0.0.1', 'admin.attendance.filter', 'http://localhost/try/ss/hrms/public/admin/attendances/filter', '2021-10-30 04:38:23', '2021-10-30 04:38:23'),
(337, 1, 2, '127.0.0.1', 'admin.attendances.index', 'http://localhost/try/ss/hrms/public/admin/attendances', '2021-10-30 04:38:27', '2021-10-30 04:38:27'),
(338, 1, 2, '127.0.0.1', 'admin.attendance.filter', 'http://localhost/try/ss/hrms/public/admin/attendances/filter', '2021-10-30 04:38:28', '2021-10-30 04:38:28'),
(339, 1, 2, '127.0.0.1', 'admin.attendances.index', 'http://localhost/try/ss/hrms/public/admin/attendances', '2021-10-30 04:39:30', '2021-10-30 04:39:30'),
(340, 1, 2, '127.0.0.1', 'admin.attendance.filter', 'http://localhost/try/ss/hrms/public/admin/attendances/filter', '2021-10-30 04:39:31', '2021-10-30 04:39:31'),
(341, 1, 2, '127.0.0.1', 'admin.attendances.index', 'http://localhost/try/ss/hrms/public/admin/attendances', '2021-10-30 04:40:05', '2021-10-30 04:40:05'),
(342, 1, 2, '127.0.0.1', 'admin.attendance.filter', 'http://localhost/try/ss/hrms/public/admin/attendances/filter', '2021-10-30 04:40:06', '2021-10-30 04:40:06'),
(343, 1, 2, '127.0.0.1', 'admin.attendances.index', 'http://localhost/try/ss/hrms/public/admin/attendances', '2021-10-30 04:40:28', '2021-10-30 04:40:28'),
(344, 1, 2, '127.0.0.1', 'admin.attendance.filter', 'http://localhost/try/ss/hrms/public/admin/attendances/filter', '2021-10-30 04:40:28', '2021-10-30 04:40:28'),
(345, 1, 2, '127.0.0.1', 'admin.attendances.index', 'http://localhost/try/ss/hrms/public/admin/attendances', '2021-10-30 04:40:34', '2021-10-30 04:40:34'),
(346, 1, 2, '127.0.0.1', 'admin.attendance.filter', 'http://localhost/try/ss/hrms/public/admin/attendances/filter', '2021-10-30 04:40:34', '2021-10-30 04:40:34'),
(347, 1, 2, '127.0.0.1', 'admin.attendances.index', 'http://localhost/try/ss/hrms/public/admin/attendances', '2021-10-30 04:40:43', '2021-10-30 04:40:43'),
(348, 1, 2, '127.0.0.1', 'admin.attendance.filter', 'http://localhost/try/ss/hrms/public/admin/attendances/filter', '2021-10-30 04:40:44', '2021-10-30 04:40:44'),
(349, 1, 2, '127.0.0.1', 'admin.attendances.index', 'http://localhost/try/ss/hrms/public/admin/attendances', '2021-10-30 04:43:08', '2021-10-30 04:43:08'),
(350, 1, 2, '127.0.0.1', 'admin.attendance.filter', 'http://localhost/try/ss/hrms/public/admin/attendances/filter', '2021-10-30 04:43:08', '2021-10-30 04:43:08'),
(351, 1, 2, '127.0.0.1', 'admin.attendances.index', 'http://localhost/try/ss/hrms/public/admin/attendances', '2021-10-30 04:43:22', '2021-10-30 04:43:22'),
(352, 1, 2, '127.0.0.1', 'admin.attendance.filter', 'http://localhost/try/ss/hrms/public/admin/attendances/filter', '2021-10-30 04:43:23', '2021-10-30 04:43:23'),
(353, 1, 2, '127.0.0.1', 'admin.attendances.index', 'http://localhost/try/ss/hrms/public/admin/attendances', '2021-10-30 04:43:57', '2021-10-30 04:43:57'),
(354, 1, 2, '127.0.0.1', 'admin.attendance.filter', 'http://localhost/try/ss/hrms/public/admin/attendances/filter', '2021-10-30 04:43:58', '2021-10-30 04:43:58'),
(355, 1, 2, '127.0.0.1', 'admin.attendances.index', 'http://localhost/try/ss/hrms/public/admin/attendances', '2021-10-30 04:44:15', '2021-10-30 04:44:15'),
(356, 1, 2, '127.0.0.1', 'admin.attendance.filter', 'http://localhost/try/ss/hrms/public/admin/attendances/filter', '2021-10-30 04:44:15', '2021-10-30 04:44:15'),
(357, 1, 2, '127.0.0.1', 'admin.attendances.index', 'http://localhost/try/ss/hrms/public/admin/attendances', '2021-10-30 04:44:35', '2021-10-30 04:44:35'),
(358, 1, 2, '127.0.0.1', 'admin.attendance.filter', 'http://localhost/try/ss/hrms/public/admin/attendances/filter', '2021-10-30 04:44:35', '2021-10-30 04:44:35'),
(359, 1, 2, '127.0.0.1', 'admin.attendances.index', 'http://localhost/try/ss/hrms/public/admin/attendances', '2021-10-30 04:45:02', '2021-10-30 04:45:02'),
(360, 1, 2, '127.0.0.1', 'admin.attendance.filter', 'http://localhost/try/ss/hrms/public/admin/attendances/filter', '2021-10-30 04:45:02', '2021-10-30 04:45:02'),
(361, 1, 2, '127.0.0.1', 'admin.employees.index', 'http://localhost/try/ss/hrms/public/admin/employees', '2021-10-30 04:45:51', '2021-10-30 04:45:51'),
(362, 1, 2, '127.0.0.1', 'admin.employees.create', 'http://localhost/try/ss/hrms/public/admin/employees/create', '2021-10-30 04:45:53', '2021-10-30 04:45:53'),
(363, 1, 2, '127.0.0.1', 'admin.ajax_employees', 'http://localhost/try/ss/hrms/public/admin/employees/ajax_employees', '2021-10-30 04:45:53', '2021-10-30 04:45:53'),
(364, 1, 2, '127.0.0.1', 'admin.departments.ajax_designation', 'http://localhost/try/ss/hrms/public/admin/departments/ajax_designation', '2021-10-30 04:45:55', '2021-10-30 04:45:55'),
(365, 1, 2, '127.0.0.1', 'admin.employees.store', 'http://localhost/try/ss/hrms/public/admin/employees', '2021-10-30 04:46:33', '2021-10-30 04:46:33'),
(366, 1, 2, '127.0.0.1', 'admin.employees.index', 'http://localhost/try/ss/hrms/public/admin/employees', '2021-10-30 04:46:35', '2021-10-30 04:46:35'),
(367, 1, 2, '127.0.0.1', 'admin.ajax_employees', 'http://localhost/try/ss/hrms/public/admin/employees/ajax_employees', '2021-10-30 04:46:35', '2021-10-30 04:46:35'),
(368, 1, 2, '127.0.0.1', 'admin.employees.create', 'http://localhost/try/ss/hrms/public/admin/employees/create', '2021-10-30 04:46:39', '2021-10-30 04:46:39'),
(369, 1, 2, '127.0.0.1', 'admin.departments.ajax_designation', 'http://localhost/try/ss/hrms/public/admin/departments/ajax_designation', '2021-10-30 04:46:39', '2021-10-30 04:46:39'),
(370, 1, 2, '127.0.0.1', 'admin.employees.store', 'http://localhost/try/ss/hrms/public/admin/employees', '2021-10-30 04:47:07', '2021-10-30 04:47:07'),
(371, 1, 2, '127.0.0.1', 'admin.employees.index', 'http://localhost/try/ss/hrms/public/admin/employees', '2021-10-30 04:47:07', '2021-10-30 04:47:07'),
(372, 1, 2, '127.0.0.1', 'admin.ajax_employees', 'http://localhost/try/ss/hrms/public/admin/employees/ajax_employees', '2021-10-30 04:47:08', '2021-10-30 04:47:08'),
(373, 1, 2, '127.0.0.1', 'admin.attendances.index', 'http://localhost/try/ss/hrms/public/admin/attendances', '2021-10-30 04:47:21', '2021-10-30 04:47:21'),
(374, 1, 2, '127.0.0.1', 'admin.attendance.filter', 'http://localhost/try/ss/hrms/public/admin/attendances/filter', '2021-10-30 04:47:22', '2021-10-30 04:47:22'),
(375, 1, 2, '127.0.0.1', 'admin.attendances.create', 'http://localhost/try/ss/hrms/public/admin/attendances/create', '2021-10-30 04:47:35', '2021-10-30 04:47:35'),
(376, 1, 2, '127.0.0.1', 'admin.attendances.edit', 'http://localhost/try/ss/hrms/public/admin/attendances/2021-10-30/edit', '2021-10-30 04:47:36', '2021-10-30 04:47:36'),
(377, 1, 2, '127.0.0.1', 'admin.attendance.ajax_attendance', 'http://localhost/try/ss/hrms/public/admin/attendances/ajax_attendance', '2021-10-30 04:47:37', '2021-10-30 04:47:37'),
(378, 1, 2, '127.0.0.1', 'admin.attendances.edit', 'http://localhost/try/ss/hrms/public/admin/attendances/2021-10-01/edit', '2021-10-30 04:47:42', '2021-10-30 04:47:42'),
(379, 1, 2, '127.0.0.1', 'admin.attendance.ajax_attendance', 'http://localhost/try/ss/hrms/public/admin/attendances/ajax_attendance', '2021-10-30 04:47:42', '2021-10-30 04:47:42'),
(380, 1, 2, '127.0.0.1', 'admin.attendance.update.row', 'http://localhost/try/ss/hrms/public/admin/attendance/update/row', '2021-10-30 04:47:55', '2021-10-30 04:47:55'),
(381, 1, 2, '127.0.0.1', 'admin.attendances.edit', 'http://localhost/try/ss/hrms/public/admin/attendances/2021-10-01/edit', '2021-10-30 04:48:02', '2021-10-30 04:48:02'),
(382, 1, 2, '127.0.0.1', 'admin.attendance.ajax_attendance', 'http://localhost/try/ss/hrms/public/admin/attendances/ajax_attendance', '2021-10-30 04:48:04', '2021-10-30 04:48:04'),
(383, 1, 2, '127.0.0.1', 'admin.attendances.index', 'http://localhost/try/ss/hrms/public/admin/attendances', '2021-10-30 04:48:05', '2021-10-30 04:48:05'),
(384, 1, 2, '127.0.0.1', 'admin.attendance.filter', 'http://localhost/try/ss/hrms/public/admin/attendances/filter', '2021-10-30 04:48:06', '2021-10-30 04:48:06'),
(385, 1, 2, '127.0.0.1', 'admin.attendance.update.row', 'http://localhost/try/ss/hrms/public/admin/attendance/update/row', '2021-10-30 04:48:18', '2021-10-30 04:48:18'),
(386, 1, 2, '127.0.0.1', 'admin.attendances.index', 'http://localhost/try/ss/hrms/public/admin/attendances', '2021-10-30 04:48:20', '2021-10-30 04:48:20'),
(387, 1, 2, '127.0.0.1', 'admin.attendance.filter', 'http://localhost/try/ss/hrms/public/admin/attendances/filter', '2021-10-30 04:48:21', '2021-10-30 04:48:21'),
(388, 1, 2, '127.0.0.1', 'admin.attendance.update.row', 'http://localhost/try/ss/hrms/public/admin/attendance/update/row', '2021-10-30 04:48:30', '2021-10-30 04:48:30'),
(389, 1, 2, '127.0.0.1', 'admin.attendances.update', 'http://localhost/try/ss/hrms/public/admin/attendances/01-10-2021', '2021-10-30 04:48:38', '2021-10-30 04:48:38'),
(390, 1, 2, '127.0.0.1', 'admin.attendances.edit', 'http://localhost/try/ss/hrms/public/admin/attendances/2021-10-01/edit', '2021-10-30 04:48:39', '2021-10-30 04:48:39'),
(391, 1, 2, '127.0.0.1', 'admin.attendance.ajax_attendance', 'http://localhost/try/ss/hrms/public/admin/attendances/ajax_attendance', '2021-10-30 04:48:39', '2021-10-30 04:48:39'),
(392, 1, 2, '127.0.0.1', 'admin.attendances.index', 'http://localhost/try/ss/hrms/public/admin/attendances', '2021-10-30 04:48:41', '2021-10-30 04:48:41'),
(393, 1, 2, '127.0.0.1', 'admin.attendance.filter', 'http://localhost/try/ss/hrms/public/admin/attendances/filter', '2021-10-30 04:48:42', '2021-10-30 04:48:42'),
(394, 1, 2, '127.0.0.1', 'admin.attendances.create', 'http://localhost/try/ss/hrms/public/admin/attendances/create', '2021-10-30 04:49:00', '2021-10-30 04:49:00'),
(395, 1, 2, '127.0.0.1', 'admin.attendances.edit', 'http://localhost/try/ss/hrms/public/admin/attendances/2021-10-30/edit', '2021-10-30 04:49:00', '2021-10-30 04:49:00'),
(396, 1, 2, '127.0.0.1', 'admin.attendance.ajax_attendance', 'http://localhost/try/ss/hrms/public/admin/attendances/ajax_attendance', '2021-10-30 04:49:01', '2021-10-30 04:49:01'),
(397, 1, 2, '127.0.0.1', 'admin.attendances.index', 'http://localhost/try/ss/hrms/public/admin/attendances', '2021-10-30 04:49:03', '2021-10-30 04:49:03'),
(398, 1, 2, '127.0.0.1', 'admin.attendance.filter', 'http://localhost/try/ss/hrms/public/admin/attendances/filter', '2021-10-30 04:49:04', '2021-10-30 04:49:04'),
(399, 1, 2, '127.0.0.1', 'admin.attendances.edit', 'http://localhost/try/ss/hrms/public/admin/attendances/2021-10-02/edit', '2021-10-30 04:49:12', '2021-10-30 04:49:12'),
(400, 1, 2, '127.0.0.1', 'admin.attendance.ajax_attendance', 'http://localhost/try/ss/hrms/public/admin/attendances/ajax_attendance', '2021-10-30 04:49:12', '2021-10-30 04:49:12'),
(401, 1, 2, '127.0.0.1', 'admin.attendances.update', 'http://localhost/try/ss/hrms/public/admin/attendances/02-10-2021', '2021-10-30 04:49:17', '2021-10-30 04:49:17'),
(402, 1, 2, '127.0.0.1', 'admin.attendances.edit', 'http://localhost/try/ss/hrms/public/admin/attendances/2021-10-02/edit', '2021-10-30 04:49:17', '2021-10-30 04:49:17'),
(403, 1, 2, '127.0.0.1', 'admin.attendance.ajax_attendance', 'http://localhost/try/ss/hrms/public/admin/attendances/ajax_attendance', '2021-10-30 04:49:18', '2021-10-30 04:49:18'),
(404, 1, 2, '127.0.0.1', 'admin.attendances.index', 'http://localhost/try/ss/hrms/public/admin/attendances', '2021-10-30 04:49:18', '2021-10-30 04:49:18'),
(405, 1, 2, '127.0.0.1', 'admin.attendance.filter', 'http://localhost/try/ss/hrms/public/admin/attendances/filter', '2021-10-30 04:49:19', '2021-10-30 04:49:19'),
(406, 1, 2, '127.0.0.1', 'admin.attendances.edit', 'http://localhost/try/ss/hrms/public/admin/attendances/2021-10-04/edit', '2021-10-30 04:49:26', '2021-10-30 04:49:26'),
(407, 1, 2, '127.0.0.1', 'admin.attendance.ajax_attendance', 'http://localhost/try/ss/hrms/public/admin/attendances/ajax_attendance', '2021-10-30 04:49:26', '2021-10-30 04:49:26'),
(408, 1, 2, '127.0.0.1', 'admin.attendances.update', 'http://localhost/try/ss/hrms/public/admin/attendances/04-10-2021', '2021-10-30 04:49:28', '2021-10-30 04:49:28'),
(409, 1, 2, '127.0.0.1', 'admin.attendances.edit', 'http://localhost/try/ss/hrms/public/admin/attendances/2021-10-04/edit', '2021-10-30 04:49:29', '2021-10-30 04:49:29'),
(410, 1, 2, '127.0.0.1', 'admin.attendance.ajax_attendance', 'http://localhost/try/ss/hrms/public/admin/attendances/ajax_attendance', '2021-10-30 04:49:29', '2021-10-30 04:49:29'),
(411, 1, 2, '127.0.0.1', 'admin.attendances.edit', 'http://localhost/try/ss/hrms/public/admin/attendances/2021-10-05/edit', '2021-10-30 04:49:32', '2021-10-30 04:49:32'),
(412, 1, 2, '127.0.0.1', 'admin.attendance.ajax_attendance', 'http://localhost/try/ss/hrms/public/admin/attendances/ajax_attendance', '2021-10-30 04:49:32', '2021-10-30 04:49:32'),
(413, 1, 2, '127.0.0.1', 'admin.attendances.update', 'http://localhost/try/ss/hrms/public/admin/attendances/05-10-2021', '2021-10-30 04:49:38', '2021-10-30 04:49:38'),
(414, 1, 2, '127.0.0.1', 'admin.attendances.edit', 'http://localhost/try/ss/hrms/public/admin/attendances/2021-10-05/edit', '2021-10-30 04:49:38', '2021-10-30 04:49:38'),
(415, 1, 2, '127.0.0.1', 'admin.attendance.ajax_attendance', 'http://localhost/try/ss/hrms/public/admin/attendances/ajax_attendance', '2021-10-30 04:49:39', '2021-10-30 04:49:39'),
(416, 1, 2, '127.0.0.1', 'admin.attendances.index', 'http://localhost/try/ss/hrms/public/admin/attendances', '2021-10-30 04:49:43', '2021-10-30 04:49:43'),
(417, 1, 2, '127.0.0.1', 'admin.attendance.filter', 'http://localhost/try/ss/hrms/public/admin/attendances/filter', '2021-10-30 04:49:43', '2021-10-30 04:49:43'),
(418, 1, 2, '127.0.0.1', 'admin.attendances.edit', 'http://localhost/try/ss/hrms/public/admin/attendances/2021-10-06/edit', '2021-10-30 04:50:13', '2021-10-30 04:50:13'),
(419, 1, 2, '127.0.0.1', 'admin.attendance.ajax_attendance', 'http://localhost/try/ss/hrms/public/admin/attendances/ajax_attendance', '2021-10-30 04:50:14', '2021-10-30 04:50:14'),
(420, 1, 2, '127.0.0.1', 'admin.attendances.update', 'http://localhost/try/ss/hrms/public/admin/attendances/06-10-2021', '2021-10-30 04:50:20', '2021-10-30 04:50:20'),
(421, 1, 2, '127.0.0.1', 'admin.attendances.edit', 'http://localhost/try/ss/hrms/public/admin/attendances/2021-10-06/edit', '2021-10-30 04:50:21', '2021-10-30 04:50:21'),
(422, 1, 2, '127.0.0.1', 'admin.attendance.ajax_attendance', 'http://localhost/try/ss/hrms/public/admin/attendances/ajax_attendance', '2021-10-30 04:50:22', '2021-10-30 04:50:22'),
(423, 1, 2, '127.0.0.1', 'admin.attendances.index', 'http://localhost/try/ss/hrms/public/admin/attendances', '2021-10-30 04:50:23', '2021-10-30 04:50:23'),
(424, 1, 2, '127.0.0.1', 'admin.attendance.filter', 'http://localhost/try/ss/hrms/public/admin/attendances/filter', '2021-10-30 04:50:24', '2021-10-30 04:50:24'),
(425, 1, 2, '127.0.0.1', 'admin.attendances.index', 'http://localhost/try/ss/hrms/public/admin/attendances', '2021-10-30 04:51:41', '2021-10-30 04:51:41'),
(426, 1, 2, '127.0.0.1', 'admin.attendance.filter', 'http://localhost/try/ss/hrms/public/admin/attendances/filter', '2021-10-30 04:51:41', '2021-10-30 04:51:41'),
(427, 1, 2, '127.0.0.1', 'admin.attendances.index', 'http://localhost/try/ss/hrms/public/admin/attendances', '2021-10-30 04:52:43', '2021-10-30 04:52:43'),
(428, 1, 2, '127.0.0.1', 'admin.attendance.filter', 'http://localhost/try/ss/hrms/public/admin/attendances/filter', '2021-10-30 04:52:44', '2021-10-30 04:52:44'),
(429, 1, 2, '127.0.0.1', 'admin.attendances.index', 'http://localhost/try/ss/hrms/public/admin/attendances', '2021-10-30 04:52:53', '2021-10-30 04:52:53'),
(430, 1, 2, '127.0.0.1', 'admin.attendance.filter', 'http://localhost/try/ss/hrms/public/admin/attendances/filter', '2021-10-30 04:52:54', '2021-10-30 04:52:54'),
(431, 1, 2, '127.0.0.1', 'admin.attendances.index', 'http://localhost/try/ss/hrms/public/admin/attendances', '2021-10-30 04:53:13', '2021-10-30 04:53:13'),
(432, 1, 2, '127.0.0.1', 'admin.attendance.filter', 'http://localhost/try/ss/hrms/public/admin/attendances/filter', '2021-10-30 04:53:14', '2021-10-30 04:53:14'),
(433, 1, 2, '127.0.0.1', 'admin.attendances.index', 'http://localhost/try/ss/hrms/public/admin/attendances', '2021-10-30 04:53:34', '2021-10-30 04:53:34'),
(434, 1, 2, '127.0.0.1', 'admin.attendance.filter', 'http://localhost/try/ss/hrms/public/admin/attendances/filter', '2021-10-30 04:53:35', '2021-10-30 04:53:35'),
(435, 1, 2, '127.0.0.1', 'admin.attendances.index', 'http://localhost/try/ss/hrms/public/admin/attendances', '2021-10-30 04:53:48', '2021-10-30 04:53:48'),
(436, 1, 2, '127.0.0.1', 'admin.attendance.filter', 'http://localhost/try/ss/hrms/public/admin/attendances/filter', '2021-10-30 04:53:49', '2021-10-30 04:53:49'),
(437, 1, 2, '127.0.0.1', 'admin.attendances.index', 'http://localhost/try/ss/hrms/public/admin/attendances', '2021-10-30 04:54:01', '2021-10-30 04:54:01'),
(438, 1, 2, '127.0.0.1', 'admin.attendance.filter', 'http://localhost/try/ss/hrms/public/admin/attendances/filter', '2021-10-30 04:54:01', '2021-10-30 04:54:01'),
(439, 1, 2, '127.0.0.1', 'admin.attendances.index', 'http://localhost/try/ss/hrms/public/admin/attendances', '2021-10-30 04:54:58', '2021-10-30 04:54:58'),
(440, 1, 2, '127.0.0.1', 'admin.attendance.filter', 'http://localhost/try/ss/hrms/public/admin/attendances/filter', '2021-10-30 04:54:59', '2021-10-30 04:54:59'),
(441, 1, 2, '127.0.0.1', 'admin.attendances.index', 'http://localhost/try/ss/hrms/public/admin/attendances', '2021-10-30 04:56:02', '2021-10-30 04:56:02'),
(442, 1, 2, '127.0.0.1', 'admin.attendance.filter', 'http://localhost/try/ss/hrms/public/admin/attendances/filter', '2021-10-30 04:56:03', '2021-10-30 04:56:03'),
(443, 1, 2, '127.0.0.1', 'admin.attendances.index', 'http://localhost/try/ss/hrms/public/admin/attendances', '2021-10-30 04:56:25', '2021-10-30 04:56:25'),
(444, 1, 2, '127.0.0.1', 'admin.attendance.filter', 'http://localhost/try/ss/hrms/public/admin/attendances/filter', '2021-10-30 04:56:26', '2021-10-30 04:56:26'),
(445, 1, 2, '127.0.0.1', 'admin.attendances.index', 'http://localhost/try/ss/hrms/public/admin/attendances', '2021-10-30 04:57:00', '2021-10-30 04:57:00'),
(446, 1, 2, '127.0.0.1', 'admin.attendance.filter', 'http://localhost/try/ss/hrms/public/admin/attendances/filter', '2021-10-30 04:57:01', '2021-10-30 04:57:01'),
(447, 1, 2, '127.0.0.1', 'admin.attendances.index', 'http://localhost/try/ss/hrms/public/admin/attendances', '2021-10-30 04:57:36', '2021-10-30 04:57:36'),
(448, 1, 2, '127.0.0.1', 'admin.attendance.filter', 'http://localhost/try/ss/hrms/public/admin/attendances/filter', '2021-10-30 04:57:37', '2021-10-30 04:57:37'),
(449, 1, 2, '127.0.0.1', 'admin.attendances.index', 'http://localhost/try/ss/hrms/public/admin/attendances', '2021-10-30 04:57:49', '2021-10-30 04:57:49'),
(450, 1, 2, '127.0.0.1', 'admin.attendance.filter', 'http://localhost/try/ss/hrms/public/admin/attendances/filter', '2021-10-30 04:57:50', '2021-10-30 04:57:50'),
(451, 1, 2, '127.0.0.1', 'admin.attendances.index', 'http://localhost/try/ss/hrms/public/admin/attendances', '2021-10-30 05:00:39', '2021-10-30 05:00:39'),
(452, 1, 2, '127.0.0.1', 'admin.attendance.filter', 'http://localhost/try/ss/hrms/public/admin/attendances/filter', '2021-10-30 05:00:40', '2021-10-30 05:00:40'),
(453, 1, 2, '127.0.0.1', 'admin.attendances.index', 'http://localhost/try/ss/hrms/public/admin/attendances', '2021-10-30 05:00:53', '2021-10-30 05:00:53'),
(454, 1, 2, '127.0.0.1', 'admin.attendance.filter', 'http://localhost/try/ss/hrms/public/admin/attendances/filter', '2021-10-30 05:00:54', '2021-10-30 05:00:54'),
(455, 1, 2, '127.0.0.1', 'admin.attendances.index', 'http://localhost/try/ss/hrms/public/admin/attendances', '2021-10-30 05:01:10', '2021-10-30 05:01:10'),
(456, 1, 2, '127.0.0.1', 'admin.attendance.filter', 'http://localhost/try/ss/hrms/public/admin/attendances/filter', '2021-10-30 05:01:10', '2021-10-30 05:01:10'),
(457, 1, 2, '127.0.0.1', 'admin.attendances.index', 'http://localhost/try/ss/hrms/public/admin/attendances', '2021-10-30 05:01:31', '2021-10-30 05:01:31'),
(458, 1, 2, '127.0.0.1', 'admin.attendance.filter', 'http://localhost/try/ss/hrms/public/admin/attendances/filter', '2021-10-30 05:01:32', '2021-10-30 05:01:32'),
(459, 1, 2, '127.0.0.1', 'admin.attendances.index', 'http://localhost/try/ss/hrms/public/admin/attendances', '2021-10-30 05:02:22', '2021-10-30 05:02:22'),
(460, 1, 2, '127.0.0.1', 'admin.attendance.filter', 'http://localhost/try/ss/hrms/public/admin/attendances/filter', '2021-10-30 05:02:23', '2021-10-30 05:02:23'),
(461, 1, 2, '127.0.0.1', 'admin.attendances.index', 'http://localhost/try/ss/hrms/public/admin/attendances', '2021-10-30 05:03:34', '2021-10-30 05:03:34'),
(462, 1, 2, '127.0.0.1', 'admin.attendance.filter', 'http://localhost/try/ss/hrms/public/admin/attendances/filter', '2021-10-30 05:03:34', '2021-10-30 05:03:34'),
(463, 1, 2, '127.0.0.1', 'admin.attendances.index', 'http://localhost/try/ss/hrms/public/admin/attendances', '2021-10-30 05:05:03', '2021-10-30 05:05:03'),
(464, 1, 2, '127.0.0.1', 'admin.attendance.filter', 'http://localhost/try/ss/hrms/public/admin/attendances/filter', '2021-10-30 05:05:04', '2021-10-30 05:05:04'),
(465, 1, 2, '127.0.0.1', 'admin.attendances.index', 'http://localhost/try/ss/hrms/public/admin/attendances', '2021-10-30 05:05:31', '2021-10-30 05:05:31'),
(466, 1, 2, '127.0.0.1', 'admin.attendance.filter', 'http://localhost/try/ss/hrms/public/admin/attendances/filter', '2021-10-30 05:05:32', '2021-10-30 05:05:32'),
(467, 1, 2, '127.0.0.1', 'admin.attendances.index', 'http://localhost/try/ss/hrms/public/admin/attendances', '2021-10-30 05:05:42', '2021-10-30 05:05:42'),
(468, 1, 2, '127.0.0.1', 'admin.attendance.filter', 'http://localhost/try/ss/hrms/public/admin/attendances/filter', '2021-10-30 05:05:43', '2021-10-30 05:05:43'),
(469, 1, 2, '127.0.0.1', 'admin.attendances.index', 'http://localhost/try/ss/hrms/public/admin/attendances', '2021-10-30 05:06:11', '2021-10-30 05:06:11'),
(470, 1, 2, '127.0.0.1', 'admin.attendance.filter', 'http://localhost/try/ss/hrms/public/admin/attendances/filter', '2021-10-30 05:06:12', '2021-10-30 05:06:12'),
(471, 1, 2, '127.0.0.1', 'admin.screenlock.modal', 'http://localhost/try/ss/hrms/public/screenlock/modal', '2021-10-30 05:08:36', '2021-10-30 05:08:36'),
(472, 1, 2, '127.0.0.1', 'admin.screen.lock', 'http://localhost/try/ss/hrms/public/screenlock', '2021-10-30 05:10:38', '2021-10-30 05:10:38'),
(473, 1, 2, '127.0.0.1', 'admin.login', 'http://localhost/try/ss/hrms/public/admin/login', '2021-10-30 05:10:44', '2021-10-30 05:10:44'),
(474, 1, 2, '127.0.0.1', 'admin.attendances.edit', 'http://localhost/try/ss/hrms/public/admin/attendances/2021-10-06/edit', '2021-10-30 05:10:45', '2021-10-30 05:10:45'),
(475, 1, 2, '127.0.0.1', 'admin.attendance.ajax_attendance', 'http://localhost/try/ss/hrms/public/admin/attendances/ajax_attendance', '2021-10-30 05:10:46', '2021-10-30 05:10:46'),
(476, 1, 2, '127.0.0.1', 'admin.attendances.show', 'http://localhost/try/ss/hrms/public/admin/attendances/attendances-roster', '2021-10-30 05:10:50', '2021-10-30 05:10:50'),
(477, 1, 2, '127.0.0.1', 'admin.attendances.create', 'http://localhost/try/ss/hrms/public/admin/attendances/create', '2021-10-30 05:10:59', '2021-10-30 05:10:59'),
(478, 1, 2, '127.0.0.1', 'admin.attendances.edit', 'http://localhost/try/ss/hrms/public/admin/attendances/2021-10-30/edit', '2021-10-30 05:11:00', '2021-10-30 05:11:00'),
(479, 1, 2, '127.0.0.1', 'admin.attendance.ajax_attendance', 'http://localhost/try/ss/hrms/public/admin/attendances/ajax_attendance', '2021-10-30 05:11:00', '2021-10-30 05:11:00'),
(480, 1, 2, '127.0.0.1', 'admin.attendances.index', 'http://localhost/try/ss/hrms/public/admin/attendances', '2021-10-30 05:11:03', '2021-10-30 05:11:03'),
(481, 1, 2, '127.0.0.1', 'admin.attendance.filter', 'http://localhost/try/ss/hrms/public/admin/attendances/filter', '2021-10-30 05:11:03', '2021-10-30 05:11:03'),
(482, 1, 2, '127.0.0.1', 'admin.leavetypes.index', 'http://localhost/try/ss/hrms/public/admin/leavetypes', '2021-10-30 05:11:05', '2021-10-30 05:11:05'),
(483, 1, 2, '127.0.0.1', 'admin.leavetypes.ajax_list', 'http://localhost/try/ss/hrms/public/admin/leavetypes/ajax_list', '2021-10-30 05:11:06', '2021-10-30 05:11:06'),
(484, 1, 2, '127.0.0.1', 'admin.leave_applications.index', 'http://localhost/try/ss/hrms/public/admin/leave_applications', '2021-10-30 05:11:07', '2021-10-30 05:11:07'),
(485, 1, 2, '127.0.0.1', 'admin.leave_applications', 'http://localhost/try/ss/hrms/public/admin/leave_applications/ajaxApplications', '2021-10-30 05:11:08', '2021-10-30 05:11:08'),
(486, 1, 2, '127.0.0.1', 'admin.jobs.index', 'http://localhost/try/ss/hrms/public/admin/jobs', '2021-10-30 05:11:11', '2021-10-30 05:11:11'),
(487, 1, 2, '127.0.0.1', 'admin.ajax_jobs', 'http://localhost/try/ss/hrms/public/admin/ajax_jobs', '2021-10-30 05:11:11', '2021-10-30 05:11:11'),
(488, 1, 2, '127.0.0.1', 'admin.jobs.create', 'http://localhost/try/ss/hrms/public/admin/jobs/create', '2021-10-30 05:11:14', '2021-10-30 05:11:14'),
(489, 1, 2, '127.0.0.1', 'admin.job_applications.index', 'http://localhost/try/ss/hrms/public/admin/job_applications', '2021-10-30 05:11:16', '2021-10-30 05:11:16'),
(490, 1, 2, '127.0.0.1', 'admin.ajax_jobs_applications', 'http://localhost/try/ss/hrms/public/admin/ajax_jobs_applications', '2021-10-30 05:11:17', '2021-10-30 05:11:17'),
(491, 1, 2, '127.0.0.1', 'admin.departments.index', 'http://localhost/try/ss/hrms/public/admin/departments', '2021-10-30 05:11:19', '2021-10-30 05:11:19'),
(492, 1, 2, '127.0.0.1', 'admin.awards.index', 'http://localhost/try/ss/hrms/public/admin/awards', '2021-10-30 05:11:21', '2021-10-30 05:11:21'),
(493, 1, 2, '127.0.0.1', 'admin.ajax_awards', 'http://localhost/try/ss/hrms/public/admin/ajax_awards', '2021-10-30 05:11:22', '2021-10-30 05:11:22'),
(494, 1, 2, '127.0.0.1', 'admin.payrolls.index', 'http://localhost/try/ss/hrms/public/admin/payrolls', '2021-10-30 05:11:28', '2021-10-30 05:11:28'),
(495, 1, 2, '127.0.0.1', 'admin.ajax_payrolls', 'http://localhost/try/ss/hrms/public/admin/ajax_payrolls', '2021-10-30 05:11:28', '2021-10-30 05:11:28'),
(496, 1, 2, '127.0.0.1', 'admin.noticeboards.index', 'http://localhost/try/ss/hrms/public/admin/noticeboards', '2021-10-30 05:11:42', '2021-10-30 05:11:42'),
(497, 1, 2, '127.0.0.1', 'admin.ajax_notices', 'http://localhost/try/ss/hrms/public/admin/ajax_notices', '2021-10-30 05:11:42', '2021-10-30 05:11:42'),
(498, 1, 2, '127.0.0.1', 'admin.noticeboards.create', 'http://localhost/try/ss/hrms/public/admin/noticeboards/create', '2021-10-30 05:11:43', '2021-10-30 05:11:43'),
(499, 1, 2, '127.0.0.1', 'admin.attendances.create', 'http://localhost/try/ss/hrms/public/admin/attendances/create', '2021-10-30 05:11:54', '2021-10-30 05:11:54'),
(500, 1, 2, '127.0.0.1', 'admin.attendances.edit', 'http://localhost/try/ss/hrms/public/admin/attendances/2021-10-30/edit', '2021-10-30 05:11:54', '2021-10-30 05:11:54'),
(501, 1, 2, '127.0.0.1', 'admin.attendance.ajax_attendance', 'http://localhost/try/ss/hrms/public/admin/attendances/ajax_attendance', '2021-10-30 05:11:55', '2021-10-30 05:11:55'),
(502, 1, 2, '127.0.0.1', 'admin.attendances.show', 'http://localhost/try/ss/hrms/public/admin/attendances/attendances-roster', '2021-10-30 05:13:02', '2021-10-30 05:13:02'),
(503, 1, 2, '127.0.0.1', 'admin.attendance.roster', 'http://localhost/try/ss/hrms/public/admin/attendances-roster', '2021-10-30 05:13:06', '2021-10-30 05:13:06'),
(504, 1, 2, '127.0.0.1', 'admin.attendance.filter', 'http://localhost/try/ss/hrms/public/admin/attendances/filter', '2021-10-30 05:13:07', '2021-10-30 05:13:07'),
(505, 1, 2, '127.0.0.1', 'admin.attendances.show', 'http://localhost/try/ss/hrms/public/admin/attendances/attendances-roster', '2021-10-30 05:13:30', '2021-10-30 05:13:30'),
(506, 1, 2, '127.0.0.1', 'admin.attendances.show', 'http://localhost/try/ss/hrms/public/admin/attendances/attendances-roster', '2021-10-30 05:13:34', '2021-10-30 05:13:34'),
(507, 1, 2, '127.0.0.1', 'admin.attendances.edit', 'http://localhost/try/ss/hrms/public/admin/attendances/2021-10-06/edit', '2021-10-30 05:13:43', '2021-10-30 05:13:43'),
(508, 1, 2, '127.0.0.1', 'admin.attendance.ajax_attendance', 'http://localhost/try/ss/hrms/public/admin/attendances/ajax_attendance', '2021-10-30 05:13:43', '2021-10-30 05:13:43'),
(509, 1, 2, '127.0.0.1', 'admin.attendances.show', 'http://localhost/try/ss/hrms/public/admin/attendances/attendances-roster', '2021-10-30 05:13:46', '2021-10-30 05:13:46'),
(510, 1, 2, '127.0.0.1', 'admin.attendances.show', 'http://localhost/try/ss/hrms/public/admin/attendances/attendances-roster', '2021-10-30 05:14:18', '2021-10-30 05:14:18'),
(511, 1, 2, '127.0.0.1', 'admin.attendance.roster', 'http://localhost/try/ss/hrms/public/admin/attendances-roster', '2021-10-30 05:14:27', '2021-10-30 05:14:27'),
(512, 1, 2, '127.0.0.1', 'admin.attendance.filter', 'http://localhost/try/ss/hrms/public/admin/attendances/filter', '2021-10-30 05:14:27', '2021-10-30 05:14:27'),
(513, 1, 2, '127.0.0.1', 'admin.attendance.index', 'http://localhost/try/ss/hrms/public/admin/attendances-roster', '2021-10-30 05:16:07', '2021-10-30 05:16:07'),
(514, 1, 2, '127.0.0.1', 'admin.attendance.filter', 'http://localhost/try/ss/hrms/public/admin/attendances/filter', '2021-10-30 05:16:08', '2021-10-30 05:16:08'),
(515, 1, 2, '127.0.0.1', 'admin.attendance.index', 'http://localhost/try/ss/hrms/public/admin/attendances-roster', '2021-10-30 05:16:18', '2021-10-30 05:16:18'),
(516, 1, 2, '127.0.0.1', 'admin.attendance.filter', 'http://localhost/try/ss/hrms/public/admin/attendances/filter', '2021-10-30 05:16:20', '2021-10-30 05:16:20'),
(517, 1, 2, '127.0.0.1', 'admin.attendance_roster.index', 'http://localhost/try/ss/hrms/public/admin/attendances-roster', '2021-10-30 05:17:07', '2021-10-30 05:17:07'),
(518, 1, 2, '127.0.0.1', 'admin.attendance.filter', 'http://localhost/try/ss/hrms/public/admin/attendances/filter', '2021-10-30 05:17:08', '2021-10-30 05:17:08'),
(519, 1, 2, '127.0.0.1', 'admin.attendance-roster.index', 'http://localhost/try/ss/hrms/public/admin/attendance-roster', '2021-10-30 05:19:32', '2021-10-30 05:19:32'),
(520, 1, 2, '127.0.0.1', 'admin.attendance-roster.index', 'http://localhost/try/ss/hrms/public/admin/attendance-roster', '2021-10-30 05:20:11', '2021-10-30 05:20:11'),
(521, 1, 2, '127.0.0.1', 'admin.attendance-roster.index', 'http://localhost/try/ss/hrms/public/admin/attendance-roster', '2021-10-30 05:21:05', '2021-10-30 05:21:05'),
(522, 1, 2, '127.0.0.1', 'admin.attendance-roster.filter', 'http://localhost/try/ss/hrms/public/admin/attendance-roster/filter', '2021-10-30 05:21:05', '2021-10-30 05:21:05'),
(523, 1, 2, '127.0.0.1', 'admin.attendance-roster.index', 'http://localhost/try/ss/hrms/public/admin/attendance-roster', '2021-10-30 05:22:00', '2021-10-30 05:22:00'),
(524, 1, 2, '127.0.0.1', 'admin.attendance-roster.filter', 'http://localhost/try/ss/hrms/public/admin/attendance-roster/filter', '2021-10-30 05:22:11', '2021-10-30 05:22:11'),
(525, 1, 2, '127.0.0.1', 'admin.dashboard.index', 'http://localhost/try/ss/hrms/public/admin/dashboard', '2021-10-30 08:35:30', '2021-10-30 08:35:30'),
(526, 1, 2, '127.0.0.1', 'admin.attendance.ajax_load_calender', 'http://localhost/try/ss/hrms/public/admin/attendances/ajax_load_calender', '2021-10-30 08:35:32', '2021-10-30 08:35:32'),
(527, 1, 2, '127.0.0.1', 'admin.attendance-roster.index', 'http://localhost/try/ss/hrms/public/admin/attendance-roster', '2021-10-30 08:35:33', '2021-10-30 08:35:33'),
(528, 1, 2, '127.0.0.1', 'admin.attendance-roster.filter', 'http://localhost/try/ss/hrms/public/admin/attendance-roster/filter', '2021-10-30 08:35:34', '2021-10-30 08:35:34'),
(529, 1, 2, '127.0.0.1', 'admin.attendance-roster.index', 'http://localhost/try/ss/hrms/public/admin/attendance-roster', '2021-10-30 08:38:39', '2021-10-30 08:38:39'),
(530, 1, 2, '127.0.0.1', 'admin.attendance-roster.filter', 'http://localhost/try/ss/hrms/public/admin/attendance-roster/filter', '2021-10-30 08:38:41', '2021-10-30 08:38:41'),
(531, 1, 2, '127.0.0.1', 'admin.attendance-roster.index', 'http://localhost/try/ss/hrms/public/admin/attendance-roster', '2021-10-30 08:39:44', '2021-10-30 08:39:44'),
(532, 1, 2, '127.0.0.1', 'admin.attendance-roster.filter', 'http://localhost/try/ss/hrms/public/admin/attendance-roster/filter', '2021-10-30 08:39:45', '2021-10-30 08:39:45'),
(533, 1, 2, '127.0.0.1', 'admin.screenlock.modal', 'http://localhost/try/ss/hrms/public/screenlock/modal', '2021-10-30 08:53:37', '2021-10-30 08:53:37'),
(534, 1, 2, '127.0.0.1', 'admin.screenlock.modal', 'http://localhost/try/ss/hrms/public/screenlock/modal', '2021-10-30 09:08:31', '2021-10-30 09:08:31'),
(535, 1, 2, '127.0.0.1', 'admin.screenlock.modal', 'http://localhost/try/ss/hrms/public/screenlock/modal', '2021-10-30 09:11:33', '2021-10-30 09:11:33'),
(536, 1, 2, '127.0.0.1', 'admin.screenlock.modal', 'http://localhost/try/ss/hrms/public/screenlock/modal', '2021-10-30 09:26:32', '2021-10-30 09:26:32'),
(537, 1, 2, '127.0.0.1', 'admin.screenlock.modal', 'http://localhost/try/ss/hrms/public/screenlock/modal', '2021-10-30 09:29:34', '2021-10-30 09:29:34'),
(538, 1, 2, '127.0.0.1', 'admin.screenlock.modal', 'http://localhost/try/ss/hrms/public/screenlock/modal', '2021-10-30 09:44:33', '2021-10-30 09:44:33'),
(539, 1, 2, '127.0.0.1', 'admin.screenlock.modal', 'http://localhost/try/ss/hrms/public/screenlock/modal', '2021-10-30 09:47:34', '2021-10-30 09:47:34'),
(540, 1, 2, '127.0.0.1', 'admin.screenlock.modal', 'http://localhost/try/ss/hrms/public/screenlock/modal', '2021-10-30 10:02:34', '2021-10-30 10:02:34'),
(541, 1, 2, '127.0.0.1', 'admin.screenlock.modal', 'http://localhost/try/ss/hrms/public/screenlock/modal', '2021-10-30 10:05:35', '2021-10-30 10:05:35'),
(542, 1, 2, '127.0.0.1', 'admin.screenlock.modal', 'http://localhost/try/ss/hrms/public/screenlock/modal', '2021-10-30 10:20:35', '2021-10-30 10:20:35'),
(543, 1, 2, '127.0.0.1', 'admin.screenlock.modal', 'http://localhost/try/ss/hrms/public/screenlock/modal', '2021-10-30 10:23:35', '2021-10-30 10:23:35'),
(544, 1, 2, '127.0.0.1', 'admin.screenlock.modal', 'http://localhost/try/ss/hrms/public/screenlock/modal', '2021-10-30 10:38:36', '2021-10-30 10:38:36'),
(545, 1, 2, '127.0.0.1', 'admin.screenlock.modal', 'http://localhost/try/ss/hrms/public/screenlock/modal', '2021-10-30 10:41:37', '2021-10-30 10:41:37'),
(546, 1, 2, '127.0.0.1', 'admin.dashboard.index', 'http://localhost/try/ss/hrms/public/admin/dashboard', '2021-10-31 05:30:33', '2021-10-31 05:30:33'),
(547, 1, 2, '127.0.0.1', 'admin.attendance.ajax_load_calender', 'http://localhost/try/ss/hrms/public/admin/attendances/ajax_load_calender', '2021-10-31 05:30:42', '2021-10-31 05:30:42'),
(548, 1, 2, '127.0.0.1', 'admin.attendances.create', 'http://localhost/try/ss/hrms/public/admin/attendances/create', '2021-10-31 05:30:55', '2021-10-31 05:30:55'),
(549, 1, 2, '127.0.0.1', 'admin.attendances.edit', 'http://localhost/try/ss/hrms/public/admin/attendances/2021-10-31/edit', '2021-10-31 05:30:55', '2021-10-31 05:30:55'),
(550, 1, 2, '127.0.0.1', 'admin.attendance.ajax_attendance', 'http://localhost/try/ss/hrms/public/admin/attendances/ajax_attendance', '2021-10-31 05:30:57', '2021-10-31 05:30:57'),
(551, 1, 2, '127.0.0.1', 'admin.attendance-roster.index', 'http://localhost/try/ss/hrms/public/admin/attendance-roster', '2021-10-31 05:31:58', '2021-10-31 05:31:58'),
(552, 1, 2, '127.0.0.1', 'admin.attendance-roster.filter', 'http://localhost/try/ss/hrms/public/admin/attendance-roster/filter', '2021-10-31 05:31:59', '2021-10-31 05:31:59'),
(553, 1, 2, '127.0.0.1', 'admin.attendances.index', 'http://localhost/try/ss/hrms/public/admin/attendances', '2021-10-31 05:32:32', '2021-10-31 05:32:32'),
(554, 1, 2, '127.0.0.1', 'admin.attendance.filter', 'http://localhost/try/ss/hrms/public/admin/attendances/filter', '2021-10-31 05:32:33', '2021-10-31 05:32:33'),
(555, 1, 2, '127.0.0.1', 'admin.attendance-roster.index', 'http://localhost/try/ss/hrms/public/admin/attendance-roster', '2021-10-31 05:34:34', '2021-10-31 05:34:34'),
(556, 1, 2, '127.0.0.1', 'admin.attendance-roster.filter', 'http://localhost/try/ss/hrms/public/admin/attendance-roster/filter', '2021-10-31 05:34:35', '2021-10-31 05:34:35'),
(557, 1, 2, '127.0.0.1', 'admin.attendance-roster.index', 'http://localhost/try/ss/hrms/public/admin/attendance-roster', '2021-10-31 05:35:00', '2021-10-31 05:35:00'),
(558, 1, 2, '127.0.0.1', 'admin.attendance-roster.filter', 'http://localhost/try/ss/hrms/public/admin/attendance-roster/filter', '2021-10-31 05:35:01', '2021-10-31 05:35:01'),
(559, 1, 2, '127.0.0.1', 'admin.employees.index', 'http://localhost/try/ss/hrms/public/admin/employees', '2021-10-31 05:36:15', '2021-10-31 05:36:15'),
(560, 1, 2, '127.0.0.1', 'admin.ajax_employees', 'http://localhost/try/ss/hrms/public/admin/employees/ajax_employees', '2021-10-31 05:36:17', '2021-10-31 05:36:17'),
(561, 1, 2, '127.0.0.1', 'admin.employees.create', 'http://localhost/try/ss/hrms/public/admin/employees/create', '2021-10-31 05:36:18', '2021-10-31 05:36:18'),
(562, 1, 2, '127.0.0.1', 'admin.departments.ajax_designation', 'http://localhost/try/ss/hrms/public/admin/departments/ajax_designation', '2021-10-31 05:36:19', '2021-10-31 05:36:19'),
(563, 1, 2, '127.0.0.1', 'admin.employees.index', 'http://localhost/try/ss/hrms/public/admin/employees', '2021-10-31 05:36:32', '2021-10-31 05:36:32');
INSERT INTO `browse_history` (`id`, `company_id`, `admin_id`, `ip`, `route`, `url`, `created_at`, `updated_at`) VALUES
(564, 1, 2, '127.0.0.1', 'admin.ajax_employees', 'http://localhost/try/ss/hrms/public/admin/employees/ajax_employees', '2021-10-31 05:36:32', '2021-10-31 05:36:32'),
(565, 1, 2, '127.0.0.1', 'admin.employees.edit', 'http://localhost/try/ss/hrms/public/admin/employees/1/edit', '2021-10-31 05:39:16', '2021-10-31 05:39:16'),
(566, 1, 2, '127.0.0.1', 'admin.departments.ajax_designation', 'http://localhost/try/ss/hrms/public/admin/departments/ajax_designation', '2021-10-31 05:39:18', '2021-10-31 05:39:18'),
(567, 1, 2, '127.0.0.1', 'admin.employees.update', 'http://localhost/try/ss/hrms/public/admin/employees/1', '2021-10-31 05:42:27', '2021-10-31 05:42:27'),
(568, 1, 2, '127.0.0.1', 'admin.employees.update', 'http://localhost/try/ss/hrms/public/admin/employees/1', '2021-10-31 05:42:42', '2021-10-31 05:42:42'),
(569, 1, 2, '127.0.0.1', 'admin.employees.edit', 'http://localhost/try/ss/hrms/public/admin/employees/1/edit', '2021-10-31 05:42:48', '2021-10-31 05:42:48'),
(570, 1, 2, '127.0.0.1', 'admin.departments.ajax_designation', 'http://localhost/try/ss/hrms/public/admin/departments/ajax_designation', '2021-10-31 05:42:49', '2021-10-31 05:42:49'),
(571, 1, 2, '127.0.0.1', 'admin.employees.index', 'http://localhost/try/ss/hrms/public/admin/employees', '2021-10-31 05:45:36', '2021-10-31 05:45:36'),
(572, 1, 2, '127.0.0.1', 'admin.ajax_employees', 'http://localhost/try/ss/hrms/public/admin/employees/ajax_employees', '2021-10-31 05:45:37', '2021-10-31 05:45:37'),
(573, 1, 2, '127.0.0.1', 'admin.employees.index', 'http://localhost/try/ss/hrms/public/admin/employees', '2021-10-31 05:48:05', '2021-10-31 05:48:05'),
(574, 1, 2, '127.0.0.1', 'admin.ajax_employees', 'http://localhost/try/ss/hrms/public/admin/employees/ajax_employees', '2021-10-31 05:48:05', '2021-10-31 05:48:05'),
(575, 1, 2, '127.0.0.1', 'admin.employees.index', 'http://localhost/try/ss/hrms/public/admin/employees', '2021-10-31 05:49:11', '2021-10-31 05:49:11'),
(576, 1, 2, '127.0.0.1', 'admin.ajax_employees', 'http://localhost/try/ss/hrms/public/admin/employees/ajax_employees', '2021-10-31 05:49:12', '2021-10-31 05:49:12'),
(577, 1, 2, '127.0.0.1', 'admin.screenlock.modal', 'http://localhost/try/ss/hrms/public/screenlock/modal', '2021-10-31 05:50:35', '2021-10-31 05:50:35'),
(578, 1, 2, '127.0.0.1', 'admin.screen.lock', 'http://localhost/try/ss/hrms/public/screenlock', '2021-10-31 05:50:58', '2021-10-31 05:50:58'),
(579, 1, 2, '127.0.0.1', 'admin.login', 'http://localhost/try/ss/hrms/public/admin/login', '2021-10-31 05:51:03', '2021-10-31 05:51:03'),
(580, 1, 2, '127.0.0.1', 'admin.attendances.index', 'http://localhost/try/ss/hrms/public/admin/attendances', '2021-10-31 05:51:04', '2021-10-31 05:51:04'),
(581, 1, 2, '127.0.0.1', 'admin.attendance.filter', 'http://localhost/try/ss/hrms/public/admin/attendances/filter', '2021-10-31 05:51:05', '2021-10-31 05:51:05'),
(582, 1, 2, '127.0.0.1', 'admin.employees.index', 'http://localhost/try/ss/hrms/public/admin/employees', '2021-10-31 05:51:16', '2021-10-31 05:51:16'),
(583, 1, 2, '127.0.0.1', 'admin.ajax_employees', 'http://localhost/try/ss/hrms/public/admin/employees/ajax_employees', '2021-10-31 05:51:17', '2021-10-31 05:51:17'),
(584, 1, 2, '127.0.0.1', 'admin.employees.index', 'http://localhost/try/ss/hrms/public/admin/employees', '2021-10-31 05:51:26', '2021-10-31 05:51:26'),
(585, 1, 2, '127.0.0.1', 'admin.ajax_employees', 'http://localhost/try/ss/hrms/public/admin/employees/ajax_employees', '2021-10-31 05:51:26', '2021-10-31 05:51:26'),
(586, 1, 2, '127.0.0.1', 'admin.employees.index', 'http://localhost/try/ss/hrms/public/admin/employees', '2021-10-31 05:51:31', '2021-10-31 05:51:31'),
(587, 1, 2, '127.0.0.1', 'admin.ajax_employees', 'http://localhost/try/ss/hrms/public/admin/employees/ajax_employees', '2021-10-31 05:51:32', '2021-10-31 05:51:32'),
(588, 1, 2, '127.0.0.1', 'admin.employees.index', 'http://localhost/try/ss/hrms/public/admin/employees', '2021-10-31 05:52:17', '2021-10-31 05:52:17'),
(589, 1, 2, '127.0.0.1', 'admin.ajax_employees', 'http://localhost/try/ss/hrms/public/admin/employees/ajax_employees', '2021-10-31 05:52:18', '2021-10-31 05:52:18'),
(590, 1, 2, '127.0.0.1', 'admin.employees.index', 'http://localhost/try/ss/hrms/public/admin/employees', '2021-10-31 05:54:50', '2021-10-31 05:54:50'),
(591, 1, 2, '127.0.0.1', 'admin.ajax_employees', 'http://localhost/try/ss/hrms/public/admin/employees/ajax_employees', '2021-10-31 05:54:51', '2021-10-31 05:54:51'),
(592, 1, 2, '127.0.0.1', 'admin.employees.index', 'http://localhost/try/ss/hrms/public/admin/employees', '2021-10-31 05:57:36', '2021-10-31 05:57:36'),
(593, 1, 2, '127.0.0.1', 'admin.ajax_employees', 'http://localhost/try/ss/hrms/public/admin/employees/ajax_employees', '2021-10-31 05:57:37', '2021-10-31 05:57:37'),
(594, 1, 2, '127.0.0.1', 'admin.employees.index', 'http://localhost/try/ss/hrms/public/admin/employees', '2021-10-31 05:58:04', '2021-10-31 05:58:04'),
(595, 1, 2, '127.0.0.1', 'admin.ajax_employees', 'http://localhost/try/ss/hrms/public/admin/employees/ajax_employees', '2021-10-31 05:58:05', '2021-10-31 05:58:05'),
(596, 1, 2, '127.0.0.1', 'admin.screenlock.modal', 'http://localhost/try/ss/hrms/public/screenlock/modal', '2021-10-31 06:08:36', '2021-10-31 06:08:36'),
(597, 1, 2, '127.0.0.1', 'admin.screenlock.modal', 'http://localhost/try/ss/hrms/public/screenlock/modal', '2021-10-31 06:16:44', '2021-10-31 06:16:44'),
(598, 1, 2, '127.0.0.1', 'admin.screenlock.modal', 'http://localhost/try/ss/hrms/public/screenlock/modal', '2021-10-31 06:26:38', '2021-10-31 06:26:38'),
(599, 1, 2, '127.0.0.1', 'admin.screenlock.modal', 'http://localhost/try/ss/hrms/public/screenlock/modal', '2021-10-31 06:34:45', '2021-10-31 06:34:45'),
(600, 1, 2, '127.0.0.1', 'admin.screenlock.modal', 'http://localhost/try/ss/hrms/public/screenlock/modal', '2021-10-31 06:44:40', '2021-10-31 06:44:40'),
(601, 1, 2, '127.0.0.1', 'admin.screenlock.modal', 'http://localhost/try/ss/hrms/public/screenlock/modal', '2021-10-31 06:52:47', '2021-10-31 06:52:47'),
(602, 1, 2, '127.0.0.1', 'admin.screenlock.modal', 'http://localhost/try/ss/hrms/public/screenlock/modal', '2021-10-31 07:02:40', '2021-10-31 07:02:40'),
(603, 1, 2, '127.0.0.1', 'admin.screenlock.modal', 'http://localhost/try/ss/hrms/public/screenlock/modal', '2021-10-31 07:10:48', '2021-10-31 07:10:48'),
(604, 1, 2, '127.0.0.1', 'admin.screenlock.modal', 'http://localhost/try/ss/hrms/public/screenlock/modal', '2021-10-31 07:20:41', '2021-10-31 07:20:41'),
(605, 1, 2, '127.0.0.1', 'admin.screenlock.modal', 'http://localhost/try/ss/hrms/public/screenlock/modal', '2021-10-31 07:28:50', '2021-10-31 07:28:50'),
(606, 1, 2, '127.0.0.1', 'admin.screenlock.modal', 'http://localhost/try/ss/hrms/public/screenlock/modal', '2021-10-31 07:38:41', '2021-10-31 07:38:41'),
(607, 1, 2, '127.0.0.1', 'admin.login', 'http://localhost/try/ss/hrms/public/admin/login', '2021-10-31 07:45:15', '2021-10-31 07:45:15'),
(608, 1, 2, '127.0.0.1', 'admin.employees.edit', 'http://localhost/try/ss/hrms/public/admin/employees/1/edit', '2021-10-31 07:45:19', '2021-10-31 07:45:19'),
(609, 1, 2, '127.0.0.1', 'admin.departments.ajax_designation', 'http://localhost/try/ss/hrms/public/admin/departments/ajax_designation', '2021-10-31 07:45:20', '2021-10-31 07:45:20'),
(610, 1, 2, '127.0.0.1', 'admin.screenlock.modal', 'http://localhost/try/ss/hrms/public/screenlock/modal', '2021-10-31 07:56:42', '2021-10-31 07:56:42'),
(611, 1, 2, '127.0.0.1', 'admin.screen.lock', 'http://localhost/try/ss/hrms/public/screenlock', '2021-10-31 08:08:23', '2021-10-31 08:08:23'),
(612, 1, 2, '127.0.0.1', 'admin.getlogin', 'http://localhost/try/ss/hrms/public/admin', '2021-10-31 08:08:23', '2021-10-31 08:08:23'),
(613, 1, 2, '127.0.0.1', 'admin.screen.lock', 'http://localhost/try/ss/hrms/public/screenlock', '2021-10-31 08:08:24', '2021-10-31 08:08:24'),
(614, 1, 2, '127.0.0.1', 'admin.login', 'http://localhost/try/ss/hrms/public/admin/login', '2021-10-31 08:08:28', '2021-10-31 08:08:28'),
(615, 1, 2, '127.0.0.1', 'admin.attendances.index', 'http://localhost/try/ss/hrms/public/admin/attendances', '2021-10-31 08:08:28', '2021-10-31 08:08:28'),
(616, 1, 2, '127.0.0.1', 'admin.attendance.filter', 'http://localhost/try/ss/hrms/public/admin/attendances/filter', '2021-10-31 08:08:29', '2021-10-31 08:08:29'),
(617, 1, 2, '127.0.0.1', 'admin.employees.index', 'http://localhost/try/ss/hrms/public/admin/employees', '2021-10-31 08:08:32', '2021-10-31 08:08:32'),
(618, 1, 2, '127.0.0.1', 'admin.ajax_employees', 'http://localhost/try/ss/hrms/public/admin/employees/ajax_employees', '2021-10-31 08:08:33', '2021-10-31 08:08:33'),
(619, 1, 2, '127.0.0.1', 'admin.attendances.create', 'http://localhost/try/ss/hrms/public/admin/attendances/create', '2021-10-31 08:08:35', '2021-10-31 08:08:35'),
(620, 1, 2, '127.0.0.1', 'admin.attendances.edit', 'http://localhost/try/ss/hrms/public/admin/attendances/2021-10-31/edit', '2021-10-31 08:08:36', '2021-10-31 08:08:36'),
(621, 1, 2, '127.0.0.1', 'admin.attendance.ajax_attendance', 'http://localhost/try/ss/hrms/public/admin/attendances/ajax_attendance', '2021-10-31 08:08:37', '2021-10-31 08:08:37'),
(622, 1, 2, '127.0.0.1', 'admin.attendance-roster.index', 'http://localhost/try/ss/hrms/public/admin/attendance-roster', '2021-10-31 08:08:43', '2021-10-31 08:08:43'),
(623, 1, 2, '127.0.0.1', 'admin.attendance-roster.filter', 'http://localhost/try/ss/hrms/public/admin/attendance-roster/filter', '2021-10-31 08:08:44', '2021-10-31 08:08:44'),
(624, 1, 2, '127.0.0.1', 'admin.attendances.create', 'http://localhost/try/ss/hrms/public/admin/attendances/create', '2021-10-31 08:10:50', '2021-10-31 08:10:50'),
(625, 1, 2, '127.0.0.1', 'admin.attendances.edit', 'http://localhost/try/ss/hrms/public/admin/attendances/2021-10-31/edit', '2021-10-31 08:10:51', '2021-10-31 08:10:51'),
(626, 1, 2, '127.0.0.1', 'admin.attendances.create', 'http://localhost/try/ss/hrms/public/admin/attendances/create', '2021-10-31 08:10:52', '2021-10-31 08:10:52'),
(627, 1, 2, '127.0.0.1', 'admin.attendances.edit', 'http://localhost/try/ss/hrms/public/admin/attendances/2021-10-31/edit', '2021-10-31 08:10:52', '2021-10-31 08:10:52'),
(628, 1, 2, '127.0.0.1', 'admin.attendances.edit', 'http://localhost/try/ss/hrms/public/admin/attendances/2021-10-31/edit', '2021-10-31 08:12:18', '2021-10-31 08:12:18'),
(629, 1, 2, '127.0.0.1', 'admin.attendances.edit', 'http://localhost/try/ss/hrms/public/admin/attendances/2021-10-31/edit', '2021-10-31 08:12:37', '2021-10-31 08:12:37'),
(630, 1, 2, '127.0.0.1', 'admin.attendance.ajax_attendance', 'http://localhost/try/ss/hrms/public/admin/attendances/ajax_attendance', '2021-10-31 08:12:39', '2021-10-31 08:12:39'),
(631, 1, 2, '127.0.0.1', 'admin.attendance-roster.index', 'http://localhost/try/ss/hrms/public/admin/attendance-roster', '2021-10-31 08:12:45', '2021-10-31 08:12:45'),
(632, 1, 2, '127.0.0.1', 'admin.attendance-roster.filter', 'http://localhost/try/ss/hrms/public/admin/attendance-roster/filter', '2021-10-31 08:12:46', '2021-10-31 08:12:46'),
(633, 1, 2, '127.0.0.1', 'admin.employees.index', 'http://localhost/try/ss/hrms/public/admin/employees', '2021-10-31 08:12:59', '2021-10-31 08:12:59'),
(634, 1, 2, '127.0.0.1', 'admin.ajax_employees', 'http://localhost/try/ss/hrms/public/admin/employees/ajax_employees', '2021-10-31 08:13:00', '2021-10-31 08:13:00'),
(635, 1, 2, '127.0.0.1', 'admin.getlogin', 'http://localhost/try/ss/hrms/public/admin', '2021-10-31 08:14:21', '2021-10-31 08:14:21'),
(636, 1, 2, '127.0.0.1', 'admin.dashboard.index', 'http://localhost/try/ss/hrms/public/admin/dashboard', '2021-10-31 08:14:21', '2021-10-31 08:14:21'),
(637, 1, 2, '127.0.0.1', 'admin.attendance.ajax_load_calender', 'http://localhost/try/ss/hrms/public/admin/attendances/ajax_load_calender', '2021-10-31 08:14:23', '2021-10-31 08:14:23'),
(638, 1, 2, '127.0.0.1', 'admin.screenlock.modal', 'http://localhost/try/ss/hrms/public/screenlock/modal', '2021-10-31 08:14:42', '2021-10-31 08:14:42'),
(639, 1, 2, '127.0.0.1', 'admin.screen.lock', 'http://localhost/try/ss/hrms/public/screenlock', '2021-10-31 08:18:57', '2021-10-31 08:18:57'),
(640, 1, 2, '127.0.0.1', 'admin.getlogin', 'http://localhost/try/ss/hrms/public/admin', '2021-10-31 08:18:57', '2021-10-31 08:18:57'),
(641, 1, 2, '127.0.0.1', 'admin.screen.lock', 'http://localhost/try/ss/hrms/public/screenlock', '2021-10-31 08:18:57', '2021-10-31 08:18:57'),
(642, 1, 2, '127.0.0.1', 'admin.login', 'http://localhost/try/ss/hrms/public/admin/login', '2021-10-31 08:19:01', '2021-10-31 08:19:01'),
(643, 1, 2, '127.0.0.1', 'admin.attendances.index', 'http://localhost/try/ss/hrms/public/admin/attendances', '2021-10-31 08:19:02', '2021-10-31 08:19:02'),
(644, 1, 2, '127.0.0.1', 'admin.attendance.filter', 'http://localhost/try/ss/hrms/public/admin/attendances/filter', '2021-10-31 08:19:03', '2021-10-31 08:19:03'),
(645, 1, 2, '127.0.0.1', 'admin.employees.index', 'http://localhost/try/ss/hrms/public/admin/employees', '2021-10-31 08:19:15', '2021-10-31 08:19:15'),
(646, 1, 2, '127.0.0.1', 'admin.ajax_employees', 'http://localhost/try/ss/hrms/public/admin/employees/ajax_employees', '2021-10-31 08:19:15', '2021-10-31 08:19:15'),
(647, 1, 2, '127.0.0.1', 'admin.employees.index', 'http://localhost/try/ss/hrms/public/admin/employees', '2021-10-31 08:20:01', '2021-10-31 08:20:01'),
(648, 1, 2, '127.0.0.1', 'admin.ajax_employees', 'http://localhost/try/ss/hrms/public/admin/employees/ajax_employees', '2021-10-31 08:20:02', '2021-10-31 08:20:02'),
(649, 1, 2, '127.0.0.1', 'admin.employees.index', 'http://localhost/try/ss/hrms/public/admin/employees', '2021-10-31 08:20:14', '2021-10-31 08:20:14'),
(650, 1, 2, '127.0.0.1', 'admin.ajax_employees', 'http://localhost/try/ss/hrms/public/admin/employees/ajax_employees', '2021-10-31 08:20:15', '2021-10-31 08:20:15'),
(651, 1, 2, '127.0.0.1', 'admin.employees.index', 'http://localhost/try/ss/hrms/public/admin/employees', '2021-10-31 08:24:34', '2021-10-31 08:24:34'),
(652, 1, 2, '127.0.0.1', 'admin.employees.index', 'http://localhost/try/ss/hrms/public/admin/employees', '2021-10-31 08:24:35', '2021-10-31 08:24:35'),
(653, 1, 2, '127.0.0.1', 'admin.attendance.filter', 'http://localhost/try/ss/hrms/public/admin/attendances/filter', '2021-10-31 08:24:47', '2021-10-31 08:24:47'),
(654, 1, 2, '127.0.0.1', 'admin.attendances.index', 'http://localhost/try/ss/hrms/public/admin/attendances', '2021-10-31 08:24:48', '2021-10-31 08:24:48'),
(655, 1, 2, '127.0.0.1', 'admin.attendances.index', 'http://localhost/try/ss/hrms/public/admin/attendances', '2021-10-31 08:24:58', '2021-10-31 08:24:58'),
(656, 1, 2, '127.0.0.1', 'admin.attendance.filter', 'http://localhost/try/ss/hrms/public/admin/attendances/filter', '2021-10-31 08:24:58', '2021-10-31 08:24:58'),
(657, 1, 2, '127.0.0.1', 'admin.employees.all_employees', 'http://localhost/try/ss/hrms/public/admin/employees/allemployees', '2021-10-31 08:25:01', '2021-10-31 08:25:01'),
(658, 1, 2, '127.0.0.1', 'admin.ajax_all_employees', 'http://localhost/try/ss/hrms/public/admin/employees/ajax_all_employees', '2021-10-31 08:25:01', '2021-10-31 08:25:01'),
(659, 1, 2, '127.0.0.1', 'admin.employees.all_employees', 'http://localhost/try/ss/hrms/public/admin/employees/allemployees', '2021-10-31 08:25:17', '2021-10-31 08:25:17'),
(660, 1, 2, '127.0.0.1', 'admin.ajax_all_employees', 'http://localhost/try/ss/hrms/public/admin/employees/ajax_all_employees', '2021-10-31 08:25:18', '2021-10-31 08:25:18'),
(661, 1, 2, '127.0.0.1', 'admin.attendances.index', 'http://localhost/try/ss/hrms/public/admin/attendances', '2021-10-31 08:25:30', '2021-10-31 08:25:30'),
(662, 1, 2, '127.0.0.1', 'admin.attendance.filter', 'http://localhost/try/ss/hrms/public/admin/attendances/filter', '2021-10-31 08:25:31', '2021-10-31 08:25:31'),
(663, 1, 2, '127.0.0.1', 'admin.getlogin', 'http://localhost/try/ss/hrms/public/admin', '2021-10-31 08:25:32', '2021-10-31 08:25:32'),
(664, 1, 2, '127.0.0.1', 'admin.dashboard.index', 'http://localhost/try/ss/hrms/public/admin/dashboard', '2021-10-31 08:25:33', '2021-10-31 08:25:33'),
(665, 1, 2, '127.0.0.1', 'admin.attendance.ajax_load_calender', 'http://localhost/try/ss/hrms/public/admin/attendances/ajax_load_calender', '2021-10-31 08:25:33', '2021-10-31 08:25:33'),
(666, 1, 2, '127.0.0.1', 'admin.employees.all_employees', 'http://localhost/try/ss/hrms/public/admin/employees/allemployees', '2021-10-31 08:31:48', '2021-10-31 08:31:48'),
(667, 1, 2, '127.0.0.1', 'admin.ajax_all_employees', 'http://localhost/try/ss/hrms/public/admin/employees/ajax_all_employees', '2021-10-31 08:31:49', '2021-10-31 08:31:49'),
(668, 1, 2, '127.0.0.1', 'admin.dashboard.index', 'http://localhost/try/ss/hrms/public/admin/dashboard', '2021-10-31 08:35:41', '2021-10-31 08:35:41'),
(669, 1, 2, '127.0.0.1', 'admin.getlogin', 'http://localhost/try/ss/hrms/public/admin', '2021-10-31 08:35:41', '2021-10-31 08:35:41'),
(670, 1, 2, '127.0.0.1', 'admin.attendance.ajax_load_calender', 'http://localhost/try/ss/hrms/public/admin/attendances/ajax_load_calender', '2021-10-31 08:35:57', '2021-10-31 08:35:57'),
(671, 1, 2, '127.0.0.1', 'admin.attendance.ajax_load_calender', 'http://localhost/try/ss/hrms/public/admin/attendances/ajax_load_calender', '2021-10-31 08:37:17', '2021-10-31 08:37:17'),
(672, 1, 2, '127.0.0.1', 'admin.employees.all_employees', 'http://localhost/try/ss/hrms/public/admin/employees/allemployees', '2021-10-31 08:41:56', '2021-10-31 08:41:56'),
(673, 1, 2, '127.0.0.1', 'admin.employees.all_employees', 'http://localhost/try/ss/hrms/public/admin/employees/allemployees', '2021-10-31 08:42:06', '2021-10-31 08:42:06'),
(674, 1, 2, '127.0.0.1', 'admin.ajax_all_employees', 'http://localhost/try/ss/hrms/public/admin/employees/ajax_all_employees', '2021-10-31 08:42:08', '2021-10-31 08:42:08'),
(675, 1, 2, '127.0.0.1', 'admin.employees.all_employees', 'http://localhost/try/ss/hrms/public/admin/employees/allemployees', '2021-10-31 08:42:23', '2021-10-31 08:42:23'),
(676, 1, 2, '127.0.0.1', 'admin.ajax_all_employees', 'http://localhost/try/ss/hrms/public/admin/employees/ajax_all_employees', '2021-10-31 08:42:24', '2021-10-31 08:42:24'),
(677, 1, 2, '127.0.0.1', 'admin.employees.all_employees', 'http://localhost/try/ss/hrms/public/admin/employees/allemployees', '2021-10-31 08:42:38', '2021-10-31 08:42:38'),
(678, 1, 2, '127.0.0.1', 'admin.ajax_all_employees', 'http://localhost/try/ss/hrms/public/admin/employees/ajax_all_employees', '2021-10-31 08:42:38', '2021-10-31 08:42:38'),
(679, 1, 2, '127.0.0.1', 'admin.employees.all_employees', 'http://localhost/try/ss/hrms/public/admin/employees/allemployees', '2021-10-31 08:44:51', '2021-10-31 08:44:51'),
(680, 1, 2, '127.0.0.1', 'admin.ajax_all_employees', 'http://localhost/try/ss/hrms/public/admin/employees/ajax_all_employees', '2021-10-31 08:44:52', '2021-10-31 08:44:52'),
(681, 1, 2, '127.0.0.1', 'admin.employees.all_employees', 'http://localhost/try/ss/hrms/public/admin/employees/allemployees', '2021-10-31 08:45:13', '2021-10-31 08:45:13'),
(682, 1, 2, '127.0.0.1', 'admin.ajax_all_employees', 'http://localhost/try/ss/hrms/public/admin/employees/ajax_all_employees', '2021-10-31 08:45:15', '2021-10-31 08:45:15'),
(683, 1, 2, '127.0.0.1', 'admin.employees.all_employees', 'http://localhost/try/ss/hrms/public/admin/employees/allemployees', '2021-10-31 08:45:22', '2021-10-31 08:45:22'),
(684, 1, 2, '127.0.0.1', 'admin.ajax_all_employees', 'http://localhost/try/ss/hrms/public/admin/employees/ajax_all_employees', '2021-10-31 08:45:22', '2021-10-31 08:45:22'),
(685, 1, 2, '127.0.0.1', 'admin.employees.all_employees', 'http://localhost/try/ss/hrms/public/admin/employees/allemployees', '2021-10-31 08:46:27', '2021-10-31 08:46:27'),
(686, 1, 2, '127.0.0.1', 'admin.ajax_all_employees', 'http://localhost/try/ss/hrms/public/admin/employees/ajax_all_employees', '2021-10-31 08:46:27', '2021-10-31 08:46:27'),
(687, 1, 2, '127.0.0.1', 'admin.employees.all_employees', 'http://localhost/try/ss/hrms/public/admin/employees/allemployees', '2021-10-31 08:47:12', '2021-10-31 08:47:12'),
(688, 1, 2, '127.0.0.1', 'admin.ajax_all_employees', 'http://localhost/try/ss/hrms/public/admin/employees/ajax_all_employees', '2021-10-31 08:47:13', '2021-10-31 08:47:13'),
(689, 1, 2, '127.0.0.1', 'admin.employees.all_employees', 'http://localhost/try/ss/hrms/public/admin/employees/allemployees', '2021-10-31 08:47:47', '2021-10-31 08:47:47'),
(690, 1, 2, '127.0.0.1', 'admin.ajax_all_employees', 'http://localhost/try/ss/hrms/public/admin/employees/ajax_all_employees', '2021-10-31 08:47:48', '2021-10-31 08:47:48'),
(691, 1, 2, '127.0.0.1', 'admin.employees.all_employees', 'http://localhost/try/ss/hrms/public/admin/employees/allemployees', '2021-10-31 08:48:18', '2021-10-31 08:48:18'),
(692, 1, 2, '127.0.0.1', 'admin.ajax_all_employees', 'http://localhost/try/ss/hrms/public/admin/employees/ajax_all_employees', '2021-10-31 08:48:20', '2021-10-31 08:48:20'),
(693, 1, 2, '127.0.0.1', 'admin.screenlock.modal', 'http://localhost/try/ss/hrms/public/screenlock/modal', '2021-10-31 08:54:50', '2021-10-31 08:54:50'),
(694, 1, 2, '127.0.0.1', 'admin.screenlock.modal', 'http://localhost/try/ss/hrms/public/screenlock/modal', '2021-10-31 09:09:23', '2021-10-31 09:09:23'),
(695, 1, 2, '127.0.0.1', 'admin.screenlock.modal', 'http://localhost/try/ss/hrms/public/screenlock/modal', '2021-10-31 09:12:52', '2021-10-31 09:12:52'),
(696, 1, 2, '127.0.0.1', 'admin.screenlock.modal', 'http://localhost/try/ss/hrms/public/screenlock/modal', '2021-10-31 09:27:25', '2021-10-31 09:27:25'),
(697, 1, 2, '127.0.0.1', 'admin.screenlock.modal', 'http://localhost/try/ss/hrms/public/screenlock/modal', '2021-10-31 09:30:54', '2021-10-31 09:30:54'),
(698, 1, 2, '127.0.0.1', 'admin.screenlock.modal', 'http://localhost/try/ss/hrms/public/screenlock/modal', '2021-10-31 09:45:26', '2021-10-31 09:45:26'),
(699, 1, 2, '127.0.0.1', 'admin.screenlock.modal', 'http://localhost/try/ss/hrms/public/screenlock/modal', '2021-10-31 09:48:55', '2021-10-31 09:48:55'),
(700, 1, 2, '127.0.0.1', 'admin.screenlock.modal', 'http://localhost/try/ss/hrms/public/screenlock/modal', '2021-10-31 10:03:28', '2021-10-31 10:03:28'),
(701, 1, 2, '127.0.0.1', 'admin.screenlock.modal', 'http://localhost/try/ss/hrms/public/screenlock/modal', '2021-10-31 10:06:56', '2021-10-31 10:06:56'),
(702, 1, 2, '127.0.0.1', 'admin.screenlock.modal', 'http://localhost/try/ss/hrms/public/screenlock/modal', '2021-10-31 10:21:29', '2021-10-31 10:21:29'),
(703, 1, 2, '127.0.0.1', 'admin.screenlock.modal', 'http://localhost/try/ss/hrms/public/screenlock/modal', '2021-10-31 10:24:57', '2021-10-31 10:24:57'),
(704, 1, 2, '127.0.0.1', 'admin.dashboard.index', 'http://localhost/try/ss/hrms/public/admin/dashboard', '2021-11-01 01:27:04', '2021-11-01 01:27:04'),
(705, 1, 2, '127.0.0.1', 'admin.attendance.ajax_load_calender', 'http://localhost/try/ss/hrms/public/admin/attendances/ajax_load_calender', '2021-11-01 01:27:11', '2021-11-01 01:27:11'),
(706, 1, 2, '127.0.0.1', 'admin.employees.all_employees', 'http://localhost/try/ss/hrms/public/admin/employees/allemployees', '2021-11-01 01:27:23', '2021-11-01 01:27:23'),
(707, 1, 2, '127.0.0.1', 'admin.ajax_all_employees', 'http://localhost/try/ss/hrms/public/admin/employees/ajax_all_employees', '2021-11-01 01:27:24', '2021-11-01 01:27:24'),
(708, 1, 2, '127.0.0.1', 'admin.employees.all_employees', 'http://localhost/try/ss/hrms/public/admin/employees/allemployees', '2021-11-01 01:28:27', '2021-11-01 01:28:27'),
(709, 1, 2, '127.0.0.1', 'admin.ajax_all_employees', 'http://localhost/try/ss/hrms/public/admin/employees/ajax_all_employees', '2021-11-01 01:28:28', '2021-11-01 01:28:28'),
(710, 1, 2, '127.0.0.1', 'admin.employees.all_employees', 'http://localhost/try/ss/hrms/public/admin/employees/allemployees', '2021-11-01 01:28:45', '2021-11-01 01:28:45'),
(711, 1, 2, '127.0.0.1', 'admin.ajax_all_employees', 'http://localhost/try/ss/hrms/public/admin/employees/ajax_all_employees', '2021-11-01 01:28:46', '2021-11-01 01:28:46'),
(712, 1, 2, '127.0.0.1', 'admin.employees.all_employees', 'http://localhost/try/ss/hrms/public/admin/employees/allemployees', '2021-11-01 01:29:17', '2021-11-01 01:29:17'),
(713, 1, 2, '127.0.0.1', 'admin.ajax_all_employees', 'http://localhost/try/ss/hrms/public/admin/employees/ajax_all_employees', '2021-11-01 01:29:18', '2021-11-01 01:29:18'),
(714, 1, 2, '127.0.0.1', 'admin.employees.index', 'http://localhost/try/ss/hrms/public/admin/employees', '2021-11-01 01:29:41', '2021-11-01 01:29:41'),
(715, 1, 2, '127.0.0.1', 'admin.ajax_employees', 'http://localhost/try/ss/hrms/public/admin/employees/ajax_employees', '2021-11-01 01:29:42', '2021-11-01 01:29:42'),
(716, 1, 2, '127.0.0.1', 'admin.employees.edit', 'http://localhost/try/ss/hrms/public/admin/employees/1/edit', '2021-11-01 01:29:45', '2021-11-01 01:29:45'),
(717, 1, 2, '127.0.0.1', 'admin.departments.ajax_designation', 'http://localhost/try/ss/hrms/public/admin/departments/ajax_designation', '2021-11-01 01:29:46', '2021-11-01 01:29:46'),
(718, 1, 2, '127.0.0.1', 'admin.screenlock.modal', 'http://localhost/try/ss/hrms/public/screenlock/modal', '2021-11-01 01:48:48', '2021-11-01 01:48:48'),
(719, 1, 2, '127.0.0.1', 'admin.screenlock.modal', 'http://localhost/try/ss/hrms/public/screenlock/modal', '2021-11-01 02:06:43', '2021-11-01 02:06:43'),
(720, 1, 2, '127.0.0.1', 'admin.screenlock.modal', 'http://localhost/try/ss/hrms/public/screenlock/modal', '2021-11-01 02:24:43', '2021-11-01 02:24:43'),
(721, 1, 2, '127.0.0.1', 'admin.screenlock.modal', 'http://localhost/try/ss/hrms/public/screenlock/modal', '2021-11-01 02:42:43', '2021-11-01 02:42:43'),
(722, 1, 2, '127.0.0.1', 'admin.screenlock.modal', 'http://localhost/try/ss/hrms/public/screenlock/modal', '2021-11-01 03:00:43', '2021-11-01 03:00:43'),
(723, 1, 2, '127.0.0.1', 'admin.screenlock.modal', 'http://localhost/try/ss/hrms/public/screenlock/modal', '2021-11-01 03:18:43', '2021-11-01 03:18:43'),
(724, 1, 2, '127.0.0.1', 'admin.screenlock.modal', 'http://localhost/try/ss/hrms/public/screenlock/modal', '2021-11-01 03:36:43', '2021-11-01 03:36:43'),
(725, 1, 2, '127.0.0.1', 'admin.dashboard.index', 'http://localhost/try/ss/hrms/public/admin/dashboard', '2021-11-01 05:06:27', '2021-11-01 05:06:27'),
(726, 1, 2, '127.0.0.1', 'admin.attendance.ajax_load_calender', 'http://localhost/try/ss/hrms/public/admin/attendances/ajax_load_calender', '2021-11-01 05:06:32', '2021-11-01 05:06:32'),
(727, 1, 2, '127.0.0.1', 'admin.employees.index', 'http://localhost/try/ss/hrms/public/admin/employees', '2021-11-01 05:08:16', '2021-11-01 05:08:16'),
(728, 1, 2, '127.0.0.1', 'admin.ajax_employees', 'http://localhost/try/ss/hrms/public/admin/employees/ajax_employees', '2021-11-01 05:08:17', '2021-11-01 05:08:17'),
(729, 1, 2, '127.0.0.1', 'admin.employees.create', 'http://localhost/try/ss/hrms/public/admin/employees/create', '2021-11-01 05:08:18', '2021-11-01 05:08:18'),
(730, 1, 2, '127.0.0.1', 'admin.departments.ajax_designation', 'http://localhost/try/ss/hrms/public/admin/departments/ajax_designation', '2021-11-01 05:08:20', '2021-11-01 05:08:20'),
(731, 1, 2, '127.0.0.1', 'admin.employees.index', 'http://localhost/try/ss/hrms/public/admin/employees', '2021-11-01 05:11:35', '2021-11-01 05:11:35'),
(732, 1, 2, '127.0.0.1', 'admin.ajax_employees', 'http://localhost/try/ss/hrms/public/admin/employees/ajax_employees', '2021-11-01 05:11:35', '2021-11-01 05:11:35'),
(733, 1, 2, '127.0.0.1', 'admin.attendances.create', 'http://localhost/try/ss/hrms/public/admin/attendances/create', '2021-11-01 05:14:11', '2021-11-01 05:14:11'),
(734, 1, 2, '127.0.0.1', 'admin.attendances.edit', 'http://localhost/try/ss/hrms/public/admin/attendances/2021-11-01/edit', '2021-11-01 05:14:12', '2021-11-01 05:14:12'),
(735, 1, 2, '127.0.0.1', 'admin.attendance.ajax_attendance', 'http://localhost/try/ss/hrms/public/admin/attendances/ajax_attendance', '2021-11-01 05:14:13', '2021-11-01 05:14:13'),
(736, 1, 2, '127.0.0.1', 'admin.attendances.index', 'http://localhost/try/ss/hrms/public/admin/attendances', '2021-11-01 05:14:17', '2021-11-01 05:14:17'),
(737, 1, 2, '127.0.0.1', 'admin.attendance.filter', 'http://localhost/try/ss/hrms/public/admin/attendances/filter', '2021-11-01 05:14:18', '2021-11-01 05:14:18'),
(738, 1, 2, '127.0.0.1', 'admin.attendance.filter', 'http://localhost/try/ss/hrms/public/admin/attendances/filter', '2021-11-01 05:14:32', '2021-11-01 05:14:32'),
(739, 1, 2, '127.0.0.1', 'admin.attendance-roster.index', 'http://localhost/try/ss/hrms/public/admin/attendance-roster', '2021-11-01 05:14:58', '2021-11-01 05:14:58'),
(740, 1, 2, '127.0.0.1', 'admin.attendance-roster.filter', 'http://localhost/try/ss/hrms/public/admin/attendance-roster/filter', '2021-11-01 05:14:59', '2021-11-01 05:14:59'),
(741, 1, 2, '127.0.0.1', 'admin.attendance-roster.filter', 'http://localhost/try/ss/hrms/public/admin/attendance-roster/filter', '2021-11-01 05:15:16', '2021-11-01 05:15:16'),
(742, 1, 2, '127.0.0.1', 'admin.attendance-roster.filter', 'http://localhost/try/ss/hrms/public/admin/attendance-roster/filter', '2021-11-01 05:15:29', '2021-11-01 05:15:29'),
(743, 1, 2, '127.0.0.1', 'admin.employees.index', 'http://localhost/try/ss/hrms/public/admin/employees', '2021-11-01 05:18:23', '2021-11-01 05:18:23'),
(744, 1, 2, '127.0.0.1', 'admin.ajax_employees', 'http://localhost/try/ss/hrms/public/admin/employees/ajax_employees', '2021-11-01 05:18:24', '2021-11-01 05:18:24'),
(745, 1, 2, '127.0.0.1', 'admin.employees.all_employees', 'http://localhost/try/ss/hrms/public/admin/employees/allemployees', '2021-11-01 05:18:42', '2021-11-01 05:18:42'),
(746, 1, 2, '127.0.0.1', 'admin.ajax_all_employees', 'http://localhost/try/ss/hrms/public/admin/employees/ajax_all_employees', '2021-11-01 05:18:43', '2021-11-01 05:18:43'),
(747, 1, 2, '127.0.0.1', 'admin.employees.edit', 'http://localhost/try/ss/hrms/public/admin/employees/1/edit', '2021-11-01 05:19:22', '2021-11-01 05:19:22'),
(748, 1, 2, '127.0.0.1', 'admin.departments.ajax_designation', 'http://localhost/try/ss/hrms/public/admin/departments/ajax_designation', '2021-11-01 05:19:23', '2021-11-01 05:19:23'),
(749, 1, 2, '127.0.0.1', 'admin.employees.all_employees', 'http://localhost/try/ss/hrms/public/admin/employees/allemployees', '2021-11-01 05:19:37', '2021-11-01 05:19:37'),
(750, 1, 2, '127.0.0.1', 'admin.ajax_all_employees', 'http://localhost/try/ss/hrms/public/admin/employees/ajax_all_employees', '2021-11-01 05:19:37', '2021-11-01 05:19:37'),
(751, 1, 2, '127.0.0.1', 'admin.dashboard.index', 'http://localhost/try/ss/hrms/public/admin/dashboard', '2021-11-01 05:35:39', '2021-11-01 05:35:39'),
(752, 1, 2, '127.0.0.1', 'admin.attendance.ajax_load_calender', 'http://localhost/try/ss/hrms/public/admin/attendances/ajax_load_calender', '2021-11-01 05:35:43', '2021-11-01 05:35:43'),
(753, 1, 2, '127.0.0.1', 'admin.noticeboards.index', 'http://localhost/try/ss/hrms/public/admin/noticeboards', '2021-11-01 05:35:59', '2021-11-01 05:35:59'),
(754, 1, 2, '127.0.0.1', 'admin.ajax_notices', 'http://localhost/try/ss/hrms/public/admin/ajax_notices', '2021-11-01 05:36:00', '2021-11-01 05:36:00'),
(755, 1, 2, '127.0.0.1', 'admin.noticeboards.create', 'http://localhost/try/ss/hrms/public/admin/noticeboards/create', '2021-11-01 05:36:02', '2021-11-01 05:36:02'),
(756, 1, 2, '127.0.0.1', 'admin.employees.index', 'http://localhost/try/ss/hrms/public/admin/employees', '2021-11-01 05:36:51', '2021-11-01 05:36:51'),
(757, 1, 2, '127.0.0.1', 'admin.ajax_employees', 'http://localhost/try/ss/hrms/public/admin/employees/ajax_employees', '2021-11-01 05:36:52', '2021-11-01 05:36:52'),
(758, 1, 2, '127.0.0.1', 'admin.noticeboards.index', 'http://localhost/try/ss/hrms/public/admin/noticeboards', '2021-11-01 05:42:24', '2021-11-01 05:42:24'),
(759, 1, 2, '127.0.0.1', 'admin.ajax_notices', 'http://localhost/try/ss/hrms/public/admin/ajax_notices', '2021-11-01 05:42:25', '2021-11-01 05:42:25'),
(760, 1, 2, '127.0.0.1', 'admin.noticeboards.create', 'http://localhost/try/ss/hrms/public/admin/noticeboards/create', '2021-11-01 05:42:25', '2021-11-01 05:42:25'),
(761, 1, 2, '127.0.0.1', 'admin.employees.all_employees', 'http://localhost/try/ss/hrms/public/admin/employees/allemployees', '2021-11-01 05:45:15', '2021-11-01 05:45:15'),
(762, 1, 2, '127.0.0.1', 'admin.ajax_all_employees', 'http://localhost/try/ss/hrms/public/admin/employees/ajax_all_employees', '2021-11-01 05:45:16', '2021-11-01 05:45:16'),
(763, 1, 2, '127.0.0.1', 'admin.screenlock.modal', 'http://localhost/try/ss/hrms/public/screenlock/modal', '2021-11-01 06:03:55', '2021-11-01 06:03:55');

-- --------------------------------------------------------

--
-- Table structure for table `companies`
--

CREATE TABLE `companies` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `subscription_plan_id` int(10) UNSIGNED DEFAULT NULL,
  `package_type` enum('monthly','annual') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'monthly',
  `email` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `logo` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'default.png',
  `address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `contact` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `currency` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'USD',
  `currency_symbol` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT '$',
  `timezone` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT '+00:00=29',
  `award_notification` tinyint(1) NOT NULL DEFAULT 1,
  `attendance_notification` tinyint(1) NOT NULL DEFAULT 1,
  `leave_notification` tinyint(1) NOT NULL DEFAULT 1,
  `notice_notification` tinyint(1) NOT NULL DEFAULT 1,
  `payroll_notification` tinyint(1) NOT NULL DEFAULT 1,
  `expense_notification` tinyint(1) NOT NULL DEFAULT 1,
  `employee_add` tinyint(1) NOT NULL DEFAULT 1,
  `job_notification` tinyint(1) NOT NULL DEFAULT 1,
  `admin_add` tinyint(1) NOT NULL DEFAULT 1,
  `admin_theme` varchar(191) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'darkblue',
  `front_theme` varchar(191) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'dark-blue',
  `locale` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'en',
  `active` tinyint(1) NOT NULL,
  `award_feature` tinyint(1) NOT NULL DEFAULT 1,
  `attendance_feature` tinyint(1) NOT NULL DEFAULT 1,
  `leave_feature` tinyint(1) NOT NULL DEFAULT 1,
  `notice_feature` tinyint(1) NOT NULL DEFAULT 1,
  `payroll_feature` tinyint(1) NOT NULL DEFAULT 1,
  `expense_feature` tinyint(1) NOT NULL DEFAULT 1,
  `holidays_feature` tinyint(1) NOT NULL DEFAULT 1,
  `jobs_feature` tinyint(1) NOT NULL DEFAULT 1,
  `status` enum('active','inactive','license_expired') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `country` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `referral_code` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mark_attendance` tinyint(1) NOT NULL DEFAULT 1,
  `office_start_time` time DEFAULT '00:00:00',
  `office_end_time` time DEFAULT '00:00:00',
  `attendance_setting_set` tinyint(1) NOT NULL DEFAULT 0,
  `late_mark_after` int(11) DEFAULT NULL,
  `billing_address` varchar(1000) COLLATE utf8_unicode_ci NOT NULL,
  `license_expired` tinyint(1) NOT NULL DEFAULT 0,
  `stripe_id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `card_brand` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `card_last_four` varchar(4) COLLATE utf8_unicode_ci DEFAULT NULL,
  `trial_ends_at` timestamp NULL DEFAULT NULL,
  `licence_expire_on` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `companies`
--

INSERT INTO `companies` (`id`, `company_name`, `subscription_plan_id`, `package_type`, `email`, `name`, `logo`, `address`, `contact`, `currency`, `currency_symbol`, `timezone`, `award_notification`, `attendance_notification`, `leave_notification`, `notice_notification`, `payroll_notification`, `expense_notification`, `employee_add`, `job_notification`, `admin_add`, `admin_theme`, `front_theme`, `locale`, `active`, `award_feature`, `attendance_feature`, `leave_feature`, `notice_feature`, `payroll_feature`, `expense_feature`, `holidays_feature`, `jobs_feature`, `status`, `created_at`, `updated_at`, `deleted_at`, `country`, `referral_code`, `mark_attendance`, `office_start_time`, `office_end_time`, `attendance_setting_set`, `late_mark_after`, `billing_address`, `license_expired`, `stripe_id`, `card_brand`, `card_last_four`, `trial_ends_at`, `licence_expire_on`) VALUES
(1, 'GT', 1, 'monthly', 'sgt@s.com', 'sathishgt', 'default.png', 'dasasdsa', '23424234', 'INR', '₹', '+05:30=251', 0, 0, 0, 0, 0, 0, 0, 1, 1, 'darkblue', 'dark-blue', 'en', 0, 1, 1, 1, 1, 1, 1, 1, 1, 'active', '2021-09-27 11:01:11', '2021-09-27 11:13:06', NULL, 'India', NULL, 1, '03:30:00', '12:30:00', 1, NULL, 'asdadsa', 0, NULL, NULL, NULL, NULL, NULL),
(2, 'GT', 1, 'monthly', 'gt@gt.com', 'GT', '8b35744d1445a8c3491a007210ea73fe.jpg', 'asda', '234242', 'INR', '₹', '+05:30=251', 0, 0, 0, 0, 0, 0, 0, 1, 1, 'darkblue', 'dark-blue', 'en', 0, 1, 1, 1, 1, 1, 1, 1, 1, 'active', '2021-09-27 23:53:42', '2021-09-28 00:05:45', NULL, 'India', NULL, 1, '12:00:00', '21:00:00', 1, NULL, 'asdadas', 0, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `contact_requests`
--

CREATE TABLE `contact_requests` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(70) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `category` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `details` varchar(1000) COLLATE utf8_unicode_ci NOT NULL,
  `status` enum('Pending','Completed') COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

CREATE TABLE `countries` (
  `id_countries` int(3) UNSIGNED NOT NULL,
  `name` varchar(200) DEFAULT NULL,
  `iso_alpha2` varchar(2) DEFAULT NULL,
  `iso_alpha3` varchar(3) DEFAULT NULL,
  `iso_numeric` int(11) DEFAULT NULL,
  `currency_code` char(3) DEFAULT NULL,
  `currency_name` varchar(32) DEFAULT NULL,
  `currency_symbol` varchar(3) DEFAULT NULL,
  `flag` varchar(6) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `countries`
--

INSERT INTO `countries` (`id_countries`, `name`, `iso_alpha2`, `iso_alpha3`, `iso_numeric`, `currency_code`, `currency_name`, `currency_symbol`, `flag`) VALUES
(1, 'Afghanistan', 'AF', 'AFG', 4, 'AFN', 'Afghani', '؋', 'AF.png'),
(2, 'Albania', 'AL', 'ALB', 8, 'ALL', 'Lek', 'Lek', 'AL.png'),
(3, 'Algeria', 'DZ', 'DZA', 12, 'DZD', 'Dinar', NULL, 'DZ.png'),
(4, 'American Samoa', 'AS', 'ASM', 16, 'USD', 'Dollar', '$', 'AS.png'),
(5, 'Andorra', 'AD', 'AND', 20, 'EUR', 'Euro', '€', 'AD.png'),
(6, 'Angola', 'AO', 'AGO', 24, 'AOA', 'Kwanza', 'Kz', 'AO.png'),
(7, 'Anguilla', 'AI', 'AIA', 660, 'XCD', 'Dollar', '$', 'AI.png'),
(8, 'Antarctica', 'AQ', 'ATA', 10, '', '', NULL, 'AQ.png'),
(9, 'Antigua and Barbuda', 'AG', 'ATG', 28, 'XCD', 'Dollar', '$', 'AG.png'),
(10, 'Argentina', 'AR', 'ARG', 32, 'ARS', 'Peso', '$', 'AR.png'),
(11, 'Armenia', 'AM', 'ARM', 51, 'AMD', 'Dram', NULL, 'AM.png'),
(12, 'Aruba', 'AW', 'ABW', 533, 'AWG', 'Guilder', 'ƒ', 'AW.png'),
(13, 'Australia', 'AU', 'AUS', 36, 'AUD', 'Dollar', '$', 'AU.png'),
(14, 'Austria', 'AT', 'AUT', 40, 'EUR', 'Euro', '€', 'AT.png'),
(15, 'Azerbaijan', 'AZ', 'AZE', 31, 'AZN', 'Manat', 'ман', 'AZ.png'),
(16, 'Bahamas', 'BS', 'BHS', 44, 'BSD', 'Dollar', '$', 'BS.png'),
(17, 'Bahrain', 'BH', 'BHR', 48, 'BHD', 'Dinar', NULL, 'BH.png'),
(18, 'Bangladesh', 'BD', 'BGD', 50, 'BDT', 'Taka', NULL, 'BD.png'),
(19, 'Barbados', 'BB', 'BRB', 52, 'BBD', 'Dollar', '$', 'BB.png'),
(20, 'Belarus', 'BY', 'BLR', 112, 'BYR', 'Ruble', 'p.', 'BY.png'),
(21, 'Belgium', 'BE', 'BEL', 56, 'EUR', 'Euro', '€', 'BE.png'),
(22, 'Belize', 'BZ', 'BLZ', 84, 'BZD', 'Dollar', 'BZ$', 'BZ.png'),
(23, 'Benin', 'BJ', 'BEN', 204, 'XOF', 'Franc', NULL, 'BJ.png'),
(24, 'Bermuda', 'BM', 'BMU', 60, 'BMD', 'Dollar', '$', 'BM.png'),
(25, 'Bhutan', 'BT', 'BTN', 64, 'BTN', 'Ngultrum', NULL, 'BT.png'),
(26, 'Bolivia', 'BO', 'BOL', 68, 'BOB', 'Boliviano', '$b', 'BO.png'),
(27, 'Bosnia and Herzegovina', 'BA', 'BIH', 70, 'BAM', 'Marka', 'KM', 'BA.png'),
(28, 'Botswana', 'BW', 'BWA', 72, 'BWP', 'Pula', 'P', 'BW.png'),
(29, 'Bouvet Island', 'BV', 'BVT', 74, 'NOK', 'Krone', 'kr', 'BV.png'),
(30, 'Brazil', 'BR', 'BRA', 76, 'BRL', 'Real', 'R$', 'BR.png'),
(31, 'British Indian Ocean Territory', 'IO', 'IOT', 86, 'USD', 'Dollar', '$', 'IO.png'),
(32, 'British Virgin Islands', 'VG', 'VGB', 92, 'USD', 'Dollar', '$', 'VG.png'),
(33, 'Brunei', 'BN', 'BRN', 96, 'BND', 'Dollar', '$', 'BN.png'),
(34, 'Bulgaria', 'BG', 'BGR', 100, 'BGN', 'Lev', 'лв', 'BG.png'),
(35, 'Burkina Faso', 'BF', 'BFA', 854, 'XOF', 'Franc', NULL, 'BF.png'),
(36, 'Burundi', 'BI', 'BDI', 108, 'BIF', 'Franc', NULL, 'BI.png'),
(37, 'Cambodia', 'KH', 'KHM', 116, 'KHR', 'Riels', '៛', 'KH.png'),
(38, 'Cameroon', 'CM', 'CMR', 120, 'XAF', 'Franc', 'FCF', 'CM.png'),
(39, 'Canada', 'CA', 'CAN', 124, 'CAD', 'Dollar', '$', 'CA.png'),
(40, 'Cape Verde', 'CV', 'CPV', 132, 'CVE', 'Escudo', NULL, 'CV.png'),
(41, 'Cayman Islands', 'KY', 'CYM', 136, 'KYD', 'Dollar', '$', 'KY.png'),
(42, 'Central African Republic', 'CF', 'CAF', 140, 'XAF', 'Franc', 'FCF', 'CF.png'),
(43, 'Chad', 'TD', 'TCD', 148, 'XAF', 'Franc', NULL, 'TD.png'),
(44, 'Chile', 'CL', 'CHL', 152, 'CLP', 'Peso', NULL, 'CL.png'),
(45, 'China', 'CN', 'CHN', 156, 'CNY', 'Yuan Renminbi', '¥', 'CN.png'),
(46, 'Christmas Island', 'CX', 'CXR', 162, 'AUD', 'Dollar', '$', 'CX.png'),
(47, 'Cocos Islands', 'CC', 'CCK', 166, 'AUD', 'Dollar', '$', 'CC.png'),
(48, 'Colombia', 'CO', 'COL', 170, 'COP', 'Peso', '$', 'CO.png'),
(49, 'Comoros', 'KM', 'COM', 174, 'KMF', 'Franc', NULL, 'KM.png'),
(50, 'Cook Islands', 'CK', 'COK', 184, 'NZD', 'Dollar', '$', 'CK.png'),
(51, 'Costa Rica', 'CR', 'CRI', 188, 'CRC', 'Colon', '₡', 'CR.png'),
(52, 'Croatia', 'HR', 'HRV', 191, 'HRK', 'Kuna', 'kn', 'HR.png'),
(53, 'Cuba', 'CU', 'CUB', 192, 'CUP', 'Peso', '₱', 'CU.png'),
(54, 'Cyprus', 'CY', 'CYP', 196, 'CYP', 'Pound', NULL, 'CY.png'),
(55, 'Czech Republic', 'CZ', 'CZE', 203, 'CZK', 'Koruna', 'Kč', 'CZ.png'),
(56, 'Democratic Republic of the Congo', 'CD', 'COD', 180, 'CDF', 'Franc', NULL, 'CD.png'),
(57, 'Denmark', 'DK', 'DNK', 208, 'DKK', 'Krone', 'kr', 'DK.png'),
(58, 'Djibouti', 'DJ', 'DJI', 262, 'DJF', 'Franc', NULL, 'DJ.png'),
(59, 'Dominica', 'DM', 'DMA', 212, 'XCD', 'Dollar', '$', 'DM.png'),
(60, 'Dominican Republic', 'DO', 'DOM', 214, 'DOP', 'Peso', 'RD$', 'DO.png'),
(61, 'East Timor', 'TL', 'TLS', 626, 'USD', 'Dollar', '$', 'TL.png'),
(62, 'Ecuador', 'EC', 'ECU', 218, 'USD', 'Dollar', '$', 'EC.png'),
(63, 'Egypt', 'EG', 'EGY', 818, 'EGP', 'Pound', '£', 'EG.png'),
(64, 'El Salvador', 'SV', 'SLV', 222, 'SVC', 'Colone', '$', 'SV.png'),
(65, 'Equatorial Guinea', 'GQ', 'GNQ', 226, 'XAF', 'Franc', 'FCF', 'GQ.png'),
(66, 'Eritrea', 'ER', 'ERI', 232, 'ERN', 'Nakfa', 'Nfk', 'ER.png'),
(67, 'Estonia', 'EE', 'EST', 233, 'EEK', 'Kroon', 'kr', 'EE.png'),
(68, 'Ethiopia', 'ET', 'ETH', 231, 'ETB', 'Birr', NULL, 'ET.png'),
(69, 'Falkland Islands', 'FK', 'FLK', 238, 'FKP', 'Pound', '£', 'FK.png'),
(70, 'Faroe Islands', 'FO', 'FRO', 234, 'DKK', 'Krone', 'kr', 'FO.png'),
(71, 'Fiji', 'FJ', 'FJI', 242, 'FJD', 'Dollar', '$', 'FJ.png'),
(72, 'Finland', 'FI', 'FIN', 246, 'EUR', 'Euro', '€', 'FI.png'),
(73, 'France', 'FR', 'FRA', 250, 'EUR', 'Euro', '€', 'FR.png'),
(74, 'French Guiana', 'GF', 'GUF', 254, 'EUR', 'Euro', '€', 'GF.png'),
(75, 'French Polynesia', 'PF', 'PYF', 258, 'XPF', 'Franc', NULL, 'PF.png'),
(76, 'French Southern Territories', 'TF', 'ATF', 260, 'EUR', 'Euro  ', '€', 'TF.png'),
(77, 'Gabon', 'GA', 'GAB', 266, 'XAF', 'Franc', 'FCF', 'GA.png'),
(78, 'Gambia', 'GM', 'GMB', 270, 'GMD', 'Dalasi', 'D', 'GM.png'),
(79, 'Georgia', 'GE', 'GEO', 268, 'GEL', 'Lari', NULL, 'GE.png'),
(80, 'Germany', 'DE', 'DEU', 276, 'EUR', 'Euro', '€', 'DE.png'),
(81, 'Ghana', 'GH', 'GHA', 288, 'GHC', 'Cedi', '¢', 'GH.png'),
(82, 'Gibraltar', 'GI', 'GIB', 292, 'GIP', 'Pound', '£', 'GI.png'),
(83, 'Greece', 'GR', 'GRC', 300, 'EUR', 'Euro', '€', 'GR.png'),
(84, 'Greenland', 'GL', 'GRL', 304, 'DKK', 'Krone', 'kr', 'GL.png'),
(85, 'Grenada', 'GD', 'GRD', 308, 'XCD', 'Dollar', '$', 'GD.png'),
(86, 'Guadeloupe', 'GP', 'GLP', 312, 'EUR', 'Euro', '€', 'GP.png'),
(87, 'Guam', 'GU', 'GUM', 316, 'USD', 'Dollar', '$', 'GU.png'),
(88, 'Guatemala', 'GT', 'GTM', 320, 'GTQ', 'Quetzal', 'Q', 'GT.png'),
(89, 'Guinea', 'GN', 'GIN', 324, 'GNF', 'Franc', NULL, 'GN.png'),
(90, 'Guinea-Bissau', 'GW', 'GNB', 624, 'XOF', 'Franc', NULL, 'GW.png'),
(91, 'Guyana', 'GY', 'GUY', 328, 'GYD', 'Dollar', '$', 'GY.png'),
(92, 'Haiti', 'HT', 'HTI', 332, 'HTG', 'Gourde', 'G', 'HT.png'),
(93, 'Heard Island and McDonald Islands', 'HM', 'HMD', 334, 'AUD', 'Dollar', '$', 'HM.png'),
(94, 'Honduras', 'HN', 'HND', 340, 'HNL', 'Lempira', 'L', 'HN.png'),
(95, 'Hong Kong', 'HK', 'HKG', 344, 'HKD', 'Dollar', '$', 'HK.png'),
(96, 'Hungary', 'HU', 'HUN', 348, 'HUF', 'Forint', 'Ft', 'HU.png'),
(97, 'Iceland', 'IS', 'ISL', 352, 'ISK', 'Krona', 'kr', 'IS.png'),
(98, 'India', 'IN', 'IND', 356, 'INR', 'Rupee', '₹', 'IN.png'),
(99, 'Indonesia', 'ID', 'IDN', 360, 'IDR', 'Rupiah', 'Rp', 'ID.png'),
(100, 'Iran', 'IR', 'IRN', 364, 'IRR', 'Rial', '﷼', 'IR.png'),
(101, 'Iraq', 'IQ', 'IRQ', 368, 'IQD', 'Dinar', NULL, 'IQ.png'),
(102, 'Ireland', 'IE', 'IRL', 372, 'EUR', 'Euro', '€', 'IE.png'),
(103, 'Israel', 'IL', 'ISR', 376, 'ILS', 'Shekel', '₪', 'IL.png'),
(104, 'Italy', 'IT', 'ITA', 380, 'EUR', 'Euro', '€', 'IT.png'),
(105, 'Ivory Coast', 'CI', 'CIV', 384, 'XOF', 'Franc', NULL, 'CI.png'),
(106, 'Jamaica', 'JM', 'JAM', 388, 'JMD', 'Dollar', '$', 'JM.png'),
(107, 'Japan', 'JP', 'JPN', 392, 'JPY', 'Yen', '¥', 'JP.png'),
(108, 'Jordan', 'JO', 'JOR', 400, 'JOD', 'Dinar', NULL, 'JO.png'),
(109, 'Kazakhstan', 'KZ', 'KAZ', 398, 'KZT', 'Tenge', 'лв', 'KZ.png'),
(110, 'Kenya', 'KE', 'KEN', 404, 'KES', 'Shilling', NULL, 'KE.png'),
(111, 'Kiribati', 'KI', 'KIR', 296, 'AUD', 'Dollar', '$', 'KI.png'),
(112, 'Kuwait', 'KW', 'KWT', 414, 'KWD', 'Dinar', NULL, 'KW.png'),
(113, 'Kyrgyzstan', 'KG', 'KGZ', 417, 'KGS', 'Som', 'лв', 'KG.png'),
(114, 'Laos', 'LA', 'LAO', 418, 'LAK', 'Kip', '₭', 'LA.png'),
(115, 'Latvia', 'LV', 'LVA', 428, 'LVL', 'Lat', 'Ls', 'LV.png'),
(116, 'Lebanon', 'LB', 'LBN', 422, 'LBP', 'Pound', '£', 'LB.png'),
(117, 'Lesotho', 'LS', 'LSO', 426, 'LSL', 'Loti', 'L', 'LS.png'),
(118, 'Liberia', 'LR', 'LBR', 430, 'LRD', 'Dollar', '$', 'LR.png'),
(119, 'Libya', 'LY', 'LBY', 434, 'LYD', 'Dinar', NULL, 'LY.png'),
(120, 'Liechtenstein', 'LI', 'LIE', 438, 'CHF', 'Franc', 'CHF', 'LI.png'),
(121, 'Lithuania', 'LT', 'LTU', 440, 'LTL', 'Litas', 'Lt', 'LT.png'),
(122, 'Luxembourg', 'LU', 'LUX', 442, 'EUR', 'Euro', '€', 'LU.png'),
(123, 'Macao', 'MO', 'MAC', 446, 'MOP', 'Pataca', 'MOP', 'MO.png'),
(124, 'Macedonia', 'MK', 'MKD', 807, 'MKD', 'Denar', 'ден', 'MK.png'),
(125, 'Madagascar', 'MG', 'MDG', 450, 'MGA', 'Ariary', NULL, 'MG.png'),
(126, 'Malawi', 'MW', 'MWI', 454, 'MWK', 'Kwacha', 'MK', 'MW.png'),
(127, 'Malaysia', 'MY', 'MYS', 458, 'MYR', 'Ringgit', 'RM', 'MY.png'),
(128, 'Maldives', 'MV', 'MDV', 462, 'MVR', 'Rufiyaa', 'Rf', 'MV.png'),
(129, 'Mali', 'ML', 'MLI', 466, 'XOF', 'Franc', NULL, 'ML.png'),
(130, 'Malta', 'MT', 'MLT', 470, 'MTL', 'Lira', NULL, 'MT.png'),
(131, 'Marshall Islands', 'MH', 'MHL', 584, 'USD', 'Dollar', '$', 'MH.png'),
(132, 'Martinique', 'MQ', 'MTQ', 474, 'EUR', 'Euro', '€', 'MQ.png'),
(133, 'Mauritania', 'MR', 'MRT', 478, 'MRO', 'Ouguiya', 'UM', 'MR.png'),
(134, 'Mauritius', 'MU', 'MUS', 480, 'MUR', 'Rupee', '₨', 'MU.png'),
(135, 'Mayotte', 'YT', 'MYT', 175, 'EUR', 'Euro', '€', 'YT.png'),
(136, 'Mexico', 'MX', 'MEX', 484, 'MXN', 'Peso', '$', 'MX.png'),
(137, 'Micronesia', 'FM', 'FSM', 583, 'USD', 'Dollar', '$', 'FM.png'),
(138, 'Moldova', 'MD', 'MDA', 498, 'MDL', 'Leu', NULL, 'MD.png'),
(139, 'Monaco', 'MC', 'MCO', 492, 'EUR', 'Euro', '€', 'MC.png'),
(140, 'Mongolia', 'MN', 'MNG', 496, 'MNT', 'Tugrik', '₮', 'MN.png'),
(141, 'Montserrat', 'MS', 'MSR', 500, 'XCD', 'Dollar', '$', 'MS.png'),
(142, 'Morocco', 'MA', 'MAR', 504, 'MAD', 'Dirham', NULL, 'MA.png'),
(143, 'Mozambique', 'MZ', 'MOZ', 508, 'MZN', 'Meticail', 'MT', 'MZ.png'),
(144, 'Myanmar', 'MM', 'MMR', 104, 'MMK', 'Kyat', 'K', 'MM.png'),
(145, 'Namibia', 'NA', 'NAM', 516, 'NAD', 'Dollar', '$', 'NA.png'),
(146, 'Nauru', 'NR', 'NRU', 520, 'AUD', 'Dollar', '$', 'NR.png'),
(147, 'Nepal', 'NP', 'NPL', 524, 'NPR', 'Rupee', '₨', 'NP.png'),
(148, 'Netherlands', 'NL', 'NLD', 528, 'EUR', 'Euro', '€', 'NL.png'),
(149, 'Netherlands Antilles', 'AN', 'ANT', 530, 'ANG', 'Guilder', 'ƒ', 'AN.png'),
(150, 'New Caledonia', 'NC', 'NCL', 540, 'XPF', 'Franc', NULL, 'NC.png'),
(151, 'New Zealand', 'NZ', 'NZL', 554, 'NZD', 'Dollar', '$', 'NZ.png'),
(152, 'Nicaragua', 'NI', 'NIC', 558, 'NIO', 'Cordoba', 'C$', 'NI.png'),
(153, 'Niger', 'NE', 'NER', 562, 'XOF', 'Franc', NULL, 'NE.png'),
(154, 'Nigeria', 'NG', 'NGA', 566, 'NGN', 'Naira', '₦', 'NG.png'),
(155, 'Niue', 'NU', 'NIU', 570, 'NZD', 'Dollar', '$', 'NU.png'),
(156, 'Norfolk Island', 'NF', 'NFK', 574, 'AUD', 'Dollar', '$', 'NF.png'),
(157, 'North Korea', 'KP', 'PRK', 408, 'KPW', 'Won', '₩', 'KP.png'),
(158, 'Northern Mariana Islands', 'MP', 'MNP', 580, 'USD', 'Dollar', '$', 'MP.png'),
(159, 'Norway', 'NO', 'NOR', 578, 'NOK', 'Krone', 'kr', 'NO.png'),
(160, 'Oman', 'OM', 'OMN', 512, 'OMR', 'Rial', '﷼', 'OM.png'),
(161, 'Pakistan', 'PK', 'PAK', 586, 'PKR', 'Rupee', '₨', 'PK.png'),
(162, 'Palau', 'PW', 'PLW', 585, 'USD', 'Dollar', '$', 'PW.png'),
(163, 'Palestinian Territory', 'PS', 'PSE', 275, 'ILS', 'Shekel', '₪', 'PS.png'),
(164, 'Panama', 'PA', 'PAN', 591, 'PAB', 'Balboa', 'B/.', 'PA.png'),
(165, 'Papua New Guinea', 'PG', 'PNG', 598, 'PGK', 'Kina', NULL, 'PG.png'),
(166, 'Paraguay', 'PY', 'PRY', 600, 'PYG', 'Guarani', 'Gs', 'PY.png'),
(167, 'Peru', 'PE', 'PER', 604, 'PEN', 'Sol', 'S/.', 'PE.png'),
(168, 'Philippines', 'PH', 'PHL', 608, 'PHP', 'Peso', 'Php', 'PH.png'),
(169, 'Pitcairn', 'PN', 'PCN', 612, 'NZD', 'Dollar', '$', 'PN.png'),
(170, 'Poland', 'PL', 'POL', 616, 'PLN', 'Zloty', 'zł', 'PL.png'),
(171, 'Portugal', 'PT', 'PRT', 620, 'EUR', 'Euro', '€', 'PT.png'),
(172, 'Puerto Rico', 'PR', 'PRI', 630, 'USD', 'Dollar', '$', 'PR.png'),
(173, 'Qatar', 'QA', 'QAT', 634, 'QAR', 'Rial', '﷼', 'QA.png'),
(174, 'Republic of the Congo', 'CG', 'COG', 178, 'XAF', 'Franc', 'FCF', 'CG.png'),
(175, 'Reunion', 'RE', 'REU', 638, 'EUR', 'Euro', '€', 'RE.png'),
(176, 'Romania', 'RO', 'ROU', 642, 'RON', 'Leu', 'lei', 'RO.png'),
(177, 'Russia', 'RU', 'RUS', 643, 'RUB', 'Ruble', 'руб', 'RU.png'),
(178, 'Rwanda', 'RW', 'RWA', 646, 'RWF', 'Franc', NULL, 'RW.png'),
(179, 'Saint Helena', 'SH', 'SHN', 654, 'SHP', 'Pound', '£', 'SH.png'),
(180, 'Saint Kitts and Nevis', 'KN', 'KNA', 659, 'XCD', 'Dollar', '$', 'KN.png'),
(181, 'Saint Lucia', 'LC', 'LCA', 662, 'XCD', 'Dollar', '$', 'LC.png'),
(182, 'Saint Pierre and Miquelon', 'PM', 'SPM', 666, 'EUR', 'Euro', '€', 'PM.png'),
(183, 'Saint Vincent and the Grenadines', 'VC', 'VCT', 670, 'XCD', 'Dollar', '$', 'VC.png'),
(184, 'Samoa', 'WS', 'WSM', 882, 'WST', 'Tala', 'WS$', 'WS.png'),
(185, 'San Marino', 'SM', 'SMR', 674, 'EUR', 'Euro', '€', 'SM.png'),
(186, 'Sao Tome and Principe', 'ST', 'STP', 678, 'STD', 'Dobra', 'Db', 'ST.png'),
(187, 'Saudi Arabia', 'SA', 'SAU', 682, 'SAR', 'Rial', '﷼', 'SA.png'),
(188, 'Senegal', 'SN', 'SEN', 686, 'XOF', 'Franc', NULL, 'SN.png'),
(189, 'Serbia and Montenegro', 'CS', 'SCG', 891, 'RSD', 'Dinar', 'Дин', 'CS.png'),
(190, 'Seychelles', 'SC', 'SYC', 690, 'SCR', 'Rupee', '₨', 'SC.png'),
(191, 'Sierra Leone', 'SL', 'SLE', 694, 'SLL', 'Leone', 'Le', 'SL.png'),
(192, 'Singapore', 'SG', 'SGP', 702, 'SGD', 'Dollar', '$', 'SG.png'),
(193, 'Slovakia', 'SK', 'SVK', 703, 'SKK', 'Koruna', 'Sk', 'SK.png'),
(194, 'Slovenia', 'SI', 'SVN', 705, 'EUR', 'Euro', '€', 'SI.png'),
(195, 'Solomon Islands', 'SB', 'SLB', 90, 'SBD', 'Dollar', '$', 'SB.png'),
(196, 'Somalia', 'SO', 'SOM', 706, 'SOS', 'Shilling', 'S', 'SO.png'),
(197, 'South Africa', 'ZA', 'ZAF', 710, 'ZAR', 'Rand', 'R', 'ZA.png'),
(198, 'South Georgia and the South Sandwich Islands', 'GS', 'SGS', 239, 'GBP', 'Pound', '£', 'GS.png'),
(199, 'South Korea', 'KR', 'KOR', 410, 'KRW', 'Won', '₩', 'KR.png'),
(200, 'Spain', 'ES', 'ESP', 724, 'EUR', 'Euro', '€', 'ES.png'),
(201, 'Sri Lanka', 'LK', 'LKA', 144, 'LKR', 'Rupee', '₨', 'LK.png'),
(202, 'Sudan', 'SD', 'SDN', 736, 'SDD', 'Dinar', NULL, 'SD.png'),
(203, 'Suriname', 'SR', 'SUR', 740, 'SRD', 'Dollar', '$', 'SR.png'),
(204, 'Svalbard and Jan Mayen', 'SJ', 'SJM', 744, 'NOK', 'Krone', 'kr', 'SJ.png'),
(205, 'Swaziland', 'SZ', 'SWZ', 748, 'SZL', 'Lilangeni', NULL, 'SZ.png'),
(206, 'Sweden', 'SE', 'SWE', 752, 'SEK', 'Krona', 'kr', 'SE.png'),
(207, 'Switzerland', 'CH', 'CHE', 756, 'CHF', 'Franc', 'CHF', 'CH.png'),
(208, 'Syria', 'SY', 'SYR', 760, 'SYP', 'Pound', '£', 'SY.png'),
(209, 'Taiwan', 'TW', 'TWN', 158, 'TWD', 'Dollar', 'NT$', 'TW.png'),
(210, 'Tajikistan', 'TJ', 'TJK', 762, 'TJS', 'Somoni', NULL, 'TJ.png'),
(211, 'Tanzania', 'TZ', 'TZA', 834, 'TZS', 'Shilling', NULL, 'TZ.png'),
(212, 'Thailand', 'TH', 'THA', 764, 'THB', 'Baht', '฿', 'TH.png'),
(213, 'Togo', 'TG', 'TGO', 768, 'XOF', 'Franc', NULL, 'TG.png'),
(214, 'Tokelau', 'TK', 'TKL', 772, 'NZD', 'Dollar', '$', 'TK.png'),
(215, 'Tonga', 'TO', 'TON', 776, 'TOP', 'Pa\"anga', 'T$', 'TO.png'),
(216, 'Trinidad and Tobago', 'TT', 'TTO', 780, 'TTD', 'Dollar', 'TT$', 'TT.png'),
(217, 'Tunisia', 'TN', 'TUN', 788, 'TND', 'Dinar', NULL, 'TN.png'),
(218, 'Turkey', 'TR', 'TUR', 792, 'TRY', 'Lira', 'YTL', 'TR.png'),
(219, 'Turkmenistan', 'TM', 'TKM', 795, 'TMM', 'Manat', 'm', 'TM.png'),
(220, 'Turks and Caicos Islands', 'TC', 'TCA', 796, 'USD', 'Dollar', '$', 'TC.png'),
(221, 'Tuvalu', 'TV', 'TUV', 798, 'AUD', 'Dollar', '$', 'TV.png'),
(222, 'U.S. Virgin Islands', 'VI', 'VIR', 850, 'USD', 'Dollar', '$', 'VI.png'),
(223, 'Uganda', 'UG', 'UGA', 800, 'UGX', 'Shilling', NULL, 'UG.png'),
(224, 'Ukraine', 'UA', 'UKR', 804, 'UAH', 'Hryvnia', '₴', 'UA.png'),
(225, 'United Arab Emirates', 'AE', 'ARE', 784, 'AED', 'Dirham', NULL, 'AE.png'),
(226, 'United Kingdom', 'GB', 'GBR', 826, 'GBP', 'Pound', '£', 'GB.png'),
(227, 'United States', 'US', 'USA', 840, 'USD', 'Dollar', '$', 'US.png'),
(228, 'United States Minor Outlying Islands', 'UM', 'UMI', 581, 'USD', 'Dollar ', '$', 'UM.png'),
(229, 'Uruguay', 'UY', 'URY', 858, 'UYU', 'Peso', '$U', 'UY.png'),
(230, 'Uzbekistan', 'UZ', 'UZB', 860, 'UZS', 'Som', 'лв', 'UZ.png'),
(231, 'Vanuatu', 'VU', 'VUT', 548, 'VUV', 'Vatu', 'Vt', 'VU.png'),
(232, 'Vatican', 'VA', 'VAT', 336, 'EUR', 'Euro', '€', 'VA.png'),
(233, 'Venezuela', 'VE', 'VEN', 862, 'VEF', 'Bolivar', 'Bs', 'VE.png'),
(234, 'Vietnam', 'VN', 'VNM', 704, 'VND', 'Dong', '₫', 'VN.png'),
(235, 'Wallis and Futuna', 'WF', 'WLF', 876, 'XPF', 'Franc', NULL, 'WF.png'),
(236, 'Western Sahara', 'EH', 'ESH', 732, 'MAD', 'Dirham', NULL, 'EH.png'),
(237, 'Yemen', 'YE', 'YEM', 887, 'YER', 'Rial', '﷼', 'YE.png'),
(238, 'Zambia', 'ZM', 'ZMB', 894, 'ZMK', 'Kwacha', 'ZK', 'ZM.png'),
(239, 'Zimbabwe', 'ZW', 'ZWE', 716, 'ZWD', 'Dollar', 'Z$', 'ZW.png');

-- --------------------------------------------------------

--
-- Table structure for table `database_backups`
--

CREATE TABLE `database_backups` (
  `id` int(10) UNSIGNED NOT NULL,
  `filename` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE `department` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `name` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`id`, `company_id`, `name`, `created_at`, `updated_at`) VALUES
(1, 1, 'IT', '2021-09-27 11:03:26', '2021-09-27 11:03:26'),
(2, 2, 'IT', '2021-09-27 23:54:25', '2021-09-27 23:54:25');

-- --------------------------------------------------------

--
-- Table structure for table `department_manager`
--

CREATE TABLE `department_manager` (
  `id` int(10) UNSIGNED NOT NULL,
  `department_id` int(10) UNSIGNED NOT NULL,
  `manager_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `designation`
--

CREATE TABLE `designation` (
  `id` int(10) UNSIGNED NOT NULL,
  `department_id` int(10) UNSIGNED NOT NULL,
  `designation` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `designation`
--

INSERT INTO `designation` (`id`, `department_id`, `designation`, `created_at`, `updated_at`) VALUES
(1, 1, 'SE', '2021-09-27 11:03:26', '2021-09-27 11:03:26'),
(2, 1, 'SSE', '2021-09-27 11:03:26', '2021-09-27 11:03:26'),
(3, 1, 'APM', '2021-09-27 11:03:26', '2021-09-27 11:03:26'),
(4, 1, 'PM', '2021-09-27 11:03:27', '2021-09-27 11:03:27'),
(5, 2, 'SE', '2021-09-27 23:54:25', '2021-09-27 23:54:25'),
(6, 2, 'SSE', '2021-09-27 23:54:25', '2021-09-27 23:54:25'),
(7, 2, 'PM', '2021-09-27 23:54:25', '2021-09-27 23:54:25');

-- --------------------------------------------------------

--
-- Table structure for table `email_templates`
--

CREATE TABLE `email_templates` (
  `id` int(10) UNSIGNED NOT NULL,
  `email_id` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `subject` text COLLATE utf8_unicode_ci NOT NULL,
  `body` text COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `email_templates`
--

INSERT INTO `email_templates` (`id`, `email_id`, `subject`, `body`, `created_at`, `updated_at`) VALUES
(1, 'INVOICE_ONE_DAY_LEFT_NOTICE', '1 Day left for License Expired', 'Hi,<br/>\r\n                            <br/>\r\n                            \r\n                            Only 1 day is left for your license to get expired.\r\n                            Pay the invoice to continue using our services.<br/>\r\n                            <br/>\r\n                            An invoice is pending in your on HRM account. Details are as follows:<br/>\r\n                            <b>Product:</b> ##PRODUCT##<br/>\r\n                            <b>Invoice Number:</b> ##INVOICE_NUMBER##<br/>\r\n                            <b>Amount:</b> ##AMOUNT##<br/>\r\n                            <b>Date Generated:</b> ##DATE_GENERATED##<br/>\r\n                            <b>Due Date:</b> ##DUE_DATE##<br/>\r\n                            <br/>\r\n                            <br/>', '2021-09-27 10:58:52', '2021-09-27 10:58:52'),
(2, 'LICENSE_EXPIRED', 'License Expired', 'Hi,<br/>\r\n                            <br/>\r\n                            Your HRM license is expired due to non-payment of invoice. To pay now go to you account and pay. Details are as follows:<br/>\r\n                            <br/>\r\n                            <b>Product:</b> ##PRODUCT##<br/>\r\n                            <b>Invoice Number:</b> ##INVOICE_NUMBER##<br/>\r\n                            <b>Amount:</b> ##AMOUNT##<br/>\r\n                            <b>Date Generated:</b> ##DATE_GENERATED##<br/>\r\n                            <b>Due Date:</b> ##DUE_DATE##<br/>\r\n                            <br/>\r\n                            <br/><br/>', '2021-09-27 10:58:52', '2021-09-27 10:58:52'),
(3, 'NEW_INVOICE_GENERATED', 'New invoice has been generated', 'Hi,<br/>\r\n                            <br/>\r\n                            \r\n                            Invoice has been generated<br/>\r\n                            <br/>\r\n                            Details are as follows:<br/>\r\n                            <br>\r\n                            <b>Product:</b> ##PRODUCT##<br/>\r\n                            <b>Invoice Number:</b> ##INVOICE_NUMBER##<br/>\r\n                            <b>Amount:</b> ##AMOUNT##<br/>\r\n                            <b>Date Generated:</b> ##DATE_GENERATED##<br/>\r\n                            <b>Due Date:</b> ##DUE_DATE##<br/>\r\n                            <br/>\r\n                            <br/>', '2021-09-27 10:59:20', '2021-09-27 10:59:20'),
(4, 'NEW_ADMIN', 'New admin added', '\r\n		 	Hi!\r\n\r\n		    <b>##NAME## </b><br> Your account is created successfully on ##COMPANY_NAME##<br /><br/>\r\n		    <p>Login Details are Below</p>\r\n\r\n		    <p><strong>Email</strong>:  ##EMAIL##</p>\r\n		    <p><strong>Password</strong>: ##PASSWORD##</p>\r\n		    <br />\r\n		    <br />\r\n   		 <hr>', '2021-09-27 10:59:27', '2021-09-27 10:59:27'),
(5, 'NEW_ADMIN_EMAIL_VERIFICATION', 'Email Verification - hrm.com', '\r\n		 	Hi!\r\n		   <b>##NAME## </b><br><br>\r\n		      Please Verify your Email.Click the below link or copy paste on browser to verify your email<br>\r\n		    ##VERIFY_LINK##<br/>\r\n		    <br />\r\n   		 <hr>', '2021-09-27 10:59:27', '2021-09-27 10:59:27'),
(6, 'ATTENDANCE_MARKED', 'Attendance Marked', 'Hi\r\n\r\n		<b>##NAME##</b><br /><br/>\r\n    Your attendance dated <strong>##DATE##</strong>  has been marked.\r\n    <br /><br />\r\n		', '2021-09-27 10:59:27', '2021-09-27 10:59:27'),
(7, 'AWARD', 'Award', 'Hi\r\n		<b>##NAME##</b><br /><br/>\r\n   You have been awarded with <strong>##AWARD##</strong>.\r\n    <br /><br />\r\n		', '2021-09-27 10:59:27', '2021-09-27 10:59:27'),
(8, 'EMPLOYEE_ADD', 'Login Credentials', 'Hi\r\n		<b>##NAME## </b><br> You account is created successfully on ##COMPANY_NAME##<br /><br/>\r\n		    <p>Login Details are Below</p>\r\n		    <strong>Email</strong>:  ##EMAIL##\r\n		    <strong>Password</strong>: ##PASSWORD##\r\n\r\n		', '2021-09-27 10:59:27', '2021-09-27 10:59:27'),
(9, 'EXPENSE_APPROVAL', 'Expense Status', 'Hi\r\n		<br /><br/>\r\n        Your expense is ##STATUS## ON ##DATE##\r\n    	<br /><br />\r\n		', '2021-09-27 10:59:27', '2021-09-27 10:59:27'),
(10, 'LEAVE_APPROVAL', 'Leave Status', 'Hi\r\n		<br /><br/>\r\n        	Your leave request of date <strong>##DATE##</strong> has been <strong>##STATUS##</strong>\r\n    	<br /><br />\r\n		', '2021-09-27 10:59:27', '2021-09-27 10:59:27'),
(11, 'NEW_COMPANY_REQUEST_TO_ADMIN', 'Company Request', 'Hi\r\n			    <br>\r\n			    <br>\r\n			    Your company  <b>##COMPANY_NAME##</b> is registered with ##STATUS## status.Please wait for the Administator approval before you login\r\n			    <br>\r\n				', '2021-09-27 10:59:27', '2021-09-27 10:59:27'),
(12, 'NEW_COMPANY_NOTIFICATION_SUPERADMIN', 'New company request', 'Hi\r\n		    <br>\r\n		    <br>\r\n		       <b>##COMPANY_NAME##</b> is registered with ##STATUS## status.Go Admin panel see the details and approve it\r\n		    <br>\r\n			', '2021-09-27 10:59:27', '2021-09-27 10:59:27'),
(13, 'NEW_NOTICE', 'New Notice published', 'Hi!\r\n\r\n    <b> ##NAME## </b>\r\n    	<br /><br/>\r\n		    New Notice Published.Click ##LINK## to Visit the dashboard\r\n	    <br /><br />\r\n		', '2021-09-27 10:59:28', '2021-09-27 10:59:28'),
(14, 'NEW_PAYSLIP', 'Payslip generated', 'Hi!\r\n\r\n		    <b>##NAME## </b><br /><br/>\r\n		    Your payslip generated for the month <strong>##MONTH_YEAR## <strong>\r\n\r\n		    <br /><br />\r\n		', '2021-09-27 10:59:28', '2021-09-27 10:59:28'),
(15, 'ADMIN_RESET_PASSWORD', 'Reset Password', 'Hi!\r\n\r\n		 <b>##NAME## </b>\r\n    	<br /><br/>\r\n	   			 To reset your password, complete this form: ##CODE_LINK##<br/>\r\n\r\n	    <br /><br />\r\n		', '2021-09-27 10:59:28', '2021-09-27 10:59:28'),
(16, 'FRONT_RESET_PASSWORD', 'Reset Password', 'Hi!\r\n\r\n		 <b>##NAME## </b>\r\n    	<br /><br/>\r\n	   			 To reset your password, complete this form: ##CODE_LINK##.<br/>\r\n\r\n	    <br /><br />\r\n		', '2021-09-27 10:59:28', '2021-09-27 10:59:28'),
(17, 'RESET_PASSWORD_SUCCESS', 'Reset Password Success', 'Hi!\r\n\r\n		 <b>##NAME## </b>\r\n    	<br /><br/>\r\n	   			Your password is successfully reset.\r\n\r\n	    <br /><br />\r\n		', '2021-09-27 10:59:28', '2021-09-27 10:59:28'),
(18, 'CHANGE_PASSWORD_EMPLOYEE', 'Password Reset', 'Hi!\r\n\r\n		 <b>##NAME## </b>\r\n    	<br /><br/>\r\n	   			Your password is successfully reset.\r\n\r\n	    <br /><br />\r\n		', '2021-09-27 10:59:28', '2021-09-27 10:59:28'),
(19, 'EXPENSE_CLAIM', 'Expense Claim request', 'Hi!\r\n\r\n		<b>##NAME##</b> your expense claim is submitted<br /><br/>\r\n\r\n		    <p><b>Item Name:</b>##ITEM_NAME##</p>\r\n		    <p><b>Purchase From:</b>##PURCHASE_FROM##</p>\r\n		    <p><b>Purchase Date:</b>##PURCHASE_DATE##</p>\r\n		    <p><b>Purchase Price:</b>  ##PRICE##</p>\r\n		    <br />\r\n		    <br />\r\n		', '2021-09-27 10:59:28', '2021-09-27 10:59:28'),
(20, 'JOB_APPLICATION_REQUEST', 'New job application submitted', 'Hi!\r\n\r\n		  <b>##NAME##</b> has submitted the job application<br /><br/>\r\n\r\n    <p><b>Position:</b>##POSITION##</p>\r\n    <p><b>Name:</b>    ##NAME##</p>\r\n    <p><b>Email:</b>   ##EMAIL##</p>\r\n    <p><b>Phone:</b>  ##PHONE##</p>\r\n    <p><b>Cover Letter:</b> ##COVER_LETTER##</p>\r\n\r\n    <br />\r\n    	Click resume  to view resume: ##LINK##</a>\r\n    <br />\r\n    <br />\r\n\r\n		', '2021-09-27 10:59:28', '2021-09-27 10:59:28');

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

CREATE TABLE `employees` (
  `id` int(10) UNSIGNED NOT NULL,
  `employeeID` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `company_id` int(10) UNSIGNED NOT NULL,
  `full_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `gender` enum('male','female') COLLATE utf8_unicode_ci NOT NULL,
  `father_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mobile_number` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `designation` int(10) UNSIGNED DEFAULT NULL,
  `joining_date` date DEFAULT NULL,
  `profile_image` varchar(191) COLLATE utf8_unicode_ci DEFAULT 'default.jpg',
  `local_address` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `permanent_address` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `annual_leave` int(11) NOT NULL DEFAULT 0,
  `status` enum('active','inactive') COLLATE utf8_unicode_ci NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `exit_date` date DEFAULT NULL,
  `reset_code` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `employees`
--

INSERT INTO `employees` (`id`, `employeeID`, `company_id`, `full_name`, `email`, `password`, `gender`, `father_name`, `mobile_number`, `date_of_birth`, `designation`, `joining_date`, `profile_image`, `local_address`, `permanent_address`, `annual_leave`, `status`, `last_login`, `remember_token`, `exit_date`, `reset_code`, `created_at`, `updated_at`) VALUES
(1, '001', 1, 'Sathish Emp', 'sa@s.com', '$2y$10$2bN0ID1EpyOrZNOop4biMeSolKixgHRVkzit79kXfxWEbcsXr.jIG', 'male', 'S', '1234', '1988-12-25', 1, '2019-01-01', 'c4328f891f7cf4143fd9673a4ebacf1d.jpg', NULL, NULL, 0, 'active', NULL, NULL, NULL, NULL, '2021-09-27 11:05:12', '2021-09-27 11:05:13'),
(2, '001', 2, 'Sathish', 'sathish@s.com', '$2y$10$4PEKJPr.MlJQ8FI8d.jD/eI4uPaO8RoyRxqa19y9z06HfgCBt6X12', 'male', 'S', '1123213', '1980-01-29', 5, '2021-04-01', '8e9784b77b527886e901eef1f62884f5.jpg', 'asdsa', 'dasd', 0, 'active', NULL, NULL, NULL, NULL, '2021-09-27 23:55:45', '2021-09-27 23:55:45'),
(3, '002', 1, 'Varun', 'va@sa.com', '$2y$10$odJdwhWARg8wzri.BijZuO9o.Z4ncT8WIcfRsdV59v8/T9/o4Igvq', 'male', 'S', NULL, '1998-12-28', 1, '2021-10-30', 'default.jpg', NULL, NULL, 0, 'active', NULL, NULL, NULL, NULL, '2021-10-30 04:46:34', '2021-10-30 04:46:34'),
(4, '003', 1, 'Karan', 'ka@sa.com', '$2y$10$ahltPfto1UTDsy7d1fI3hONuxwjY4y1pgIcmXQaBRugd0S0T9Ps.q', 'male', 'F', NULL, '1998-02-03', 1, '2021-10-30', 'default.jpg', NULL, NULL, 0, 'active', NULL, NULL, NULL, NULL, '2021-10-30 04:47:07', '2021-10-30 04:47:07');

-- --------------------------------------------------------

--
-- Table structure for table `employee_documents`
--

CREATE TABLE `employee_documents` (
  `id` int(10) UNSIGNED NOT NULL,
  `employee_id` int(10) UNSIGNED NOT NULL,
  `type` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `filename` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `employee_documents`
--

INSERT INTO `employee_documents` (`id`, `employee_id`, `type`, `filename`, `created_at`, `updated_at`) VALUES
(1, 1, 'resume', '70988410e09ebd3c48bc4e1d66c9a69d.doc', '2021-10-31 05:42:42', '2021-10-31 05:42:42'),
(2, 1, 'offerLetter', '8926db2d02f2e02a335313e25fbc32c8.doc', '2021-10-31 05:42:42', '2021-10-31 05:42:42'),
(3, 1, 'joiningLetter', '92e54f22c00e3a185f9e2b7393209012.doc', '2021-10-31 05:42:42', '2021-10-31 05:42:42'),
(4, 1, 'contract', '35b7854e6301febb406d2bbe982201d6.doc', '2021-10-31 05:42:42', '2021-10-31 05:42:42'),
(5, 1, 'IDProof', '7527df60221246570b0b6fcac2221eb8.jpg', '2021-10-31 05:42:43', '2021-10-31 05:42:43');

-- --------------------------------------------------------

--
-- Table structure for table `expenses`
--

CREATE TABLE `expenses` (
  `id` int(10) UNSIGNED NOT NULL,
  `item_name` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `purchase_date` date NOT NULL,
  `purchase_from` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `price` double NOT NULL,
  `bill` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `company_id` int(10) UNSIGNED NOT NULL,
  `employee_id` int(10) UNSIGNED NOT NULL,
  `status` enum('pending','approved','rejected') COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_records`
--

CREATE TABLE `failed_records` (
  `id` int(10) UNSIGNED NOT NULL,
  `data` text COLLATE utf8_unicode_ci NOT NULL,
  `fail_reason` varchar(2000) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `faq`
--

CREATE TABLE `faq` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `content_text` text COLLATE utf8_unicode_ci NOT NULL,
  `faq_category_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `faq_category`
--

CREATE TABLE `faq_category` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `status` enum('active','inactive') COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `features`
--

CREATE TABLE `features` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `image` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `features`
--

INSERT INTO `features` (`id`, `title`, `description`, `image`, `created_at`, `updated_at`) VALUES
(1, 'Comprehensive Employee Dashboard', 'Employee Dashboard has been designed to give easy access to the relevant information on a single page.The Dashboard also makes doing common tasks very easy. An Employee can track his attendance on the calendar, view his leaves, check latest notices on the Notice Board, see upcoming holidays and birthdays, and even download salary slip of every month.', 'employee_dashboard.png', '2021-09-27 10:59:19', '2021-09-27 10:59:19'),
(2, 'Expense Claim', 'HRM makes it very easy to manage expenses made by employees and reimburse them. Be it online bill, mobile recharge, field expenses, etc. employees can add expenses they have made with all details including the bill. Approved expenses are automatically added to salary in payroll.', 'expense.png', '2021-09-27 10:59:19', '2021-09-27 10:59:19'),
(3, 'Leave Management', 'Applying for leaves is a cake walk with HRM. An Employee can apply for leaves on\r\n                                specific days or by using a date range when he wants to apply for a long leave -\r\n                                for example, sick or maternity leaves.\r\n                                Leave request is sent to the HR Manager for the approval. After approval or rejection,\r\n                                the employee is notified by an email.', 'apply_leaves.png', '2021-09-27 10:59:19', '2021-09-27 10:59:19'),
(4, 'Job Application', 'Job Application section allows employees to refer people to open job applications in\r\n                                the organization. This promotes their involvement in referring good candidates for open\r\n                                jobs\r\n                                and makes it easy for the manager to manage the referrals.', 'job_vacency.png', '2021-09-27 10:59:19', '2021-09-27 10:59:19'),
(5, 'Admin Dashboard', 'HRM focuses on providing easy access to information. Admin dashboard has common stats to give a good overview of what\'s going on in the organization. Stats like total employees, total departments, awards, attendance, company expenses, current month birthdays, awards list, etc. are available at hand on the dashboard itself.', 'admin_dash.png', '2021-09-27 10:59:19', '2021-09-27 10:59:19'),
(6, 'Employee Management', 'You can easily manage all the employees in the organization and their data with HRM. Tasks like adding new employees, updating employee information, deleting any existing employee, and others can now be done without much hassle. You can also assign Credit Leaves (Annual Leaves) to an employee based on his experience and performance.', 'employee_admin.png', '2021-09-27 10:59:19', '2021-09-27 10:59:19'),
(7, 'Pay Slip Generator', 'Why to use a separate payroll software for generating pay slips when it can be done in HRM itself. HRM provides a simple interface to make generating pay slip both easy and fun. Now add hourly payments, allowances, and deductions, and generate, edit and email payslips to employees, all using HRM.', 'payroll.png', '2021-09-27 10:59:19', '2021-09-27 10:59:19'),
(8, 'Awards Management', 'Being a good HR Manager, you frequently give awards and appreciation to employees. But, as a number of employees increase, keeping the track of them becomes difficult. No worries, with HRM you can comfortably manage all the awards, achievements, and appreciations given in your organization.', 'awards.png', '2021-09-27 10:59:19', '2021-09-27 10:59:19'),
(9, 'Notice Board', 'With HRM\'s notice board feature, you can make company-wide announcements. Notices are visible on employee dashboard and employees are also notified by email.', 'notice.png', '2021-09-27 10:59:19', '2021-09-27 10:59:19'),
(10, 'Company Expense Management', 'Now keep track of all the company expenses conveniently. Any expense, from a small pencil to big purchases like laptops, bills, party expenditure, etc. can be added the to the expense management. HRM shows monthly expense stats to help you know if you are overspending and take measures on time.', 'expense_admin.png', '2021-09-27 10:59:19', '2021-09-27 10:59:19'),
(11, 'Attendance Management', 'You can mark attendance of all the employees with just one click. All you need to do is specify which employees are absent and then mark attendance.\r\n\r\nYou can also see the attendance of employees month wise.', 'attendance.png', '2021-09-27 10:59:19', '2021-09-27 10:59:19'),
(12, 'Holidays List', 'Company Holidays are also now very easy to manage. Any holidays for the current year can be pre-planned and added. Employees can see all the upcoming holidays on their dashboard and make plans accordingly.', 'holidays.png', '2021-09-27 10:59:19', '2021-09-27 10:59:19'),
(13, 'Admin Job Application', 'You can easily review the resumes submitted by employees and accept the best candidates. He can also preview the submitted resume without downloading them.', 'job_admin.png', '2021-09-27 10:59:20', '2021-09-27 10:59:20'),
(14, 'Customize to Your Needs', 'HRM provides many options to customize HRM according to your needs. You can change details like the logo, company address, contact number, email and currency to use on Settings Page.', 'settings.png', '2021-09-27 10:59:20', '2021-09-27 10:59:20'),
(15, 'Multiple Admins', 'HRM supports multiple admins. Add admins without any restrictions to minimize your headache. You just need to create a new admin and email them the details of the new account.', 'admins.png', '2021-09-27 10:59:20', '2021-09-27 10:59:20'),
(16, 'Multiple Themes', 'HRM has 11 front end themes. Choose a theme that everyone likes, or the one that blends well with your company logo.', 'themes.png', '2021-09-27 10:59:20', '2021-09-27 10:59:20');

-- --------------------------------------------------------

--
-- Table structure for table `holidays`
--

CREATE TABLE `holidays` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `date` date NOT NULL,
  `occassion` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `holidays`
--

INSERT INTO `holidays` (`id`, `company_id`, `date`, `occassion`, `created_at`, `updated_at`) VALUES
(1, 2, '2021-10-11', 'Dasara', '2021-09-27 23:58:27', '2021-09-27 23:58:27'),
(2, 1, '2021-11-05', 'Office Off', '2021-10-24 08:37:18', '2021-10-24 08:37:42'),
(3, 1, '2021-12-27', 'XMas', '2021-10-24 08:37:42', '2021-10-24 08:37:42');

-- --------------------------------------------------------

--
-- Table structure for table `holidays_list`
--

CREATE TABLE `holidays_list` (
  `id` int(10) UNSIGNED NOT NULL,
  `date` date NOT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `country` varchar(100) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `invoices`
--

CREATE TABLE `invoices` (
  `id` int(10) UNSIGNED NOT NULL,
  `license_number` char(36) COLLATE utf8_unicode_ci DEFAULT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `invoice_number` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `amount` decimal(13,2) NOT NULL,
  `currency` char(3) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'USD',
  `currencySymbol` char(3) COLLATE utf8_unicode_ci NOT NULL DEFAULT '$',
  `invoice_date` date DEFAULT NULL,
  `due_date` date DEFAULT NULL,
  `status` enum('Paid','Unpaid','Cancelled','Error') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Unpaid',
  `notes` text COLLATE utf8_unicode_ci NOT NULL,
  `transaction_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `invoice_items`
--

CREATE TABLE `invoice_items` (
  `id` int(10) UNSIGNED NOT NULL,
  `invoice_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `type` enum('Item','Tax','Discount') COLLATE utf8_unicode_ci NOT NULL,
  `amount` decimal(13,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `position` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `description` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `posted_date` date NOT NULL,
  `last_date` date NOT NULL,
  `close_date` date NOT NULL,
  `status` enum('active','inactive') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `jobs`
--

INSERT INTO `jobs` (`id`, `company_id`, `position`, `description`, `posted_date`, `last_date`, `close_date`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 'SR Dev', '<p>SR Dev asd ada dada dadassd asd asd asd asdsada<br></p>', '2021-01-01', '2021-10-31', '2021-10-31', 'active', '2021-10-24 08:32:25', '2021-10-24 08:32:25');

-- --------------------------------------------------------

--
-- Table structure for table `job_applications`
--

CREATE TABLE `job_applications` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED NOT NULL,
  `job_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `resume` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `cover_letter` text COLLATE utf8_unicode_ci NOT NULL,
  `status` enum('selected','rejected','pending') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'pending',
  `submitted_by` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `languages`
--

CREATE TABLE `languages` (
  `id` int(10) UNSIGNED NOT NULL,
  `locale` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `language` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `languages`
--

INSERT INTO `languages` (`id`, `locale`, `language`, `active`) VALUES
(1, 'en', 'US English', 1),
(2, 'es', 'Spanish', 1),
(3, 'fr', 'French', 1),
(4, 'pt', 'Portuguese', 1);

-- --------------------------------------------------------

--
-- Table structure for table `leavetypes`
--

CREATE TABLE `leavetypes` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `leaveType` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `num_of_leave` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `leavetypes`
--

INSERT INTO `leavetypes` (`id`, `company_id`, `leaveType`, `num_of_leave`, `created_at`, `updated_at`) VALUES
(1, 1, 'ML', 6, '2021-09-27 11:08:36', '2021-09-27 11:08:36'),
(2, 1, 'CL', 16, '2021-09-27 11:08:43', '2021-09-27 11:08:43'),
(3, 2, 'ML', 6, '2021-09-28 00:00:07', '2021-09-28 00:00:07');

-- --------------------------------------------------------

--
-- Table structure for table `leave_applications`
--

CREATE TABLE `leave_applications` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED NOT NULL,
  `employee_id` int(10) UNSIGNED NOT NULL,
  `leaveType` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `halfDayType` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_updated_by` int(10) UNSIGNED DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `days` int(11) NOT NULL,
  `applied_on` date DEFAULT NULL,
  `reason` text COLLATE utf8_unicode_ci NOT NULL,
  `application_status` enum('approved','rejected','pending') COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `leave_applications`
--

INSERT INTO `leave_applications` (`id`, `company_id`, `employee_id`, `leaveType`, `halfDayType`, `last_updated_by`, `start_date`, `end_date`, `days`, `applied_on`, `reason`, `application_status`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'ML', 'no', NULL, '2021-09-30', NULL, 1, '2021-09-27', '', 'pending', '2021-09-27 11:24:00', '2021-09-27 11:24:00'),
(2, 1, 1, 'ML', 'no', NULL, '2021-09-30', NULL, 1, '2021-09-27', 'Sick', 'pending', '2021-09-27 11:24:06', '2021-09-27 11:24:06'),
(3, 1, 1, 'ML', 'no', NULL, '2021-09-30', NULL, 1, '2021-09-27', 'Sick', 'pending', '2021-09-27 11:24:15', '2021-09-27 11:24:15'),
(4, 1, 1, 'ML', 'no', NULL, '2021-09-30', NULL, 1, '2021-09-27', 'Sick', 'pending', '2021-09-27 11:24:25', '2021-09-27 11:24:25');

-- --------------------------------------------------------

--
-- Table structure for table `licenses`
--

CREATE TABLE `licenses` (
  `license_number` char(36) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(70) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `company` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `subdomain` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `license_type_id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `status` enum('Valid','Expired','Disabled') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Valid',
  `expires_on` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `license_country_pricing`
--

CREATE TABLE `license_country_pricing` (
  `id` int(10) UNSIGNED NOT NULL,
  `license_type_id` int(10) UNSIGNED NOT NULL,
  `country` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `currency_code` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  `currency_symbol` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  `price` decimal(8,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `license_types`
--

CREATE TABLE `license_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `free_users` tinyint(4) NOT NULL,
  `price` decimal(8,2) NOT NULL,
  `type` enum('Cloud','Multi-Company','On-Premise') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Cloud',
  `status` enum('Enabled','Disabled') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Enabled',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ltm_translations`
--

CREATE TABLE `ltm_translations` (
  `id` int(10) UNSIGNED NOT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `locale` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `group` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `key` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `value` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2013_04_09_062329_create_revissions_table', 1),
(2, '2013_10_08_070623_create_subscription_plans', 1),
(3, '2014_01_28_050545_create_company_table', 1),
(4, '2014_04_02_193005_create_translations_table', 1),
(5, '2015_01_01_113224_create_department_table', 1),
(6, '2015_01_02_113252_create_designation_table', 1),
(7, '2015_01_03_051233_create_employees_table', 1),
(8, '2015_01_14_095049_create_leavetypes_table', 1),
(9, '2015_01_15_061824_create_admins_table', 1),
(10, '2015_01_15_062941_create_bank_details_table', 1),
(11, '2015_01_15_104831_create_employee_documents_table', 1),
(12, '2015_01_15_105222_create_awards_table', 1),
(13, '2015_01_15_110029_create_holidays_table', 1),
(14, '2015_01_15_110255_create_attendance_table', 1),
(15, '2015_01_20_100417_create_salary_table', 1),
(16, '2015_01_22_150640_create_expenses_table', 1),
(17, '2015_02_10_044023_create_noticeboards_table', 1),
(18, '2015_05_18_041236_create_country_table', 1),
(19, '2015_05_20_081903_create_leave_applications', 1),
(20, '2015_05_23_063217_create_payrolls_table', 1),
(21, '2015_06_02_174830_create_jobs_table', 1),
(22, '2015_06_03_124443_create_jobApplications_table', 1),
(23, '2015_06_07_112126_add_employeeID_to_expense_table', 1),
(24, '2015_06_08_051127_add_expense_to_payrolls', 1),
(25, '2015_06_10_040042_add_bsb_bank_details', 1),
(26, '2015_06_11_094005_create_language_table', 1),
(27, '2015_08_27_124551_add_superadmintype_table', 1),
(28, '2015_08_28_073542_create_settings_table', 1),
(29, '2015_09_21_121944_create_emailTemplates_table', 1),
(30, '2015_12_01_094436_contact_form', 1),
(31, '2015_12_01_121511_create_jobs_queued_table', 1),
(32, '2015_12_02_042829_licenses_types', 1),
(33, '2015_12_02_141828_licenses', 1),
(34, '2015_12_03_085826_transactions', 1),
(35, '2015_12_07_141042_add_soft_delete_companies_table', 1),
(36, '2015_12_11_043103_country_wise_pricing', 1),
(37, '2015_12_11_044747_combine_price_column', 1),
(38, '2015_12_19_045656_add_country_company', 1),
(39, '2015_12_29_055336_drop_leave_app_foreign_keys', 1),
(40, '2015_12_31_052753_rename_ifsc_and_pan_column', 1),
(41, '2016_01_07_103507_referral_member_table', 1),
(42, '2016_01_07_113732_add_referral_code_companies', 1),
(43, '2016_01_09_081051_browse_history_table', 1),
(44, '2016_01_11_071613_add_status_to_referral_members', 1),
(45, '2016_01_23_060953_CreateDatabaseBackupsTable', 1),
(46, '2016_01_25_094404_add_supervisor', 1),
(47, '2016_01_28_101227_create_dept_manager', 1),
(48, '2016_01_30_073216_failed_records_table', 1),
(49, '2016_02_10_051740_add_clock_attendence_table', 1),
(50, '2016_02_10_133843_timezone_field', 1),
(51, '2016_02_10_165940_holidays_list_country', 1),
(52, '2016_02_11_152050_updates', 1),
(53, '2016_02_12_064233_updates_read', 1),
(54, '2016_02_16_071246_add_mark_attendance_companies', 1),
(55, '2016_02_17_050720_number_of_logins', 1),
(56, '2016_02_18_043238_set_default_companies_office_time', 1),
(57, '2016_02_22_070410_Add_attendance_settings_col_company', 1),
(58, '2016_02_22_070558_Add_is_late_col_attendance', 1),
(59, '2016_02_24_044525_invoice_tables', 1),
(60, '2016_02_25_042354_license_link_columns', 1),
(61, '2016_03_02_060333_add_office_start_end_time_to_attendance', 1),
(62, '2016_03_02_093444_billing_address', 1),
(63, '2016_03_04_083135_drop_half_day_foreign_key', 1),
(64, '2016_03_04_091447_remove_updated_by_column', 1),
(65, '2016_03_06_165923_employee_company_id_column', 1),
(66, '2016_03_07_115548_update_timezone_currency', 1),
(67, '2016_03_31_095011_jobs_type_medium_text', 1),
(68, '2016_04_15_070953_license_expired_column', 1),
(69, '2016_11_11_095228_add_invoice_emails_template', 1),
(70, '2018_10_08_062013_add_cashier_columns', 1),
(71, '2018_12_03_062040_update_subscription_table', 1),
(72, '2018_12_03_121300_add_stripe_columns_in_company_table', 1),
(73, '2018_12_03_122119_create_subscriptions_table', 1),
(74, '2019_01_18_095252_create_faq_category_table', 1),
(75, '2019_01_18_095308_create_faq_table', 1),
(76, '2019_01_18_095309_create_stripe_invoices_table', 1),
(77, '2019_03_06_083339_add_stripe_setting_column_in_settings_table', 1),
(78, '2019_03_11_045839_update_set_nullable_companies_table', 1),
(79, '2019_03_11_092232_nullable_employees_table', 1),
(80, '2019_03_11_093614_nullable_expense_table', 1),
(81, '2019_03_11_111346_awards_nullable_table', 1),
(82, '2019_03_12_041352_insert_smtp_settings_from_env', 1),
(83, '2019_03_18_100657_alter_companies_table', 1),
(84, '2019_03_18_140009_add_gdpr_to_users_table', 1),
(85, '2019_03_19_062146_employees_admin_gdpr_columns_extend', 1),
(86, '2019_04_24_064209_add_pt_language_in_languages_table', 1),
(87, '2019_05_13_070209_add_currency_id_in_settings_table', 1),
(88, '2019_06_05_091741_alter_allowances_column_payrolls_table', 1),
(89, '2019_06_10_072120_add_status_column_in_payrolls_table', 1),
(90, '2019_08_01_052902_alter_mail_encryption_in_settings_table', 1),
(91, '2019_08_12_073129_update_settings_add_envato_key', 1),
(92, '2019_08_13_073129_update_settings_add_support_key', 1),
(93, '2019_08_18_151918_create_features_table', 1),
(94, '2019_08_28_081847_update_smtp_setting_verified', 1),
(95, '2019_09_25_083712_update_setting_cron_job', 1),
(96, '2019_09_26_074828_add_new_invoice_generated', 1),
(97, '2019_11_06_042543_alter_leave_application_data', 1),
(98, '2019_11_12_054145_add_system_update_column_in_settings_table', 1),
(99, '2019_11_28_090611_add_paypal_column_in_settings_table', 1),
(100, '2019_11_29_111053_add_paypal_mode_column_in_settings_table', 1),
(101, '2019_12_06_091241_add_column_end_on_in_stripe_invoices_table', 1),
(102, '2020_02_01_101914_update_settings_review', 1),
(103, '2020_03_03_121750_add_stripe_active_subscription', 1),
(104, '2020_10_22_065125_update_smtp_from_email', 1),
(105, '2021_06_14_112939_setting_update_favicon_table', 1),
(106, '2021_06_17_052911_languages_status_column', 1),
(107, '2021_06_17_065532_pages_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `noticeboards`
--

CREATE TABLE `noticeboards` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `title` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `status` enum('active','inactive') COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `noticeboards`
--

INSERT INTO `noticeboards` (`id`, `company_id`, `title`, `description`, `status`, `created_at`, `updated_at`) VALUES
(1, 2, 'Wel', '<p>asdadsa<br></p>', 'active', '2021-09-27 23:57:54', '2021-09-27 23:57:54');

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `language_id` int(10) UNSIGNED DEFAULT NULL,
  `title` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `slug` text COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `pages`
--

INSERT INTO `pages` (`id`, `language_id`, `title`, `slug`, `description`, `created_at`, `updated_at`) VALUES
(1, 1, 'Terms of Service', 'terms-of-service', ' THIS IS AN AGREEMENT BETWEEN YOU OR THE ENTITY THAT YOU REPRESENT (hereinafter \"You\" or \"Your\") AND HRM SAAS (hereinafter \"HRM SAAS\") GOVERNING YOUR USE OF TIME TRACKER SYSTEM – HRM (hereinafter the \"Software\").\r\n\r\n<h4>1. Acceptance of Terms</h4>\r\n\r\nThis Agreement consists of the following terms and conditions referred to as the \"Terms\". You must be of legal age to enter into a binding agreement in order to accept the Terms. If you do not agree to the Terms, do not use the Software. You can accept the Terms by checking a checkbox or clicking on a button indicating your acceptance of the terms or by actually using the Software.\r\n\r\n<h4>2. Description of Software</h4>\r\n\r\n{{ $setting->main_name }}, an HR Management solution. You may use the Software for your personal and business use or for internal business purpose in the organization that you represent. You may connect to the Software using any Internet browser supported by the Software. You are responsible for obtaining access to the Internet and the equipment necessary to use the Software. You can create and edit content with your user account and if you choose to do so, you can publish and share such content.\r\n\r\n<h4>3. Modification of Terms of Software</h4>\r\n\r\nWe may modify the Terms upon notice to you at any time through a service announcement or by sending email to your primary email address. If we make significant changes to the Terms that affect your rights, you will be provided with at least 30 days advance notice of the changes by email to your primary email address. You may terminate your use of the Software by providing HRM SAAS notice by email within 30 days of being notified of the availability of the modified Terms if the Terms are modified in a manner that substantially affects your rights in connection with use of the Software. In the event of such termination, you will be entitled to prorated refund of the unused portion of any prepaid fees. Your continued use of the Software after the effective date of any change to the Terms will be deemed to be your agreement to the modified Terms.\r\n\r\n<h4>4. User Sign up Obligations</h4>\r\n\r\nYou need to sign up for a user account by providing all required information in order to access or use the Software. If you represent an organization and wish to use the Software for corporate internal use, we recommend that you, and all other users from your organization, sign up for user accounts by providing your corporate contact information. In particular, we recommend that you use your corporate email address. You agree to: a) provide true, accurate, current and complete information about yourself as prompted by the sign-up process; and b) maintain and promptly update the information provided during sign up to keep it true, accurate, current, and complete. If you provide any information that is untrue, inaccurate, outdated, or incomplete, or if HRM SAAS has reasonable grounds to suspect that such information is untrue, inaccurate, outdated, or incomplete, HRM SAAS may terminate your user account and refuse current or future use of the Software.\r\n\r\n<h4>5. Organization Accounts and Administrators</h4>\r\n\r\nWhen you sign up for an account for your organization you may specify one or more administrators. The administrators will have the right to configure the Software based on your requirements and manage end users in your organization account. If your organization account is created and configured on your behalf by a third party, it is likely that such third party has assumed administrator role for your organization. Make sure that you enter into a suitable agreement with such third party specifying such party’s roles and restrictions as an administrator of your organization account. You are responsible for:\r\n<ol>\r\n<li>ensuring confidentiality of your organization account password,</li>\r\n<li>appointing competent individuals as administrators for managing your organization account, and</li>\r\n<li>ensuring that all activities that occur in connection with your organization account comply with this Agreement. You understand that HRM SAAS is not responsible for account administration and internal management of the Software for you.</li>\r\n</ol>\r\nYou are responsible for taking necessary steps for ensuring that your organization does not lose control of the administrator accounts. You may specify a process to be followed for recovering control in the event of such loss of control of the administrator accounts by sending an email to <a href=\"mailto:admin@example.com\">admin@example.com</a>, provided that the process is acceptable to HRM SAAS. In the absence of any specified administrator account recovery process, HRM SAAS may provide control of an administrator account to an individual providing proof satisfactory to HRM SAAS demonstrating authorization to act on behalf of the organization. You agree not to hold HRM SAAS liable for the consequences of any action taken by HRM SAAS in good faith in this regard.\r\n\r\n<h4>6. Self-Hosted Terms</h4>\r\n\r\n<h5>6.1 Your License Rights</h5>\r\n\r\nSubject to the terms and conditions of this Agreement, HRM SAAS grants you a non-exclusive, non-sublicensable and non-transferable license to install and use the Software during the applicable License Term in accordance with this Agreement.\r\n\r\n<h5>6.2 Number of Instances</h5>\r\n\r\nUnless otherwise specified in your Order, for each Software license that you purchase, you may install one instance of the Software on systems owned or operated by you (or your third party service providers so long as you remain responsible for their compliance with the terms and conditions of this Agreement).\r\n\r\n<h5>6.3 Your Modifications</h5>\r\n\r\nSubject to the terms and conditions of this Agreement:\r\n\r\n<ol>\r\n<li>for any elements of the Software provided by HRM SAAS in source code form, and to the extent permitted in the Documentation, you may modify such source code solely for purposes of developing bug fixes, customizations and additional features for the Software and</li>\r\n\r\n<li>you may also modify the Documentation to reflect your permitted modifications of the Software source code or the particular use of the Products within your organization.</li>\r\n</ol>\r\n\r\nAny modified source code or Documentation constitutes \"Your Modifications\". You may use Your Modifications solely with respect to your own instances in support of your permitted use of the Software but you may not distribute the code of Your Modifications to any third party. Notwithstanding anything in this Agreement to the contrary, HRM SAAS has no support, warranty, indemnification or other obligation or liability with respect to Your Modifications or their combination, interaction or use with our Products. You shall indemnify, defend and hold us harmless from and against any and all claims, costs, damages, losses, liabilities and expenses (including reasonable attorneys’ fees and costs) arising out of or in connection with any claim brought against us by a third party relating to Your Modifications (including but not limited to any representations or warranties you make about Your Modifications or the Software) or your breach of this Section 6.3. This indemnification obligation is subject to your receiving (i) prompt written notice of such claim (but in any event notice in sufficient time for you to respond without prejudice); (ii) the exclusive right to control and direct the investigation, defense, or settlement of such claim; and (iii) all reasonably necessary cooperation of HRM SAAS at your expense.\r\n\r\n<h5>6.4 Attribution</h5>\r\n\r\nIn any use of the Software, you must include the following attribution to HRM SAAS on all user interfaces in the following format: \"Powered by HRM SAAS\" which must in every case include a hyperlink to http://www.solutionrack.com, and which must be in the same format as delivered in the Software. If no such attribution is delivered with the Software, it is not required to include such attribution.\r\n\r\n<h5>6.5 Support</h5>\r\n\r\nThe support provided by HRM SAAS for self-hosted services is limited to the issues arising because of bugs in the Software delivered. It does not include (i) issues arising as a result of outdated software running on server on which you choose to install the Software (ii) issues arising as a result\r\n\r\nof Your Modifications as described in section 6.5 (iii) issues arising because server not meeting System Requirements for the Software.\r\n\r\n<h4>7. Personal Information and Privacy</h4>\r\n\r\nPersonal information you provide to HRM SAAS through the Software is governed by TIME TRACKER SYSTEM – HRM Privacy Policy. Your election to use the Software indicates your acceptance of the terms of the TIME TRACKER SYSTEM – HRM Privacy Policy. You are responsible for maintaining confidentiality of your username, password and other sensitive information. You are responsible for all activities that occur in your user account and you agree to inform us immediately of any unauthorized use of your user account by email to <a href=\"mailto:admin@example.com\">admin@example.com</a>. We are not responsible for any loss or damage to you or to any third party incurred as a result of any unauthorized access and/or use of your user account, or otherwise.\r\n\r\n<h4>8. Communications from HRM SAAS</h4>\r\n\r\nThe Software may include certain communications from HRM SAAS, such as service announcements, administrative messages and newsletters. You understand that these communications shall be considered part of using the Software. As part of our policy to provide you total privacy, we also provide you the option of opting out from receiving newsletters from us. However, you will not be able to opt-out from receiving service announcements and administrative messages.\r\n\r\n<h4>9. Complaints</h4>\r\n\r\nIf we receive a complaint from any person against you with respect to your activities as part of use of the Software, we will forward the complaint to the primary email address of your user account. You must respond to the complainant directly within 10 days of receiving the complaint forwarded by us and copy HRM SAAS in the communication. If you do not respond to the complainant within 10 days from the date of our email to you, we may disclose your name and contact information to the complainant for enabling the complainant to take legal action against you. You understand that your failure to respond to the forwarded complaint within the 10 days’ time limit will be construed as your consent to disclosure of your name and contact information by HRM SAAS to the complainant.\r\n\r\n<h4>10. Fees and Payments</h4>\r\n\r\nThe Software is available under monthly subscription plan. Your subscription can be automatically renewed at the end of each month unless you downgrade your paid subscription plan to a free plan or inform us that you do not wish to renew the subscription. If you do not wish to renew the subscription, you must inform us at least seven days prior to the renewal date. If you have not downgraded to a free plan and if you have not informed us that you do not wish to renew the subscription, you will be presumed to have authorized HRM SAAS to charge the subscription fee. From time to time, we may change the price of any Software or charge for use of Services that are currently available free of charge. Any increase in charges will not apply until the expiry of your then current billing cycle. You will not be charged for using any Software unless you have opted for a paid subscription plan.\r\n\r\n<h4>11. Restrictions on Use</h4>\r\n\r\nIn addition to all other terms and conditions of this Agreement, you shall not: (i) transfer the Software or otherwise make it available to any third party; (ii) provide any service based on the Software without prior written permission; (iii) use the third party links to sites without agreeing to their website terms & conditions; (iv) post links to third party sites or use their logo, company name, etc. without their prior written permission; (v) publish any personal or confidential information belonging to any person or entity without obtaining consent from such person or entity; (vi) use the Software in any manner that could damage, disable, overburden, impair or harm any server, network, computer system, resource of HRM SAAS; (vii) violate any applicable local, state, national or international law; and (viii) create a false identity to mislead any person as to the identity or origin of any communication.\r\n\r\n<h4>12. Spamming and Illegal Activities</h4>\r\n\r\nYou agree to be solely responsible for the contents of your transmissions through the Software. You agree not to use the Software for illegal purposes or for the transmission of material that is unlawful, defamatory, harassing, libelous, invasive of another\'s privacy, abusive, threatening, harmful, vulgar, pornographic, obscene, or is otherwise objectionable, offends religious sentiments, promotes racism, contains viruses or malicious code, or that which infringes or may infringe intellectual property or other rights of another. You agree not to use the Software for the transmission of \"junk mail\", \"spam\", \"chain letters\", \"phishing\" or unsolicited mass distribution of email. We reserve the right to terminate your access to the Software if there are reasonable grounds to believe that you have used the Software for any illegal or unauthorized activity.\r\n\r\n<h4>13. Inactive User Accounts Policy</h4>\r\n\r\n            We reserve the right to terminate unpaid user accounts that are inactive for a continuous period of 120 days. In the event of such termination, all data associated with such user account will be deleted. We will provide you prior notice of such termination and option to back-up your data. In case of accounts with more than one user, if at least one of the users is active, the account will not be considered inactive.\r\n\r\n<h4>14. Data Ownership</h4>\r\n\r\n            We respect your right to ownership of content created or stored by you. You own the content created or stored by you. Unless specifically permitted by you, your use of the Software does not grant HRM SAAS the license to use, reproduce, adapt, modify, publish or distribute the content created by you or stored in your user account for HRM SAAS\'s commercial, marketing or any similar purpose. But you grant HRM SAAS permission to access, copy, distribute, store, transmit, reformat, publicly display and publicly perform the content of your user account solely as required for the purpose of providing the Software to you.\r\n\r\n<h4>15. User Generated Content</h4>\r\n\r\nYou may transmit or publish content created by you using the Software or otherwise. However, you shall be solely responsible for such content and the consequences of its transmission or publication. Any content made public will be publicly accessible through the internet and may be crawled and indexed by search engines. You are responsible for ensuring that you do not accidentally make any private content publicly available. Any content that you may receive from other users of the Software, is provided to you AS IS for your information and personal use only and you agree not to use, copy, reproduce, distribute, transmit, broadcast, display, sell, license or otherwise exploit such content for any purpose, without the express written consent of the person who owns the rights to such content. In the course of using the Software, if you come across any content with copyright notice(s) or any copy protection feature(s), you agree not to remove such copyright notice(s) or disable such copy protection feature(s) as the case may be. By making any copyrighted/copyrightable content available on the Software you affirm that you have the consent, authorization or permission, as the case may be from every person who may claim any rights in such content to make such content available in such manner. Further, by making any content available in the manner aforementioned, you expressly agree that HRM SAAS will have the right to block access to or remove such content made available by you if HRM SAAS receives complaints\r\n\r\nconcerning any illegality or infringement of third party rights in such content. By using the Software and transmitting or publishing any content using such Software, you expressly consent to determination of questions of illegality or infringement of third party rights in such content by the agent designated by HRM SAAS for this purpose.\r\n\r\n<h4>16. Disclaimer of Warranties</h4>\r\n\r\nYOU EXPRESSLY UNDERSTAND AND AGREE THAT THE USE OF THE SERVICE IS AT YOUR SOLE RISK. THE SERVICES ARE PROVIDED ON AN AS-IS-AND-AS-AVAILABLE BASIS. HRM SAAS EXPRESSLY DISCLAIMS ALL WARRANTIES OF ANY KIND, WHETHER EXPRESS OR IMPLIED, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE. HRM SAAS MAKES NO WARRANTY THAT THE SERVICES WILL BE UNINTERRUPTED, TIMELY, SECURE, OR ERROR FREE. USE OF ANY MATERIAL DOWNLOADED OR OBTAINED THROUGH THE USE OF THE SERVICES SHALL BE AT YOUR OWN DISCRETION AND RISK AND YOU WILL BE SOLELY RESPONSIBLE FOR ANY DAMAGE TO YOUR COMPUTER SYSTEM, MOBILE TELEPHONE, WIRELESS DEVICE OR DATA THAT RESULTS FROM THE USE OF THE SERVICE OR THE DOWNLOAD OF ANY SUCH MATERIAL. NO ADVICE OR INFORMATION, WHETHER WRITTEN OR ORAL, OBTAINED BY YOU FROM HRM SAAS, ITS EMPLOYEES OR REPRESENTATIVES SHALL CREATE ANY WARRANTY NOT EXPRESSLY STATED IN THE TERMS.\r\n\r\n<h4>17. Limitation of Liability</h4>\r\n\r\nYOU AGREE THAT HRM SAAS SHALL, IN NO EVENT, BE LIABLE FOR ANY CONSEQUENTIAL, INCIDENTAL, INDIRECT, SPECIAL, PUNITIVE, OR OTHER LOSS OR DAMAGE WHATSOEVER OR FOR LOSS OF BUSINESS PROFITS, BUSINESS INTERRUPTION, COMPUTER FAILURE, LOSS OF BUSINESS INFORMATION, OR OTHER LOSS ARISING OUT OF OR CAUSED BY YOUR USE OF OR INABILITY TO USE THE SERVICE, EVEN IF HRM SAAS HAS BEEN ADVISED OF THE POSSIBILITY OF SUCH DAMAGE. IN NO EVENT SHALL HRM SAAS\'S ENTIRE LIABILITY TO YOU IN RESPECT OF THE SERVICE, WHETHER DIRECT OR INDIRECT, EXCEED THE FEES PAID BY YOU TOWARDS SUCH SERVICE.\r\n\r\n<h4>18. Indemnification</h4>\r\n\r\n            You agree to indemnify and hold harmless HRM SAAS, its officers, directors, employees, suppliers, and affiliates, from and against any losses, damages, fines and expenses (including attorney\'s fees and costs) arising out of or relating to any claims that you have used the Software in violation of another party\'s rights, in violation of any law, in violations of any provisions of the Terms, or any other claim related to your use of the Software, except where such use is authorized by HRM SAAS.\r\n\r\n<h4>19. Suspension and Termination</h4>\r\n\r\n            We may suspend your user account or temporarily disable access to whole or part of any Software in the event of any suspected illegal activity, extended periods of inactivity or requests by law enforcement or other government agencies. Objections to suspension or disabling of user accounts should be made to <a href=\"mailto:admin@example.com\">admin@example.com</a> within thirty days of being notified about the suspension. We may terminate a suspended or disabled user account after thirty days. We will also terminate your user account on your request. In addition, we reserve the right to terminate your user account and deny the Software upon reasonable belief that you have violated the Terms. You have the right to terminate your user account if HRM SAAS breaches its obligations under these Terms and in such event, you will be entitled to prorated refund of\r\n\r\naccess to the Software, deletion of information in your user account such as your email address and password and deletion of all data in your user account.\r\n\r\n<h4>20. END OF TERMS OF SERVICE</h4>\r\n\r\nIf you have any questions or concerns regarding this Agreement, please contact us at <a href=\"mailto:admin@example.com\">admin@example.com</a>.', '2021-09-27 10:59:24', '2021-09-27 10:59:24'),
(2, 1, 'Privacy Policy', 'privacy-policy', ' <h4>General</h4>\r\n\r\n                        At HRM SAAS, we respect your need for online privacy and protect any Personal Information that you may share with us, in an appropriate manner. Our practice with respect to use of your Personal Information is as set forth below in this Privacy Policy Statement. As a condition to use of HRM SAAS Services, you consent to the terms of the Privacy Policy Statement as it may be updated from time to time.\r\n\r\n                        <h4>Children\'s Online Privacy Protection</h4>\r\n\r\n                        HRM SAAS does not knowingly collect Personal Information from users who are under 13 years of age.\r\n\r\n                        <h4>Information Recorded and Use:</h4>\r\n\r\n                        <h5>Personal Information</h5>\r\n\r\n            During the Registration Process for creating a user account, we request for your name, email address and company name. You will also be asked to choose a password, which will be used solely for the purpose of providing access to your user account. Your name and email address will be used to inform you regarding new services, releases, upcoming events and changes in this Privacy Policy Statement.\r\n                        <br><br/>\r\n                        HRM SAAS will have access to third party personal information provided by you as part of using HRM SAAS Services. This information may include third party names, email addresses, phone numbers and physical addresses and will be used for servicing your requirements as expressed by you to HRM SAAS and solely as part and parcel of your use of HRM SAAS Services. We do not share this third party personal information with anyone for promotional purposes, nor do we utilize it for any purposes not expressly consented to by you. When you elect to refer friends to the website, we request their email address and name to facilitate the request and deliver a one time email. Your friend may contact us at <a href=\"mailto:admin@example.com\">admin@example.com</a> to request that we remove this information from our database.\r\n                        <br/><br/>\r\n                        We post user testimonials on our website. These testimonials may include names and other Personal Information and we acquire permission from our users prior to posting these on our website.\r\n                        <br/><br/>\r\n                        HRM SAAS is not responsible for the Personal Information users elect to post within their testimonials.\r\n\r\n                        <h5>Usage Details</h5>\r\n\r\n            Your usage details such as time, frequency, duration and pattern of use, features used and the amount of storage used will be recorded by us in order to enhance your experience of the HRM SAAS Services and to help us provide you the best possible service.\r\n\r\n                        <h5>Contents of your User Account</h5>\r\n\r\n            We store and maintain files, documents, emails and other data stored in your user account at servers provided by cloud services like Microsoft Azure. In order to prevent loss of data due to errors or system failures, we also keep backup copies of data including the contents of your user account. Hence your files and data may remain on our servers even after deletion or termination of your user account. We may retain and use your Personal Information and data as necessary to comply with our legal obligations, resolve disputes, and enforce our rights. We assure you that the contents of your user account will not be disclosed to anyone and will not be accessible even to employees of HRM SAAS except in circumstances specifically mentioned in this Privacy Policy Statement and Terms of Services. We also do not scan the contents of your user account for serving targeted advertisements.\r\n\r\n                        <h5>Payment Information</h5>\r\n\r\n            In case of services requiring payment, we request credit card or other payment account information, which will be used solely for processing payments. Your financial information will not be stored by us except for the name and address of the card holder, the expiry date and the last four digits of the Credit Card number. Subject to your prior consent and where necessary for processing future payments, your financial information will be stored in encrypted form on secure servers of our reputed Payment Gateway Service Provider who is beholden to treating your Personal Information in accordance with this Privacy Policy Statement.\r\n\r\n\r\n                        <h5>Behavioral Targeting/Re-Targeting</h5>\r\n\r\n                        We partner with third parties to manage our advertisements on other sites. Our third-party partners may use technologies such as cookies to gather information about your activities on this site and other sites in order to provide you advertising based upon your browsing activities and interests. If you wish to not have this information used for the purpose of serving you interest-based advertisements, you may opt-out by <a href=\"http://preferences-mgr.truste.com/\" target=\"_blank\">clicking here</a> (or if located in the European Union <a href=\"http://www.youronlinechoices.eu/\" _target=\"blank\">click here</a>). However, you will continue to receive generic advertisements on other websites that display advertisements.\r\n\r\n                        <h5>Links from our website</h5>\r\n\r\n                        Some pages of our website contain external links. You are advised to verify the privacy practices of such other websites. We are not responsible for the manner of use or misuse of information made available by you at such other websites. We encourage you not to provide Personal Information, without assuring yourselves of the Privacy Policy Statement of other websites.\r\n\r\n                        <h5>Federated Authentication</h5>\r\n\r\n                        You can log in to our site, if option available, using federated authentication providers such as Facebook Connect. These services will authenticate your identity and provide you the option to share certain Personal Information with us such as your name and email address to pre-populate our sign up form.\r\n\r\n                        <h5>With whom we share Information</h5>\r\n\r\n                        We may need to share your Personal Information and your data to our affiliates, resellers, service providers and business partners solely for the purpose of providing HRM SAAS Services to you. The purposes for which we may disclose your Personal Information or data to our service providers may include, but are not limited to, data storage, database management, web analytics and payment processing. These service providers are authorized to use your Personal Information or data only as necessary to provide these services to us. In such cases HRM SAAS will also ensure that such affiliates, resellers, service providers and business partners comply with this Privacy Policy Statement and adopt appropriate confidentiality and security measures. We will obtain your prior specific consent before we share your Personal Information or data to any person outside HRM SAAS for any purpose that is not directly connected with providing HRM SAAS Services to you. We will share your Personal Information with third parties only in the ways that are described in this Privacy Policy Statement. We do not sell your Personal Information to third parties. We may share generic aggregated demographic information not linked to any Personal Information regarding visitors and users with our business partners and advertisers. Please be aware that laws in various jurisdictions in which we operate may obligate us to disclose user information and the contents of your user account to the local law enforcement authorities under a legal process or an enforceable government request. In addition, we may also disclose Personal Information and contents of your user account to law enforcement authorities if such disclosure is determined to be necessary by HRM SAAS in our sole and absolute discretion for protecting the safety of our users, employees, or the general public. If HRM SAAS is involved in a merger, acquisition, or sale of all or a portion of its business or assets, you will be notified via email and/or a prominent notice on our website of any change in ownership or uses of your Personal Information, as well as any choices you may have regarding your Personal Information.\r\n\r\n                        <h5>How secure is your Information</h5>\r\n\r\n                        We adopt industry appropriate data collection, storage and processing practices and security measures, as well as physical security measures to protect against unauthorized access, alteration, disclosure or destruction of your Personal Information, username, password, transaction information and data stored in your user account. Access to your name and email address is restricted to our employees who need to know such information in connection with providing HRM SAAS Services to you and are bound by confidentiality obligations.\r\n\r\n                        <h5>Your Choice in Information Use</h5>\r\n\r\n                        In the event we decide to use your Personal Information for any purpose other than as stated in this Privacy Policy Statement, we will offer you an effective way to opt out of the use of your Personal Information for those other purposes. From time to time, we may send emails to you regarding new services, releases and upcoming events. You may opt out of receiving newsletters and other secondary messages from HRM SAAS by selecting the ‘unsubscribe’ function present in every email we send. However, you will continue to receive essential transactional emails.\r\n                        <br/><br/>\r\n                        Accessing, Updating and Removing Personal Information Users who wish to correct, update or remove any Personal Information including those from a public forum, directory or testimonial on our site may do so either by accessing their user account or by contacting HRM SAAS Customer Support Services at <a href=\"mailto:admin@example.com\">admin@example.com</a>. Such changes may take up to 48 hours to take effect. We respond to all enquiries within 30 days. Investigation of Illegal Activity We may need to provide access to your Personal Information and the contents of your user account to our employees and service providers for the purpose of investigating any suspected illegal activity or potential violation of the terms and conditions for use of HRM SAAS Services. However, HRM SAAS will ensure that such access is in compliance with this Privacy Policy Statement and subject to appropriate confidentiality and security measures.\r\n\r\n                        <h5>Enforcement of Privacy Policy</h5>\r\n\r\n                        We make every effort, including periodic reviews to ensure that Personal Information provided by you is used in conformity with this Privacy Policy Statement. If you have any concerns regarding our adherence to this Privacy Policy Statement or the manner in which Personal Information is used for the purpose of providing HRM SAAS Services, kindly contact HRM SAAS Customer Support Services at <a href=\"mailto:admin@example.com\">admin@example.com</a>. We will contact you to address your concerns and we will also co-operate with regulatory authorities in this regard if needed.\r\n\r\n                        <h5>Notification of Changes</h5>\r\n\r\n                        We may modify the Privacy Policy Statement upon notice to you at any time through a service announcement or by sending email to your primary email address. If we make significant changes in the Privacy Policy Statement that affect your rights, You will be provided with at least 30 days advance notice of the changes by email to your primary email address. You may terminate your use of HRM SAAS Services by providing HRM SAAS notice by email within 30 days of being notified of the availability of the modified Privacy Policy Statement if the Privacy Policy Statement is modified in a manner that substantially affects your rights in connection with use of HRM SAAS Services. Your continued use of HRM SAAS Services after the effective date of any change to the Privacy Policy Statement will be deemed to be your agreement to the modified Privacy Policy Statement. You will not receive email notification of minor changes to the Privacy Policy Statement. If you are concerned about how your Personal Information is used, you should check back at our privacy policy periodically.\r\n\r\n                        <h5>Blogs and Forums</h5>\r\n\r\n                        We provide the capacity for users to post information in blogs and forums for sharing information in a public space on the website. This information is publicly available to all users of these forums and visitors to our website. We require registration to publish information, but given the public nature of both platforms, any Personal Information disclosed within these forums may be used to contact users with unsolicited messages. We encourage users to be cautious in disclosure of Personal Information in public forums as HRM SAAS is not responsible for the Personal Information users elect to disclose.\r\n                        <br/><br/>\r\n                        HRM SAAS also supports third party widgets such as Facebook and Twitter buttons on the website that allow users to share articles and other information on different platforms. These widgets may collect your IP address, which page you are visiting on our site, and may set a cookie to enable the widgets to function properly. These widgets do not collect or store any Personal Information from users on the website and simply act as a bridge for your convenience in sharing information. Your interactions with these widgets are governed by the privacy policy of the company providing it.\r\n\r\n                        <h5>END OF PRIVACY POLICY</h5>\r\n\r\n                        If you have any questions or concerns regarding this Privacy Policy Statement, please contact us at <a href=\"mailto:admin@example.com\">admin@example.com</a>. We shall respond to all inquiries within 30 days of receipt upon ascertaining your identity.', '2021-09-27 10:59:24', '2021-09-27 10:59:24'),
(3, 1, 'About Us', 'about-us', '<div class=\"col-sm-12\"><h2 class=\"main-heading sea-green\">Overview</h2><div class=\"page-content\"><p>Froiden is an outsourcing services provider for small and medium businesses, based in <a href=\"https://en.wikipedia.org/wiki/Jaipur\" target=\"_blank\" rel=\"noopener noreferrer\">Jaipur, Rajasthan</a>. It is a young company incorporated in the year 2014.</p><p>We exclusively focus on providing services related to web applications. We do have plans for expanding to other emerging domains in near future.</p><p>We are not limited to providing outsourcing services. We have equal focus on developing our own products. While our products also are web applications and supporting mobile applications, we do not focus on any particular subject or industry. Our products tend to provide solutions to common problems faced by people. We do not develop products if similar ones are already in the market, unless the existing products can be greatly improved upon.</p><br></div><h2 class=\"main-heading sea-green\">Difference Matters</h2><div class=\"page-content\"><p>While working with Froiden, one thing that you will experience the most is the difference from others in the way we work and see things, and why is this difference so important.</p><p>Even smallest of things done differently can result in exceptional outcomes. This is what drives us to do things the way we think is right, and not just going by the book. This leads to innovations you find at Froiden.</p></div><h2 class=\"main-heading sea-green\">More About Froiden</h2><div class=\"page-content\"><p>Here are some links to learn more about us:</p><ul><li><a href=\"/about/history\">History</a>: The story of Froiden - how it started and what lies ahead</li></ul></div><h2 class=\"main-heading sea-green\">The Road Ahead</h2><div class=\"page-content\"><p>At the time this site was published, Froiden was about to complete three years. It had lived the hardest period of a startup.</p><p>Our journey of three years has made us stronger and braver. Our team has grown to 14 members and together have achieved many milestones in terms of revenue.</p><p>Our goal for next few years is to take our products to new heights. To support that, we will keep growing our services business. We believe in <em>small team - big impact</em>, so we will expand our team to a limit.</p><p>Lastly, and obviously, we will keep working on new technologies and ideas, build new products, focus on innovation and build Froiden as a brand.</p></div></div>', '2021-09-27 10:59:24', '2021-09-27 10:59:24');
INSERT INTO `pages` (`id`, `language_id`, `title`, `slug`, `description`, `created_at`, `updated_at`) VALUES
(4, 2, 'Terms of Service', 'terms-of-service', ' THIS IS AN AGREEMENT BETWEEN YOU OR THE ENTITY THAT YOU REPRESENT (hereinafter \"You\" or \"Your\") AND HRM SAAS (hereinafter \"HRM SAAS\") GOVERNING YOUR USE OF TIME TRACKER SYSTEM – HRM (hereinafter the \"Software\").\r\n\r\n<h4>1. Acceptance of Terms</h4>\r\n\r\nThis Agreement consists of the following terms and conditions referred to as the \"Terms\". You must be of legal age to enter into a binding agreement in order to accept the Terms. If you do not agree to the Terms, do not use the Software. You can accept the Terms by checking a checkbox or clicking on a button indicating your acceptance of the terms or by actually using the Software.\r\n\r\n<h4>2. Description of Software</h4>\r\n\r\n{{ $setting->main_name }}, an HR Management solution. You may use the Software for your personal and business use or for internal business purpose in the organization that you represent. You may connect to the Software using any Internet browser supported by the Software. You are responsible for obtaining access to the Internet and the equipment necessary to use the Software. You can create and edit content with your user account and if you choose to do so, you can publish and share such content.\r\n\r\n<h4>3. Modification of Terms of Software</h4>\r\n\r\nWe may modify the Terms upon notice to you at any time through a service announcement or by sending email to your primary email address. If we make significant changes to the Terms that affect your rights, you will be provided with at least 30 days advance notice of the changes by email to your primary email address. You may terminate your use of the Software by providing HRM SAAS notice by email within 30 days of being notified of the availability of the modified Terms if the Terms are modified in a manner that substantially affects your rights in connection with use of the Software. In the event of such termination, you will be entitled to prorated refund of the unused portion of any prepaid fees. Your continued use of the Software after the effective date of any change to the Terms will be deemed to be your agreement to the modified Terms.\r\n\r\n<h4>4. User Sign up Obligations</h4>\r\n\r\nYou need to sign up for a user account by providing all required information in order to access or use the Software. If you represent an organization and wish to use the Software for corporate internal use, we recommend that you, and all other users from your organization, sign up for user accounts by providing your corporate contact information. In particular, we recommend that you use your corporate email address. You agree to: a) provide true, accurate, current and complete information about yourself as prompted by the sign-up process; and b) maintain and promptly update the information provided during sign up to keep it true, accurate, current, and complete. If you provide any information that is untrue, inaccurate, outdated, or incomplete, or if HRM SAAS has reasonable grounds to suspect that such information is untrue, inaccurate, outdated, or incomplete, HRM SAAS may terminate your user account and refuse current or future use of the Software.\r\n\r\n<h4>5. Organization Accounts and Administrators</h4>\r\n\r\nWhen you sign up for an account for your organization you may specify one or more administrators. The administrators will have the right to configure the Software based on your requirements and manage end users in your organization account. If your organization account is created and configured on your behalf by a third party, it is likely that such third party has assumed administrator role for your organization. Make sure that you enter into a suitable agreement with such third party specifying such party’s roles and restrictions as an administrator of your organization account. You are responsible for:\r\n<ol>\r\n<li>ensuring confidentiality of your organization account password,</li>\r\n<li>appointing competent individuals as administrators for managing your organization account, and</li>\r\n<li>ensuring that all activities that occur in connection with your organization account comply with this Agreement. You understand that HRM SAAS is not responsible for account administration and internal management of the Software for you.</li>\r\n</ol>\r\nYou are responsible for taking necessary steps for ensuring that your organization does not lose control of the administrator accounts. You may specify a process to be followed for recovering control in the event of such loss of control of the administrator accounts by sending an email to <a href=\"mailto:admin@example.com\">admin@example.com</a>, provided that the process is acceptable to HRM SAAS. In the absence of any specified administrator account recovery process, HRM SAAS may provide control of an administrator account to an individual providing proof satisfactory to HRM SAAS demonstrating authorization to act on behalf of the organization. You agree not to hold HRM SAAS liable for the consequences of any action taken by HRM SAAS in good faith in this regard.\r\n\r\n<h4>6. Self-Hosted Terms</h4>\r\n\r\n<h5>6.1 Your License Rights</h5>\r\n\r\nSubject to the terms and conditions of this Agreement, HRM SAAS grants you a non-exclusive, non-sublicensable and non-transferable license to install and use the Software during the applicable License Term in accordance with this Agreement.\r\n\r\n<h5>6.2 Number of Instances</h5>\r\n\r\nUnless otherwise specified in your Order, for each Software license that you purchase, you may install one instance of the Software on systems owned or operated by you (or your third party service providers so long as you remain responsible for their compliance with the terms and conditions of this Agreement).\r\n\r\n<h5>6.3 Your Modifications</h5>\r\n\r\nSubject to the terms and conditions of this Agreement:\r\n\r\n<ol>\r\n<li>for any elements of the Software provided by HRM SAAS in source code form, and to the extent permitted in the Documentation, you may modify such source code solely for purposes of developing bug fixes, customizations and additional features for the Software and</li>\r\n\r\n<li>you may also modify the Documentation to reflect your permitted modifications of the Software source code or the particular use of the Products within your organization.</li>\r\n</ol>\r\n\r\nAny modified source code or Documentation constitutes \"Your Modifications\". You may use Your Modifications solely with respect to your own instances in support of your permitted use of the Software but you may not distribute the code of Your Modifications to any third party. Notwithstanding anything in this Agreement to the contrary, HRM SAAS has no support, warranty, indemnification or other obligation or liability with respect to Your Modifications or their combination, interaction or use with our Products. You shall indemnify, defend and hold us harmless from and against any and all claims, costs, damages, losses, liabilities and expenses (including reasonable attorneys’ fees and costs) arising out of or in connection with any claim brought against us by a third party relating to Your Modifications (including but not limited to any representations or warranties you make about Your Modifications or the Software) or your breach of this Section 6.3. This indemnification obligation is subject to your receiving (i) prompt written notice of such claim (but in any event notice in sufficient time for you to respond without prejudice); (ii) the exclusive right to control and direct the investigation, defense, or settlement of such claim; and (iii) all reasonably necessary cooperation of HRM SAAS at your expense.\r\n\r\n<h5>6.4 Attribution</h5>\r\n\r\nIn any use of the Software, you must include the following attribution to HRM SAAS on all user interfaces in the following format: \"Powered by HRM SAAS\" which must in every case include a hyperlink to http://www.solutionrack.com, and which must be in the same format as delivered in the Software. If no such attribution is delivered with the Software, it is not required to include such attribution.\r\n\r\n<h5>6.5 Support</h5>\r\n\r\nThe support provided by HRM SAAS for self-hosted services is limited to the issues arising because of bugs in the Software delivered. It does not include (i) issues arising as a result of outdated software running on server on which you choose to install the Software (ii) issues arising as a result\r\n\r\nof Your Modifications as described in section 6.5 (iii) issues arising because server not meeting System Requirements for the Software.\r\n\r\n<h4>7. Personal Information and Privacy</h4>\r\n\r\nPersonal information you provide to HRM SAAS through the Software is governed by TIME TRACKER SYSTEM – HRM Privacy Policy. Your election to use the Software indicates your acceptance of the terms of the TIME TRACKER SYSTEM – HRM Privacy Policy. You are responsible for maintaining confidentiality of your username, password and other sensitive information. You are responsible for all activities that occur in your user account and you agree to inform us immediately of any unauthorized use of your user account by email to <a href=\"mailto:admin@example.com\">admin@example.com</a>. We are not responsible for any loss or damage to you or to any third party incurred as a result of any unauthorized access and/or use of your user account, or otherwise.\r\n\r\n<h4>8. Communications from HRM SAAS</h4>\r\n\r\nThe Software may include certain communications from HRM SAAS, such as service announcements, administrative messages and newsletters. You understand that these communications shall be considered part of using the Software. As part of our policy to provide you total privacy, we also provide you the option of opting out from receiving newsletters from us. However, you will not be able to opt-out from receiving service announcements and administrative messages.\r\n\r\n<h4>9. Complaints</h4>\r\n\r\nIf we receive a complaint from any person against you with respect to your activities as part of use of the Software, we will forward the complaint to the primary email address of your user account. You must respond to the complainant directly within 10 days of receiving the complaint forwarded by us and copy HRM SAAS in the communication. If you do not respond to the complainant within 10 days from the date of our email to you, we may disclose your name and contact information to the complainant for enabling the complainant to take legal action against you. You understand that your failure to respond to the forwarded complaint within the 10 days’ time limit will be construed as your consent to disclosure of your name and contact information by HRM SAAS to the complainant.\r\n\r\n<h4>10. Fees and Payments</h4>\r\n\r\nThe Software is available under monthly subscription plan. Your subscription can be automatically renewed at the end of each month unless you downgrade your paid subscription plan to a free plan or inform us that you do not wish to renew the subscription. If you do not wish to renew the subscription, you must inform us at least seven days prior to the renewal date. If you have not downgraded to a free plan and if you have not informed us that you do not wish to renew the subscription, you will be presumed to have authorized HRM SAAS to charge the subscription fee. From time to time, we may change the price of any Software or charge for use of Services that are currently available free of charge. Any increase in charges will not apply until the expiry of your then current billing cycle. You will not be charged for using any Software unless you have opted for a paid subscription plan.\r\n\r\n<h4>11. Restrictions on Use</h4>\r\n\r\nIn addition to all other terms and conditions of this Agreement, you shall not: (i) transfer the Software or otherwise make it available to any third party; (ii) provide any service based on the Software without prior written permission; (iii) use the third party links to sites without agreeing to their website terms & conditions; (iv) post links to third party sites or use their logo, company name, etc. without their prior written permission; (v) publish any personal or confidential information belonging to any person or entity without obtaining consent from such person or entity; (vi) use the Software in any manner that could damage, disable, overburden, impair or harm any server, network, computer system, resource of HRM SAAS; (vii) violate any applicable local, state, national or international law; and (viii) create a false identity to mislead any person as to the identity or origin of any communication.\r\n\r\n<h4>12. Spamming and Illegal Activities</h4>\r\n\r\nYou agree to be solely responsible for the contents of your transmissions through the Software. You agree not to use the Software for illegal purposes or for the transmission of material that is unlawful, defamatory, harassing, libelous, invasive of another\'s privacy, abusive, threatening, harmful, vulgar, pornographic, obscene, or is otherwise objectionable, offends religious sentiments, promotes racism, contains viruses or malicious code, or that which infringes or may infringe intellectual property or other rights of another. You agree not to use the Software for the transmission of \"junk mail\", \"spam\", \"chain letters\", \"phishing\" or unsolicited mass distribution of email. We reserve the right to terminate your access to the Software if there are reasonable grounds to believe that you have used the Software for any illegal or unauthorized activity.\r\n\r\n<h4>13. Inactive User Accounts Policy</h4>\r\n\r\n            We reserve the right to terminate unpaid user accounts that are inactive for a continuous period of 120 days. In the event of such termination, all data associated with such user account will be deleted. We will provide you prior notice of such termination and option to back-up your data. In case of accounts with more than one user, if at least one of the users is active, the account will not be considered inactive.\r\n\r\n<h4>14. Data Ownership</h4>\r\n\r\n            We respect your right to ownership of content created or stored by you. You own the content created or stored by you. Unless specifically permitted by you, your use of the Software does not grant HRM SAAS the license to use, reproduce, adapt, modify, publish or distribute the content created by you or stored in your user account for HRM SAAS\'s commercial, marketing or any similar purpose. But you grant HRM SAAS permission to access, copy, distribute, store, transmit, reformat, publicly display and publicly perform the content of your user account solely as required for the purpose of providing the Software to you.\r\n\r\n<h4>15. User Generated Content</h4>\r\n\r\nYou may transmit or publish content created by you using the Software or otherwise. However, you shall be solely responsible for such content and the consequences of its transmission or publication. Any content made public will be publicly accessible through the internet and may be crawled and indexed by search engines. You are responsible for ensuring that you do not accidentally make any private content publicly available. Any content that you may receive from other users of the Software, is provided to you AS IS for your information and personal use only and you agree not to use, copy, reproduce, distribute, transmit, broadcast, display, sell, license or otherwise exploit such content for any purpose, without the express written consent of the person who owns the rights to such content. In the course of using the Software, if you come across any content with copyright notice(s) or any copy protection feature(s), you agree not to remove such copyright notice(s) or disable such copy protection feature(s) as the case may be. By making any copyrighted/copyrightable content available on the Software you affirm that you have the consent, authorization or permission, as the case may be from every person who may claim any rights in such content to make such content available in such manner. Further, by making any content available in the manner aforementioned, you expressly agree that HRM SAAS will have the right to block access to or remove such content made available by you if HRM SAAS receives complaints\r\n\r\nconcerning any illegality or infringement of third party rights in such content. By using the Software and transmitting or publishing any content using such Software, you expressly consent to determination of questions of illegality or infringement of third party rights in such content by the agent designated by HRM SAAS for this purpose.\r\n\r\n<h4>16. Disclaimer of Warranties</h4>\r\n\r\nYOU EXPRESSLY UNDERSTAND AND AGREE THAT THE USE OF THE SERVICE IS AT YOUR SOLE RISK. THE SERVICES ARE PROVIDED ON AN AS-IS-AND-AS-AVAILABLE BASIS. HRM SAAS EXPRESSLY DISCLAIMS ALL WARRANTIES OF ANY KIND, WHETHER EXPRESS OR IMPLIED, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE. HRM SAAS MAKES NO WARRANTY THAT THE SERVICES WILL BE UNINTERRUPTED, TIMELY, SECURE, OR ERROR FREE. USE OF ANY MATERIAL DOWNLOADED OR OBTAINED THROUGH THE USE OF THE SERVICES SHALL BE AT YOUR OWN DISCRETION AND RISK AND YOU WILL BE SOLELY RESPONSIBLE FOR ANY DAMAGE TO YOUR COMPUTER SYSTEM, MOBILE TELEPHONE, WIRELESS DEVICE OR DATA THAT RESULTS FROM THE USE OF THE SERVICE OR THE DOWNLOAD OF ANY SUCH MATERIAL. NO ADVICE OR INFORMATION, WHETHER WRITTEN OR ORAL, OBTAINED BY YOU FROM HRM SAAS, ITS EMPLOYEES OR REPRESENTATIVES SHALL CREATE ANY WARRANTY NOT EXPRESSLY STATED IN THE TERMS.\r\n\r\n<h4>17. Limitation of Liability</h4>\r\n\r\nYOU AGREE THAT HRM SAAS SHALL, IN NO EVENT, BE LIABLE FOR ANY CONSEQUENTIAL, INCIDENTAL, INDIRECT, SPECIAL, PUNITIVE, OR OTHER LOSS OR DAMAGE WHATSOEVER OR FOR LOSS OF BUSINESS PROFITS, BUSINESS INTERRUPTION, COMPUTER FAILURE, LOSS OF BUSINESS INFORMATION, OR OTHER LOSS ARISING OUT OF OR CAUSED BY YOUR USE OF OR INABILITY TO USE THE SERVICE, EVEN IF HRM SAAS HAS BEEN ADVISED OF THE POSSIBILITY OF SUCH DAMAGE. IN NO EVENT SHALL HRM SAAS\'S ENTIRE LIABILITY TO YOU IN RESPECT OF THE SERVICE, WHETHER DIRECT OR INDIRECT, EXCEED THE FEES PAID BY YOU TOWARDS SUCH SERVICE.\r\n\r\n<h4>18. Indemnification</h4>\r\n\r\n            You agree to indemnify and hold harmless HRM SAAS, its officers, directors, employees, suppliers, and affiliates, from and against any losses, damages, fines and expenses (including attorney\'s fees and costs) arising out of or relating to any claims that you have used the Software in violation of another party\'s rights, in violation of any law, in violations of any provisions of the Terms, or any other claim related to your use of the Software, except where such use is authorized by HRM SAAS.\r\n\r\n<h4>19. Suspension and Termination</h4>\r\n\r\n            We may suspend your user account or temporarily disable access to whole or part of any Software in the event of any suspected illegal activity, extended periods of inactivity or requests by law enforcement or other government agencies. Objections to suspension or disabling of user accounts should be made to <a href=\"mailto:admin@example.com\">admin@example.com</a> within thirty days of being notified about the suspension. We may terminate a suspended or disabled user account after thirty days. We will also terminate your user account on your request. In addition, we reserve the right to terminate your user account and deny the Software upon reasonable belief that you have violated the Terms. You have the right to terminate your user account if HRM SAAS breaches its obligations under these Terms and in such event, you will be entitled to prorated refund of\r\n\r\naccess to the Software, deletion of information in your user account such as your email address and password and deletion of all data in your user account.\r\n\r\n<h4>20. END OF TERMS OF SERVICE</h4>\r\n\r\nIf you have any questions or concerns regarding this Agreement, please contact us at <a href=\"mailto:admin@example.com\">admin@example.com</a>.', '2021-09-27 10:59:27', '2021-09-27 10:59:27'),
(5, 2, 'Privacy Policy', 'privacy-policy', ' <h4>General</h4>\r\n\r\n                        At HRM SAAS, we respect your need for online privacy and protect any Personal Information that you may share with us, in an appropriate manner. Our practice with respect to use of your Personal Information is as set forth below in this Privacy Policy Statement. As a condition to use of HRM SAAS Services, you consent to the terms of the Privacy Policy Statement as it may be updated from time to time.\r\n\r\n                        <h4>Children\'s Online Privacy Protection</h4>\r\n\r\n                        HRM SAAS does not knowingly collect Personal Information from users who are under 13 years of age.\r\n\r\n                        <h4>Information Recorded and Use:</h4>\r\n\r\n                        <h5>Personal Information</h5>\r\n\r\n            During the Registration Process for creating a user account, we request for your name, email address and company name. You will also be asked to choose a password, which will be used solely for the purpose of providing access to your user account. Your name and email address will be used to inform you regarding new services, releases, upcoming events and changes in this Privacy Policy Statement.\r\n                        <br><br/>\r\n                        HRM SAAS will have access to third party personal information provided by you as part of using HRM SAAS Services. This information may include third party names, email addresses, phone numbers and physical addresses and will be used for servicing your requirements as expressed by you to HRM SAAS and solely as part and parcel of your use of HRM SAAS Services. We do not share this third party personal information with anyone for promotional purposes, nor do we utilize it for any purposes not expressly consented to by you. When you elect to refer friends to the website, we request their email address and name to facilitate the request and deliver a one time email. Your friend may contact us at <a href=\"mailto:admin@example.com\">admin@example.com</a> to request that we remove this information from our database.\r\n                        <br/><br/>\r\n                        We post user testimonials on our website. These testimonials may include names and other Personal Information and we acquire permission from our users prior to posting these on our website.\r\n                        <br/><br/>\r\n                        HRM SAAS is not responsible for the Personal Information users elect to post within their testimonials.\r\n\r\n                        <h5>Usage Details</h5>\r\n\r\n            Your usage details such as time, frequency, duration and pattern of use, features used and the amount of storage used will be recorded by us in order to enhance your experience of the HRM SAAS Services and to help us provide you the best possible service.\r\n\r\n                        <h5>Contents of your User Account</h5>\r\n\r\n            We store and maintain files, documents, emails and other data stored in your user account at servers provided by cloud services like Microsoft Azure. In order to prevent loss of data due to errors or system failures, we also keep backup copies of data including the contents of your user account. Hence your files and data may remain on our servers even after deletion or termination of your user account. We may retain and use your Personal Information and data as necessary to comply with our legal obligations, resolve disputes, and enforce our rights. We assure you that the contents of your user account will not be disclosed to anyone and will not be accessible even to employees of HRM SAAS except in circumstances specifically mentioned in this Privacy Policy Statement and Terms of Services. We also do not scan the contents of your user account for serving targeted advertisements.\r\n\r\n                        <h5>Payment Information</h5>\r\n\r\n            In case of services requiring payment, we request credit card or other payment account information, which will be used solely for processing payments. Your financial information will not be stored by us except for the name and address of the card holder, the expiry date and the last four digits of the Credit Card number. Subject to your prior consent and where necessary for processing future payments, your financial information will be stored in encrypted form on secure servers of our reputed Payment Gateway Service Provider who is beholden to treating your Personal Information in accordance with this Privacy Policy Statement.\r\n\r\n\r\n                        <h5>Behavioral Targeting/Re-Targeting</h5>\r\n\r\n                        We partner with third parties to manage our advertisements on other sites. Our third-party partners may use technologies such as cookies to gather information about your activities on this site and other sites in order to provide you advertising based upon your browsing activities and interests. If you wish to not have this information used for the purpose of serving you interest-based advertisements, you may opt-out by <a href=\"http://preferences-mgr.truste.com/\" target=\"_blank\">clicking here</a> (or if located in the European Union <a href=\"http://www.youronlinechoices.eu/\" _target=\"blank\">click here</a>). However, you will continue to receive generic advertisements on other websites that display advertisements.\r\n\r\n                        <h5>Links from our website</h5>\r\n\r\n                        Some pages of our website contain external links. You are advised to verify the privacy practices of such other websites. We are not responsible for the manner of use or misuse of information made available by you at such other websites. We encourage you not to provide Personal Information, without assuring yourselves of the Privacy Policy Statement of other websites.\r\n\r\n                        <h5>Federated Authentication</h5>\r\n\r\n                        You can log in to our site, if option available, using federated authentication providers such as Facebook Connect. These services will authenticate your identity and provide you the option to share certain Personal Information with us such as your name and email address to pre-populate our sign up form.\r\n\r\n                        <h5>With whom we share Information</h5>\r\n\r\n                        We may need to share your Personal Information and your data to our affiliates, resellers, service providers and business partners solely for the purpose of providing HRM SAAS Services to you. The purposes for which we may disclose your Personal Information or data to our service providers may include, but are not limited to, data storage, database management, web analytics and payment processing. These service providers are authorized to use your Personal Information or data only as necessary to provide these services to us. In such cases HRM SAAS will also ensure that such affiliates, resellers, service providers and business partners comply with this Privacy Policy Statement and adopt appropriate confidentiality and security measures. We will obtain your prior specific consent before we share your Personal Information or data to any person outside HRM SAAS for any purpose that is not directly connected with providing HRM SAAS Services to you. We will share your Personal Information with third parties only in the ways that are described in this Privacy Policy Statement. We do not sell your Personal Information to third parties. We may share generic aggregated demographic information not linked to any Personal Information regarding visitors and users with our business partners and advertisers. Please be aware that laws in various jurisdictions in which we operate may obligate us to disclose user information and the contents of your user account to the local law enforcement authorities under a legal process or an enforceable government request. In addition, we may also disclose Personal Information and contents of your user account to law enforcement authorities if such disclosure is determined to be necessary by HRM SAAS in our sole and absolute discretion for protecting the safety of our users, employees, or the general public. If HRM SAAS is involved in a merger, acquisition, or sale of all or a portion of its business or assets, you will be notified via email and/or a prominent notice on our website of any change in ownership or uses of your Personal Information, as well as any choices you may have regarding your Personal Information.\r\n\r\n                        <h5>How secure is your Information</h5>\r\n\r\n                        We adopt industry appropriate data collection, storage and processing practices and security measures, as well as physical security measures to protect against unauthorized access, alteration, disclosure or destruction of your Personal Information, username, password, transaction information and data stored in your user account. Access to your name and email address is restricted to our employees who need to know such information in connection with providing HRM SAAS Services to you and are bound by confidentiality obligations.\r\n\r\n                        <h5>Your Choice in Information Use</h5>\r\n\r\n                        In the event we decide to use your Personal Information for any purpose other than as stated in this Privacy Policy Statement, we will offer you an effective way to opt out of the use of your Personal Information for those other purposes. From time to time, we may send emails to you regarding new services, releases and upcoming events. You may opt out of receiving newsletters and other secondary messages from HRM SAAS by selecting the ‘unsubscribe’ function present in every email we send. However, you will continue to receive essential transactional emails.\r\n                        <br/><br/>\r\n                        Accessing, Updating and Removing Personal Information Users who wish to correct, update or remove any Personal Information including those from a public forum, directory or testimonial on our site may do so either by accessing their user account or by contacting HRM SAAS Customer Support Services at <a href=\"mailto:admin@example.com\">admin@example.com</a>. Such changes may take up to 48 hours to take effect. We respond to all enquiries within 30 days. Investigation of Illegal Activity We may need to provide access to your Personal Information and the contents of your user account to our employees and service providers for the purpose of investigating any suspected illegal activity or potential violation of the terms and conditions for use of HRM SAAS Services. However, HRM SAAS will ensure that such access is in compliance with this Privacy Policy Statement and subject to appropriate confidentiality and security measures.\r\n\r\n                        <h5>Enforcement of Privacy Policy</h5>\r\n\r\n                        We make every effort, including periodic reviews to ensure that Personal Information provided by you is used in conformity with this Privacy Policy Statement. If you have any concerns regarding our adherence to this Privacy Policy Statement or the manner in which Personal Information is used for the purpose of providing HRM SAAS Services, kindly contact HRM SAAS Customer Support Services at <a href=\"mailto:admin@example.com\">admin@example.com</a>. We will contact you to address your concerns and we will also co-operate with regulatory authorities in this regard if needed.\r\n\r\n                        <h5>Notification of Changes</h5>\r\n\r\n                        We may modify the Privacy Policy Statement upon notice to you at any time through a service announcement or by sending email to your primary email address. If we make significant changes in the Privacy Policy Statement that affect your rights, You will be provided with at least 30 days advance notice of the changes by email to your primary email address. You may terminate your use of HRM SAAS Services by providing HRM SAAS notice by email within 30 days of being notified of the availability of the modified Privacy Policy Statement if the Privacy Policy Statement is modified in a manner that substantially affects your rights in connection with use of HRM SAAS Services. Your continued use of HRM SAAS Services after the effective date of any change to the Privacy Policy Statement will be deemed to be your agreement to the modified Privacy Policy Statement. You will not receive email notification of minor changes to the Privacy Policy Statement. If you are concerned about how your Personal Information is used, you should check back at our privacy policy periodically.\r\n\r\n                        <h5>Blogs and Forums</h5>\r\n\r\n                        We provide the capacity for users to post information in blogs and forums for sharing information in a public space on the website. This information is publicly available to all users of these forums and visitors to our website. We require registration to publish information, but given the public nature of both platforms, any Personal Information disclosed within these forums may be used to contact users with unsolicited messages. We encourage users to be cautious in disclosure of Personal Information in public forums as HRM SAAS is not responsible for the Personal Information users elect to disclose.\r\n                        <br/><br/>\r\n                        HRM SAAS also supports third party widgets such as Facebook and Twitter buttons on the website that allow users to share articles and other information on different platforms. These widgets may collect your IP address, which page you are visiting on our site, and may set a cookie to enable the widgets to function properly. These widgets do not collect or store any Personal Information from users on the website and simply act as a bridge for your convenience in sharing information. Your interactions with these widgets are governed by the privacy policy of the company providing it.\r\n\r\n                        <h5>END OF PRIVACY POLICY</h5>\r\n\r\n                        If you have any questions or concerns regarding this Privacy Policy Statement, please contact us at <a href=\"mailto:admin@example.com\">admin@example.com</a>. We shall respond to all inquiries within 30 days of receipt upon ascertaining your identity.', '2021-09-27 10:59:27', '2021-09-27 10:59:27'),
(6, 2, 'About Us', 'about-us', '<div class=\"col-sm-12\"><h2 class=\"main-heading sea-green\">Overview</h2><div class=\"page-content\"><p>Froiden is an outsourcing services provider for small and medium businesses, based in <a href=\"https://en.wikipedia.org/wiki/Jaipur\" target=\"_blank\" rel=\"noopener noreferrer\">Jaipur, Rajasthan</a>. It is a young company incorporated in the year 2014.</p><p>We exclusively focus on providing services related to web applications. We do have plans for expanding to other emerging domains in near future.</p><p>We are not limited to providing outsourcing services. We have equal focus on developing our own products. While our products also are web applications and supporting mobile applications, we do not focus on any particular subject or industry. Our products tend to provide solutions to common problems faced by people. We do not develop products if similar ones are already in the market, unless the existing products can be greatly improved upon.</p><br></div><h2 class=\"main-heading sea-green\">Difference Matters</h2><div class=\"page-content\"><p>While working with Froiden, one thing that you will experience the most is the difference from others in the way we work and see things, and why is this difference so important.</p><p>Even smallest of things done differently can result in exceptional outcomes. This is what drives us to do things the way we think is right, and not just going by the book. This leads to innovations you find at Froiden.</p></div><h2 class=\"main-heading sea-green\">More About Froiden</h2><div class=\"page-content\"><p>Here are some links to learn more about us:</p><ul><li><a href=\"/about/history\">History</a>: The story of Froiden - how it started and what lies ahead</li></ul></div><h2 class=\"main-heading sea-green\">The Road Ahead</h2><div class=\"page-content\"><p>At the time this site was published, Froiden was about to complete three years. It had lived the hardest period of a startup.</p><p>Our journey of three years has made us stronger and braver. Our team has grown to 14 members and together have achieved many milestones in terms of revenue.</p><p>Our goal for next few years is to take our products to new heights. To support that, we will keep growing our services business. We believe in <em>small team - big impact</em>, so we will expand our team to a limit.</p><p>Lastly, and obviously, we will keep working on new technologies and ideas, build new products, focus on innovation and build Froiden as a brand.</p></div></div>', '2021-09-27 10:59:27', '2021-09-27 10:59:27');
INSERT INTO `pages` (`id`, `language_id`, `title`, `slug`, `description`, `created_at`, `updated_at`) VALUES
(7, 3, 'Terms of Service', 'terms-of-service', ' THIS IS AN AGREEMENT BETWEEN YOU OR THE ENTITY THAT YOU REPRESENT (hereinafter \"You\" or \"Your\") AND HRM SAAS (hereinafter \"HRM SAAS\") GOVERNING YOUR USE OF TIME TRACKER SYSTEM – HRM (hereinafter the \"Software\").\r\n\r\n<h4>1. Acceptance of Terms</h4>\r\n\r\nThis Agreement consists of the following terms and conditions referred to as the \"Terms\". You must be of legal age to enter into a binding agreement in order to accept the Terms. If you do not agree to the Terms, do not use the Software. You can accept the Terms by checking a checkbox or clicking on a button indicating your acceptance of the terms or by actually using the Software.\r\n\r\n<h4>2. Description of Software</h4>\r\n\r\n{{ $setting->main_name }}, an HR Management solution. You may use the Software for your personal and business use or for internal business purpose in the organization that you represent. You may connect to the Software using any Internet browser supported by the Software. You are responsible for obtaining access to the Internet and the equipment necessary to use the Software. You can create and edit content with your user account and if you choose to do so, you can publish and share such content.\r\n\r\n<h4>3. Modification of Terms of Software</h4>\r\n\r\nWe may modify the Terms upon notice to you at any time through a service announcement or by sending email to your primary email address. If we make significant changes to the Terms that affect your rights, you will be provided with at least 30 days advance notice of the changes by email to your primary email address. You may terminate your use of the Software by providing HRM SAAS notice by email within 30 days of being notified of the availability of the modified Terms if the Terms are modified in a manner that substantially affects your rights in connection with use of the Software. In the event of such termination, you will be entitled to prorated refund of the unused portion of any prepaid fees. Your continued use of the Software after the effective date of any change to the Terms will be deemed to be your agreement to the modified Terms.\r\n\r\n<h4>4. User Sign up Obligations</h4>\r\n\r\nYou need to sign up for a user account by providing all required information in order to access or use the Software. If you represent an organization and wish to use the Software for corporate internal use, we recommend that you, and all other users from your organization, sign up for user accounts by providing your corporate contact information. In particular, we recommend that you use your corporate email address. You agree to: a) provide true, accurate, current and complete information about yourself as prompted by the sign-up process; and b) maintain and promptly update the information provided during sign up to keep it true, accurate, current, and complete. If you provide any information that is untrue, inaccurate, outdated, or incomplete, or if HRM SAAS has reasonable grounds to suspect that such information is untrue, inaccurate, outdated, or incomplete, HRM SAAS may terminate your user account and refuse current or future use of the Software.\r\n\r\n<h4>5. Organization Accounts and Administrators</h4>\r\n\r\nWhen you sign up for an account for your organization you may specify one or more administrators. The administrators will have the right to configure the Software based on your requirements and manage end users in your organization account. If your organization account is created and configured on your behalf by a third party, it is likely that such third party has assumed administrator role for your organization. Make sure that you enter into a suitable agreement with such third party specifying such party’s roles and restrictions as an administrator of your organization account. You are responsible for:\r\n<ol>\r\n<li>ensuring confidentiality of your organization account password,</li>\r\n<li>appointing competent individuals as administrators for managing your organization account, and</li>\r\n<li>ensuring that all activities that occur in connection with your organization account comply with this Agreement. You understand that HRM SAAS is not responsible for account administration and internal management of the Software for you.</li>\r\n</ol>\r\nYou are responsible for taking necessary steps for ensuring that your organization does not lose control of the administrator accounts. You may specify a process to be followed for recovering control in the event of such loss of control of the administrator accounts by sending an email to <a href=\"mailto:admin@example.com\">admin@example.com</a>, provided that the process is acceptable to HRM SAAS. In the absence of any specified administrator account recovery process, HRM SAAS may provide control of an administrator account to an individual providing proof satisfactory to HRM SAAS demonstrating authorization to act on behalf of the organization. You agree not to hold HRM SAAS liable for the consequences of any action taken by HRM SAAS in good faith in this regard.\r\n\r\n<h4>6. Self-Hosted Terms</h4>\r\n\r\n<h5>6.1 Your License Rights</h5>\r\n\r\nSubject to the terms and conditions of this Agreement, HRM SAAS grants you a non-exclusive, non-sublicensable and non-transferable license to install and use the Software during the applicable License Term in accordance with this Agreement.\r\n\r\n<h5>6.2 Number of Instances</h5>\r\n\r\nUnless otherwise specified in your Order, for each Software license that you purchase, you may install one instance of the Software on systems owned or operated by you (or your third party service providers so long as you remain responsible for their compliance with the terms and conditions of this Agreement).\r\n\r\n<h5>6.3 Your Modifications</h5>\r\n\r\nSubject to the terms and conditions of this Agreement:\r\n\r\n<ol>\r\n<li>for any elements of the Software provided by HRM SAAS in source code form, and to the extent permitted in the Documentation, you may modify such source code solely for purposes of developing bug fixes, customizations and additional features for the Software and</li>\r\n\r\n<li>you may also modify the Documentation to reflect your permitted modifications of the Software source code or the particular use of the Products within your organization.</li>\r\n</ol>\r\n\r\nAny modified source code or Documentation constitutes \"Your Modifications\". You may use Your Modifications solely with respect to your own instances in support of your permitted use of the Software but you may not distribute the code of Your Modifications to any third party. Notwithstanding anything in this Agreement to the contrary, HRM SAAS has no support, warranty, indemnification or other obligation or liability with respect to Your Modifications or their combination, interaction or use with our Products. You shall indemnify, defend and hold us harmless from and against any and all claims, costs, damages, losses, liabilities and expenses (including reasonable attorneys’ fees and costs) arising out of or in connection with any claim brought against us by a third party relating to Your Modifications (including but not limited to any representations or warranties you make about Your Modifications or the Software) or your breach of this Section 6.3. This indemnification obligation is subject to your receiving (i) prompt written notice of such claim (but in any event notice in sufficient time for you to respond without prejudice); (ii) the exclusive right to control and direct the investigation, defense, or settlement of such claim; and (iii) all reasonably necessary cooperation of HRM SAAS at your expense.\r\n\r\n<h5>6.4 Attribution</h5>\r\n\r\nIn any use of the Software, you must include the following attribution to HRM SAAS on all user interfaces in the following format: \"Powered by HRM SAAS\" which must in every case include a hyperlink to http://www.solutionrack.com, and which must be in the same format as delivered in the Software. If no such attribution is delivered with the Software, it is not required to include such attribution.\r\n\r\n<h5>6.5 Support</h5>\r\n\r\nThe support provided by HRM SAAS for self-hosted services is limited to the issues arising because of bugs in the Software delivered. It does not include (i) issues arising as a result of outdated software running on server on which you choose to install the Software (ii) issues arising as a result\r\n\r\nof Your Modifications as described in section 6.5 (iii) issues arising because server not meeting System Requirements for the Software.\r\n\r\n<h4>7. Personal Information and Privacy</h4>\r\n\r\nPersonal information you provide to HRM SAAS through the Software is governed by TIME TRACKER SYSTEM – HRM Privacy Policy. Your election to use the Software indicates your acceptance of the terms of the TIME TRACKER SYSTEM – HRM Privacy Policy. You are responsible for maintaining confidentiality of your username, password and other sensitive information. You are responsible for all activities that occur in your user account and you agree to inform us immediately of any unauthorized use of your user account by email to <a href=\"mailto:admin@example.com\">admin@example.com</a>. We are not responsible for any loss or damage to you or to any third party incurred as a result of any unauthorized access and/or use of your user account, or otherwise.\r\n\r\n<h4>8. Communications from HRM SAAS</h4>\r\n\r\nThe Software may include certain communications from HRM SAAS, such as service announcements, administrative messages and newsletters. You understand that these communications shall be considered part of using the Software. As part of our policy to provide you total privacy, we also provide you the option of opting out from receiving newsletters from us. However, you will not be able to opt-out from receiving service announcements and administrative messages.\r\n\r\n<h4>9. Complaints</h4>\r\n\r\nIf we receive a complaint from any person against you with respect to your activities as part of use of the Software, we will forward the complaint to the primary email address of your user account. You must respond to the complainant directly within 10 days of receiving the complaint forwarded by us and copy HRM SAAS in the communication. If you do not respond to the complainant within 10 days from the date of our email to you, we may disclose your name and contact information to the complainant for enabling the complainant to take legal action against you. You understand that your failure to respond to the forwarded complaint within the 10 days’ time limit will be construed as your consent to disclosure of your name and contact information by HRM SAAS to the complainant.\r\n\r\n<h4>10. Fees and Payments</h4>\r\n\r\nThe Software is available under monthly subscription plan. Your subscription can be automatically renewed at the end of each month unless you downgrade your paid subscription plan to a free plan or inform us that you do not wish to renew the subscription. If you do not wish to renew the subscription, you must inform us at least seven days prior to the renewal date. If you have not downgraded to a free plan and if you have not informed us that you do not wish to renew the subscription, you will be presumed to have authorized HRM SAAS to charge the subscription fee. From time to time, we may change the price of any Software or charge for use of Services that are currently available free of charge. Any increase in charges will not apply until the expiry of your then current billing cycle. You will not be charged for using any Software unless you have opted for a paid subscription plan.\r\n\r\n<h4>11. Restrictions on Use</h4>\r\n\r\nIn addition to all other terms and conditions of this Agreement, you shall not: (i) transfer the Software or otherwise make it available to any third party; (ii) provide any service based on the Software without prior written permission; (iii) use the third party links to sites without agreeing to their website terms & conditions; (iv) post links to third party sites or use their logo, company name, etc. without their prior written permission; (v) publish any personal or confidential information belonging to any person or entity without obtaining consent from such person or entity; (vi) use the Software in any manner that could damage, disable, overburden, impair or harm any server, network, computer system, resource of HRM SAAS; (vii) violate any applicable local, state, national or international law; and (viii) create a false identity to mislead any person as to the identity or origin of any communication.\r\n\r\n<h4>12. Spamming and Illegal Activities</h4>\r\n\r\nYou agree to be solely responsible for the contents of your transmissions through the Software. You agree not to use the Software for illegal purposes or for the transmission of material that is unlawful, defamatory, harassing, libelous, invasive of another\'s privacy, abusive, threatening, harmful, vulgar, pornographic, obscene, or is otherwise objectionable, offends religious sentiments, promotes racism, contains viruses or malicious code, or that which infringes or may infringe intellectual property or other rights of another. You agree not to use the Software for the transmission of \"junk mail\", \"spam\", \"chain letters\", \"phishing\" or unsolicited mass distribution of email. We reserve the right to terminate your access to the Software if there are reasonable grounds to believe that you have used the Software for any illegal or unauthorized activity.\r\n\r\n<h4>13. Inactive User Accounts Policy</h4>\r\n\r\n            We reserve the right to terminate unpaid user accounts that are inactive for a continuous period of 120 days. In the event of such termination, all data associated with such user account will be deleted. We will provide you prior notice of such termination and option to back-up your data. In case of accounts with more than one user, if at least one of the users is active, the account will not be considered inactive.\r\n\r\n<h4>14. Data Ownership</h4>\r\n\r\n            We respect your right to ownership of content created or stored by you. You own the content created or stored by you. Unless specifically permitted by you, your use of the Software does not grant HRM SAAS the license to use, reproduce, adapt, modify, publish or distribute the content created by you or stored in your user account for HRM SAAS\'s commercial, marketing or any similar purpose. But you grant HRM SAAS permission to access, copy, distribute, store, transmit, reformat, publicly display and publicly perform the content of your user account solely as required for the purpose of providing the Software to you.\r\n\r\n<h4>15. User Generated Content</h4>\r\n\r\nYou may transmit or publish content created by you using the Software or otherwise. However, you shall be solely responsible for such content and the consequences of its transmission or publication. Any content made public will be publicly accessible through the internet and may be crawled and indexed by search engines. You are responsible for ensuring that you do not accidentally make any private content publicly available. Any content that you may receive from other users of the Software, is provided to you AS IS for your information and personal use only and you agree not to use, copy, reproduce, distribute, transmit, broadcast, display, sell, license or otherwise exploit such content for any purpose, without the express written consent of the person who owns the rights to such content. In the course of using the Software, if you come across any content with copyright notice(s) or any copy protection feature(s), you agree not to remove such copyright notice(s) or disable such copy protection feature(s) as the case may be. By making any copyrighted/copyrightable content available on the Software you affirm that you have the consent, authorization or permission, as the case may be from every person who may claim any rights in such content to make such content available in such manner. Further, by making any content available in the manner aforementioned, you expressly agree that HRM SAAS will have the right to block access to or remove such content made available by you if HRM SAAS receives complaints\r\n\r\nconcerning any illegality or infringement of third party rights in such content. By using the Software and transmitting or publishing any content using such Software, you expressly consent to determination of questions of illegality or infringement of third party rights in such content by the agent designated by HRM SAAS for this purpose.\r\n\r\n<h4>16. Disclaimer of Warranties</h4>\r\n\r\nYOU EXPRESSLY UNDERSTAND AND AGREE THAT THE USE OF THE SERVICE IS AT YOUR SOLE RISK. THE SERVICES ARE PROVIDED ON AN AS-IS-AND-AS-AVAILABLE BASIS. HRM SAAS EXPRESSLY DISCLAIMS ALL WARRANTIES OF ANY KIND, WHETHER EXPRESS OR IMPLIED, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE. HRM SAAS MAKES NO WARRANTY THAT THE SERVICES WILL BE UNINTERRUPTED, TIMELY, SECURE, OR ERROR FREE. USE OF ANY MATERIAL DOWNLOADED OR OBTAINED THROUGH THE USE OF THE SERVICES SHALL BE AT YOUR OWN DISCRETION AND RISK AND YOU WILL BE SOLELY RESPONSIBLE FOR ANY DAMAGE TO YOUR COMPUTER SYSTEM, MOBILE TELEPHONE, WIRELESS DEVICE OR DATA THAT RESULTS FROM THE USE OF THE SERVICE OR THE DOWNLOAD OF ANY SUCH MATERIAL. NO ADVICE OR INFORMATION, WHETHER WRITTEN OR ORAL, OBTAINED BY YOU FROM HRM SAAS, ITS EMPLOYEES OR REPRESENTATIVES SHALL CREATE ANY WARRANTY NOT EXPRESSLY STATED IN THE TERMS.\r\n\r\n<h4>17. Limitation of Liability</h4>\r\n\r\nYOU AGREE THAT HRM SAAS SHALL, IN NO EVENT, BE LIABLE FOR ANY CONSEQUENTIAL, INCIDENTAL, INDIRECT, SPECIAL, PUNITIVE, OR OTHER LOSS OR DAMAGE WHATSOEVER OR FOR LOSS OF BUSINESS PROFITS, BUSINESS INTERRUPTION, COMPUTER FAILURE, LOSS OF BUSINESS INFORMATION, OR OTHER LOSS ARISING OUT OF OR CAUSED BY YOUR USE OF OR INABILITY TO USE THE SERVICE, EVEN IF HRM SAAS HAS BEEN ADVISED OF THE POSSIBILITY OF SUCH DAMAGE. IN NO EVENT SHALL HRM SAAS\'S ENTIRE LIABILITY TO YOU IN RESPECT OF THE SERVICE, WHETHER DIRECT OR INDIRECT, EXCEED THE FEES PAID BY YOU TOWARDS SUCH SERVICE.\r\n\r\n<h4>18. Indemnification</h4>\r\n\r\n            You agree to indemnify and hold harmless HRM SAAS, its officers, directors, employees, suppliers, and affiliates, from and against any losses, damages, fines and expenses (including attorney\'s fees and costs) arising out of or relating to any claims that you have used the Software in violation of another party\'s rights, in violation of any law, in violations of any provisions of the Terms, or any other claim related to your use of the Software, except where such use is authorized by HRM SAAS.\r\n\r\n<h4>19. Suspension and Termination</h4>\r\n\r\n            We may suspend your user account or temporarily disable access to whole or part of any Software in the event of any suspected illegal activity, extended periods of inactivity or requests by law enforcement or other government agencies. Objections to suspension or disabling of user accounts should be made to <a href=\"mailto:admin@example.com\">admin@example.com</a> within thirty days of being notified about the suspension. We may terminate a suspended or disabled user account after thirty days. We will also terminate your user account on your request. In addition, we reserve the right to terminate your user account and deny the Software upon reasonable belief that you have violated the Terms. You have the right to terminate your user account if HRM SAAS breaches its obligations under these Terms and in such event, you will be entitled to prorated refund of\r\n\r\naccess to the Software, deletion of information in your user account such as your email address and password and deletion of all data in your user account.\r\n\r\n<h4>20. END OF TERMS OF SERVICE</h4>\r\n\r\nIf you have any questions or concerns regarding this Agreement, please contact us at <a href=\"mailto:admin@example.com\">admin@example.com</a>.', '2021-09-27 10:59:27', '2021-09-27 10:59:27'),
(8, 3, 'Privacy Policy', 'privacy-policy', ' <h4>General</h4>\r\n\r\n                        At HRM SAAS, we respect your need for online privacy and protect any Personal Information that you may share with us, in an appropriate manner. Our practice with respect to use of your Personal Information is as set forth below in this Privacy Policy Statement. As a condition to use of HRM SAAS Services, you consent to the terms of the Privacy Policy Statement as it may be updated from time to time.\r\n\r\n                        <h4>Children\'s Online Privacy Protection</h4>\r\n\r\n                        HRM SAAS does not knowingly collect Personal Information from users who are under 13 years of age.\r\n\r\n                        <h4>Information Recorded and Use:</h4>\r\n\r\n                        <h5>Personal Information</h5>\r\n\r\n            During the Registration Process for creating a user account, we request for your name, email address and company name. You will also be asked to choose a password, which will be used solely for the purpose of providing access to your user account. Your name and email address will be used to inform you regarding new services, releases, upcoming events and changes in this Privacy Policy Statement.\r\n                        <br><br/>\r\n                        HRM SAAS will have access to third party personal information provided by you as part of using HRM SAAS Services. This information may include third party names, email addresses, phone numbers and physical addresses and will be used for servicing your requirements as expressed by you to HRM SAAS and solely as part and parcel of your use of HRM SAAS Services. We do not share this third party personal information with anyone for promotional purposes, nor do we utilize it for any purposes not expressly consented to by you. When you elect to refer friends to the website, we request their email address and name to facilitate the request and deliver a one time email. Your friend may contact us at <a href=\"mailto:admin@example.com\">admin@example.com</a> to request that we remove this information from our database.\r\n                        <br/><br/>\r\n                        We post user testimonials on our website. These testimonials may include names and other Personal Information and we acquire permission from our users prior to posting these on our website.\r\n                        <br/><br/>\r\n                        HRM SAAS is not responsible for the Personal Information users elect to post within their testimonials.\r\n\r\n                        <h5>Usage Details</h5>\r\n\r\n            Your usage details such as time, frequency, duration and pattern of use, features used and the amount of storage used will be recorded by us in order to enhance your experience of the HRM SAAS Services and to help us provide you the best possible service.\r\n\r\n                        <h5>Contents of your User Account</h5>\r\n\r\n            We store and maintain files, documents, emails and other data stored in your user account at servers provided by cloud services like Microsoft Azure. In order to prevent loss of data due to errors or system failures, we also keep backup copies of data including the contents of your user account. Hence your files and data may remain on our servers even after deletion or termination of your user account. We may retain and use your Personal Information and data as necessary to comply with our legal obligations, resolve disputes, and enforce our rights. We assure you that the contents of your user account will not be disclosed to anyone and will not be accessible even to employees of HRM SAAS except in circumstances specifically mentioned in this Privacy Policy Statement and Terms of Services. We also do not scan the contents of your user account for serving targeted advertisements.\r\n\r\n                        <h5>Payment Information</h5>\r\n\r\n            In case of services requiring payment, we request credit card or other payment account information, which will be used solely for processing payments. Your financial information will not be stored by us except for the name and address of the card holder, the expiry date and the last four digits of the Credit Card number. Subject to your prior consent and where necessary for processing future payments, your financial information will be stored in encrypted form on secure servers of our reputed Payment Gateway Service Provider who is beholden to treating your Personal Information in accordance with this Privacy Policy Statement.\r\n\r\n\r\n                        <h5>Behavioral Targeting/Re-Targeting</h5>\r\n\r\n                        We partner with third parties to manage our advertisements on other sites. Our third-party partners may use technologies such as cookies to gather information about your activities on this site and other sites in order to provide you advertising based upon your browsing activities and interests. If you wish to not have this information used for the purpose of serving you interest-based advertisements, you may opt-out by <a href=\"http://preferences-mgr.truste.com/\" target=\"_blank\">clicking here</a> (or if located in the European Union <a href=\"http://www.youronlinechoices.eu/\" _target=\"blank\">click here</a>). However, you will continue to receive generic advertisements on other websites that display advertisements.\r\n\r\n                        <h5>Links from our website</h5>\r\n\r\n                        Some pages of our website contain external links. You are advised to verify the privacy practices of such other websites. We are not responsible for the manner of use or misuse of information made available by you at such other websites. We encourage you not to provide Personal Information, without assuring yourselves of the Privacy Policy Statement of other websites.\r\n\r\n                        <h5>Federated Authentication</h5>\r\n\r\n                        You can log in to our site, if option available, using federated authentication providers such as Facebook Connect. These services will authenticate your identity and provide you the option to share certain Personal Information with us such as your name and email address to pre-populate our sign up form.\r\n\r\n                        <h5>With whom we share Information</h5>\r\n\r\n                        We may need to share your Personal Information and your data to our affiliates, resellers, service providers and business partners solely for the purpose of providing HRM SAAS Services to you. The purposes for which we may disclose your Personal Information or data to our service providers may include, but are not limited to, data storage, database management, web analytics and payment processing. These service providers are authorized to use your Personal Information or data only as necessary to provide these services to us. In such cases HRM SAAS will also ensure that such affiliates, resellers, service providers and business partners comply with this Privacy Policy Statement and adopt appropriate confidentiality and security measures. We will obtain your prior specific consent before we share your Personal Information or data to any person outside HRM SAAS for any purpose that is not directly connected with providing HRM SAAS Services to you. We will share your Personal Information with third parties only in the ways that are described in this Privacy Policy Statement. We do not sell your Personal Information to third parties. We may share generic aggregated demographic information not linked to any Personal Information regarding visitors and users with our business partners and advertisers. Please be aware that laws in various jurisdictions in which we operate may obligate us to disclose user information and the contents of your user account to the local law enforcement authorities under a legal process or an enforceable government request. In addition, we may also disclose Personal Information and contents of your user account to law enforcement authorities if such disclosure is determined to be necessary by HRM SAAS in our sole and absolute discretion for protecting the safety of our users, employees, or the general public. If HRM SAAS is involved in a merger, acquisition, or sale of all or a portion of its business or assets, you will be notified via email and/or a prominent notice on our website of any change in ownership or uses of your Personal Information, as well as any choices you may have regarding your Personal Information.\r\n\r\n                        <h5>How secure is your Information</h5>\r\n\r\n                        We adopt industry appropriate data collection, storage and processing practices and security measures, as well as physical security measures to protect against unauthorized access, alteration, disclosure or destruction of your Personal Information, username, password, transaction information and data stored in your user account. Access to your name and email address is restricted to our employees who need to know such information in connection with providing HRM SAAS Services to you and are bound by confidentiality obligations.\r\n\r\n                        <h5>Your Choice in Information Use</h5>\r\n\r\n                        In the event we decide to use your Personal Information for any purpose other than as stated in this Privacy Policy Statement, we will offer you an effective way to opt out of the use of your Personal Information for those other purposes. From time to time, we may send emails to you regarding new services, releases and upcoming events. You may opt out of receiving newsletters and other secondary messages from HRM SAAS by selecting the ‘unsubscribe’ function present in every email we send. However, you will continue to receive essential transactional emails.\r\n                        <br/><br/>\r\n                        Accessing, Updating and Removing Personal Information Users who wish to correct, update or remove any Personal Information including those from a public forum, directory or testimonial on our site may do so either by accessing their user account or by contacting HRM SAAS Customer Support Services at <a href=\"mailto:admin@example.com\">admin@example.com</a>. Such changes may take up to 48 hours to take effect. We respond to all enquiries within 30 days. Investigation of Illegal Activity We may need to provide access to your Personal Information and the contents of your user account to our employees and service providers for the purpose of investigating any suspected illegal activity or potential violation of the terms and conditions for use of HRM SAAS Services. However, HRM SAAS will ensure that such access is in compliance with this Privacy Policy Statement and subject to appropriate confidentiality and security measures.\r\n\r\n                        <h5>Enforcement of Privacy Policy</h5>\r\n\r\n                        We make every effort, including periodic reviews to ensure that Personal Information provided by you is used in conformity with this Privacy Policy Statement. If you have any concerns regarding our adherence to this Privacy Policy Statement or the manner in which Personal Information is used for the purpose of providing HRM SAAS Services, kindly contact HRM SAAS Customer Support Services at <a href=\"mailto:admin@example.com\">admin@example.com</a>. We will contact you to address your concerns and we will also co-operate with regulatory authorities in this regard if needed.\r\n\r\n                        <h5>Notification of Changes</h5>\r\n\r\n                        We may modify the Privacy Policy Statement upon notice to you at any time through a service announcement or by sending email to your primary email address. If we make significant changes in the Privacy Policy Statement that affect your rights, You will be provided with at least 30 days advance notice of the changes by email to your primary email address. You may terminate your use of HRM SAAS Services by providing HRM SAAS notice by email within 30 days of being notified of the availability of the modified Privacy Policy Statement if the Privacy Policy Statement is modified in a manner that substantially affects your rights in connection with use of HRM SAAS Services. Your continued use of HRM SAAS Services after the effective date of any change to the Privacy Policy Statement will be deemed to be your agreement to the modified Privacy Policy Statement. You will not receive email notification of minor changes to the Privacy Policy Statement. If you are concerned about how your Personal Information is used, you should check back at our privacy policy periodically.\r\n\r\n                        <h5>Blogs and Forums</h5>\r\n\r\n                        We provide the capacity for users to post information in blogs and forums for sharing information in a public space on the website. This information is publicly available to all users of these forums and visitors to our website. We require registration to publish information, but given the public nature of both platforms, any Personal Information disclosed within these forums may be used to contact users with unsolicited messages. We encourage users to be cautious in disclosure of Personal Information in public forums as HRM SAAS is not responsible for the Personal Information users elect to disclose.\r\n                        <br/><br/>\r\n                        HRM SAAS also supports third party widgets such as Facebook and Twitter buttons on the website that allow users to share articles and other information on different platforms. These widgets may collect your IP address, which page you are visiting on our site, and may set a cookie to enable the widgets to function properly. These widgets do not collect or store any Personal Information from users on the website and simply act as a bridge for your convenience in sharing information. Your interactions with these widgets are governed by the privacy policy of the company providing it.\r\n\r\n                        <h5>END OF PRIVACY POLICY</h5>\r\n\r\n                        If you have any questions or concerns regarding this Privacy Policy Statement, please contact us at <a href=\"mailto:admin@example.com\">admin@example.com</a>. We shall respond to all inquiries within 30 days of receipt upon ascertaining your identity.', '2021-09-27 10:59:27', '2021-09-27 10:59:27'),
(9, 3, 'About Us', 'about-us', '<div class=\"col-sm-12\"><h2 class=\"main-heading sea-green\">Overview</h2><div class=\"page-content\"><p>Froiden is an outsourcing services provider for small and medium businesses, based in <a href=\"https://en.wikipedia.org/wiki/Jaipur\" target=\"_blank\" rel=\"noopener noreferrer\">Jaipur, Rajasthan</a>. It is a young company incorporated in the year 2014.</p><p>We exclusively focus on providing services related to web applications. We do have plans for expanding to other emerging domains in near future.</p><p>We are not limited to providing outsourcing services. We have equal focus on developing our own products. While our products also are web applications and supporting mobile applications, we do not focus on any particular subject or industry. Our products tend to provide solutions to common problems faced by people. We do not develop products if similar ones are already in the market, unless the existing products can be greatly improved upon.</p><br></div><h2 class=\"main-heading sea-green\">Difference Matters</h2><div class=\"page-content\"><p>While working with Froiden, one thing that you will experience the most is the difference from others in the way we work and see things, and why is this difference so important.</p><p>Even smallest of things done differently can result in exceptional outcomes. This is what drives us to do things the way we think is right, and not just going by the book. This leads to innovations you find at Froiden.</p></div><h2 class=\"main-heading sea-green\">More About Froiden</h2><div class=\"page-content\"><p>Here are some links to learn more about us:</p><ul><li><a href=\"/about/history\">History</a>: The story of Froiden - how it started and what lies ahead</li></ul></div><h2 class=\"main-heading sea-green\">The Road Ahead</h2><div class=\"page-content\"><p>At the time this site was published, Froiden was about to complete three years. It had lived the hardest period of a startup.</p><p>Our journey of three years has made us stronger and braver. Our team has grown to 14 members and together have achieved many milestones in terms of revenue.</p><p>Our goal for next few years is to take our products to new heights. To support that, we will keep growing our services business. We believe in <em>small team - big impact</em>, so we will expand our team to a limit.</p><p>Lastly, and obviously, we will keep working on new technologies and ideas, build new products, focus on innovation and build Froiden as a brand.</p></div></div>', '2021-09-27 10:59:27', '2021-09-27 10:59:27');
INSERT INTO `pages` (`id`, `language_id`, `title`, `slug`, `description`, `created_at`, `updated_at`) VALUES
(10, 4, 'Terms of Service', 'terms-of-service', ' THIS IS AN AGREEMENT BETWEEN YOU OR THE ENTITY THAT YOU REPRESENT (hereinafter \"You\" or \"Your\") AND HRM SAAS (hereinafter \"HRM SAAS\") GOVERNING YOUR USE OF TIME TRACKER SYSTEM – HRM (hereinafter the \"Software\").\r\n\r\n<h4>1. Acceptance of Terms</h4>\r\n\r\nThis Agreement consists of the following terms and conditions referred to as the \"Terms\". You must be of legal age to enter into a binding agreement in order to accept the Terms. If you do not agree to the Terms, do not use the Software. You can accept the Terms by checking a checkbox or clicking on a button indicating your acceptance of the terms or by actually using the Software.\r\n\r\n<h4>2. Description of Software</h4>\r\n\r\n{{ $setting->main_name }}, an HR Management solution. You may use the Software for your personal and business use or for internal business purpose in the organization that you represent. You may connect to the Software using any Internet browser supported by the Software. You are responsible for obtaining access to the Internet and the equipment necessary to use the Software. You can create and edit content with your user account and if you choose to do so, you can publish and share such content.\r\n\r\n<h4>3. Modification of Terms of Software</h4>\r\n\r\nWe may modify the Terms upon notice to you at any time through a service announcement or by sending email to your primary email address. If we make significant changes to the Terms that affect your rights, you will be provided with at least 30 days advance notice of the changes by email to your primary email address. You may terminate your use of the Software by providing HRM SAAS notice by email within 30 days of being notified of the availability of the modified Terms if the Terms are modified in a manner that substantially affects your rights in connection with use of the Software. In the event of such termination, you will be entitled to prorated refund of the unused portion of any prepaid fees. Your continued use of the Software after the effective date of any change to the Terms will be deemed to be your agreement to the modified Terms.\r\n\r\n<h4>4. User Sign up Obligations</h4>\r\n\r\nYou need to sign up for a user account by providing all required information in order to access or use the Software. If you represent an organization and wish to use the Software for corporate internal use, we recommend that you, and all other users from your organization, sign up for user accounts by providing your corporate contact information. In particular, we recommend that you use your corporate email address. You agree to: a) provide true, accurate, current and complete information about yourself as prompted by the sign-up process; and b) maintain and promptly update the information provided during sign up to keep it true, accurate, current, and complete. If you provide any information that is untrue, inaccurate, outdated, or incomplete, or if HRM SAAS has reasonable grounds to suspect that such information is untrue, inaccurate, outdated, or incomplete, HRM SAAS may terminate your user account and refuse current or future use of the Software.\r\n\r\n<h4>5. Organization Accounts and Administrators</h4>\r\n\r\nWhen you sign up for an account for your organization you may specify one or more administrators. The administrators will have the right to configure the Software based on your requirements and manage end users in your organization account. If your organization account is created and configured on your behalf by a third party, it is likely that such third party has assumed administrator role for your organization. Make sure that you enter into a suitable agreement with such third party specifying such party’s roles and restrictions as an administrator of your organization account. You are responsible for:\r\n<ol>\r\n<li>ensuring confidentiality of your organization account password,</li>\r\n<li>appointing competent individuals as administrators for managing your organization account, and</li>\r\n<li>ensuring that all activities that occur in connection with your organization account comply with this Agreement. You understand that HRM SAAS is not responsible for account administration and internal management of the Software for you.</li>\r\n</ol>\r\nYou are responsible for taking necessary steps for ensuring that your organization does not lose control of the administrator accounts. You may specify a process to be followed for recovering control in the event of such loss of control of the administrator accounts by sending an email to <a href=\"mailto:admin@example.com\">admin@example.com</a>, provided that the process is acceptable to HRM SAAS. In the absence of any specified administrator account recovery process, HRM SAAS may provide control of an administrator account to an individual providing proof satisfactory to HRM SAAS demonstrating authorization to act on behalf of the organization. You agree not to hold HRM SAAS liable for the consequences of any action taken by HRM SAAS in good faith in this regard.\r\n\r\n<h4>6. Self-Hosted Terms</h4>\r\n\r\n<h5>6.1 Your License Rights</h5>\r\n\r\nSubject to the terms and conditions of this Agreement, HRM SAAS grants you a non-exclusive, non-sublicensable and non-transferable license to install and use the Software during the applicable License Term in accordance with this Agreement.\r\n\r\n<h5>6.2 Number of Instances</h5>\r\n\r\nUnless otherwise specified in your Order, for each Software license that you purchase, you may install one instance of the Software on systems owned or operated by you (or your third party service providers so long as you remain responsible for their compliance with the terms and conditions of this Agreement).\r\n\r\n<h5>6.3 Your Modifications</h5>\r\n\r\nSubject to the terms and conditions of this Agreement:\r\n\r\n<ol>\r\n<li>for any elements of the Software provided by HRM SAAS in source code form, and to the extent permitted in the Documentation, you may modify such source code solely for purposes of developing bug fixes, customizations and additional features for the Software and</li>\r\n\r\n<li>you may also modify the Documentation to reflect your permitted modifications of the Software source code or the particular use of the Products within your organization.</li>\r\n</ol>\r\n\r\nAny modified source code or Documentation constitutes \"Your Modifications\". You may use Your Modifications solely with respect to your own instances in support of your permitted use of the Software but you may not distribute the code of Your Modifications to any third party. Notwithstanding anything in this Agreement to the contrary, HRM SAAS has no support, warranty, indemnification or other obligation or liability with respect to Your Modifications or their combination, interaction or use with our Products. You shall indemnify, defend and hold us harmless from and against any and all claims, costs, damages, losses, liabilities and expenses (including reasonable attorneys’ fees and costs) arising out of or in connection with any claim brought against us by a third party relating to Your Modifications (including but not limited to any representations or warranties you make about Your Modifications or the Software) or your breach of this Section 6.3. This indemnification obligation is subject to your receiving (i) prompt written notice of such claim (but in any event notice in sufficient time for you to respond without prejudice); (ii) the exclusive right to control and direct the investigation, defense, or settlement of such claim; and (iii) all reasonably necessary cooperation of HRM SAAS at your expense.\r\n\r\n<h5>6.4 Attribution</h5>\r\n\r\nIn any use of the Software, you must include the following attribution to HRM SAAS on all user interfaces in the following format: \"Powered by HRM SAAS\" which must in every case include a hyperlink to http://www.solutionrack.com, and which must be in the same format as delivered in the Software. If no such attribution is delivered with the Software, it is not required to include such attribution.\r\n\r\n<h5>6.5 Support</h5>\r\n\r\nThe support provided by HRM SAAS for self-hosted services is limited to the issues arising because of bugs in the Software delivered. It does not include (i) issues arising as a result of outdated software running on server on which you choose to install the Software (ii) issues arising as a result\r\n\r\nof Your Modifications as described in section 6.5 (iii) issues arising because server not meeting System Requirements for the Software.\r\n\r\n<h4>7. Personal Information and Privacy</h4>\r\n\r\nPersonal information you provide to HRM SAAS through the Software is governed by TIME TRACKER SYSTEM – HRM Privacy Policy. Your election to use the Software indicates your acceptance of the terms of the TIME TRACKER SYSTEM – HRM Privacy Policy. You are responsible for maintaining confidentiality of your username, password and other sensitive information. You are responsible for all activities that occur in your user account and you agree to inform us immediately of any unauthorized use of your user account by email to <a href=\"mailto:admin@example.com\">admin@example.com</a>. We are not responsible for any loss or damage to you or to any third party incurred as a result of any unauthorized access and/or use of your user account, or otherwise.\r\n\r\n<h4>8. Communications from HRM SAAS</h4>\r\n\r\nThe Software may include certain communications from HRM SAAS, such as service announcements, administrative messages and newsletters. You understand that these communications shall be considered part of using the Software. As part of our policy to provide you total privacy, we also provide you the option of opting out from receiving newsletters from us. However, you will not be able to opt-out from receiving service announcements and administrative messages.\r\n\r\n<h4>9. Complaints</h4>\r\n\r\nIf we receive a complaint from any person against you with respect to your activities as part of use of the Software, we will forward the complaint to the primary email address of your user account. You must respond to the complainant directly within 10 days of receiving the complaint forwarded by us and copy HRM SAAS in the communication. If you do not respond to the complainant within 10 days from the date of our email to you, we may disclose your name and contact information to the complainant for enabling the complainant to take legal action against you. You understand that your failure to respond to the forwarded complaint within the 10 days’ time limit will be construed as your consent to disclosure of your name and contact information by HRM SAAS to the complainant.\r\n\r\n<h4>10. Fees and Payments</h4>\r\n\r\nThe Software is available under monthly subscription plan. Your subscription can be automatically renewed at the end of each month unless you downgrade your paid subscription plan to a free plan or inform us that you do not wish to renew the subscription. If you do not wish to renew the subscription, you must inform us at least seven days prior to the renewal date. If you have not downgraded to a free plan and if you have not informed us that you do not wish to renew the subscription, you will be presumed to have authorized HRM SAAS to charge the subscription fee. From time to time, we may change the price of any Software or charge for use of Services that are currently available free of charge. Any increase in charges will not apply until the expiry of your then current billing cycle. You will not be charged for using any Software unless you have opted for a paid subscription plan.\r\n\r\n<h4>11. Restrictions on Use</h4>\r\n\r\nIn addition to all other terms and conditions of this Agreement, you shall not: (i) transfer the Software or otherwise make it available to any third party; (ii) provide any service based on the Software without prior written permission; (iii) use the third party links to sites without agreeing to their website terms & conditions; (iv) post links to third party sites or use their logo, company name, etc. without their prior written permission; (v) publish any personal or confidential information belonging to any person or entity without obtaining consent from such person or entity; (vi) use the Software in any manner that could damage, disable, overburden, impair or harm any server, network, computer system, resource of HRM SAAS; (vii) violate any applicable local, state, national or international law; and (viii) create a false identity to mislead any person as to the identity or origin of any communication.\r\n\r\n<h4>12. Spamming and Illegal Activities</h4>\r\n\r\nYou agree to be solely responsible for the contents of your transmissions through the Software. You agree not to use the Software for illegal purposes or for the transmission of material that is unlawful, defamatory, harassing, libelous, invasive of another\'s privacy, abusive, threatening, harmful, vulgar, pornographic, obscene, or is otherwise objectionable, offends religious sentiments, promotes racism, contains viruses or malicious code, or that which infringes or may infringe intellectual property or other rights of another. You agree not to use the Software for the transmission of \"junk mail\", \"spam\", \"chain letters\", \"phishing\" or unsolicited mass distribution of email. We reserve the right to terminate your access to the Software if there are reasonable grounds to believe that you have used the Software for any illegal or unauthorized activity.\r\n\r\n<h4>13. Inactive User Accounts Policy</h4>\r\n\r\n            We reserve the right to terminate unpaid user accounts that are inactive for a continuous period of 120 days. In the event of such termination, all data associated with such user account will be deleted. We will provide you prior notice of such termination and option to back-up your data. In case of accounts with more than one user, if at least one of the users is active, the account will not be considered inactive.\r\n\r\n<h4>14. Data Ownership</h4>\r\n\r\n            We respect your right to ownership of content created or stored by you. You own the content created or stored by you. Unless specifically permitted by you, your use of the Software does not grant HRM SAAS the license to use, reproduce, adapt, modify, publish or distribute the content created by you or stored in your user account for HRM SAAS\'s commercial, marketing or any similar purpose. But you grant HRM SAAS permission to access, copy, distribute, store, transmit, reformat, publicly display and publicly perform the content of your user account solely as required for the purpose of providing the Software to you.\r\n\r\n<h4>15. User Generated Content</h4>\r\n\r\nYou may transmit or publish content created by you using the Software or otherwise. However, you shall be solely responsible for such content and the consequences of its transmission or publication. Any content made public will be publicly accessible through the internet and may be crawled and indexed by search engines. You are responsible for ensuring that you do not accidentally make any private content publicly available. Any content that you may receive from other users of the Software, is provided to you AS IS for your information and personal use only and you agree not to use, copy, reproduce, distribute, transmit, broadcast, display, sell, license or otherwise exploit such content for any purpose, without the express written consent of the person who owns the rights to such content. In the course of using the Software, if you come across any content with copyright notice(s) or any copy protection feature(s), you agree not to remove such copyright notice(s) or disable such copy protection feature(s) as the case may be. By making any copyrighted/copyrightable content available on the Software you affirm that you have the consent, authorization or permission, as the case may be from every person who may claim any rights in such content to make such content available in such manner. Further, by making any content available in the manner aforementioned, you expressly agree that HRM SAAS will have the right to block access to or remove such content made available by you if HRM SAAS receives complaints\r\n\r\nconcerning any illegality or infringement of third party rights in such content. By using the Software and transmitting or publishing any content using such Software, you expressly consent to determination of questions of illegality or infringement of third party rights in such content by the agent designated by HRM SAAS for this purpose.\r\n\r\n<h4>16. Disclaimer of Warranties</h4>\r\n\r\nYOU EXPRESSLY UNDERSTAND AND AGREE THAT THE USE OF THE SERVICE IS AT YOUR SOLE RISK. THE SERVICES ARE PROVIDED ON AN AS-IS-AND-AS-AVAILABLE BASIS. HRM SAAS EXPRESSLY DISCLAIMS ALL WARRANTIES OF ANY KIND, WHETHER EXPRESS OR IMPLIED, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE. HRM SAAS MAKES NO WARRANTY THAT THE SERVICES WILL BE UNINTERRUPTED, TIMELY, SECURE, OR ERROR FREE. USE OF ANY MATERIAL DOWNLOADED OR OBTAINED THROUGH THE USE OF THE SERVICES SHALL BE AT YOUR OWN DISCRETION AND RISK AND YOU WILL BE SOLELY RESPONSIBLE FOR ANY DAMAGE TO YOUR COMPUTER SYSTEM, MOBILE TELEPHONE, WIRELESS DEVICE OR DATA THAT RESULTS FROM THE USE OF THE SERVICE OR THE DOWNLOAD OF ANY SUCH MATERIAL. NO ADVICE OR INFORMATION, WHETHER WRITTEN OR ORAL, OBTAINED BY YOU FROM HRM SAAS, ITS EMPLOYEES OR REPRESENTATIVES SHALL CREATE ANY WARRANTY NOT EXPRESSLY STATED IN THE TERMS.\r\n\r\n<h4>17. Limitation of Liability</h4>\r\n\r\nYOU AGREE THAT HRM SAAS SHALL, IN NO EVENT, BE LIABLE FOR ANY CONSEQUENTIAL, INCIDENTAL, INDIRECT, SPECIAL, PUNITIVE, OR OTHER LOSS OR DAMAGE WHATSOEVER OR FOR LOSS OF BUSINESS PROFITS, BUSINESS INTERRUPTION, COMPUTER FAILURE, LOSS OF BUSINESS INFORMATION, OR OTHER LOSS ARISING OUT OF OR CAUSED BY YOUR USE OF OR INABILITY TO USE THE SERVICE, EVEN IF HRM SAAS HAS BEEN ADVISED OF THE POSSIBILITY OF SUCH DAMAGE. IN NO EVENT SHALL HRM SAAS\'S ENTIRE LIABILITY TO YOU IN RESPECT OF THE SERVICE, WHETHER DIRECT OR INDIRECT, EXCEED THE FEES PAID BY YOU TOWARDS SUCH SERVICE.\r\n\r\n<h4>18. Indemnification</h4>\r\n\r\n            You agree to indemnify and hold harmless HRM SAAS, its officers, directors, employees, suppliers, and affiliates, from and against any losses, damages, fines and expenses (including attorney\'s fees and costs) arising out of or relating to any claims that you have used the Software in violation of another party\'s rights, in violation of any law, in violations of any provisions of the Terms, or any other claim related to your use of the Software, except where such use is authorized by HRM SAAS.\r\n\r\n<h4>19. Suspension and Termination</h4>\r\n\r\n            We may suspend your user account or temporarily disable access to whole or part of any Software in the event of any suspected illegal activity, extended periods of inactivity or requests by law enforcement or other government agencies. Objections to suspension or disabling of user accounts should be made to <a href=\"mailto:admin@example.com\">admin@example.com</a> within thirty days of being notified about the suspension. We may terminate a suspended or disabled user account after thirty days. We will also terminate your user account on your request. In addition, we reserve the right to terminate your user account and deny the Software upon reasonable belief that you have violated the Terms. You have the right to terminate your user account if HRM SAAS breaches its obligations under these Terms and in such event, you will be entitled to prorated refund of\r\n\r\naccess to the Software, deletion of information in your user account such as your email address and password and deletion of all data in your user account.\r\n\r\n<h4>20. END OF TERMS OF SERVICE</h4>\r\n\r\nIf you have any questions or concerns regarding this Agreement, please contact us at <a href=\"mailto:admin@example.com\">admin@example.com</a>.', '2021-09-27 10:59:27', '2021-09-27 10:59:27'),
(11, 4, 'Privacy Policy', 'privacy-policy', ' <h4>General</h4>\r\n\r\n                        At HRM SAAS, we respect your need for online privacy and protect any Personal Information that you may share with us, in an appropriate manner. Our practice with respect to use of your Personal Information is as set forth below in this Privacy Policy Statement. As a condition to use of HRM SAAS Services, you consent to the terms of the Privacy Policy Statement as it may be updated from time to time.\r\n\r\n                        <h4>Children\'s Online Privacy Protection</h4>\r\n\r\n                        HRM SAAS does not knowingly collect Personal Information from users who are under 13 years of age.\r\n\r\n                        <h4>Information Recorded and Use:</h4>\r\n\r\n                        <h5>Personal Information</h5>\r\n\r\n            During the Registration Process for creating a user account, we request for your name, email address and company name. You will also be asked to choose a password, which will be used solely for the purpose of providing access to your user account. Your name and email address will be used to inform you regarding new services, releases, upcoming events and changes in this Privacy Policy Statement.\r\n                        <br><br/>\r\n                        HRM SAAS will have access to third party personal information provided by you as part of using HRM SAAS Services. This information may include third party names, email addresses, phone numbers and physical addresses and will be used for servicing your requirements as expressed by you to HRM SAAS and solely as part and parcel of your use of HRM SAAS Services. We do not share this third party personal information with anyone for promotional purposes, nor do we utilize it for any purposes not expressly consented to by you. When you elect to refer friends to the website, we request their email address and name to facilitate the request and deliver a one time email. Your friend may contact us at <a href=\"mailto:admin@example.com\">admin@example.com</a> to request that we remove this information from our database.\r\n                        <br/><br/>\r\n                        We post user testimonials on our website. These testimonials may include names and other Personal Information and we acquire permission from our users prior to posting these on our website.\r\n                        <br/><br/>\r\n                        HRM SAAS is not responsible for the Personal Information users elect to post within their testimonials.\r\n\r\n                        <h5>Usage Details</h5>\r\n\r\n            Your usage details such as time, frequency, duration and pattern of use, features used and the amount of storage used will be recorded by us in order to enhance your experience of the HRM SAAS Services and to help us provide you the best possible service.\r\n\r\n                        <h5>Contents of your User Account</h5>\r\n\r\n            We store and maintain files, documents, emails and other data stored in your user account at servers provided by cloud services like Microsoft Azure. In order to prevent loss of data due to errors or system failures, we also keep backup copies of data including the contents of your user account. Hence your files and data may remain on our servers even after deletion or termination of your user account. We may retain and use your Personal Information and data as necessary to comply with our legal obligations, resolve disputes, and enforce our rights. We assure you that the contents of your user account will not be disclosed to anyone and will not be accessible even to employees of HRM SAAS except in circumstances specifically mentioned in this Privacy Policy Statement and Terms of Services. We also do not scan the contents of your user account for serving targeted advertisements.\r\n\r\n                        <h5>Payment Information</h5>\r\n\r\n            In case of services requiring payment, we request credit card or other payment account information, which will be used solely for processing payments. Your financial information will not be stored by us except for the name and address of the card holder, the expiry date and the last four digits of the Credit Card number. Subject to your prior consent and where necessary for processing future payments, your financial information will be stored in encrypted form on secure servers of our reputed Payment Gateway Service Provider who is beholden to treating your Personal Information in accordance with this Privacy Policy Statement.\r\n\r\n\r\n                        <h5>Behavioral Targeting/Re-Targeting</h5>\r\n\r\n                        We partner with third parties to manage our advertisements on other sites. Our third-party partners may use technologies such as cookies to gather information about your activities on this site and other sites in order to provide you advertising based upon your browsing activities and interests. If you wish to not have this information used for the purpose of serving you interest-based advertisements, you may opt-out by <a href=\"http://preferences-mgr.truste.com/\" target=\"_blank\">clicking here</a> (or if located in the European Union <a href=\"http://www.youronlinechoices.eu/\" _target=\"blank\">click here</a>). However, you will continue to receive generic advertisements on other websites that display advertisements.\r\n\r\n                        <h5>Links from our website</h5>\r\n\r\n                        Some pages of our website contain external links. You are advised to verify the privacy practices of such other websites. We are not responsible for the manner of use or misuse of information made available by you at such other websites. We encourage you not to provide Personal Information, without assuring yourselves of the Privacy Policy Statement of other websites.\r\n\r\n                        <h5>Federated Authentication</h5>\r\n\r\n                        You can log in to our site, if option available, using federated authentication providers such as Facebook Connect. These services will authenticate your identity and provide you the option to share certain Personal Information with us such as your name and email address to pre-populate our sign up form.\r\n\r\n                        <h5>With whom we share Information</h5>\r\n\r\n                        We may need to share your Personal Information and your data to our affiliates, resellers, service providers and business partners solely for the purpose of providing HRM SAAS Services to you. The purposes for which we may disclose your Personal Information or data to our service providers may include, but are not limited to, data storage, database management, web analytics and payment processing. These service providers are authorized to use your Personal Information or data only as necessary to provide these services to us. In such cases HRM SAAS will also ensure that such affiliates, resellers, service providers and business partners comply with this Privacy Policy Statement and adopt appropriate confidentiality and security measures. We will obtain your prior specific consent before we share your Personal Information or data to any person outside HRM SAAS for any purpose that is not directly connected with providing HRM SAAS Services to you. We will share your Personal Information with third parties only in the ways that are described in this Privacy Policy Statement. We do not sell your Personal Information to third parties. We may share generic aggregated demographic information not linked to any Personal Information regarding visitors and users with our business partners and advertisers. Please be aware that laws in various jurisdictions in which we operate may obligate us to disclose user information and the contents of your user account to the local law enforcement authorities under a legal process or an enforceable government request. In addition, we may also disclose Personal Information and contents of your user account to law enforcement authorities if such disclosure is determined to be necessary by HRM SAAS in our sole and absolute discretion for protecting the safety of our users, employees, or the general public. If HRM SAAS is involved in a merger, acquisition, or sale of all or a portion of its business or assets, you will be notified via email and/or a prominent notice on our website of any change in ownership or uses of your Personal Information, as well as any choices you may have regarding your Personal Information.\r\n\r\n                        <h5>How secure is your Information</h5>\r\n\r\n                        We adopt industry appropriate data collection, storage and processing practices and security measures, as well as physical security measures to protect against unauthorized access, alteration, disclosure or destruction of your Personal Information, username, password, transaction information and data stored in your user account. Access to your name and email address is restricted to our employees who need to know such information in connection with providing HRM SAAS Services to you and are bound by confidentiality obligations.\r\n\r\n                        <h5>Your Choice in Information Use</h5>\r\n\r\n                        In the event we decide to use your Personal Information for any purpose other than as stated in this Privacy Policy Statement, we will offer you an effective way to opt out of the use of your Personal Information for those other purposes. From time to time, we may send emails to you regarding new services, releases and upcoming events. You may opt out of receiving newsletters and other secondary messages from HRM SAAS by selecting the ‘unsubscribe’ function present in every email we send. However, you will continue to receive essential transactional emails.\r\n                        <br/><br/>\r\n                        Accessing, Updating and Removing Personal Information Users who wish to correct, update or remove any Personal Information including those from a public forum, directory or testimonial on our site may do so either by accessing their user account or by contacting HRM SAAS Customer Support Services at <a href=\"mailto:admin@example.com\">admin@example.com</a>. Such changes may take up to 48 hours to take effect. We respond to all enquiries within 30 days. Investigation of Illegal Activity We may need to provide access to your Personal Information and the contents of your user account to our employees and service providers for the purpose of investigating any suspected illegal activity or potential violation of the terms and conditions for use of HRM SAAS Services. However, HRM SAAS will ensure that such access is in compliance with this Privacy Policy Statement and subject to appropriate confidentiality and security measures.\r\n\r\n                        <h5>Enforcement of Privacy Policy</h5>\r\n\r\n                        We make every effort, including periodic reviews to ensure that Personal Information provided by you is used in conformity with this Privacy Policy Statement. If you have any concerns regarding our adherence to this Privacy Policy Statement or the manner in which Personal Information is used for the purpose of providing HRM SAAS Services, kindly contact HRM SAAS Customer Support Services at <a href=\"mailto:admin@example.com\">admin@example.com</a>. We will contact you to address your concerns and we will also co-operate with regulatory authorities in this regard if needed.\r\n\r\n                        <h5>Notification of Changes</h5>\r\n\r\n                        We may modify the Privacy Policy Statement upon notice to you at any time through a service announcement or by sending email to your primary email address. If we make significant changes in the Privacy Policy Statement that affect your rights, You will be provided with at least 30 days advance notice of the changes by email to your primary email address. You may terminate your use of HRM SAAS Services by providing HRM SAAS notice by email within 30 days of being notified of the availability of the modified Privacy Policy Statement if the Privacy Policy Statement is modified in a manner that substantially affects your rights in connection with use of HRM SAAS Services. Your continued use of HRM SAAS Services after the effective date of any change to the Privacy Policy Statement will be deemed to be your agreement to the modified Privacy Policy Statement. You will not receive email notification of minor changes to the Privacy Policy Statement. If you are concerned about how your Personal Information is used, you should check back at our privacy policy periodically.\r\n\r\n                        <h5>Blogs and Forums</h5>\r\n\r\n                        We provide the capacity for users to post information in blogs and forums for sharing information in a public space on the website. This information is publicly available to all users of these forums and visitors to our website. We require registration to publish information, but given the public nature of both platforms, any Personal Information disclosed within these forums may be used to contact users with unsolicited messages. We encourage users to be cautious in disclosure of Personal Information in public forums as HRM SAAS is not responsible for the Personal Information users elect to disclose.\r\n                        <br/><br/>\r\n                        HRM SAAS also supports third party widgets such as Facebook and Twitter buttons on the website that allow users to share articles and other information on different platforms. These widgets may collect your IP address, which page you are visiting on our site, and may set a cookie to enable the widgets to function properly. These widgets do not collect or store any Personal Information from users on the website and simply act as a bridge for your convenience in sharing information. Your interactions with these widgets are governed by the privacy policy of the company providing it.\r\n\r\n                        <h5>END OF PRIVACY POLICY</h5>\r\n\r\n                        If you have any questions or concerns regarding this Privacy Policy Statement, please contact us at <a href=\"mailto:admin@example.com\">admin@example.com</a>. We shall respond to all inquiries within 30 days of receipt upon ascertaining your identity.', '2021-09-27 10:59:27', '2021-09-27 10:59:27'),
(12, 4, 'About Us', 'about-us', '<div class=\"col-sm-12\"><h2 class=\"main-heading sea-green\">Overview</h2><div class=\"page-content\"><p>Froiden is an outsourcing services provider for small and medium businesses, based in <a href=\"https://en.wikipedia.org/wiki/Jaipur\" target=\"_blank\" rel=\"noopener noreferrer\">Jaipur, Rajasthan</a>. It is a young company incorporated in the year 2014.</p><p>We exclusively focus on providing services related to web applications. We do have plans for expanding to other emerging domains in near future.</p><p>We are not limited to providing outsourcing services. We have equal focus on developing our own products. While our products also are web applications and supporting mobile applications, we do not focus on any particular subject or industry. Our products tend to provide solutions to common problems faced by people. We do not develop products if similar ones are already in the market, unless the existing products can be greatly improved upon.</p><br></div><h2 class=\"main-heading sea-green\">Difference Matters</h2><div class=\"page-content\"><p>While working with Froiden, one thing that you will experience the most is the difference from others in the way we work and see things, and why is this difference so important.</p><p>Even smallest of things done differently can result in exceptional outcomes. This is what drives us to do things the way we think is right, and not just going by the book. This leads to innovations you find at Froiden.</p></div><h2 class=\"main-heading sea-green\">More About Froiden</h2><div class=\"page-content\"><p>Here are some links to learn more about us:</p><ul><li><a href=\"/about/history\">History</a>: The story of Froiden - how it started and what lies ahead</li></ul></div><h2 class=\"main-heading sea-green\">The Road Ahead</h2><div class=\"page-content\"><p>At the time this site was published, Froiden was about to complete three years. It had lived the hardest period of a startup.</p><p>Our journey of three years has made us stronger and braver. Our team has grown to 14 members and together have achieved many milestones in terms of revenue.</p><p>Our goal for next few years is to take our products to new heights. To support that, we will keep growing our services business. We believe in <em>small team - big impact</em>, so we will expand our team to a limit.</p><p>Lastly, and obviously, we will keep working on new technologies and ideas, build new products, focus on innovation and build Froiden as a brand.</p></div></div>', '2021-09-27 10:59:27', '2021-09-27 10:59:27');

-- --------------------------------------------------------

--
-- Table structure for table `payrolls`
--

CREATE TABLE `payrolls` (
  `id` int(10) UNSIGNED NOT NULL,
  `employee_id` int(10) UNSIGNED NOT NULL,
  `month` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `year` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `payment_mode` enum('cash','paypal','bank_transfer','cheque') COLLATE utf8_unicode_ci NOT NULL,
  `basic` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `overtime_hours` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `overtime_pay` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `allowances` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_allowance` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `deductions` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_deduction` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `additionals` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `total_additional` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `net_salary` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `pay_date` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expense` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `company_id` int(10) UNSIGNED NOT NULL,
  `status` enum('paid','unpaid') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'paid'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `payrolls`
--

INSERT INTO `payrolls` (`id`, `employee_id`, `month`, `year`, `payment_mode`, `basic`, `overtime_hours`, `overtime_pay`, `allowances`, `total_allowance`, `deductions`, `total_deduction`, `additionals`, `total_additional`, `net_salary`, `pay_date`, `created_at`, `updated_at`, `expense`, `company_id`, `status`) VALUES
(2, 1, '8', '2021', 'cash', '0', '27', '2025', '{\"Bonus\":\"0\"}', '0.00', '{\"Tax\":\"100\",\"PF\":\"50\"}', '150.00', '', '', '1875.00', '0000-00-00', '2021-09-27 11:19:25', '2021-09-27 11:19:25', '0', 1, 'paid'),
(3, 2, '8', '2021', 'cash', '6000', '18', '2700', '{\"Bonus\":\"0\"}', '0.00', '{\"IT Tax\":\"250\",\"PF\":\"800\"}', '1050.00', '', '', '7650.00', '0000-00-00', '2021-09-28 00:05:47', '2021-09-28 00:05:47', '0', 2, 'paid'),
(4, 1, '9', '2021', 'cash', '0', '0', '0', '{\"Bonus\":\"0\"}', '0.00', '[]', '0.00', '', '', '0.00', '0000-00-00', '2021-10-24 07:26:13', '2021-10-24 07:26:14', '0', 1, 'paid'),
(5, 1, '10', '2021', 'cash', '0', '0', '0', '{\"Bonus\":\"0\"}', '0.00', '[]', '0.00', '', '', '0.00', '0000-00-00', '2021-10-24 07:26:28', '2021-10-24 07:26:28', '0', 1, 'paid');

-- --------------------------------------------------------

--
-- Table structure for table `queued_jobs`
--

CREATE TABLE `queued_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8_unicode_ci NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `referral_member`
--

CREATE TABLE `referral_member` (
  `id` int(10) UNSIGNED NOT NULL,
  `referral_code` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `company_name` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `company_address` text COLLATE utf8_unicode_ci NOT NULL,
  `position` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `country` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `agreement` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `date_of_agreement` datetime NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` enum('active','inactive') COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `revisions`
--

CREATE TABLE `revisions` (
  `id` int(10) UNSIGNED NOT NULL,
  `revisionable_type` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `revisionable_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `key` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `old_value` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `new_value` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `salary`
--

CREATE TABLE `salary` (
  `id` int(10) UNSIGNED NOT NULL,
  `employee_id` int(10) UNSIGNED NOT NULL,
  `type` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `salary` double NOT NULL,
  `remarks` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `salary`
--

INSERT INTO `salary` (`id`, `employee_id`, `type`, `salary`, `remarks`, `created_at`, `updated_at`) VALUES
(2, 1, 'hourly_rate', 75, 'Hourly Rate', '2021-09-27 11:05:13', '2021-09-27 11:16:25'),
(3, 2, 'basic', 6000, 'Basic Salary', '2021-09-27 23:55:45', '2021-09-27 23:55:45'),
(4, 2, 'hourly_rate', 150, 'Hourly Rate', '2021-09-27 23:55:45', '2021-09-27 23:55:45'),
(5, 3, 'basic', 0, 'Basic Salary', '2021-10-30 04:46:34', '2021-10-30 04:46:34'),
(6, 3, 'hourly_rate', 0, 'Hourly Rate', '2021-10-30 04:46:34', '2021-10-30 04:46:34'),
(7, 4, 'basic', 0, 'Basic Salary', '2021-10-30 04:47:07', '2021-10-30 04:47:07'),
(8, 4, 'hourly_rate', 0, 'Hourly Rate', '2021-10-30 04:47:07', '2021-10-30 04:47:07');

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `main_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `logo` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `contact` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `admin_theme` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `locale` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'en',
  `status` enum('active','inactive') COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `stripe_key` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `stripe_secret` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `stripe_webhook_secret` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `stripe_status` tinyint(1) NOT NULL DEFAULT 1,
  `paypal_client_id` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `paypal_secret` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `paypal_status` tinyint(1) NOT NULL DEFAULT 1,
  `mail_driver` enum('smtp','mail') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'mail',
  `mail_host` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mail_port` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mail_username` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mail_password` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mail_encryption` enum('tls','ssl','') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `gdpr` tinyint(1) NOT NULL DEFAULT 0,
  `currency` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `currency_symbol` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `purchase_code` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `supported_until` timestamp NULL DEFAULT NULL,
  `verified` tinyint(1) NOT NULL DEFAULT 0,
  `cron_job_set` tinyint(1) NOT NULL DEFAULT 0,
  `system_update` tinyint(1) NOT NULL DEFAULT 1,
  `paypal_mode` enum('sandbox','live') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'sandbox',
  `show_review_modal` tinyint(1) NOT NULL DEFAULT 1,
  `mail_from_name` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mail_from_email` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `favicon` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `main_name`, `email`, `name`, `logo`, `address`, `contact`, `admin_theme`, `locale`, `status`, `created_at`, `updated_at`, `stripe_key`, `stripe_secret`, `stripe_webhook_secret`, `stripe_status`, `paypal_client_id`, `paypal_secret`, `paypal_status`, `mail_driver`, `mail_host`, `mail_port`, `mail_username`, `mail_password`, `mail_encryption`, `gdpr`, `currency`, `currency_symbol`, `purchase_code`, `supported_until`, `verified`, `cron_job_set`, `system_update`, `paypal_mode`, `show_review_modal`, `mail_from_name`, `mail_from_email`, `favicon`) VALUES
(1, 'HRM SAAS', 'admin@example.com', 'Administrator', NULL, '77849 George Knolls Suite 391\nPort Everette, IL 28094', '+2543666855107', 'blue', 'en', 'active', '2021-09-27 10:59:26', '2021-09-27 10:59:26', NULL, NULL, NULL, 1, NULL, NULL, 1, 'mail', NULL, NULL, NULL, NULL, '', 0, 'USD', '$', NULL, NULL, 0, 0, 1, 'sandbox', 1, 'HRM SAAS', 'admin@example.com', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `stripe_invoices`
--

CREATE TABLE `stripe_invoices` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED NOT NULL,
  `payment_method` enum('stripe','paypal') COLLATE utf8_unicode_ci NOT NULL,
  `invoice_id` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `subscription_plan_id` int(10) UNSIGNED NOT NULL,
  `transaction_id` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `amount` decimal(12,2) UNSIGNED NOT NULL,
  `pay_date` date NOT NULL,
  `next_pay_date` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `plan_id` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `billing_frequency` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `end_on` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `subscriptions`
--

CREATE TABLE `subscriptions` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `stripe_id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `stripe_plan` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `quantity` int(11) NOT NULL,
  `trial_ends_at` timestamp NULL DEFAULT NULL,
  `ends_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `stripe_status` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `subscription_plans`
--

CREATE TABLE `subscription_plans` (
  `id` int(10) UNSIGNED NOT NULL,
  `plan_name` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `start_user_count` int(11) NOT NULL,
  `end_user_count` int(11) NOT NULL,
  `monthly_price` double NOT NULL,
  `annual_price` double NOT NULL,
  `stripe_annual_plan_id` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `stripe_monthly_plan_id` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `subscription_plans`
--

INSERT INTO `subscription_plans` (`id`, `plan_name`, `start_user_count`, `end_user_count`, `monthly_price`, `annual_price`, `stripe_annual_plan_id`, `stripe_monthly_plan_id`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Basic', 0, 30, 0, 0, 'hrm_basic_plan_annual', 'hrm_basic_plan_monthly', 1, '2021-09-27 10:59:25', '2021-09-27 10:59:25'),
(2, 'Advanced', 31, 50, 25, 250, 'hrm_advanced_plan_annual', 'hrm_advanced_plan_montly', 1, '2021-09-27 10:59:25', '2021-09-27 10:59:25'),
(3, 'Premium', 51, 60, 100, 1000, 'hrm_premium_plan_annual', 'hrm_premium_plan_montly', 1, '2021-09-27 10:59:25', '2021-09-27 10:59:25');

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` int(10) UNSIGNED NOT NULL,
  `license_number` char(36) COLLATE utf8_unicode_ci DEFAULT NULL,
  `payment_id` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `payer_id` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `transaction_id` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `payer_email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `payment_method` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `payer_fname` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `payer_lname` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `currency_code` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `payment_status` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  `user_details` varchar(3000) COLLATE utf8_unicode_ci NOT NULL,
  `failure_data` varchar(3000) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `updates`
--

CREATE TABLE `updates` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `excerpt` text COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `status` enum('Unpublished','Published') COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `updates_read`
--

CREATE TABLE `updates_read` (
  `admin_id` int(10) UNSIGNED NOT NULL,
  `update_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admins_email_unique` (`email`),
  ADD KEY `admins_company_id_foreign` (`company_id`);

--
-- Indexes for table `attendance`
--
ALTER TABLE `attendance`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `attendance_employee_id_date_unique` (`employee_id`,`date`),
  ADD KEY `attendance_leavetype_index` (`leaveType`),
  ADD KEY `attendance_halfdaytype_index` (`halfDayType`),
  ADD KEY `attendance_last_updated_by_foreign` (`last_updated_by`);

--
-- Indexes for table `awards`
--
ALTER TABLE `awards`
  ADD PRIMARY KEY (`id`),
  ADD KEY `awards_company_id_foreign` (`company_id`),
  ADD KEY `awards_employee_id_foreign` (`employee_id`);

--
-- Indexes for table `bank_details`
--
ALTER TABLE `bank_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bank_details_employee_id_foreign` (`employee_id`);

--
-- Indexes for table `browse_history`
--
ALTER TABLE `browse_history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `browse_history_company_id_foreign` (`company_id`),
  ADD KEY `browse_history_admin_id_foreign` (`admin_id`);

--
-- Indexes for table `companies`
--
ALTER TABLE `companies`
  ADD PRIMARY KEY (`id`),
  ADD KEY `companies_subscription_plan_id_foreign` (`subscription_plan_id`);

--
-- Indexes for table `contact_requests`
--
ALTER TABLE `contact_requests`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`id_countries`);

--
-- Indexes for table `database_backups`
--
ALTER TABLE `database_backups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`id`),
  ADD KEY `department_company_id_foreign` (`company_id`);

--
-- Indexes for table `department_manager`
--
ALTER TABLE `department_manager`
  ADD PRIMARY KEY (`id`),
  ADD KEY `department_manager_department_id_foreign` (`department_id`),
  ADD KEY `department_manager_manager_id_foreign` (`manager_id`);

--
-- Indexes for table `designation`
--
ALTER TABLE `designation`
  ADD PRIMARY KEY (`id`),
  ADD KEY `designation_department_id_foreign` (`department_id`);

--
-- Indexes for table `email_templates`
--
ALTER TABLE `email_templates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `employees_email_unique` (`email`),
  ADD KEY `employees_designation_foreign` (`designation`),
  ADD KEY `employees_company_id_foreign` (`company_id`);

--
-- Indexes for table `employee_documents`
--
ALTER TABLE `employee_documents`
  ADD PRIMARY KEY (`id`),
  ADD KEY `employee_documents_employee_id_foreign` (`employee_id`);

--
-- Indexes for table `expenses`
--
ALTER TABLE `expenses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `expenses_company_id_foreign` (`company_id`),
  ADD KEY `expenses_employee_id_foreign` (`employee_id`);

--
-- Indexes for table `failed_records`
--
ALTER TABLE `failed_records`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `faq`
--
ALTER TABLE `faq`
  ADD PRIMARY KEY (`id`),
  ADD KEY `faq_faq_category_id_foreign` (`faq_category_id`);

--
-- Indexes for table `faq_category`
--
ALTER TABLE `faq_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `features`
--
ALTER TABLE `features`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `holidays`
--
ALTER TABLE `holidays`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `holidays_date_company_id_unique` (`date`,`company_id`),
  ADD KEY `holidays_company_id_foreign` (`company_id`);

--
-- Indexes for table `holidays_list`
--
ALTER TABLE `holidays_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `invoices`
--
ALTER TABLE `invoices`
  ADD PRIMARY KEY (`id`),
  ADD KEY `invoices_license_number_foreign` (`license_number`),
  ADD KEY `invoices_company_id_foreign` (`company_id`),
  ADD KEY `invoices_transaction_id_foreign` (`transaction_id`);

--
-- Indexes for table `invoice_items`
--
ALTER TABLE `invoice_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `invoice_items_invoice_id_foreign` (`invoice_id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_company_id_foreign` (`company_id`);

--
-- Indexes for table `job_applications`
--
ALTER TABLE `job_applications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `job_applications_company_id_foreign` (`company_id`),
  ADD KEY `job_applications_job_id_foreign` (`job_id`),
  ADD KEY `job_applications_submitted_by_foreign` (`submitted_by`);

--
-- Indexes for table `languages`
--
ALTER TABLE `languages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `leavetypes`
--
ALTER TABLE `leavetypes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `leavetypes_company_id_foreign` (`company_id`),
  ADD KEY `leavetypes_leavetype_index` (`leaveType`);

--
-- Indexes for table `leave_applications`
--
ALTER TABLE `leave_applications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `leave_applications_company_id_foreign` (`company_id`),
  ADD KEY `leave_applications_employee_id_foreign` (`employee_id`),
  ADD KEY `leave_applications_leavetype_index` (`leaveType`),
  ADD KEY `leave_applications_halfdaytype_index` (`halfDayType`),
  ADD KEY `leave_applications_last_updated_by_foreign` (`last_updated_by`);

--
-- Indexes for table `licenses`
--
ALTER TABLE `licenses`
  ADD PRIMARY KEY (`license_number`),
  ADD KEY `licenses_license_type_id_foreign` (`license_type_id`),
  ADD KEY `licenses_company_id_foreign` (`company_id`);

--
-- Indexes for table `license_country_pricing`
--
ALTER TABLE `license_country_pricing`
  ADD PRIMARY KEY (`id`),
  ADD KEY `license_country_pricing_license_type_id_foreign` (`license_type_id`);

--
-- Indexes for table `license_types`
--
ALTER TABLE `license_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ltm_translations`
--
ALTER TABLE `ltm_translations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `noticeboards`
--
ALTER TABLE `noticeboards`
  ADD PRIMARY KEY (`id`),
  ADD KEY `noticeboards_company_id_foreign` (`company_id`);

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pages_language_id_foreign` (`language_id`);

--
-- Indexes for table `payrolls`
--
ALTER TABLE `payrolls`
  ADD PRIMARY KEY (`id`),
  ADD KEY `payrolls_employee_id_foreign` (`employee_id`),
  ADD KEY `payrolls_company_id_foreign` (`company_id`);

--
-- Indexes for table `queued_jobs`
--
ALTER TABLE `queued_jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `queued_jobs_queue_reserved_reserved_at_index` (`queue`,`reserved`,`reserved_at`);

--
-- Indexes for table `referral_member`
--
ALTER TABLE `referral_member`
  ADD PRIMARY KEY (`id`),
  ADD KEY `referral_member_referral_code_index` (`referral_code`);

--
-- Indexes for table `revisions`
--
ALTER TABLE `revisions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `revisions_revisionable_id_revisionable_type_index` (`revisionable_id`,`revisionable_type`);

--
-- Indexes for table `salary`
--
ALTER TABLE `salary`
  ADD PRIMARY KEY (`id`),
  ADD KEY `salary_employee_id_foreign` (`employee_id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `stripe_invoices`
--
ALTER TABLE `stripe_invoices`
  ADD PRIMARY KEY (`id`),
  ADD KEY `stripe_invoices_company_id_foreign` (`company_id`),
  ADD KEY `stripe_invoices_subscription_plan_id_foreign` (`subscription_plan_id`);

--
-- Indexes for table `subscriptions`
--
ALTER TABLE `subscriptions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subscription_plans`
--
ALTER TABLE `subscription_plans`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transactions_license_number_foreign` (`license_number`);

--
-- Indexes for table `updates`
--
ALTER TABLE `updates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `updates_read`
--
ALTER TABLE `updates_read`
  ADD UNIQUE KEY `updates_read_admin_id_update_id_unique` (`admin_id`,`update_id`),
  ADD KEY `updates_read_update_id_foreign` (`update_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `attendance`
--
ALTER TABLE `attendance`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `awards`
--
ALTER TABLE `awards`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bank_details`
--
ALTER TABLE `bank_details`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `browse_history`
--
ALTER TABLE `browse_history`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=764;

--
-- AUTO_INCREMENT for table `companies`
--
ALTER TABLE `companies`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `contact_requests`
--
ALTER TABLE `contact_requests`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `countries`
--
ALTER TABLE `countries`
  MODIFY `id_countries` int(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=240;

--
-- AUTO_INCREMENT for table `database_backups`
--
ALTER TABLE `database_backups`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `department`
--
ALTER TABLE `department`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `department_manager`
--
ALTER TABLE `department_manager`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `designation`
--
ALTER TABLE `designation`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `email_templates`
--
ALTER TABLE `email_templates`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `employees`
--
ALTER TABLE `employees`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `employee_documents`
--
ALTER TABLE `employee_documents`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `expenses`
--
ALTER TABLE `expenses`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `failed_records`
--
ALTER TABLE `failed_records`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `faq`
--
ALTER TABLE `faq`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `faq_category`
--
ALTER TABLE `faq_category`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `features`
--
ALTER TABLE `features`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `holidays`
--
ALTER TABLE `holidays`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `holidays_list`
--
ALTER TABLE `holidays_list`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `invoices`
--
ALTER TABLE `invoices`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `invoice_items`
--
ALTER TABLE `invoice_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `job_applications`
--
ALTER TABLE `job_applications`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `languages`
--
ALTER TABLE `languages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `leavetypes`
--
ALTER TABLE `leavetypes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `leave_applications`
--
ALTER TABLE `leave_applications`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `license_country_pricing`
--
ALTER TABLE `license_country_pricing`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `license_types`
--
ALTER TABLE `license_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ltm_translations`
--
ALTER TABLE `ltm_translations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=108;

--
-- AUTO_INCREMENT for table `noticeboards`
--
ALTER TABLE `noticeboards`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `payrolls`
--
ALTER TABLE `payrolls`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `queued_jobs`
--
ALTER TABLE `queued_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `referral_member`
--
ALTER TABLE `referral_member`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `revisions`
--
ALTER TABLE `revisions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `salary`
--
ALTER TABLE `salary`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `stripe_invoices`
--
ALTER TABLE `stripe_invoices`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `subscriptions`
--
ALTER TABLE `subscriptions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `subscription_plans`
--
ALTER TABLE `subscription_plans`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `updates`
--
ALTER TABLE `updates`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `admins`
--
ALTER TABLE `admins`
  ADD CONSTRAINT `admins_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `attendance`
--
ALTER TABLE `attendance`
  ADD CONSTRAINT `attendance_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `attendance_last_updated_by_foreign` FOREIGN KEY (`last_updated_by`) REFERENCES `admins` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `awards`
--
ALTER TABLE `awards`
  ADD CONSTRAINT `awards_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `awards_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `bank_details`
--
ALTER TABLE `bank_details`
  ADD CONSTRAINT `bank_details_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `browse_history`
--
ALTER TABLE `browse_history`
  ADD CONSTRAINT `browse_history_admin_id_foreign` FOREIGN KEY (`admin_id`) REFERENCES `admins` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `browse_history_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `companies`
--
ALTER TABLE `companies`
  ADD CONSTRAINT `companies_subscription_plan_id_foreign` FOREIGN KEY (`subscription_plan_id`) REFERENCES `subscription_plans` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `department`
--
ALTER TABLE `department`
  ADD CONSTRAINT `department_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `department_manager`
--
ALTER TABLE `department_manager`
  ADD CONSTRAINT `department_manager_department_id_foreign` FOREIGN KEY (`department_id`) REFERENCES `department` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `department_manager_manager_id_foreign` FOREIGN KEY (`manager_id`) REFERENCES `admins` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `designation`
--
ALTER TABLE `designation`
  ADD CONSTRAINT `designation_department_id_foreign` FOREIGN KEY (`department_id`) REFERENCES `department` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `employees`
--
ALTER TABLE `employees`
  ADD CONSTRAINT `employees_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `employees_designation_foreign` FOREIGN KEY (`designation`) REFERENCES `designation` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `employee_documents`
--
ALTER TABLE `employee_documents`
  ADD CONSTRAINT `employee_documents_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `expenses`
--
ALTER TABLE `expenses`
  ADD CONSTRAINT `expenses_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `expenses_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `faq`
--
ALTER TABLE `faq`
  ADD CONSTRAINT `faq_faq_category_id_foreign` FOREIGN KEY (`faq_category_id`) REFERENCES `faq_category` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `holidays`
--
ALTER TABLE `holidays`
  ADD CONSTRAINT `holidays_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `invoices`
--
ALTER TABLE `invoices`
  ADD CONSTRAINT `invoices_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `invoices_license_number_foreign` FOREIGN KEY (`license_number`) REFERENCES `licenses` (`license_number`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `invoices_transaction_id_foreign` FOREIGN KEY (`transaction_id`) REFERENCES `transactions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `invoice_items`
--
ALTER TABLE `invoice_items`
  ADD CONSTRAINT `invoice_items_invoice_id_foreign` FOREIGN KEY (`invoice_id`) REFERENCES `invoices` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `jobs`
--
ALTER TABLE `jobs`
  ADD CONSTRAINT `jobs_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `job_applications`
--
ALTER TABLE `job_applications`
  ADD CONSTRAINT `job_applications_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `job_applications_job_id_foreign` FOREIGN KEY (`job_id`) REFERENCES `jobs` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `job_applications_submitted_by_foreign` FOREIGN KEY (`submitted_by`) REFERENCES `employees` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `leavetypes`
--
ALTER TABLE `leavetypes`
  ADD CONSTRAINT `leavetypes_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `leave_applications`
--
ALTER TABLE `leave_applications`
  ADD CONSTRAINT `leave_applications_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `leave_applications_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `leave_applications_last_updated_by_foreign` FOREIGN KEY (`last_updated_by`) REFERENCES `admins` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `licenses`
--
ALTER TABLE `licenses`
  ADD CONSTRAINT `licenses_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE SET NULL ON UPDATE SET NULL,
  ADD CONSTRAINT `licenses_license_type_id_foreign` FOREIGN KEY (`license_type_id`) REFERENCES `license_types` (`id`);

--
-- Constraints for table `license_country_pricing`
--
ALTER TABLE `license_country_pricing`
  ADD CONSTRAINT `license_country_pricing_license_type_id_foreign` FOREIGN KEY (`license_type_id`) REFERENCES `license_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `noticeboards`
--
ALTER TABLE `noticeboards`
  ADD CONSTRAINT `noticeboards_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `pages`
--
ALTER TABLE `pages`
  ADD CONSTRAINT `pages_language_id_foreign` FOREIGN KEY (`language_id`) REFERENCES `languages` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `payrolls`
--
ALTER TABLE `payrolls`
  ADD CONSTRAINT `payrolls_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `payrolls_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `salary`
--
ALTER TABLE `salary`
  ADD CONSTRAINT `salary_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `stripe_invoices`
--
ALTER TABLE `stripe_invoices`
  ADD CONSTRAINT `stripe_invoices_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `stripe_invoices_subscription_plan_id_foreign` FOREIGN KEY (`subscription_plan_id`) REFERENCES `subscription_plans` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `transactions`
--
ALTER TABLE `transactions`
  ADD CONSTRAINT `transactions_license_number_foreign` FOREIGN KEY (`license_number`) REFERENCES `licenses` (`license_number`) ON DELETE SET NULL ON UPDATE SET NULL;

--
-- Constraints for table `updates_read`
--
ALTER TABLE `updates_read`
  ADD CONSTRAINT `updates_read_admin_id_foreign` FOREIGN KEY (`admin_id`) REFERENCES `admins` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `updates_read_update_id_foreign` FOREIGN KEY (`update_id`) REFERENCES `updates` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
