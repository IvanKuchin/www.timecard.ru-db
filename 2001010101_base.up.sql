-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jun 03, 2022 at 09:51 PM
-- Server version: 5.7.33-0ubuntu0.16.04.1
-- PHP Version: 7.0.33-0ubuntu0.16.04.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `test`
--

-- --------------------------------------------------------

--
-- Table structure for table `absence`
--

CREATE TABLE `absence` (
  `id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  `absence_type_id` int(11) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `comment` varchar(1024) NOT NULL DEFAULT '',
  `request_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `absence_types`
--

CREATE TABLE `absence_types` (
  `id` int(11) NOT NULL,
  `title` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `action_category`
--

CREATE TABLE `action_category` (
  `id` int(11) NOT NULL,
  `title` varchar(256) NOT NULL,
  `title_male` varchar(256) NOT NULL,
  `title_female` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `action_types`
--

CREATE TABLE `action_types` (
  `id` int(11) NOT NULL,
  `categoryID` int(3) NOT NULL,
  `title` varchar(256) NOT NULL,
  `title_male` varchar(256) NOT NULL,
  `title_female` varchar(256) NOT NULL,
  `isShowFeed` int(1) NOT NULL,
  `isShowNotification` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `activators`
--

CREATE TABLE `activators` (
  `id` varchar(50) NOT NULL DEFAULT '',
  `user` varchar(64) NOT NULL DEFAULT '',
  `type` enum('regNewUser','password_recovery') NOT NULL,
  `date` datetime NOT NULL DEFAULT '2000-01-01 00:00:00'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `airfare_limits_by_direction`
--

CREATE TABLE `airfare_limits_by_direction` (
  `id` int(11) NOT NULL,
  `from` int(11) NOT NULL,
  `to` int(11) NOT NULL,
  `limit` int(11) NOT NULL,
  `agency_company_id` int(11) NOT NULL,
  `creator_user_id` int(11) NOT NULL,
  `eventTimestamp` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `airlines`
--

CREATE TABLE `airlines` (
  `id` int(11) NOT NULL,
  `code` varchar(2) NOT NULL,
  `description_rus` varchar(128) NOT NULL DEFAULT '',
  `description_eng` varchar(128) NOT NULL,
  `country` varchar(128) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `airline_bookings`
--

CREATE TABLE `airline_bookings` (
  `id` int(11) NOT NULL,
  `contract_sow_id` int(11) NOT NULL,
  `search_id` varchar(64) NOT NULL,
  `search_trip_id` varchar(64) NOT NULL,
  `search_fare_id` varchar(64) NOT NULL,
  `passport_type` enum('foreign_passport','domestic_passport') NOT NULL DEFAULT 'foreign_passport',
  `trip_id` varchar(64) NOT NULL DEFAULT '',
  `destination` varchar(64) NOT NULL DEFAULT '',
  `checkin` varchar(64) NOT NULL DEFAULT '',
  `checkout` varchar(64) NOT NULL DEFAULT '',
  `amount` float NOT NULL DEFAULT '0',
  `book_date` varchar(64) NOT NULL DEFAULT '',
  `status` enum('done','pending','failed') NOT NULL DEFAULT 'pending',
  `voucher_filename` varchar(64) NOT NULL DEFAULT '',
  `eventTimestamp` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `airports`
--

CREATE TABLE `airports` (
  `id` int(11) NOT NULL,
  `city_name` varchar(64) NOT NULL,
  `airport_code` varchar(8) NOT NULL,
  `airport_name` varchar(64) NOT NULL,
  `airport_country_id` int(11) NOT NULL,
  `world_area_code` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Stand-in structure for view `airports_view`
--
CREATE TABLE `airports_view` (
`id` int(11)
,`city_name` varchar(64)
,`airport_code` varchar(8)
,`airport_name` varchar(64)
,`world_area_code` int(11)
,`country_name` varchar(64)
);

-- --------------------------------------------------------

--
-- Table structure for table `airport_countries`
--

CREATE TABLE `airport_countries` (
  `id` int(11) NOT NULL,
  `title` varchar(64) NOT NULL,
  `abbrev` varchar(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `banks`
--

CREATE TABLE `banks` (
  `id` int(11) NOT NULL,
  `title` varchar(256) NOT NULL,
  `bik` varchar(16) NOT NULL,
  `account` varchar(64) NOT NULL,
  `geo_zip_id` int(11) DEFAULT '29817',
  `address` varchar(256) NOT NULL DEFAULT '',
  `phone` varchar(256) NOT NULL DEFAULT '',
  `okato` varchar(16) NOT NULL DEFAULT '',
  `okpo` varchar(16) NOT NULL DEFAULT '',
  `regnum` varchar(16) NOT NULL DEFAULT '',
  `srok` varchar(16) NOT NULL DEFAULT '' COMMENT 'dokuments handling period'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `bt`
--

CREATE TABLE `bt` (
  `id` int(11) NOT NULL,
  `contract_sow_id` int(11) NOT NULL,
  `date_start` date NOT NULL,
  `date_end` date NOT NULL,
  `customer_id` int(11) NOT NULL,
  `place` varchar(256) NOT NULL,
  `purpose` varchar(256) NOT NULL,
  `status` enum('saved','submit','approved','pending_approve','rejected') NOT NULL DEFAULT 'saved',
  `submit_date` int(11) NOT NULL DEFAULT '0',
  `approve_date` int(11) NOT NULL DEFAULT '0',
  `payed_date` int(11) NOT NULL DEFAULT '0',
  `expected_pay_date` int(11) NOT NULL DEFAULT '0',
  `originals_received_date` int(11) NOT NULL DEFAULT '0',
  `invoice_filename` varchar(128) NOT NULL DEFAULT '',
  `invoice_id` int(11) NOT NULL,
  `eventTimestamp` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `bt_allowance`
--

CREATE TABLE `bt_allowance` (
  `id` int(11) NOT NULL,
  `agency_company_id` int(11) NOT NULL,
  `geo_country_id` int(11) NOT NULL,
  `amount` float NOT NULL,
  `eventTimestamp` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `bt_approvals`
--

CREATE TABLE `bt_approvals` (
  `id` int(11) NOT NULL,
  `bt_id` int(11) NOT NULL,
  `approver_id` int(11) NOT NULL,
  `decision` enum('approved','rejected','pending','submit') NOT NULL DEFAULT 'pending',
  `comment` varchar(512) NOT NULL,
  `eventTimestamp` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Stand-in structure for view `bt_approvals_view`
--
CREATE TABLE `bt_approvals_view` (
`bt_approvers_id` int(11)
,`bt_approvals_eventTimestamp` int(11)
,`bt_approvals_bt_id` int(11)
,`bt_approvers_approver_order` int(11)
);

-- --------------------------------------------------------

--
-- Table structure for table `bt_approvers`
--

CREATE TABLE `bt_approvers` (
  `id` int(11) NOT NULL,
  `approver_user_id` int(11) NOT NULL,
  `contract_psow_id` int(11) NOT NULL,
  `approver_order` int(11) NOT NULL,
  `auto_approve` enum('Y','N') NOT NULL DEFAULT 'N',
  `type` enum('service','business travel') NOT NULL DEFAULT 'business travel',
  `rate` enum('subcontractor','agency') NOT NULL DEFAULT 'subcontractor'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `bt_approvers_backup`
--

CREATE TABLE `bt_approvers_backup` (
  `id` int(11) NOT NULL,
  `approver_user_id` int(11) NOT NULL,
  `contract_psow_id` int(11) NOT NULL,
  `contract_sow_id` int(11) NOT NULL COMMENT 'must be replaced to contract_psow_id',
  `approver_order` int(11) NOT NULL,
  `auto_approve` enum('Y','N') NOT NULL DEFAULT 'N',
  `type` enum('service','business travel') NOT NULL DEFAULT 'business travel',
  `rate` enum('subcontractor','agency') NOT NULL DEFAULT 'subcontractor'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Stand-in structure for view `bt_download_attachments_view`
--
CREATE TABLE `bt_download_attachments_view` (
`id` int(11)
,`bt_id` int(11)
,`date` date
,`bt_expense_id` int(11)
,`value` varchar(256)
);

-- --------------------------------------------------------

--
-- Table structure for table `bt_expenses`
--

CREATE TABLE `bt_expenses` (
  `id` int(11) NOT NULL,
  `bt_id` int(11) NOT NULL,
  `bt_expense_template_id` int(11) NOT NULL,
  `comment` varchar(256) NOT NULL,
  `date` date NOT NULL,
  `payment_type` enum('cash','card') NOT NULL,
  `price_foreign` varchar(32) NOT NULL DEFAULT '0',
  `price_domestic` varchar(32) NOT NULL DEFAULT '0',
  `currency_nominal` int(11) NOT NULL DEFAULT '0',
  `currency_name` varchar(64) NOT NULL DEFAULT '',
  `currency_value` float NOT NULL DEFAULT '0',
  `eventTimestamp` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `bt_expense_items`
--

CREATE TABLE `bt_expense_items` (
  `id` int(11) NOT NULL,
  `title` varchar(64) NOT NULL,
  `agency_comment` varchar(64) NOT NULL,
  `is_default` enum('Y','N') NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `bt_expense_item_docs`
--

CREATE TABLE `bt_expense_item_docs` (
  `id` int(11) NOT NULL,
  `bt_expense_item_id` int(11) NOT NULL,
  `type` enum('image','input','allowance') NOT NULL,
  `title` varchar(64) NOT NULL,
  `description` varchar(512) NOT NULL DEFAULT '',
  `tooltip` varchar(256) NOT NULL DEFAULT '',
  `payment` enum('cash','card','cash and card') NOT NULL DEFAULT 'cash',
  `required` enum('Y','N') NOT NULL DEFAULT 'Y'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `bt_expense_lines`
--

CREATE TABLE `bt_expense_lines` (
  `id` int(11) NOT NULL,
  `bt_expense_id` int(11) NOT NULL,
  `bt_expense_line_template_id` int(11) NOT NULL,
  `value` varchar(256) NOT NULL,
  `comment` varchar(256) NOT NULL,
  `eventTimestamp` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `bt_expense_line_templates`
--

CREATE TABLE `bt_expense_line_templates` (
  `id` int(11) NOT NULL,
  `bt_expense_template_id` int(11) NOT NULL,
  `dom_type` enum('image','input','allowance') NOT NULL,
  `title` varchar(64) NOT NULL,
  `description` varchar(512) NOT NULL DEFAULT '',
  `tooltip` varchar(256) NOT NULL DEFAULT '',
  `payment` enum('cash','card','cash and card') NOT NULL DEFAULT 'cash',
  `required` enum('Y','N') NOT NULL DEFAULT 'Y'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `bt_expense_templates`
--

CREATE TABLE `bt_expense_templates` (
  `id` int(11) NOT NULL,
  `title` varchar(64) NOT NULL,
  `agency_company_id` int(11) NOT NULL,
  `agency_comment` varchar(64) NOT NULL,
  `is_default` enum('Y','N') NOT NULL DEFAULT 'N',
  `taxable` enum('Y','N') NOT NULL DEFAULT 'Y',
  `eventTimestamp` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `bt_sow`
--

CREATE TABLE `bt_sow` (
  `id` int(11) NOT NULL,
  `sow_id` int(11) NOT NULL,
  `bt_expense_template_id` int(11) NOT NULL,
  `eventTimestamp` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `bt_sow_assignment`
--

CREATE TABLE `bt_sow_assignment` (
  `id` int(11) NOT NULL,
  `sow_id` int(11) NOT NULL,
  `bt_expense_template_id` int(11) NOT NULL,
  `assignee_user_id` int(11) NOT NULL,
  `eventTimestamp` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `captcha`
--

CREATE TABLE `captcha` (
  `id` int(5) NOT NULL,
  `session` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `filename` varchar(255) NOT NULL,
  `purpose` varchar(255) NOT NULL,
  `timestamp` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `chat_contact_list`
--

CREATE TABLE `chat_contact_list` (
  `id` int(10) NOT NULL,
  `userID` int(10) NOT NULL,
  `friendID` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `chat_messages`
--

CREATE TABLE `chat_messages` (
  `id` bigint(20) NOT NULL,
  `message` text NOT NULL,
  `messageType` enum('text','image') NOT NULL DEFAULT 'text',
  `fromType` enum('fromUser','fromCompany') NOT NULL,
  `fromID` int(11) NOT NULL,
  `toType` enum('toUser','toCompany','toGroup','Broadcast') NOT NULL,
  `toID` int(11) NOT NULL,
  `messageStatus` enum('unread','read','unread_const','delivered','sent') NOT NULL,
  `eventTimestamp` datetime NOT NULL,
  `secondsSinceY2k` bigint(15) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `company`
--

CREATE TABLE `company` (
  `id` int(11) NOT NULL,
  `type` enum('agency','partner','subcontractor','cost_center') NOT NULL,
  `name` varchar(256) NOT NULL,
  `legal_geo_zip_id` int(11) NOT NULL,
  `legal_address` varchar(256) NOT NULL,
  `mailing_geo_zip_id` int(11) NOT NULL,
  `mailing_address` varchar(256) NOT NULL,
  `tin` varchar(64) NOT NULL,
  `bank_id` int(11) NOT NULL,
  `account` varchar(64) NOT NULL,
  `kpp` varchar(64) NOT NULL,
  `ogrn` varchar(64) NOT NULL,
  `vat` enum('Y','N') NOT NULL DEFAULT 'N',
  `vat_calculation_type` enum('sum_by_row','percentage') NOT NULL DEFAULT 'sum_by_row',
  `link` varchar(32) NOT NULL DEFAULT '',
  `admin_userID` int(11) NOT NULL DEFAULT '0',
  `act_number_prefix` varchar(16) NOT NULL DEFAULT '',
  `act_number` int(11) NOT NULL DEFAULT '1',
  `act_number_postfix` varchar(16) NOT NULL DEFAULT '',
  `act_number_unique` enum('true','false') NOT NULL DEFAULT 'false',
  `isConfirmed` enum('Y','N') NOT NULL DEFAULT 'N' COMMENT 'Company owning confirmed with documents',
  `foundationDate` varchar(15) NOT NULL DEFAULT '01/01/2000' COMMENT 'date format: dd/mm/yyyy',
  `numberOfEmployee` int(11) NOT NULL DEFAULT '0',
  `webSite` varchar(254) NOT NULL DEFAULT '',
  `description` varchar(16384) NOT NULL DEFAULT '',
  `isBlocked` enum('Y','N') NOT NULL DEFAULT 'N',
  `logo_folder` varchar(16) NOT NULL DEFAULT '',
  `logo_filename` varchar(32) NOT NULL DEFAULT '',
  `ownerChangeCounter` int(11) NOT NULL DEFAULT '0',
  `lastActivity` int(11) NOT NULL DEFAULT '0' COMMENT 'If no activities for a long time, user may not be active or cyber-squatter. Reset company ownership to 0',
  `eventTimestamp` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `company_agreement_files`
--

CREATE TABLE `company_agreement_files` (
  `id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  `title` varchar(64) NOT NULL COMMENT 'title visible to user',
  `filename` varchar(1024) NOT NULL DEFAULT '',
  `owner_user_id` int(11) NOT NULL,
  `eventTimestamp` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `company_candidates`
--

CREATE TABLE `company_candidates` (
  `id` int(11) NOT NULL,
  `vacancy_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `answer1` enum('1','2','3') NOT NULL,
  `answer2` enum('1','2','3') NOT NULL,
  `answer3` enum('1','2','3') NOT NULL,
  `language1` enum('Y','N','') NOT NULL DEFAULT '',
  `language2` enum('Y','N','') NOT NULL DEFAULT '',
  `language3` enum('Y','N','') NOT NULL DEFAULT '',
  `skill1` enum('Y','N','') NOT NULL DEFAULT '',
  `skill2` enum('Y','N','') NOT NULL DEFAULT '',
  `skill3` enum('Y','N','') NOT NULL DEFAULT '',
  `description` varchar(1024) NOT NULL DEFAULT '',
  `status` enum('applied','rejected') NOT NULL DEFAULT 'applied' COMMENT 'if add more statuses, investigate sort in user_profile.',
  `eventTimestamp` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `company_custom_fields`
--

CREATE TABLE `company_custom_fields` (
  `id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  `var_name` varchar(64) NOT NULL COMMENT 'ID uses in templates',
  `title` varchar(64) NOT NULL COMMENT 'title visible to user',
  `description` varchar(64) NOT NULL DEFAULT '',
  `type` enum('input','file') NOT NULL DEFAULT 'input',
  `value` varchar(1024) NOT NULL DEFAULT '',
  `visible_by_subcontractor` enum('Y','N') NOT NULL DEFAULT 'N',
  `editable_by_subcontractor` enum('Y','N') NOT NULL DEFAULT 'N',
  `owner_user_id` int(11) NOT NULL,
  `eventTimestamp` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `company_employees`
--

CREATE TABLE `company_employees` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL COMMENT 'employee',
  `company_id` int(11) NOT NULL,
  `position_id` int(11) NOT NULL DEFAULT '1',
  `allowed_change_agency_data` enum('Y','N') NOT NULL DEFAULT 'N',
  `allowed_change_sow` enum('Y','N') NOT NULL DEFAULT 'N',
  `eventTimestamp` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `company_founder`
--

CREATE TABLE `company_founder` (
  `id` int(11) NOT NULL,
  `companyID` int(11) NOT NULL,
  `founder_name` varchar(256) NOT NULL DEFAULT '',
  `founder_userID` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `company_industry`
--

CREATE TABLE `company_industry` (
  `id` int(11) NOT NULL,
  `name` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `company_industry_ref`
--

CREATE TABLE `company_industry_ref` (
  `id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  `profile_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `company_owner`
--

CREATE TABLE `company_owner` (
  `id` int(11) NOT NULL,
  `companyID` int(11) NOT NULL,
  `owner_name` varchar(256) NOT NULL DEFAULT '',
  `owner_userID` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `company_posession_request`
--

CREATE TABLE `company_posession_request` (
  `id` int(11) NOT NULL,
  `requested_company_id` int(11) NOT NULL,
  `requester_user_id` int(11) NOT NULL,
  `status` enum('requested','approved','rejected') NOT NULL,
  `description` varchar(1024) NOT NULL DEFAULT '',
  `eventTimestamp` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `company_position`
--

CREATE TABLE `company_position` (
  `id` int(11) NOT NULL,
  `title` varchar(256) NOT NULL,
  `area` varchar(256) NOT NULL DEFAULT '',
  `local_service_description` varchar(256) NOT NULL DEFAULT '',
  `remote_service_description` varchar(256) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `company_questions`
--

CREATE TABLE `company_questions` (
  `id` int(11) NOT NULL,
  `set_id` int(11) NOT NULL,
  `question` varchar(256) NOT NULL,
  `answer1` varchar(256) NOT NULL,
  `answer2` varchar(256) NOT NULL,
  `answer3` varchar(256) NOT NULL,
  `correct_answer` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `company_vacancy`
--

CREATE TABLE `company_vacancy` (
  `id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  `company_position_id` int(11) NOT NULL,
  `geo_locality_id` int(11) NOT NULL,
  `salary_min` int(11) NOT NULL DEFAULT '0',
  `salary_max` int(11) NOT NULL DEFAULT '0',
  `start_month` int(2) NOT NULL,
  `work_format` enum('fte','pte','remote','entrepreneur') NOT NULL DEFAULT 'fte',
  `description` varchar(16384) NOT NULL DEFAULT '',
  `question1` varchar(256) NOT NULL DEFAULT '',
  `answer11` varchar(256) NOT NULL DEFAULT '',
  `answer12` varchar(256) NOT NULL DEFAULT '',
  `answer13` varchar(256) NOT NULL DEFAULT '',
  `correct_answer1` int(11) NOT NULL DEFAULT '0',
  `question2` varchar(256) NOT NULL DEFAULT '',
  `answer21` varchar(256) NOT NULL DEFAULT '',
  `answer22` varchar(256) NOT NULL DEFAULT '',
  `answer23` varchar(256) NOT NULL DEFAULT '',
  `correct_answer2` int(11) NOT NULL DEFAULT '0',
  `question3` varchar(256) NOT NULL DEFAULT '',
  `answer31` varchar(256) NOT NULL DEFAULT '',
  `answer32` varchar(256) NOT NULL DEFAULT '',
  `answer33` varchar(256) NOT NULL DEFAULT '',
  `correct_answer3` int(11) NOT NULL DEFAULT '0',
  `language1_id` int(11) NOT NULL DEFAULT '0',
  `language2_id` int(11) NOT NULL DEFAULT '0',
  `language3_id` int(11) NOT NULL DEFAULT '0',
  `skill1_id` int(11) NOT NULL DEFAULT '0',
  `skill2_id` int(11) NOT NULL DEFAULT '0',
  `skill3_id` int(11) NOT NULL DEFAULT '0',
  `publish_finish` date NOT NULL DEFAULT '2000-01-01',
  `publish_period` enum('suspend','week','month') NOT NULL DEFAULT 'suspend'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `contracts_psow`
--

CREATE TABLE `contracts_psow` (
  `id` int(11) NOT NULL,
  `contract_sow_id` int(11) NOT NULL,
  `cost_center_id` int(11) NOT NULL,
  `company_position_id` int(11) NOT NULL,
  `start_date` date NOT NULL DEFAULT '2000-01-01',
  `end_date` date NOT NULL DEFAULT '2000-01-01',
  `number` varchar(128) NOT NULL DEFAULT '',
  `sign_date` date NOT NULL DEFAULT '2000-01-01',
  `day_rate` double NOT NULL DEFAULT '0',
  `working_hours_per_day` double NOT NULL DEFAULT '8',
  `bt_markup` double NOT NULL DEFAULT '0',
  `bt_markup_type` enum('percent','fix') NOT NULL DEFAULT 'percent',
  `eventTimestamp` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `contracts_sow`
--

CREATE TABLE `contracts_sow` (
  `id` int(11) NOT NULL,
  `subcontractor_company_id` int(11) NOT NULL,
  `agency_company_id` int(11) NOT NULL,
  `company_position_id` int(11) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `number` varchar(128) NOT NULL,
  `sign_date` date NOT NULL,
  `timecard_period` enum('month','week') NOT NULL,
  `subcontractor_create_tasks` enum('Y','N') NOT NULL DEFAULT 'N',
  `day_rate` double NOT NULL DEFAULT '0' COMMENT 'day_rate_to_subcontractor',
  `working_hours_per_day` double NOT NULL DEFAULT '8',
  `status` enum('accepted_by_subc','signed','negotiating','expired') NOT NULL DEFAULT 'negotiating',
  `agreement_filename` varchar(128) NOT NULL DEFAULT '',
  `payment_period_service` int(11) NOT NULL DEFAULT '30' COMMENT 'in days',
  `payment_period_bt` int(11) NOT NULL DEFAULT '30' COMMENT 'in days',
  `recall_by_agency` enum('Y','N') NOT NULL DEFAULT 'Y',
  `recall_by_subcontractor` enum('Y','N') NOT NULL DEFAULT 'N',
  `creator_user_id` int(11) NOT NULL,
  `eventTimestamp` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `contract_psow_custom_fields`
--

CREATE TABLE `contract_psow_custom_fields` (
  `id` int(11) NOT NULL,
  `contract_psow_id` int(11) NOT NULL,
  `var_name` varchar(64) NOT NULL COMMENT 'ID uses in templates',
  `title` varchar(64) NOT NULL COMMENT 'title visible to user',
  `description` varchar(64) NOT NULL DEFAULT '',
  `type` enum('input','file') NOT NULL DEFAULT 'input',
  `value` varchar(1024) NOT NULL DEFAULT '',
  `visible_by_subcontractor` enum('Y','N') NOT NULL DEFAULT 'N' COMMENT 'PSoW not visible by subc  (not valid)',
  `editable_by_subcontractor` enum('Y','N') NOT NULL DEFAULT 'N' COMMENT 'PSoW not visible by subc  (not valid)',
  `owner_user_id` int(11) NOT NULL,
  `eventTimestamp` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `contract_sow_agreement_files`
--

CREATE TABLE `contract_sow_agreement_files` (
  `id` int(11) NOT NULL,
  `contract_sow_id` int(11) NOT NULL,
  `title` varchar(64) NOT NULL COMMENT 'title visible to user',
  `filename` varchar(1024) NOT NULL DEFAULT '',
  `owner_user_id` int(11) NOT NULL,
  `eventTimestamp` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `contract_sow_custom_fields`
--

CREATE TABLE `contract_sow_custom_fields` (
  `id` int(11) NOT NULL,
  `contract_sow_id` int(11) NOT NULL,
  `var_name` varchar(64) NOT NULL COMMENT 'ID uses in templates',
  `title` varchar(64) NOT NULL COMMENT 'title visible to user',
  `description` varchar(64) NOT NULL DEFAULT '',
  `type` enum('input','file') NOT NULL DEFAULT 'input',
  `value` varchar(1024) NOT NULL DEFAULT '',
  `visible_by_subcontractor` enum('Y','N') NOT NULL DEFAULT 'N',
  `editable_by_subcontractor` enum('Y','N') NOT NULL DEFAULT 'N',
  `owner_user_id` int(11) NOT NULL,
  `eventTimestamp` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cost_centers`
--

CREATE TABLE `cost_centers` (
  `id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  `title` varchar(64) NOT NULL DEFAULT '' COMMENT 'optional field, use company.name instead',
  `description` varchar(256) NOT NULL DEFAULT '',
  `agency_company_id` int(11) NOT NULL,
  `start_date` date NOT NULL DEFAULT '2000-01-01',
  `end_date` date NOT NULL DEFAULT '2000-01-01',
  `number` varchar(128) NOT NULL DEFAULT '',
  `sign_date` date NOT NULL DEFAULT '2000-01-01',
  `assignee_user_id` int(11) NOT NULL,
  `eventTimestamp` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cost_center_assignment`
--

CREATE TABLE `cost_center_assignment` (
  `id` int(11) NOT NULL,
  `cost_center_id` int(11) NOT NULL,
  `timecard_customer_id` int(11) NOT NULL,
  `assignee_user_id` int(11) NOT NULL,
  `eventTimestamp` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cost_center_custom_fields`
--

CREATE TABLE `cost_center_custom_fields` (
  `id` int(11) NOT NULL,
  `cost_center_id` int(11) NOT NULL,
  `var_name` varchar(64) NOT NULL COMMENT 'ID uses in templates',
  `title` varchar(64) NOT NULL COMMENT 'title visible to user',
  `description` varchar(64) NOT NULL DEFAULT '',
  `type` enum('input','file') NOT NULL DEFAULT 'input',
  `value` varchar(1024) NOT NULL DEFAULT '',
  `visible_by_subcontractor` enum('Y','N') NOT NULL DEFAULT 'N',
  `editable_by_subcontractor` enum('Y','N') NOT NULL DEFAULT 'N',
  `owner_user_id` int(11) NOT NULL,
  `eventTimestamp` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `currency_rate`
--

CREATE TABLE `currency_rate` (
  `id` int(11) NOT NULL,
  `date` date NOT NULL,
  `num_code` int(11) NOT NULL,
  `char_code` varchar(8) NOT NULL,
  `nominal` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  `value` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `demo_requests`
--

CREATE TABLE `demo_requests` (
  `id` int(11) NOT NULL,
  `name` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `dictionary_adverse`
--

CREATE TABLE `dictionary_adverse` (
  `id` int(11) NOT NULL,
  `word` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `email_change_tokens`
--

CREATE TABLE `email_change_tokens` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `new_email` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `eventTimestamp` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `exception`
--

CREATE TABLE `exception` (
  `identifier` int(3) UNSIGNED NOT NULL,
  `id` varchar(100) NOT NULL DEFAULT '',
  `message` text NOT NULL,
  `template` varchar(100) NOT NULL DEFAULT '',
  `lng` char(3) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `faq`
--

CREATE TABLE `faq` (
  `id` int(11) NOT NULL,
  `role` enum('subcontractor','helpdesk','agency','approver','user') COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `feed`
--

CREATE TABLE `feed` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(4) NOT NULL DEFAULT '',
  `srcType` enum('user','company','group') NOT NULL DEFAULT 'user',
  `userId` int(11) NOT NULL COMMENT 'srcID (something producing action)',
  `dstType` enum('user','company','group','') NOT NULL DEFAULT '',
  `dstID` int(11) NOT NULL DEFAULT '0',
  `actionTypeId` int(11) NOT NULL COMMENT 'Action type',
  `actionId` int(11) NOT NULL DEFAULT '0' COMMENT 'Additional data',
  `eventTimestamp` datetime NOT NULL COMMENT 'format YYYY-MM-DD HH:MM:SS'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `feed_images`
--

CREATE TABLE `feed_images` (
  `id` int(10) UNSIGNED NOT NULL,
  `setID` int(11) NOT NULL DEFAULT '0',
  `srcType` enum('user','company','group') NOT NULL DEFAULT 'user',
  `userID` int(10) NOT NULL,
  `folder` varchar(32) NOT NULL,
  `filename` varchar(128) NOT NULL,
  `mediaType` enum('image','video','youtube_video') NOT NULL DEFAULT 'image',
  `isActive` tinyint(1) NOT NULL DEFAULT '0',
  `tempSet` int(9) NOT NULL,
  `removeFlag` enum('keep','remove') NOT NULL DEFAULT 'keep',
  `exifDateTime` varchar(64) NOT NULL DEFAULT '',
  `exifGPSAltitude` varchar(64) NOT NULL DEFAULT '',
  `exifGPSLatitude` varchar(64) NOT NULL DEFAULT '',
  `exifGPSLongitude` varchar(64) NOT NULL DEFAULT '',
  `exifGPSSpeed` varchar(64) NOT NULL DEFAULT '',
  `exifModel` varchar(64) NOT NULL DEFAULT '',
  `exifAuthors` varchar(64) NOT NULL DEFAULT '',
  `exifApertureValue` varchar(64) NOT NULL DEFAULT '',
  `exifBrightnessValue` varchar(64) NOT NULL DEFAULT '',
  `exifColorSpace` varchar(64) NOT NULL DEFAULT '',
  `exifComponentsConfiguration` varchar(64) NOT NULL DEFAULT '',
  `exifCompression` varchar(64) NOT NULL DEFAULT '',
  `exifDateTimeDigitized` varchar(64) NOT NULL DEFAULT '',
  `exifDateTimeOriginal` varchar(64) NOT NULL DEFAULT '',
  `exifExifImageLength` varchar(64) NOT NULL DEFAULT '',
  `exifExifImageWidth` varchar(64) NOT NULL DEFAULT '',
  `exifExifOffset` varchar(64) NOT NULL DEFAULT '',
  `exifExifVersion` varchar(64) NOT NULL DEFAULT '',
  `exifExposureBiasValue` varchar(64) NOT NULL DEFAULT '',
  `exifExposureMode` varchar(64) NOT NULL DEFAULT '',
  `exifExposureProgram` varchar(64) NOT NULL DEFAULT '',
  `exifExposureTime` varchar(64) NOT NULL DEFAULT '',
  `exifFlash` varchar(64) NOT NULL DEFAULT '',
  `exifFlashPixVersion` varchar(64) NOT NULL DEFAULT '',
  `exifFNumber` varchar(64) NOT NULL DEFAULT '',
  `exifFocalLength` varchar(64) NOT NULL DEFAULT '',
  `exifFocalLengthIn35mmFilm` varchar(64) NOT NULL DEFAULT '',
  `exifGPSDateStamp` varchar(64) NOT NULL DEFAULT '',
  `exifGPSDestBearing` varchar(64) NOT NULL DEFAULT '',
  `exifGPSDestBearingRef` varchar(64) NOT NULL DEFAULT '',
  `exifGPSImgDirection` varchar(64) NOT NULL DEFAULT '',
  `exifGPSImgDirectionRef` varchar(64) NOT NULL DEFAULT '',
  `exifGPSInfo` varchar(64) NOT NULL DEFAULT '',
  `exifGPSTimeStamp` varchar(64) NOT NULL DEFAULT '',
  `exifISOSpeedRatings` varchar(64) NOT NULL DEFAULT '',
  `exifJPEGInterchangeFormat` varchar(64) NOT NULL DEFAULT '',
  `exifJPEGInterchangeFormatLength` varchar(64) NOT NULL DEFAULT '',
  `exifMake` varchar(64) NOT NULL DEFAULT '',
  `exifMeteringMode` varchar(64) NOT NULL DEFAULT '',
  `exifOrientation` varchar(64) NOT NULL DEFAULT '',
  `exifResolutionUnit` varchar(64) NOT NULL DEFAULT '',
  `exifSceneCaptureType` varchar(64) NOT NULL DEFAULT '',
  `exifSceneType` varchar(64) NOT NULL DEFAULT '',
  `exifSensingMethod` varchar(64) NOT NULL DEFAULT '',
  `exifShutterSpeedValue` varchar(64) NOT NULL DEFAULT '',
  `exifSoftware` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `exifSubjectArea` varchar(64) NOT NULL DEFAULT '',
  `exifSubSecTimeDigitized` varchar(64) NOT NULL DEFAULT '',
  `exifSubSecTimeOriginal` varchar(64) NOT NULL DEFAULT '',
  `exifWhiteBalance` varchar(64) NOT NULL DEFAULT '',
  `exifXResolution` varchar(64) NOT NULL DEFAULT '',
  `exifYCbCrPositioning` varchar(64) NOT NULL DEFAULT '',
  `exifYResolution` varchar(64) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `feed_message`
--

CREATE TABLE `feed_message` (
  `id` int(11) NOT NULL,
  `title` varchar(1024) NOT NULL,
  `link` varchar(1024) NOT NULL,
  `message` text NOT NULL,
  `imageSetID` int(11) NOT NULL,
  `access` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='ATTENTION ! "Table truncation" must be implemented with care';

-- --------------------------------------------------------

--
-- Table structure for table `feed_message_comment`
--

CREATE TABLE `feed_message_comment` (
  `id` int(11) NOT NULL,
  `messageID` int(11) NOT NULL,
  `userID` int(11) NOT NULL,
  `type` enum('message','book','certification','university','course','language','school','company') NOT NULL DEFAULT 'message',
  `comment` text NOT NULL,
  `eventTimestamp` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `feed_message_params`
--

CREATE TABLE `feed_message_params` (
  `id` int(10) UNSIGNED NOT NULL,
  `parameter` enum('like','spam','likeBook','likeCertification','likeUniversityDegree','likeCourse','likeLanguage','likeSchool','likeCompany') NOT NULL,
  `messageID` int(11) NOT NULL,
  `userID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `geo_country`
--

CREATE TABLE `geo_country` (
  `id` int(11) NOT NULL,
  `title` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `geo_locality`
--

CREATE TABLE `geo_locality` (
  `id` int(11) NOT NULL,
  `geo_region_id` int(11) NOT NULL DEFAULT '0',
  `title` varchar(128) NOT NULL,
  `population` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `geo_locality_unknown`
--

CREATE TABLE `geo_locality_unknown` (
  `id` int(11) NOT NULL,
  `locality` varchar(256) NOT NULL,
  `eventTimestamp` datetime NOT NULL DEFAULT '2000-01-01 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Stand-in structure for view `geo_locality_view`
--
CREATE TABLE `geo_locality_view` (
`geo_locality_id` int(11)
,`geo_locality_title` varchar(128)
,`geo_region_id` int(11)
,`geo_region_title` varchar(128)
,`geo_country_id` int(11)
,`geo_country_title` varchar(128)
);

-- --------------------------------------------------------

--
-- Table structure for table `geo_region`
--

CREATE TABLE `geo_region` (
  `id` int(11) NOT NULL,
  `geo_country_id` int(11) NOT NULL DEFAULT '7',
  `title` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `geo_zip`
--

CREATE TABLE `geo_zip` (
  `id` int(11) NOT NULL,
  `zip` varchar(16) NOT NULL,
  `geo_locality_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `groups`
--

CREATE TABLE `groups` (
  `id` int(11) NOT NULL,
  `link` varchar(64) NOT NULL DEFAULT '' COMMENT 'name in web-link',
  `title` varchar(64) NOT NULL COMMENT 'human readable title',
  `description` varchar(1024) NOT NULL DEFAULT '',
  `logo_folder` varchar(32) NOT NULL DEFAULT '',
  `logo_filename` varchar(32) NOT NULL DEFAULT '',
  `owner_id` int(11) NOT NULL,
  `isBlocked` enum('N','Y') NOT NULL DEFAULT 'N',
  `eventTimestampCreation` int(11) NOT NULL,
  `eventTimestampLastPost` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `helpdesk_tickets`
--

CREATE TABLE `helpdesk_tickets` (
  `id` int(11) NOT NULL,
  `title` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `helpdesk_ticket_attaches`
--

CREATE TABLE `helpdesk_ticket_attaches` (
  `id` int(11) NOT NULL,
  `helpdesk_ticket_history_id` int(11) NOT NULL,
  `filename` varchar(512) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `helpdesk_ticket_history`
--

CREATE TABLE `helpdesk_ticket_history` (
  `id` int(11) NOT NULL,
  `helpdesk_ticket_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `severity` int(11) NOT NULL,
  `state` enum('new','customer_pending','company_pending','assigned','solution_provided','monitoring','close_pending','closed','severity_changed','change_company_user') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'new',
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `eventTimestamp` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Stand-in structure for view `helpdesk_ticket_history_helpdesk_users_view`
--
CREATE TABLE `helpdesk_ticket_history_helpdesk_users_view` (
`id` int(11)
,`helpdesk_ticket_id` int(11)
,`user_id` int(11)
,`severity` int(11)
,`state` enum('new','customer_pending','company_pending','assigned','solution_provided','monitoring','close_pending','closed','severity_changed','change_company_user')
,`description` text
,`eventTimestamp` int(11)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `helpdesk_ticket_history_last_case_state_view`
--
CREATE TABLE `helpdesk_ticket_history_last_case_state_view` (
`id` int(11)
,`helpdesk_ticket_id` int(11)
,`user_id` int(11)
,`severity` int(11)
,`state` enum('new','customer_pending','company_pending','assigned','solution_provided','monitoring','close_pending','closed','severity_changed','change_company_user')
,`description` text
,`eventTimestamp` int(11)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `helpdesk_ticket_history_last_helpdesk_user_update_view`
--
CREATE TABLE `helpdesk_ticket_history_last_helpdesk_user_update_view` (
`id` int(11)
,`helpdesk_ticket_id` int(11)
,`user_id` int(11)
,`severity` int(11)
,`state` enum('new','customer_pending','company_pending','assigned','solution_provided','monitoring','close_pending','closed','severity_changed','change_company_user')
,`description` text
,`eventTimestamp` int(11)
);

-- --------------------------------------------------------

--
-- Table structure for table `holiday_calendar`
--

CREATE TABLE `holiday_calendar` (
  `id` int(11) NOT NULL,
  `agency_company_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `type` enum('full','partial') NOT NULL DEFAULT 'full',
  `title` varchar(64) NOT NULL,
  `eventTimestamp` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `hotel_chains`
--

CREATE TABLE `hotel_chains` (
  `id` int(11) NOT NULL,
  `code` varchar(3) NOT NULL,
  `description_rus` varchar(128) NOT NULL DEFAULT '',
  `description_eng` varchar(128) NOT NULL,
  `country` varchar(128) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `invoices`
--

CREATE TABLE `invoices` (
  `id` int(11) NOT NULL,
  `full_number` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `eventTimestamp` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `invoice_cost_center_bt`
--

CREATE TABLE `invoice_cost_center_bt` (
  `id` int(11) NOT NULL,
  `cost_center_id` int(11) NOT NULL,
  `file` varchar(256) NOT NULL COMMENT 'archive with all files enclosed',
  `owner_user_id` int(11) NOT NULL,
  `owner_company_id` int(11) NOT NULL COMMENT 'use it only to check that invoce belongs to company',
  `invoice_id` int(11) NOT NULL,
  `eventTimestamp` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `invoice_cost_center_bt_details`
--

CREATE TABLE `invoice_cost_center_bt_details` (
  `id` int(11) NOT NULL,
  `invoice_cost_center_bt_id` int(11) NOT NULL,
  `bt_id` int(11) NOT NULL,
  `cc_amount_pre_tax` double NOT NULL DEFAULT '0',
  `cc_amount_tax` double NOT NULL DEFAULT '0',
  `cc_amount_total` double NOT NULL DEFAULT '0',
  `subc_amount_pre_tax` double NOT NULL DEFAULT '0',
  `subc_amount_tax` double NOT NULL DEFAULT '0',
  `subc_amount_total` double NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `invoice_cost_center_service`
--

CREATE TABLE `invoice_cost_center_service` (
  `id` int(11) NOT NULL,
  `cost_center_id` int(11) NOT NULL,
  `file` varchar(256) NOT NULL COMMENT 'archive with all files enclosed',
  `owner_user_id` int(11) NOT NULL,
  `owner_company_id` int(11) NOT NULL COMMENT 'use it only to check that invoce belongs to company',
  `invoice_id` int(11) NOT NULL,
  `eventTimestamp` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `invoice_cost_center_service_details`
--

CREATE TABLE `invoice_cost_center_service_details` (
  `id` int(11) NOT NULL,
  `invoice_cost_center_service_id` int(11) NOT NULL,
  `timecard_id` int(11) NOT NULL,
  `cc_amount_pre_tax` double NOT NULL DEFAULT '0',
  `cc_amount_tax` double NOT NULL DEFAULT '0',
  `cc_amount_total` double NOT NULL DEFAULT '0',
  `subc_amount_pre_tax` double NOT NULL DEFAULT '0',
  `subc_amount_tax` double NOT NULL DEFAULT '0',
  `subc_amount_total` double NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `language`
--

CREATE TABLE `language` (
  `id` int(11) NOT NULL,
  `title` varchar(512) NOT NULL,
  `logo_folder` varchar(16) NOT NULL DEFAULT '',
  `logo_filename` varchar(32) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `name_sex`
--

CREATE TABLE `name_sex` (
  `id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  `sex` enum('male','female') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `password_dictionary_adjectives`
--

CREATE TABLE `password_dictionary_adjectives` (
  `id` int(11) NOT NULL,
  `word` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `password_dictionary_characteristics`
--

CREATE TABLE `password_dictionary_characteristics` (
  `id` int(11) NOT NULL,
  `word` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `password_dictionary_nouns`
--

CREATE TABLE `password_dictionary_nouns` (
  `id` int(11) NOT NULL,
  `word` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `phone_confirmation`
--

CREATE TABLE `phone_confirmation` (
  `id` int(11) NOT NULL,
  `session` varchar(64) NOT NULL,
  `confirmation_code` varchar(8) NOT NULL,
  `country_code` varchar(8) NOT NULL DEFAULT '',
  `phone_number` varchar(32) NOT NULL DEFAULT '',
  `attempt` int(11) NOT NULL DEFAULT '0',
  `eventTimestamp` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `railroads`
--

CREATE TABLE `railroads` (
  `id` int(11) NOT NULL,
  `code` varchar(3) NOT NULL,
  `description_rus` varchar(128) NOT NULL DEFAULT '',
  `description_eng` varchar(128) NOT NULL,
  `country` varchar(128) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(128) NOT NULL DEFAULT '',
  `user_id` int(11) NOT NULL DEFAULT '24',
  `country_auto` varchar(128) NOT NULL DEFAULT '',
  `city_auto` varchar(128) NOT NULL DEFAULT '',
  `lng` varchar(4) NOT NULL DEFAULT '',
  `ip` varchar(40) NOT NULL DEFAULT '',
  `time` datetime NOT NULL DEFAULT '2000-01-01 00:00:00',
  `http_user_agent` varchar(512) NOT NULL DEFAULT '',
  `expire` int(11) NOT NULL DEFAULT '3600' COMMENT 'session duration in seconds',
  `remove_flag` enum('N','Y','pending') NOT NULL DEFAULT 'N',
  `remove_flag_timestamp` int(11) NOT NULL DEFAULT '0',
  `previous_sessid` varchar(128) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sessions_persistence_ratelimit`
--

CREATE TABLE `sessions_persistence_ratelimit` (
  `id` int(11) NOT NULL,
  `ip` varchar(40) NOT NULL,
  `attempts` int(11) NOT NULL,
  `eventTimestamp` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `settings_default`
--

CREATE TABLE `settings_default` (
  `id` int(11) NOT NULL,
  `setting` varchar(64) NOT NULL,
  `value` varchar(256) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `site_themes`
--

CREATE TABLE `site_themes` (
  `id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `path` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sms_report`
--

CREATE TABLE `sms_report` (
  `id` int(11) NOT NULL,
  `number` varchar(32) NOT NULL DEFAULT '',
  `sms_id` int(11) NOT NULL,
  `sms_cost` float NOT NULL,
  `sms_quantity` int(11) NOT NULL DEFAULT '1',
  `sms_text` varchar(1024) NOT NULL DEFAULT '',
  `current_balance` float NOT NULL,
  `eventTimestamp` datetime NOT NULL DEFAULT '2000-01-01 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `subcontractors_to_agency_mapping`
--

CREATE TABLE `subcontractors_to_agency_mapping` (
  `id` int(11) NOT NULL,
  `subcontractor_company_id` int(11) NOT NULL,
  `agency_company_id` int(11) NOT NULL,
  `eventTimestamp` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Agency isn''t allowed to search any subc on the web-site';

-- --------------------------------------------------------

--
-- Table structure for table `temp_media`
--

CREATE TABLE `temp_media` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL COMMENT 'user uploaded image',
  `mediaType` enum('image','youtube_video') NOT NULL DEFAULT 'image',
  `folder` varchar(4) NOT NULL,
  `filename` varchar(64) NOT NULL,
  `eventTimestamp` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `timecards`
--

CREATE TABLE `timecards` (
  `id` int(11) NOT NULL,
  `contract_sow_id` int(11) NOT NULL,
  `period_start` date NOT NULL,
  `period_end` date NOT NULL DEFAULT '2000-01-01',
  `status` enum('saved','submit','approved','pending approve','rejected') NOT NULL DEFAULT 'saved',
  `submit_date` int(11) NOT NULL DEFAULT '0',
  `approve_date` int(11) NOT NULL DEFAULT '0',
  `payed_date` int(11) NOT NULL DEFAULT '0',
  `expected_pay_date` int(11) NOT NULL DEFAULT '0',
  `originals_received_date` int(11) NOT NULL DEFAULT '0',
  `invoice_filename` varchar(128) NOT NULL DEFAULT '',
  `invoice_id` int(11) NOT NULL,
  `eventTimestamp` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `timecard_approvals`
--

CREATE TABLE `timecard_approvals` (
  `id` int(11) NOT NULL,
  `timecard_id` int(11) NOT NULL,
  `approver_id` int(11) NOT NULL,
  `decision` enum('approved','rejected','pending','submit') NOT NULL DEFAULT 'pending',
  `comment` varchar(512) NOT NULL,
  `eventTimestamp` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Stand-in structure for view `timecard_approvals_view`
--
CREATE TABLE `timecard_approvals_view` (
`timecard_approvers_id` int(11)
,`timecard_approvals_eventTimestamp` int(11)
,`timecard_approvals_timecard_id` int(11)
,`timecard_approvers_approver_order` int(11)
);

-- --------------------------------------------------------

--
-- Table structure for table `timecard_approvers`
--

CREATE TABLE `timecard_approvers` (
  `id` int(11) NOT NULL,
  `approver_user_id` int(11) NOT NULL,
  `contract_psow_id` int(11) NOT NULL,
  `approver_order` int(11) NOT NULL,
  `auto_approve` enum('Y','N') NOT NULL DEFAULT 'N',
  `type` enum('service','business travel') NOT NULL DEFAULT 'service',
  `rate` enum('subcontractor','agency') NOT NULL DEFAULT 'subcontractor'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `timecard_customers`
--

CREATE TABLE `timecard_customers` (
  `id` int(11) NOT NULL,
  `agency_company_id` int(11) NOT NULL,
  `title` varchar(256) NOT NULL,
  `eventTimestamp` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `timecard_lines`
--

CREATE TABLE `timecard_lines` (
  `id` int(11) NOT NULL,
  `timecard_id` int(11) NOT NULL,
  `timecard_task_id` int(11) NOT NULL,
  `row` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `timecard_projects`
--

CREATE TABLE `timecard_projects` (
  `id` int(11) NOT NULL,
  `timecard_customers_id` int(11) NOT NULL,
  `title` varchar(256) NOT NULL,
  `eventTimestamp` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `timecard_tasks`
--

CREATE TABLE `timecard_tasks` (
  `id` int(11) NOT NULL,
  `timecard_projects_id` int(11) NOT NULL,
  `title` varchar(256) NOT NULL,
  `eventTimestamp` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `timecard_task_assignment`
--

CREATE TABLE `timecard_task_assignment` (
  `id` int(11) NOT NULL,
  `timecard_tasks_id` int(11) NOT NULL,
  `assignee_user_id` int(11) NOT NULL,
  `period_start` date NOT NULL,
  `period_end` date NOT NULL,
  `hour_limit` int(11) NOT NULL,
  `contract_sow_id` int(11) NOT NULL,
  `eventTimestamp` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `login` varchar(64) NOT NULL DEFAULT '',
  `email` varchar(64) NOT NULL DEFAULT '',
  `email_changeable` enum('Y','N') NOT NULL DEFAULT 'N',
  `type` enum('subcontractor','approver','agency','no role','user','guest','helpdesk') NOT NULL DEFAULT 'no role',
  `isactivated` enum('N','Y') NOT NULL DEFAULT 'N',
  `isblocked` char(1) NOT NULL DEFAULT 'N',
  `lng` varchar(20) NOT NULL DEFAULT '',
  `regdate` date NOT NULL DEFAULT '2000-01-01',
  `partnerid` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `country` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `geo_locality_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(30) NOT NULL DEFAULT '',
  `nameLast` varchar(30) NOT NULL DEFAULT '',
  `nameMiddle` varchar(64) NOT NULL DEFAULT '',
  `address` varchar(64) NOT NULL DEFAULT '',
  `phone` varchar(64) NOT NULL DEFAULT '',
  `country_code` varchar(5) NOT NULL DEFAULT '',
  `is_phone_confirmed` enum('Y','N') NOT NULL DEFAULT 'N',
  `cv` text NOT NULL,
  `passport_series` varchar(16) NOT NULL DEFAULT '',
  `passport_number` varchar(16) NOT NULL DEFAULT '',
  `passport_issue_date` date NOT NULL DEFAULT '1900-01-01',
  `passport_issue_authority` varchar(256) NOT NULL DEFAULT '',
  `foreign_passport_number` varchar(32) NOT NULL DEFAULT '',
  `foreign_passport_expiration_date` date NOT NULL DEFAULT '1900-01-01',
  `first_name_en` varchar(32) NOT NULL DEFAULT '',
  `last_name_en` varchar(32) NOT NULL DEFAULT '',
  `middle_name_en` varchar(32) NOT NULL DEFAULT '',
  `citizenship_code` enum('RU') NOT NULL DEFAULT 'RU',
  `sex` enum('male','female','') NOT NULL DEFAULT '',
  `birthday` date NOT NULL DEFAULT '1900-01-01',
  `birthdayAccess` enum('public','private') NOT NULL DEFAULT 'private',
  `site_theme_id` int(11) NOT NULL DEFAULT '1',
  `smartway_employee_id` varchar(64) NOT NULL DEFAULT '',
  `appliedVacanciesRender` enum('all','inprogress') NOT NULL DEFAULT 'all' COMMENT 'declares vacancies render in profile_edit: "show all" / "in-progress"',
  `pending_approval_notification_timecard` enum('Y','N') NOT NULL DEFAULT 'N',
  `pending_approval_notification_bt` enum('Y','N') NOT NULL DEFAULT 'N',
  `helpdesk_new_notification_S1_sms` enum('Y','N') NOT NULL DEFAULT 'N',
  `helpdesk_new_notification_S2_sms` enum('Y','N') NOT NULL DEFAULT 'N',
  `helpdesk_new_notification_S3_sms` enum('Y','N') NOT NULL DEFAULT 'N',
  `helpdesk_new_notification_S4_sms` enum('Y','N') NOT NULL DEFAULT 'N',
  `helpdesk_new_notification_S1_email` enum('Y','N') NOT NULL DEFAULT 'N',
  `helpdesk_new_notification_S2_email` enum('Y','N') NOT NULL DEFAULT 'N',
  `helpdesk_new_notification_S3_email` enum('Y','N') NOT NULL DEFAULT 'N',
  `helpdesk_new_notification_S4_email` enum('Y','N') NOT NULL DEFAULT 'N',
  `helpdesk_subscription_S1_sms` enum('N','Y') NOT NULL DEFAULT 'N',
  `helpdesk_subscription_S2_sms` enum('N','Y') NOT NULL DEFAULT 'N',
  `helpdesk_subscription_S3_sms` enum('N','Y') NOT NULL DEFAULT 'N',
  `helpdesk_subscription_S4_sms` enum('N','Y') NOT NULL DEFAULT 'N',
  `helpdesk_subscription_S1_email` enum('N','Y') NOT NULL DEFAULT 'N',
  `helpdesk_subscription_S2_email` enum('N','Y') NOT NULL DEFAULT 'N',
  `helpdesk_subscription_S3_email` enum('N','Y') NOT NULL DEFAULT 'N',
  `helpdesk_subscription_S4_email` enum('N','Y') NOT NULL DEFAULT 'N',
  `last_online` datetime NOT NULL DEFAULT '2000-01-01 00:00:00' COMMENT 'используется для presence',
  `last_onlineSecondsSinceY2k` bigint(15) NOT NULL DEFAULT '0',
  `ip` varchar(40) NOT NULL DEFAULT '',
  `activated` datetime NOT NULL DEFAULT '2000-01-01 00:00:00',
  `activator_sent` datetime NOT NULL DEFAULT '2000-01-01 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `users_avatars`
--

CREATE TABLE `users_avatars` (
  `id` int(10) UNSIGNED NOT NULL,
  `userid` int(10) NOT NULL,
  `folder` text NOT NULL,
  `filename` text NOT NULL,
  `isActive` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `users_block`
--

CREATE TABLE `users_block` (
  `userid` varchar(255) NOT NULL DEFAULT '',
  `date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `notes` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `users_company`
--

CREATE TABLE `users_company` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  `position_title_id` int(11) NOT NULL,
  `occupation_start` date NOT NULL,
  `occupation_finish` date NOT NULL,
  `current_company` tinyint(1) NOT NULL,
  `responsibilities` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `users_complains`
--

CREATE TABLE `users_complains` (
  `id` int(11) NOT NULL,
  `userID` int(11) NOT NULL,
  `entityID` int(11) NOT NULL,
  `type` enum('company','certification','course','university','school','language','book') NOT NULL,
  `subtype` enum('image','title','description','general') NOT NULL,
  `complainComment` varchar(512) NOT NULL DEFAULT '',
  `resolveComment` varchar(512) NOT NULL DEFAULT '',
  `state` enum('new','handling','closed') NOT NULL DEFAULT 'new',
  `openEventTimestamp` int(11) NOT NULL,
  `closeEventTimestamp` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `users_friends`
--

CREATE TABLE `users_friends` (
  `id` int(10) UNSIGNED NOT NULL,
  `userID` int(11) NOT NULL,
  `friendID` int(11) NOT NULL,
  `state` enum('requested','confirmed','blocked','ignored','requesting') NOT NULL,
  `date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `users_language`
--

CREATE TABLE `users_language` (
  `id` int(11) NOT NULL,
  `user_id` int(15) NOT NULL,
  `language_id` int(11) NOT NULL,
  `level` enum('Свободно','Читаю, пишу','Начинающий','') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `users_notification`
--

CREATE TABLE `users_notification` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(1024) NOT NULL DEFAULT '',
  `userId` int(11) NOT NULL COMMENT 'User making an action',
  `actionTypeId` int(11) NOT NULL COMMENT 'Action type',
  `actionId` int(11) NOT NULL DEFAULT '0' COMMENT 'Additional data',
  `notificationStatus` enum('read','unread') NOT NULL DEFAULT 'unread',
  `eventTimestamp` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `users_passwd`
--

CREATE TABLE `users_passwd` (
  `id` int(11) NOT NULL,
  `userID` int(11) NOT NULL,
  `passwd` varchar(128) NOT NULL,
  `isActive` enum('true','false') NOT NULL DEFAULT 'false',
  `eventTimestamp` datetime NOT NULL DEFAULT '2000-01-01 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `users_subscriptions`
--

CREATE TABLE `users_subscriptions` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `entity_type` enum('company','group') NOT NULL,
  `entity_id` int(11) NOT NULL,
  `eventTimestamp` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `users_watched`
--

CREATE TABLE `users_watched` (
  `id` int(11) NOT NULL,
  `watched_userID` int(11) NOT NULL,
  `watching_userID` int(11) NOT NULL,
  `eventTimestamp` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `user_bonuses_avia`
--

CREATE TABLE `user_bonuses_avia` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `airline_id` int(11) NOT NULL,
  `number` varchar(32) NOT NULL,
  `eventTimestamp` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Stand-in structure for view `user_bonuses_avia_view`
--
CREATE TABLE `user_bonuses_avia_view` (
`id` int(11)
,`user_id` int(11)
,`airline_id` int(11)
,`number` varchar(32)
,`eventTimestamp` int(11)
,`code` varchar(2)
,`description_rus` varchar(128)
,`description_eng` varchar(128)
,`country` varchar(128)
);

-- --------------------------------------------------------

--
-- Table structure for table `user_bonuses_hotels`
--

CREATE TABLE `user_bonuses_hotels` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `hotel_chain_id` int(11) NOT NULL,
  `number` varchar(32) NOT NULL,
  `eventTimestamp` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Stand-in structure for view `user_bonuses_hotel_view`
--
CREATE TABLE `user_bonuses_hotel_view` (
`id` int(11)
,`user_id` int(11)
,`hotel_chain_id` int(11)
,`number` varchar(32)
,`eventTimestamp` int(11)
,`code` varchar(3)
,`description_rus` varchar(128)
,`description_eng` varchar(128)
,`country` varchar(128)
);

-- --------------------------------------------------------

--
-- Table structure for table `user_bonuses_railroads`
--

CREATE TABLE `user_bonuses_railroads` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `railroad_id` int(11) NOT NULL,
  `number` varchar(32) NOT NULL,
  `eventTimestamp` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Stand-in structure for view `user_bonuses_railroad_view`
--
CREATE TABLE `user_bonuses_railroad_view` (
`id` int(11)
,`user_id` int(11)
,`railroad_id` int(11)
,`number` varchar(32)
,`eventTimestamp` int(11)
,`code` varchar(3)
,`description_rus` varchar(128)
,`description_eng` varchar(128)
,`country` varchar(128)
);

-- --------------------------------------------------------

--
-- Structure for view `airports_view`
--
DROP TABLE IF EXISTS `airports_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `airports_view`  AS  select `airports`.`id` AS `id`,`airports`.`city_name` AS `city_name`,`airports`.`airport_code` AS `airport_code`,`airports`.`airport_name` AS `airport_name`,`airports`.`world_area_code` AS `world_area_code`,`airport_countries`.`title` AS `country_name` from (`airports` join `airport_countries` on((`airports`.`airport_country_id` = `airport_countries`.`id`))) ;

-- --------------------------------------------------------

--
-- Structure for view `bt_approvals_view`
--
DROP TABLE IF EXISTS `bt_approvals_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `bt_approvals_view`  AS  select `bt_approvers`.`id` AS `bt_approvers_id`,`bt_approvals`.`eventTimestamp` AS `bt_approvals_eventTimestamp`,`bt_approvals`.`bt_id` AS `bt_approvals_bt_id`,`bt_approvers`.`approver_order` AS `bt_approvers_approver_order` from (`bt_approvals` join `bt_approvers` on((`bt_approvers`.`id` = `bt_approvals`.`approver_id`))) ;

-- --------------------------------------------------------

--
-- Structure for view `bt_download_attachments_view`
--
DROP TABLE IF EXISTS `bt_download_attachments_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `bt_download_attachments_view`  AS  select `exp_line`.`id` AS `id`,`exp`.`bt_id` AS `bt_id`,`exp`.`date` AS `date`,`exp_line`.`bt_expense_id` AS `bt_expense_id`,`exp_line`.`value` AS `value` from ((`bt_expense_lines` `exp_line` join `bt_expense_line_templates` `exp_line_templ` on((`exp_line_templ`.`id` = `exp_line`.`bt_expense_line_template_id`))) join `bt_expenses` `exp` on((`exp`.`id` = `exp_line`.`bt_expense_id`))) where (`exp_line_templ`.`dom_type` = 'image') ;

-- --------------------------------------------------------

--
-- Structure for view `geo_locality_view`
--
DROP TABLE IF EXISTS `geo_locality_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `geo_locality_view`  AS  select `geo_locality`.`id` AS `geo_locality_id`,`geo_locality`.`title` AS `geo_locality_title`,`geo_region`.`id` AS `geo_region_id`,`geo_region`.`title` AS `geo_region_title`,`geo_country`.`id` AS `geo_country_id`,`geo_country`.`title` AS `geo_country_title` from ((`geo_locality` join `geo_region` on((`geo_region`.`id` = `geo_locality`.`geo_region_id`))) join `geo_country` on((`geo_country`.`id` = `geo_region`.`geo_country_id`))) ;

-- --------------------------------------------------------

--
-- Structure for view `helpdesk_ticket_history_helpdesk_users_view`
--
DROP TABLE IF EXISTS `helpdesk_ticket_history_helpdesk_users_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `helpdesk_ticket_history_helpdesk_users_view`  AS  select `helpdesk_ticket_history`.`id` AS `id`,`helpdesk_ticket_history`.`helpdesk_ticket_id` AS `helpdesk_ticket_id`,`helpdesk_ticket_history`.`user_id` AS `user_id`,`helpdesk_ticket_history`.`severity` AS `severity`,`helpdesk_ticket_history`.`state` AS `state`,`helpdesk_ticket_history`.`description` AS `description`,`helpdesk_ticket_history`.`eventTimestamp` AS `eventTimestamp` from `helpdesk_ticket_history` where `helpdesk_ticket_history`.`user_id` in (select `users`.`id` from `users` where (`users`.`type` = 'helpdesk')) ;

-- --------------------------------------------------------

--
-- Structure for view `helpdesk_ticket_history_last_case_state_view`
--
DROP TABLE IF EXISTS `helpdesk_ticket_history_last_case_state_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `helpdesk_ticket_history_last_case_state_view`  AS  select `a`.`id` AS `id`,`a`.`helpdesk_ticket_id` AS `helpdesk_ticket_id`,`a`.`user_id` AS `user_id`,`a`.`severity` AS `severity`,`a`.`state` AS `state`,`a`.`description` AS `description`,`a`.`eventTimestamp` AS `eventTimestamp` from (`helpdesk_ticket_history` `a` left join `helpdesk_ticket_history` `b` on(((`a`.`helpdesk_ticket_id` = `b`.`helpdesk_ticket_id`) and (`a`.`eventTimestamp` < `b`.`eventTimestamp`)))) where isnull(`b`.`helpdesk_ticket_id`) ;

-- --------------------------------------------------------

--
-- Structure for view `helpdesk_ticket_history_last_helpdesk_user_update_view`
--
DROP TABLE IF EXISTS `helpdesk_ticket_history_last_helpdesk_user_update_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `helpdesk_ticket_history_last_helpdesk_user_update_view`  AS  select `a`.`id` AS `id`,`a`.`helpdesk_ticket_id` AS `helpdesk_ticket_id`,`a`.`user_id` AS `user_id`,`a`.`severity` AS `severity`,`a`.`state` AS `state`,`a`.`description` AS `description`,`a`.`eventTimestamp` AS `eventTimestamp` from (`helpdesk_ticket_history_helpdesk_users_view` `a` left join `helpdesk_ticket_history_helpdesk_users_view` `b` on(((`a`.`helpdesk_ticket_id` = `b`.`helpdesk_ticket_id`) and (`a`.`eventTimestamp` < `b`.`eventTimestamp`)))) where isnull(`b`.`helpdesk_ticket_id`) ;

-- --------------------------------------------------------

--
-- Structure for view `timecard_approvals_view`
--
DROP TABLE IF EXISTS `timecard_approvals_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `timecard_approvals_view`  AS  select `timecard_approvers`.`id` AS `timecard_approvers_id`,`timecard_approvals`.`eventTimestamp` AS `timecard_approvals_eventTimestamp`,`timecard_approvals`.`timecard_id` AS `timecard_approvals_timecard_id`,`timecard_approvers`.`approver_order` AS `timecard_approvers_approver_order` from (`timecard_approvals` join `timecard_approvers` on((`timecard_approvers`.`id` = `timecard_approvals`.`approver_id`))) ;

-- --------------------------------------------------------

--
-- Structure for view `user_bonuses_avia_view`
--
DROP TABLE IF EXISTS `user_bonuses_avia_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `user_bonuses_avia_view`  AS  select `user_bonuses_avia`.`id` AS `id`,`user_bonuses_avia`.`user_id` AS `user_id`,`user_bonuses_avia`.`airline_id` AS `airline_id`,`user_bonuses_avia`.`number` AS `number`,`user_bonuses_avia`.`eventTimestamp` AS `eventTimestamp`,`airlines`.`code` AS `code`,`airlines`.`description_rus` AS `description_rus`,`airlines`.`description_eng` AS `description_eng`,`airlines`.`country` AS `country` from (`user_bonuses_avia` join `airlines` on((`user_bonuses_avia`.`airline_id` = `airlines`.`id`))) ;

-- --------------------------------------------------------

--
-- Structure for view `user_bonuses_hotel_view`
--
DROP TABLE IF EXISTS `user_bonuses_hotel_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `user_bonuses_hotel_view`  AS  select `user_bonuses_hotels`.`id` AS `id`,`user_bonuses_hotels`.`user_id` AS `user_id`,`user_bonuses_hotels`.`hotel_chain_id` AS `hotel_chain_id`,`user_bonuses_hotels`.`number` AS `number`,`user_bonuses_hotels`.`eventTimestamp` AS `eventTimestamp`,`hotel_chains`.`code` AS `code`,`hotel_chains`.`description_rus` AS `description_rus`,`hotel_chains`.`description_eng` AS `description_eng`,`hotel_chains`.`country` AS `country` from (`user_bonuses_hotels` join `hotel_chains` on((`user_bonuses_hotels`.`hotel_chain_id` = `hotel_chains`.`id`))) ;

-- --------------------------------------------------------

--
-- Structure for view `user_bonuses_railroad_view`
--
DROP TABLE IF EXISTS `user_bonuses_railroad_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `user_bonuses_railroad_view`  AS  select `user_bonuses_railroads`.`id` AS `id`,`user_bonuses_railroads`.`user_id` AS `user_id`,`user_bonuses_railroads`.`railroad_id` AS `railroad_id`,`user_bonuses_railroads`.`number` AS `number`,`user_bonuses_railroads`.`eventTimestamp` AS `eventTimestamp`,`railroads`.`code` AS `code`,`railroads`.`description_rus` AS `description_rus`,`railroads`.`description_eng` AS `description_eng`,`railroads`.`country` AS `country` from (`user_bonuses_railroads` join `railroads` on((`user_bonuses_railroads`.`railroad_id` = `railroads`.`id`))) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `absence`
--
ALTER TABLE `absence`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sow_id` (`company_id`),
  ADD KEY `absence_type_id` (`absence_type_id`),
  ADD KEY `start_date` (`start_date`),
  ADD KEY `end_date` (`end_date`);

--
-- Indexes for table `absence_types`
--
ALTER TABLE `absence_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `action_category`
--
ALTER TABLE `action_category`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `title` (`title`);

--
-- Indexes for table `action_types`
--
ALTER TABLE `action_types`
  ADD PRIMARY KEY (`id`),
  ADD KEY `categoryID` (`categoryID`),
  ADD KEY `title` (`title`),
  ADD KEY `isShowNotification` (`isShowNotification`),
  ADD KEY `isShowFeed` (`isShowFeed`);

--
-- Indexes for table `activators`
--
ALTER TABLE `activators`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `type` (`type`);

--
-- Indexes for table `airfare_limits_by_direction`
--
ALTER TABLE `airfare_limits_by_direction`
  ADD PRIMARY KEY (`id`),
  ADD KEY `from` (`from`),
  ADD KEY `to` (`to`),
  ADD KEY `owner_agency_id` (`agency_company_id`),
  ADD KEY `eventTimestamp` (`eventTimestamp`),
  ADD KEY `creator_user_id` (`creator_user_id`);

--
-- Indexes for table `airlines`
--
ALTER TABLE `airlines`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `iata_code` (`code`),
  ADD UNIQUE KEY `description_eng_2` (`description_eng`),
  ADD KEY `description_rus` (`description_rus`),
  ADD KEY `description_eng` (`description_eng`);

--
-- Indexes for table `airline_bookings`
--
ALTER TABLE `airline_bookings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `search_id` (`search_id`),
  ADD KEY `trip_id` (`search_trip_id`),
  ADD KEY `fare_id` (`search_fare_id`),
  ADD KEY `contract_sow_id` (`contract_sow_id`);

--
-- Indexes for table `airports`
--
ALTER TABLE `airports`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `airport_code` (`airport_code`),
  ADD KEY `city_name` (`city_name`),
  ADD KEY `airport_name` (`airport_name`),
  ADD KEY `world_area_code` (`world_area_code`),
  ADD KEY `airport_country_id` (`airport_country_id`);

--
-- Indexes for table `airport_countries`
--
ALTER TABLE `airport_countries`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `title_2` (`title`),
  ADD KEY `title` (`title`);

--
-- Indexes for table `banks`
--
ALTER TABLE `banks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bik` (`bik`),
  ADD KEY `geo_zip_id` (`geo_zip_id`);

--
-- Indexes for table `bt`
--
ALTER TABLE `bt`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sow_id` (`contract_sow_id`),
  ADD KEY `date_start` (`date_start`),
  ADD KEY `date_end` (`date_end`),
  ADD KEY `customer_id` (`customer_id`),
  ADD KEY `payed_date` (`payed_date`),
  ADD KEY `expected_pay_date` (`expected_pay_date`),
  ADD KEY `originals_received_date` (`originals_received_date`),
  ADD KEY `status` (`status`),
  ADD KEY `act_id` (`invoice_id`);

--
-- Indexes for table `bt_allowance`
--
ALTER TABLE `bt_allowance`
  ADD PRIMARY KEY (`id`),
  ADD KEY `agency_company_id` (`agency_company_id`),
  ADD KEY `country` (`geo_country_id`);

--
-- Indexes for table `bt_approvals`
--
ALTER TABLE `bt_approvals`
  ADD PRIMARY KEY (`id`),
  ADD KEY `timecard_id` (`bt_id`),
  ADD KEY `approver_id` (`approver_id`),
  ADD KEY `decision` (`decision`),
  ADD KEY `eventTimestamp` (`eventTimestamp`);

--
-- Indexes for table `bt_approvers`
--
ALTER TABLE `bt_approvers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `approver_user_id` (`approver_user_id`),
  ADD KEY `approver_order` (`approver_order`),
  ADD KEY `contract_psow_id` (`contract_psow_id`);

--
-- Indexes for table `bt_approvers_backup`
--
ALTER TABLE `bt_approvers_backup`
  ADD PRIMARY KEY (`id`),
  ADD KEY `approver_user_id` (`approver_user_id`),
  ADD KEY `contract_sow_id` (`contract_sow_id`),
  ADD KEY `approver_order` (`approver_order`),
  ADD KEY `contract_psow_id` (`contract_psow_id`);

--
-- Indexes for table `bt_expenses`
--
ALTER TABLE `bt_expenses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bt_id` (`bt_id`),
  ADD KEY `bt_expense_item_id` (`bt_expense_template_id`);

--
-- Indexes for table `bt_expense_items`
--
ALTER TABLE `bt_expense_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `is_default` (`is_default`) USING BTREE;

--
-- Indexes for table `bt_expense_item_docs`
--
ALTER TABLE `bt_expense_item_docs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bt_expense_item_id` (`bt_expense_item_id`),
  ADD KEY `type` (`type`),
  ADD KEY `payment` (`payment`),
  ADD KEY `required` (`required`);

--
-- Indexes for table `bt_expense_lines`
--
ALTER TABLE `bt_expense_lines`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bt_expense_id` (`bt_expense_id`),
  ADD KEY `bt_expenses_item_id` (`bt_expense_line_template_id`);

--
-- Indexes for table `bt_expense_line_templates`
--
ALTER TABLE `bt_expense_line_templates`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bt_expense_item_id` (`bt_expense_template_id`),
  ADD KEY `type` (`dom_type`),
  ADD KEY `payment` (`payment`),
  ADD KEY `required` (`required`);

--
-- Indexes for table `bt_expense_templates`
--
ALTER TABLE `bt_expense_templates`
  ADD PRIMARY KEY (`id`),
  ADD KEY `is_default` (`is_default`) USING BTREE,
  ADD KEY `agency_company_id` (`agency_company_id`);

--
-- Indexes for table `bt_sow`
--
ALTER TABLE `bt_sow`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sow_id` (`sow_id`),
  ADD KEY `bt_expence_item_id` (`bt_expense_template_id`);

--
-- Indexes for table `bt_sow_assignment`
--
ALTER TABLE `bt_sow_assignment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sow_id` (`sow_id`),
  ADD KEY `bt_expence_item_id` (`bt_expense_template_id`),
  ADD KEY `assignee_user_id` (`assignee_user_id`);

--
-- Indexes for table `captcha`
--
ALTER TABLE `captcha`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `id_2` (`id`),
  ADD KEY `id_3` (`id`),
  ADD KEY `id_4` (`id`);

--
-- Indexes for table `chat_contact_list`
--
ALTER TABLE `chat_contact_list`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userID` (`userID`),
  ADD KEY `friendID` (`friendID`);

--
-- Indexes for table `chat_messages`
--
ALTER TABLE `chat_messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fromType` (`fromType`),
  ADD KEY `fromID` (`fromID`),
  ADD KEY `toType` (`toType`),
  ADD KEY `toID` (`toID`),
  ADD KEY `messageStatus` (`messageStatus`),
  ADD KEY `secondsSinceY2k` (`secondsSinceY2k`);

--
-- Indexes for table `company`
--
ALTER TABLE `company`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `tin` (`tin`) USING BTREE,
  ADD KEY `name` (`name`),
  ADD KEY `owner_userID` (`admin_userID`),
  ADD KEY `isBlocked` (`isBlocked`),
  ADD KEY `lastActivity` (`lastActivity`),
  ADD KEY `link` (`link`),
  ADD KEY `geo_zip_id` (`legal_geo_zip_id`),
  ADD KEY `bank_id` (`bank_id`),
  ADD KEY `mailing_geo_zip_id` (`mailing_geo_zip_id`),
  ADD KEY `type` (`type`);

--
-- Indexes for table `company_agreement_files`
--
ALTER TABLE `company_agreement_files`
  ADD PRIMARY KEY (`id`),
  ADD KEY `owner_user_id` (`owner_user_id`),
  ADD KEY `company_id` (`company_id`) USING BTREE,
  ADD KEY `title` (`title`);

--
-- Indexes for table `company_candidates`
--
ALTER TABLE `company_candidates`
  ADD PRIMARY KEY (`id`),
  ADD KEY `vacancy_id` (`vacancy_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `status` (`status`);

--
-- Indexes for table `company_custom_fields`
--
ALTER TABLE `company_custom_fields`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `company_id_var_name` (`company_id`,`var_name`) USING BTREE,
  ADD KEY `title` (`var_name`),
  ADD KEY `owner_user_id` (`owner_user_id`),
  ADD KEY `visible_by_subcontractor` (`visible_by_subcontractor`),
  ADD KEY `editable_by_subcontractor` (`editable_by_subcontractor`),
  ADD KEY `company_id` (`company_id`) USING BTREE;

--
-- Indexes for table `company_employees`
--
ALTER TABLE `company_employees`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_id` (`user_id`) USING BTREE,
  ADD KEY `company_id` (`company_id`),
  ADD KEY `position_id` (`position_id`);

--
-- Indexes for table `company_founder`
--
ALTER TABLE `company_founder`
  ADD PRIMARY KEY (`id`),
  ADD KEY `companyID` (`companyID`),
  ADD KEY `owner_userID` (`founder_userID`),
  ADD KEY `founder_name` (`founder_name`);

--
-- Indexes for table `company_industry`
--
ALTER TABLE `company_industry`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `company_industry_ref`
--
ALTER TABLE `company_industry_ref`
  ADD PRIMARY KEY (`id`),
  ADD KEY `company_id` (`company_id`),
  ADD KEY `profile_id` (`profile_id`);

--
-- Indexes for table `company_owner`
--
ALTER TABLE `company_owner`
  ADD PRIMARY KEY (`id`),
  ADD KEY `companyID` (`companyID`),
  ADD KEY `owner_userID` (`owner_userID`),
  ADD KEY `owner_name` (`owner_name`),
  ADD KEY `companyID_2` (`companyID`);

--
-- Indexes for table `company_posession_request`
--
ALTER TABLE `company_posession_request`
  ADD PRIMARY KEY (`id`),
  ADD KEY `requested_company_id` (`requested_company_id`),
  ADD KEY `requester_user_id` (`requester_user_id`),
  ADD KEY `eventTimestamp` (`eventTimestamp`);

--
-- Indexes for table `company_position`
--
ALTER TABLE `company_position`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `title` (`title`);

--
-- Indexes for table `company_questions`
--
ALTER TABLE `company_questions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `set_id` (`set_id`);

--
-- Indexes for table `company_vacancy`
--
ALTER TABLE `company_vacancy`
  ADD PRIMARY KEY (`id`),
  ADD KEY `company_id` (`company_id`),
  ADD KEY `company_position_id` (`company_position_id`),
  ADD KEY `geo_locality_id` (`geo_locality_id`),
  ADD KEY `publish_start` (`publish_finish`);

--
-- Indexes for table `contracts_psow`
--
ALTER TABLE `contracts_psow`
  ADD PRIMARY KEY (`id`),
  ADD KEY `start_date` (`start_date`),
  ADD KEY `end_date` (`end_date`),
  ADD KEY `company_position_id` (`company_position_id`),
  ADD KEY `contract_sow_id` (`contract_sow_id`),
  ADD KEY `cost_center_id` (`cost_center_id`);

--
-- Indexes for table `contracts_sow`
--
ALTER TABLE `contracts_sow`
  ADD PRIMARY KEY (`id`),
  ADD KEY `employee_id` (`subcontractor_company_id`),
  ADD KEY `agency_id` (`agency_company_id`),
  ADD KEY `start_date` (`start_date`),
  ADD KEY `end_date` (`end_date`),
  ADD KEY `company_position_id` (`company_position_id`),
  ADD KEY `creator_user_id` (`creator_user_id`),
  ADD KEY `status` (`status`);

--
-- Indexes for table `contract_psow_custom_fields`
--
ALTER TABLE `contract_psow_custom_fields`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `contract_psow_id` (`contract_psow_id`,`var_name`),
  ADD KEY `sow_id` (`contract_psow_id`),
  ADD KEY `title` (`var_name`),
  ADD KEY `owner_user_id` (`owner_user_id`),
  ADD KEY `visible_by_subcontractor` (`visible_by_subcontractor`),
  ADD KEY `editable_by_subcontractor` (`editable_by_subcontractor`);

--
-- Indexes for table `contract_sow_agreement_files`
--
ALTER TABLE `contract_sow_agreement_files`
  ADD PRIMARY KEY (`id`),
  ADD KEY `owner_user_id` (`owner_user_id`),
  ADD KEY `contract_sow_id` (`contract_sow_id`),
  ADD KEY `title` (`title`);

--
-- Indexes for table `contract_sow_custom_fields`
--
ALTER TABLE `contract_sow_custom_fields`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `contract_sow_id` (`contract_sow_id`,`var_name`) USING BTREE,
  ADD KEY `sow_id` (`contract_sow_id`),
  ADD KEY `title` (`var_name`),
  ADD KEY `owner_user_id` (`owner_user_id`),
  ADD KEY `visible_by_subcontractor` (`visible_by_subcontractor`),
  ADD KEY `editable_by_subcontractor` (`editable_by_subcontractor`);

--
-- Indexes for table `cost_centers`
--
ALTER TABLE `cost_centers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `title` (`title`),
  ADD KEY `agency_company_id` (`agency_company_id`),
  ADD KEY `assignee_user_id` (`assignee_user_id`),
  ADD KEY `start_date` (`start_date`),
  ADD KEY `end_date` (`end_date`),
  ADD KEY `sign_date` (`sign_date`),
  ADD KEY `company_id` (`company_id`);

--
-- Indexes for table `cost_center_assignment`
--
ALTER TABLE `cost_center_assignment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cost_center_id` (`cost_center_id`),
  ADD KEY `timecard_customer_id` (`timecard_customer_id`),
  ADD KEY `assignee_user_id` (`assignee_user_id`);

--
-- Indexes for table `cost_center_custom_fields`
--
ALTER TABLE `cost_center_custom_fields`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `cost_center_id_2` (`cost_center_id`,`var_name`),
  ADD KEY `title` (`var_name`),
  ADD KEY `owner_user_id` (`owner_user_id`),
  ADD KEY `visible_by_subcontractor` (`visible_by_subcontractor`),
  ADD KEY `editable_by_subcontractor` (`editable_by_subcontractor`),
  ADD KEY `cost_center_id` (`cost_center_id`);

--
-- Indexes for table `currency_rate`
--
ALTER TABLE `currency_rate`
  ADD PRIMARY KEY (`id`),
  ADD KEY `date` (`date`),
  ADD KEY `num_code` (`num_code`),
  ADD KEY `char_code` (`char_code`),
  ADD KEY `nominal` (`nominal`),
  ADD KEY `name` (`name`),
  ADD KEY `value` (`value`);

--
-- Indexes for table `demo_requests`
--
ALTER TABLE `demo_requests`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dictionary_adverse`
--
ALTER TABLE `dictionary_adverse`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `email_change_tokens`
--
ALTER TABLE `email_change_tokens`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `exception`
--
ALTER TABLE `exception`
  ADD PRIMARY KEY (`identifier`);

--
-- Indexes for table `faq`
--
ALTER TABLE `faq`
  ADD PRIMARY KEY (`id`),
  ADD KEY `role` (`role`);

--
-- Indexes for table `feed`
--
ALTER TABLE `feed`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userId` (`userId`),
  ADD KEY `eventTimestamp` (`eventTimestamp`),
  ADD KEY `actionTypeId` (`actionTypeId`),
  ADD KEY `actionId` (`actionId`),
  ADD KEY `srcType` (`srcType`),
  ADD KEY `dstType` (`dstType`),
  ADD KEY `dstID` (`dstID`);

--
-- Indexes for table `feed_images`
--
ALTER TABLE `feed_images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userID` (`userID`),
  ADD KEY `tempSet` (`tempSet`),
  ADD KEY `setID` (`setID`),
  ADD KEY `srcType` (`srcType`);

--
-- Indexes for table `feed_message`
--
ALTER TABLE `feed_message`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`),
  ADD KEY `imageSetID` (`imageSetID`);

--
-- Indexes for table `feed_message_comment`
--
ALTER TABLE `feed_message_comment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `messageID` (`messageID`),
  ADD KEY `userID` (`userID`),
  ADD KEY `type` (`type`);

--
-- Indexes for table `feed_message_params`
--
ALTER TABLE `feed_message_params`
  ADD PRIMARY KEY (`id`),
  ADD KEY `messageID` (`messageID`),
  ADD KEY `userID` (`userID`),
  ADD KEY `parameter` (`parameter`);

--
-- Indexes for table `geo_country`
--
ALTER TABLE `geo_country`
  ADD PRIMARY KEY (`id`),
  ADD KEY `title` (`title`);

--
-- Indexes for table `geo_locality`
--
ALTER TABLE `geo_locality`
  ADD PRIMARY KEY (`id`),
  ADD KEY `title` (`title`),
  ADD KEY `geo_region_id` (`geo_region_id`);

--
-- Indexes for table `geo_locality_unknown`
--
ALTER TABLE `geo_locality_unknown`
  ADD PRIMARY KEY (`id`),
  ADD KEY `locality` (`locality`) USING BTREE;

--
-- Indexes for table `geo_region`
--
ALTER TABLE `geo_region`
  ADD PRIMARY KEY (`id`),
  ADD KEY `title` (`title`),
  ADD KEY `geo_country_id` (`geo_country_id`);

--
-- Indexes for table `geo_zip`
--
ALTER TABLE `geo_zip`
  ADD PRIMARY KEY (`id`),
  ADD KEY `zip` (`zip`),
  ADD KEY `geo_locality_id` (`geo_locality_id`) USING BTREE;

--
-- Indexes for table `groups`
--
ALTER TABLE `groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `link` (`link`),
  ADD KEY `owner_id` (`owner_id`),
  ADD KEY `isBlocked` (`isBlocked`);

--
-- Indexes for table `helpdesk_tickets`
--
ALTER TABLE `helpdesk_tickets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `title` (`title`),
  ADD KEY `opener_user_id` (`customer_user_id`);

--
-- Indexes for table `helpdesk_ticket_attaches`
--
ALTER TABLE `helpdesk_ticket_attaches`
  ADD PRIMARY KEY (`id`),
  ADD KEY `helpdesk_ticket_history_id` (`helpdesk_ticket_history_id`);

--
-- Indexes for table `helpdesk_ticket_history`
--
ALTER TABLE `helpdesk_ticket_history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `helpdesk_ticket_id` (`helpdesk_ticket_id`),
  ADD KEY `state` (`state`),
  ADD KEY `eventTimestamp` (`eventTimestamp`),
  ADD KEY `company_user_id` (`user_id`),
  ADD KEY `severity` (`severity`);

--
-- Indexes for table `holiday_calendar`
--
ALTER TABLE `holiday_calendar`
  ADD PRIMARY KEY (`id`),
  ADD KEY `date` (`date`),
  ADD KEY `agency_company_id` (`agency_company_id`);

--
-- Indexes for table `hotel_chains`
--
ALTER TABLE `hotel_chains`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `iata_code` (`code`),
  ADD UNIQUE KEY `description_eng_2` (`description_eng`),
  ADD KEY `description_rus` (`description_rus`),
  ADD KEY `description_eng` (`description_eng`);

--
-- Indexes for table `invoices`
--
ALTER TABLE `invoices`
  ADD PRIMARY KEY (`id`),
  ADD KEY `full_number` (`full_number`);

--
-- Indexes for table `invoice_cost_center_bt`
--
ALTER TABLE `invoice_cost_center_bt`
  ADD PRIMARY KEY (`id`),
  ADD KEY `owner_user_id` (`owner_user_id`),
  ADD KEY `cost_center_id` (`cost_center_id`),
  ADD KEY `owner_company_id` (`owner_company_id`),
  ADD KEY `act_id` (`invoice_id`);

--
-- Indexes for table `invoice_cost_center_bt_details`
--
ALTER TABLE `invoice_cost_center_bt_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `invoice_cost_center_bt_id` (`invoice_cost_center_bt_id`),
  ADD KEY `bt_id` (`bt_id`);

--
-- Indexes for table `invoice_cost_center_service`
--
ALTER TABLE `invoice_cost_center_service`
  ADD PRIMARY KEY (`id`),
  ADD KEY `owner_user_id` (`owner_user_id`),
  ADD KEY `cost_center_id` (`cost_center_id`),
  ADD KEY `owner_company_id` (`owner_company_id`),
  ADD KEY `act_id` (`invoice_id`);

--
-- Indexes for table `invoice_cost_center_service_details`
--
ALTER TABLE `invoice_cost_center_service_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `contract_sow_id` (`timecard_id`),
  ADD KEY `invoice_cost_center_service_id` (`invoice_cost_center_service_id`);

--
-- Indexes for table `language`
--
ALTER TABLE `language`
  ADD PRIMARY KEY (`id`),
  ADD KEY `title` (`title`);

--
-- Indexes for table `name_sex`
--
ALTER TABLE `name_sex`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `sex` (`sex`);

--
-- Indexes for table `password_dictionary_adjectives`
--
ALTER TABLE `password_dictionary_adjectives`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_dictionary_characteristics`
--
ALTER TABLE `password_dictionary_characteristics`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_dictionary_nouns`
--
ALTER TABLE `password_dictionary_nouns`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `phone_confirmation`
--
ALTER TABLE `phone_confirmation`
  ADD PRIMARY KEY (`id`),
  ADD KEY `session` (`session`),
  ADD KEY `confirmation_code` (`confirmation_code`),
  ADD KEY `eventTimestamp` (`eventTimestamp`);

--
-- Indexes for table `railroads`
--
ALTER TABLE `railroads`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `iata_code` (`code`),
  ADD UNIQUE KEY `description_eng_2` (`description_eng`),
  ADD KEY `description_rus` (`description_rus`),
  ADD KEY `description_eng` (`description_eng`);

--
-- Indexes for table `schema_migrations`
--
ALTER TABLE `schema_migrations`
  ADD PRIMARY KEY (`version`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`),
  ADD KEY `time` (`time`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `previous_sesid` (`previous_sessid`);

--
-- Indexes for table `sessions_persistence_ratelimit`
--
ALTER TABLE `sessions_persistence_ratelimit`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ip` (`ip`),
  ADD KEY `eventTimestamp` (`eventTimestamp`);

--
-- Indexes for table `settings_default`
--
ALTER TABLE `settings_default`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `setting` (`setting`);

--
-- Indexes for table `site_themes`
--
ALTER TABLE `site_themes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sms_report`
--
ALTER TABLE `sms_report`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subcontractors_to_agency_mapping`
--
ALTER TABLE `subcontractors_to_agency_mapping`
  ADD PRIMARY KEY (`id`),
  ADD KEY `subcontractor_company_id` (`subcontractor_company_id`),
  ADD KEY `agency_company_id` (`agency_company_id`);

--
-- Indexes for table `temp_media`
--
ALTER TABLE `temp_media`
  ADD PRIMARY KEY (`id`),
  ADD KEY `eventTimestamp` (`eventTimestamp`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `mediaType` (`mediaType`);

--
-- Indexes for table `timecards`
--
ALTER TABLE `timecards`
  ADD PRIMARY KEY (`id`),
  ADD KEY `period_start` (`period_start`),
  ADD KEY `contract_sow_id` (`contract_sow_id`),
  ADD KEY `status` (`status`),
  ADD KEY `period_end` (`period_end`),
  ADD KEY `payed_date` (`payed_date`),
  ADD KEY `expected_pay_date` (`expected_pay_date`),
  ADD KEY `originals_received_date` (`originals_received_date`),
  ADD KEY `act_id` (`invoice_id`);

--
-- Indexes for table `timecard_approvals`
--
ALTER TABLE `timecard_approvals`
  ADD PRIMARY KEY (`id`),
  ADD KEY `timecard_id` (`timecard_id`),
  ADD KEY `approver_id` (`approver_id`),
  ADD KEY `decision` (`decision`),
  ADD KEY `eventTimestamp` (`eventTimestamp`);

--
-- Indexes for table `timecard_approvers`
--
ALTER TABLE `timecard_approvers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `approver_user_id` (`approver_user_id`),
  ADD KEY `approver_order` (`approver_order`),
  ADD KEY `contract_psow_id` (`contract_psow_id`);

--
-- Indexes for table `timecard_customers`
--
ALTER TABLE `timecard_customers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `title` (`title`),
  ADD KEY `agency_company_id` (`agency_company_id`);

--
-- Indexes for table `timecard_lines`
--
ALTER TABLE `timecard_lines`
  ADD PRIMARY KEY (`id`),
  ADD KEY `timecard_id` (`timecard_id`),
  ADD KEY `timecard_tasks_id` (`timecard_task_id`);

--
-- Indexes for table `timecard_projects`
--
ALTER TABLE `timecard_projects`
  ADD PRIMARY KEY (`id`),
  ADD KEY `timecard_cutomers_id` (`timecard_customers_id`),
  ADD KEY `title` (`title`);

--
-- Indexes for table `timecard_tasks`
--
ALTER TABLE `timecard_tasks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `timecard_projects_id` (`timecard_projects_id`),
  ADD KEY `title` (`title`);

--
-- Indexes for table `timecard_task_assignment`
--
ALTER TABLE `timecard_task_assignment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `timecard_tasks_id` (`timecard_tasks_id`),
  ADD KEY `contract_sow_id` (`contract_sow_id`),
  ADD KEY `assignee_id` (`assignee_user_id`),
  ADD KEY `period_start` (`period_start`),
  ADD KEY `period_end` (`period_end`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email_2` (`email`),
  ADD UNIQUE KEY `login_2` (`login`),
  ADD KEY `name` (`name`),
  ADD KEY `nameLast` (`nameLast`),
  ADD KEY `birthdayAccess` (`birthdayAccess`),
  ADD KEY `birthday` (`birthday`),
  ADD KEY `nameMiddle` (`nameMiddle`),
  ADD KEY `phone` (`phone`),
  ADD KEY `country_code` (`country_code`),
  ADD KEY `helpdesk_subscription_S1` (`helpdesk_subscription_S1_sms`),
  ADD KEY `helpdesk_subscription_S2` (`helpdesk_subscription_S2_sms`),
  ADD KEY `helpdesk_subscription_S3` (`helpdesk_subscription_S3_sms`),
  ADD KEY `helpdesk_subscription_S4` (`helpdesk_subscription_S4_sms`),
  ADD KEY `helpdesk_subscription_S1_email` (`helpdesk_subscription_S1_email`),
  ADD KEY `helpdesk_subscription_S2_email` (`helpdesk_subscription_S2_email`),
  ADD KEY `helpdesk_subscription_S3_email` (`helpdesk_subscription_S3_email`),
  ADD KEY `helpdesk_subscription_S4_email` (`helpdesk_subscription_S4_email`),
  ADD KEY `helpdesk_new_notification_S1_sms` (`helpdesk_new_notification_S1_sms`),
  ADD KEY `helpdesk_new_notification_S2_sms` (`helpdesk_new_notification_S2_sms`),
  ADD KEY `helpdesk_new_notification_S3_sms` (`helpdesk_new_notification_S3_sms`),
  ADD KEY `helpdesk_new_notification_S4_sms` (`helpdesk_new_notification_S4_sms`),
  ADD KEY `helpdesk_new_notification_S1_email` (`helpdesk_new_notification_S1_email`),
  ADD KEY `helpdesk_new_notification_S2_email` (`helpdesk_new_notification_S2_email`),
  ADD KEY `helpdesk_new_notification_S3_email` (`helpdesk_new_notification_S3_email`),
  ADD KEY `helpdesk_new_notification_S4_email` (`helpdesk_new_notification_S4_email`),
  ADD KEY `timecard_pending_approval_notification` (`pending_approval_notification_timecard`),
  ADD KEY `bt_pending_approval_notification` (`pending_approval_notification_bt`);

--
-- Indexes for table `users_avatars`
--
ALTER TABLE `users_avatars`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userid` (`userid`),
  ADD KEY `isActive` (`isActive`);

--
-- Indexes for table `users_company`
--
ALTER TABLE `users_company`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `company_id` (`company_id`),
  ADD KEY `position_title_id` (`position_title_id`);

--
-- Indexes for table `users_complains`
--
ALTER TABLE `users_complains`
  ADD PRIMARY KEY (`id`),
  ADD KEY `entityID` (`entityID`),
  ADD KEY `userID` (`userID`),
  ADD KEY `subtype` (`subtype`),
  ADD KEY `type` (`type`);

--
-- Indexes for table `users_friends`
--
ALTER TABLE `users_friends`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userID` (`userID`),
  ADD KEY `friendID` (`friendID`),
  ADD KEY `state` (`state`);

--
-- Indexes for table `users_language`
--
ALTER TABLE `users_language`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `language_id` (`language_id`);

--
-- Indexes for table `users_notification`
--
ALTER TABLE `users_notification`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userId` (`userId`),
  ADD KEY `actionTypeId` (`actionTypeId`),
  ADD KEY `actionId` (`actionId`),
  ADD KEY `notificationStatus` (`notificationStatus`),
  ADD KEY `eventTimestamp_2` (`eventTimestamp`);

--
-- Indexes for table `users_passwd`
--
ALTER TABLE `users_passwd`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userID` (`userID`),
  ADD KEY `isActive` (`isActive`),
  ADD KEY `passwd` (`passwd`);

--
-- Indexes for table `users_subscriptions`
--
ALTER TABLE `users_subscriptions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `entity_type` (`entity_type`),
  ADD KEY `entity_id` (`entity_id`);

--
-- Indexes for table `users_watched`
--
ALTER TABLE `users_watched`
  ADD PRIMARY KEY (`id`),
  ADD KEY `watching_userID` (`watching_userID`),
  ADD KEY `eventTimestamp` (`eventTimestamp`),
  ADD KEY `watched_userID` (`watched_userID`);

--
-- Indexes for table `user_bonuses_avia`
--
ALTER TABLE `user_bonuses_avia`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bonuses_avia_id` (`airline_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `user_bonuses_hotels`
--
ALTER TABLE `user_bonuses_hotels`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bonuses_avia_id` (`hotel_chain_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `user_bonuses_railroads`
--
ALTER TABLE `user_bonuses_railroads`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bonuses_avia_id` (`railroad_id`),
  ADD KEY `user_id` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `absence`
--
ALTER TABLE `absence`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT for table `absence_types`
--
ALTER TABLE `absence_types`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `action_category`
--
ALTER TABLE `action_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=114;
--
-- AUTO_INCREMENT for table `action_types`
--
ALTER TABLE `action_types`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2001;
--
-- AUTO_INCREMENT for table `airfare_limits_by_direction`
--
ALTER TABLE `airfare_limits_by_direction`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT for table `airlines`
--
ALTER TABLE `airlines`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12735;
--
-- AUTO_INCREMENT for table `airline_bookings`
--
ALTER TABLE `airline_bookings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;
--
-- AUTO_INCREMENT for table `airports`
--
ALTER TABLE `airports`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9524;
--
-- AUTO_INCREMENT for table `airport_countries`
--
ALTER TABLE `airport_countries`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=234;
--
-- AUTO_INCREMENT for table `banks`
--
ALTER TABLE `banks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1884;
--
-- AUTO_INCREMENT for table `bt`
--
ALTER TABLE `bt`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81;
--
-- AUTO_INCREMENT for table `bt_allowance`
--
ALTER TABLE `bt_allowance`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `bt_approvals`
--
ALTER TABLE `bt_approvals`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;
--
-- AUTO_INCREMENT for table `bt_approvers`
--
ALTER TABLE `bt_approvers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;
--
-- AUTO_INCREMENT for table `bt_approvers_backup`
--
ALTER TABLE `bt_approvers_backup`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;
--
-- AUTO_INCREMENT for table `bt_expenses`
--
ALTER TABLE `bt_expenses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=107;
--
-- AUTO_INCREMENT for table `bt_expense_items`
--
ALTER TABLE `bt_expense_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `bt_expense_item_docs`
--
ALTER TABLE `bt_expense_item_docs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `bt_expense_lines`
--
ALTER TABLE `bt_expense_lines`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=318;
--
-- AUTO_INCREMENT for table `bt_expense_line_templates`
--
ALTER TABLE `bt_expense_line_templates`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
--
-- AUTO_INCREMENT for table `bt_expense_templates`
--
ALTER TABLE `bt_expense_templates`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `bt_sow`
--
ALTER TABLE `bt_sow`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `bt_sow_assignment`
--
ALTER TABLE `bt_sow_assignment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;
--
-- AUTO_INCREMENT for table `captcha`
--
ALTER TABLE `captcha`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `chat_contact_list`
--
ALTER TABLE `chat_contact_list`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `chat_messages`
--
ALTER TABLE `chat_messages`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `company`
--
ALTER TABLE `company`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1100;
--
-- AUTO_INCREMENT for table `company_agreement_files`
--
ALTER TABLE `company_agreement_files`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;
--
-- AUTO_INCREMENT for table `company_candidates`
--
ALTER TABLE `company_candidates`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `company_custom_fields`
--
ALTER TABLE `company_custom_fields`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;
--
-- AUTO_INCREMENT for table `company_employees`
--
ALTER TABLE `company_employees`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `company_founder`
--
ALTER TABLE `company_founder`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;
--
-- AUTO_INCREMENT for table `company_industry`
--
ALTER TABLE `company_industry`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT for table `company_industry_ref`
--
ALTER TABLE `company_industry_ref`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `company_owner`
--
ALTER TABLE `company_owner`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `company_posession_request`
--
ALTER TABLE `company_posession_request`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `company_position`
--
ALTER TABLE `company_position`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15264;
--
-- AUTO_INCREMENT for table `company_questions`
--
ALTER TABLE `company_questions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `company_vacancy`
--
ALTER TABLE `company_vacancy`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
--
-- AUTO_INCREMENT for table `contracts_psow`
--
ALTER TABLE `contracts_psow`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;
--
-- AUTO_INCREMENT for table `contracts_sow`
--
ALTER TABLE `contracts_sow`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;
--
-- AUTO_INCREMENT for table `contract_psow_custom_fields`
--
ALTER TABLE `contract_psow_custom_fields`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;
--
-- AUTO_INCREMENT for table `contract_sow_agreement_files`
--
ALTER TABLE `contract_sow_agreement_files`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `contract_sow_custom_fields`
--
ALTER TABLE `contract_sow_custom_fields`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=258;
--
-- AUTO_INCREMENT for table `cost_centers`
--
ALTER TABLE `cost_centers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT for table `cost_center_assignment`
--
ALTER TABLE `cost_center_assignment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;
--
-- AUTO_INCREMENT for table `cost_center_custom_fields`
--
ALTER TABLE `cost_center_custom_fields`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;
--
-- AUTO_INCREMENT for table `currency_rate`
--
ALTER TABLE `currency_rate`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6701;
--
-- AUTO_INCREMENT for table `demo_requests`
--
ALTER TABLE `demo_requests`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;
--
-- AUTO_INCREMENT for table `dictionary_adverse`
--
ALTER TABLE `dictionary_adverse`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `email_change_tokens`
--
ALTER TABLE `email_change_tokens`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `exception`
--
ALTER TABLE `exception`
  MODIFY `identifier` int(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=112;
--
-- AUTO_INCREMENT for table `faq`
--
ALTER TABLE `faq`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `feed`
--
ALTER TABLE `feed`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8162;
--
-- AUTO_INCREMENT for table `feed_images`
--
ALTER TABLE `feed_images`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1455;
--
-- AUTO_INCREMENT for table `feed_message`
--
ALTER TABLE `feed_message`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=279;
--
-- AUTO_INCREMENT for table `feed_message_comment`
--
ALTER TABLE `feed_message_comment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=233;
--
-- AUTO_INCREMENT for table `feed_message_params`
--
ALTER TABLE `feed_message_params`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=301;
--
-- AUTO_INCREMENT for table `geo_country`
--
ALTER TABLE `geo_country`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=381;
--
-- AUTO_INCREMENT for table `geo_locality`
--
ALTER TABLE `geo_locality`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29821;
--
-- AUTO_INCREMENT for table `geo_locality_unknown`
--
ALTER TABLE `geo_locality_unknown`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `geo_region`
--
ALTER TABLE `geo_region`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=787;
--
-- AUTO_INCREMENT for table `geo_zip`
--
ALTER TABLE `geo_zip`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44993;
--
-- AUTO_INCREMENT for table `groups`
--
ALTER TABLE `groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;
--
-- AUTO_INCREMENT for table `helpdesk_tickets`
--
ALTER TABLE `helpdesk_tickets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=438814;
--
-- AUTO_INCREMENT for table `helpdesk_ticket_attaches`
--
ALTER TABLE `helpdesk_ticket_attaches`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=131;
--
-- AUTO_INCREMENT for table `helpdesk_ticket_history`
--
ALTER TABLE `helpdesk_ticket_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=312;
--
-- AUTO_INCREMENT for table `holiday_calendar`
--
ALTER TABLE `holiday_calendar`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT for table `hotel_chains`
--
ALTER TABLE `hotel_chains`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `invoices`
--
ALTER TABLE `invoices`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=269;
--
-- AUTO_INCREMENT for table `invoice_cost_center_bt`
--
ALTER TABLE `invoice_cost_center_bt`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;
--
-- AUTO_INCREMENT for table `invoice_cost_center_bt_details`
--
ALTER TABLE `invoice_cost_center_bt_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=131;
--
-- AUTO_INCREMENT for table `invoice_cost_center_service`
--
ALTER TABLE `invoice_cost_center_service`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=126;
--
-- AUTO_INCREMENT for table `invoice_cost_center_service_details`
--
ALTER TABLE `invoice_cost_center_service_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=181;
--
-- AUTO_INCREMENT for table `language`
--
ALTER TABLE `language`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=85;
--
-- AUTO_INCREMENT for table `name_sex`
--
ALTER TABLE `name_sex`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=753;
--
-- AUTO_INCREMENT for table `password_dictionary_adjectives`
--
ALTER TABLE `password_dictionary_adjectives`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=370;
--
-- AUTO_INCREMENT for table `password_dictionary_characteristics`
--
ALTER TABLE `password_dictionary_characteristics`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=738;
--
-- AUTO_INCREMENT for table `password_dictionary_nouns`
--
ALTER TABLE `password_dictionary_nouns`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1383;
--
-- AUTO_INCREMENT for table `phone_confirmation`
--
ALTER TABLE `phone_confirmation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `railroads`
--
ALTER TABLE `railroads`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `sessions_persistence_ratelimit`
--
ALTER TABLE `sessions_persistence_ratelimit`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1052;
--
-- AUTO_INCREMENT for table `settings_default`
--
ALTER TABLE `settings_default`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `site_themes`
--
ALTER TABLE `site_themes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `sms_report`
--
ALTER TABLE `sms_report`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=183;
--
-- AUTO_INCREMENT for table `subcontractors_to_agency_mapping`
--
ALTER TABLE `subcontractors_to_agency_mapping`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `temp_media`
--
ALTER TABLE `temp_media`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `timecards`
--
ALTER TABLE `timecards`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=74;
--
-- AUTO_INCREMENT for table `timecard_approvals`
--
ALTER TABLE `timecard_approvals`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=154;
--
-- AUTO_INCREMENT for table `timecard_approvers`
--
ALTER TABLE `timecard_approvers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;
--
-- AUTO_INCREMENT for table `timecard_customers`
--
ALTER TABLE `timecard_customers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT for table `timecard_lines`
--
ALTER TABLE `timecard_lines`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=351;
--
-- AUTO_INCREMENT for table `timecard_projects`
--
ALTER TABLE `timecard_projects`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;
--
-- AUTO_INCREMENT for table `timecard_tasks`
--
ALTER TABLE `timecard_tasks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;
--
-- AUTO_INCREMENT for table `timecard_task_assignment`
--
ALTER TABLE `timecard_task_assignment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=75;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1058;
--
-- AUTO_INCREMENT for table `users_avatars`
--
ALTER TABLE `users_avatars`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=159;
--
-- AUTO_INCREMENT for table `users_company`
--
ALTER TABLE `users_company`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `users_complains`
--
ALTER TABLE `users_complains`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `users_friends`
--
ALTER TABLE `users_friends`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `users_language`
--
ALTER TABLE `users_language`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `users_notification`
--
ALTER TABLE `users_notification`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3823;
--
-- AUTO_INCREMENT for table `users_passwd`
--
ALTER TABLE `users_passwd`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=93;
--
-- AUTO_INCREMENT for table `users_subscriptions`
--
ALTER TABLE `users_subscriptions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=71;
--
-- AUTO_INCREMENT for table `users_watched`
--
ALTER TABLE `users_watched`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `user_bonuses_avia`
--
ALTER TABLE `user_bonuses_avia`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT for table `user_bonuses_hotels`
--
ALTER TABLE `user_bonuses_hotels`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `user_bonuses_railroads`
--
ALTER TABLE `user_bonuses_railroads`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `absence`
--
ALTER TABLE `absence`
  ADD CONSTRAINT `absence_ibfk_2` FOREIGN KEY (`absence_type_id`) REFERENCES `absence_types` (`id`),
  ADD CONSTRAINT `absence_ibfk_3` FOREIGN KEY (`company_id`) REFERENCES `company` (`id`);

--
-- Constraints for table `action_types`
--
ALTER TABLE `action_types`
  ADD CONSTRAINT `action_types_ibfk_1` FOREIGN KEY (`categoryID`) REFERENCES `action_category` (`id`);

--
-- Constraints for table `airfare_limits_by_direction`
--
ALTER TABLE `airfare_limits_by_direction`
  ADD CONSTRAINT `airfare_limits_by_direction_ibfk_1` FOREIGN KEY (`from`) REFERENCES `airport_countries` (`id`),
  ADD CONSTRAINT `airfare_limits_by_direction_ibfk_2` FOREIGN KEY (`to`) REFERENCES `airport_countries` (`id`),
  ADD CONSTRAINT `airfare_limits_by_direction_ibfk_3` FOREIGN KEY (`agency_company_id`) REFERENCES `company` (`id`),
  ADD CONSTRAINT `airfare_limits_by_direction_ibfk_4` FOREIGN KEY (`creator_user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `airline_bookings`
--
ALTER TABLE `airline_bookings`
  ADD CONSTRAINT `airline_bookings_ibfk_2` FOREIGN KEY (`contract_sow_id`) REFERENCES `contracts_sow` (`id`);

--
-- Constraints for table `airports`
--
ALTER TABLE `airports`
  ADD CONSTRAINT `airports_ibfk_1` FOREIGN KEY (`airport_country_id`) REFERENCES `airport_countries` (`id`);

--
-- Constraints for table `banks`
--
ALTER TABLE `banks`
  ADD CONSTRAINT `banks_ibfk_1` FOREIGN KEY (`geo_zip_id`) REFERENCES `geo_zip` (`id`);

--
-- Constraints for table `bt`
--
ALTER TABLE `bt`
  ADD CONSTRAINT `bt_ibfk_1` FOREIGN KEY (`contract_sow_id`) REFERENCES `contracts_sow` (`id`),
  ADD CONSTRAINT `bt_ibfk_2` FOREIGN KEY (`customer_id`) REFERENCES `timecard_customers` (`id`),
  ADD CONSTRAINT `bt_ibfk_3` FOREIGN KEY (`invoice_id`) REFERENCES `invoices` (`id`);

--
-- Constraints for table `bt_allowance`
--
ALTER TABLE `bt_allowance`
  ADD CONSTRAINT `bt_allowance_ibfk_1` FOREIGN KEY (`agency_company_id`) REFERENCES `company` (`id`),
  ADD CONSTRAINT `bt_allowance_ibfk_2` FOREIGN KEY (`geo_country_id`) REFERENCES `geo_country` (`id`);

--
-- Constraints for table `bt_approvals`
--
ALTER TABLE `bt_approvals`
  ADD CONSTRAINT `bt_approvals_ibfk_1` FOREIGN KEY (`bt_id`) REFERENCES `bt` (`id`),
  ADD CONSTRAINT `bt_approvals_ibfk_2` FOREIGN KEY (`approver_id`) REFERENCES `bt_approvers` (`id`);

--
-- Constraints for table `bt_approvers`
--
ALTER TABLE `bt_approvers`
  ADD CONSTRAINT `bt_approvers_ibfk_1` FOREIGN KEY (`approver_user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `bt_approvers_ibfk_3` FOREIGN KEY (`contract_psow_id`) REFERENCES `contracts_psow` (`id`);

--
-- Constraints for table `bt_expenses`
--
ALTER TABLE `bt_expenses`
  ADD CONSTRAINT `bt_expenses_ibfk_1` FOREIGN KEY (`bt_id`) REFERENCES `bt` (`id`),
  ADD CONSTRAINT `bt_expenses_ibfk_2` FOREIGN KEY (`bt_expense_template_id`) REFERENCES `bt_expense_templates` (`id`);

--
-- Constraints for table `bt_expense_item_docs`
--
ALTER TABLE `bt_expense_item_docs`
  ADD CONSTRAINT `bt_expense_item_docs_ibfk_1` FOREIGN KEY (`bt_expense_item_id`) REFERENCES `bt_expense_items` (`id`);

--
-- Constraints for table `bt_expense_lines`
--
ALTER TABLE `bt_expense_lines`
  ADD CONSTRAINT `bt_expense_lines_ibfk_1` FOREIGN KEY (`bt_expense_id`) REFERENCES `bt_expenses` (`id`),
  ADD CONSTRAINT `bt_expense_lines_ibfk_2` FOREIGN KEY (`bt_expense_line_template_id`) REFERENCES `bt_expense_line_templates` (`id`);

--
-- Constraints for table `bt_expense_line_templates`
--
ALTER TABLE `bt_expense_line_templates`
  ADD CONSTRAINT `bt_expense_line_templates_ibfk_1` FOREIGN KEY (`bt_expense_template_id`) REFERENCES `bt_expense_templates` (`id`);

--
-- Constraints for table `bt_expense_templates`
--
ALTER TABLE `bt_expense_templates`
  ADD CONSTRAINT `bt_expense_templates_ibfk_1` FOREIGN KEY (`agency_company_id`) REFERENCES `company` (`id`);

--
-- Constraints for table `bt_sow`
--
ALTER TABLE `bt_sow`
  ADD CONSTRAINT `bt_sow_ibfk_1` FOREIGN KEY (`sow_id`) REFERENCES `contracts_sow` (`id`),
  ADD CONSTRAINT `bt_sow_ibfk_2` FOREIGN KEY (`bt_expense_template_id`) REFERENCES `bt_expense_templates` (`id`);

--
-- Constraints for table `bt_sow_assignment`
--
ALTER TABLE `bt_sow_assignment`
  ADD CONSTRAINT `bt_sow_assignment_ibfk_1` FOREIGN KEY (`sow_id`) REFERENCES `contracts_sow` (`id`),
  ADD CONSTRAINT `bt_sow_assignment_ibfk_2` FOREIGN KEY (`bt_expense_template_id`) REFERENCES `bt_expense_templates` (`id`),
  ADD CONSTRAINT `bt_sow_assignment_ibfk_3` FOREIGN KEY (`assignee_user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `chat_contact_list`
--
ALTER TABLE `chat_contact_list`
  ADD CONSTRAINT `chat_contact_list_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `chat_contact_list_ibfk_2` FOREIGN KEY (`friendID`) REFERENCES `users` (`id`);

--
-- Constraints for table `company`
--
ALTER TABLE `company`
  ADD CONSTRAINT `company_ibfk_1` FOREIGN KEY (`legal_geo_zip_id`) REFERENCES `geo_zip` (`id`),
  ADD CONSTRAINT `company_ibfk_2` FOREIGN KEY (`bank_id`) REFERENCES `banks` (`id`),
  ADD CONSTRAINT `company_ibfk_3` FOREIGN KEY (`admin_userID`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `company_ibfk_4` FOREIGN KEY (`mailing_geo_zip_id`) REFERENCES `geo_zip` (`id`);

--
-- Constraints for table `company_agreement_files`
--
ALTER TABLE `company_agreement_files`
  ADD CONSTRAINT `company_agreement_files_ibfk_1` FOREIGN KEY (`company_id`) REFERENCES `company` (`id`),
  ADD CONSTRAINT `company_agreement_files_ibfk_2` FOREIGN KEY (`owner_user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `company_custom_fields`
--
ALTER TABLE `company_custom_fields`
  ADD CONSTRAINT `company_custom_fields_ibfk_1` FOREIGN KEY (`company_id`) REFERENCES `company` (`id`),
  ADD CONSTRAINT `company_custom_fields_ibfk_2` FOREIGN KEY (`owner_user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `company_employees`
--
ALTER TABLE `company_employees`
  ADD CONSTRAINT `company_employees_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `company_employees_ibfk_2` FOREIGN KEY (`company_id`) REFERENCES `company` (`id`),
  ADD CONSTRAINT `company_employees_ibfk_3` FOREIGN KEY (`position_id`) REFERENCES `company_position` (`id`);

--
-- Constraints for table `company_industry_ref`
--
ALTER TABLE `company_industry_ref`
  ADD CONSTRAINT `company_industry_ref_ibfk_1` FOREIGN KEY (`company_id`) REFERENCES `company` (`id`),
  ADD CONSTRAINT `company_industry_ref_ibfk_2` FOREIGN KEY (`profile_id`) REFERENCES `company_industry_ref` (`id`);

--
-- Constraints for table `company_owner`
--
ALTER TABLE `company_owner`
  ADD CONSTRAINT `company_owner_ibfk_1` FOREIGN KEY (`companyID`) REFERENCES `company` (`id`);

--
-- Constraints for table `company_posession_request`
--
ALTER TABLE `company_posession_request`
  ADD CONSTRAINT `company_posession_request_ibfk_1` FOREIGN KEY (`requested_company_id`) REFERENCES `company` (`id`),
  ADD CONSTRAINT `company_posession_request_ibfk_2` FOREIGN KEY (`requester_user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `company_vacancy`
--
ALTER TABLE `company_vacancy`
  ADD CONSTRAINT `company_vacancy_ibfk_1` FOREIGN KEY (`company_id`) REFERENCES `company` (`id`),
  ADD CONSTRAINT `company_vacancy_ibfk_2` FOREIGN KEY (`company_position_id`) REFERENCES `company_position` (`id`),
  ADD CONSTRAINT `company_vacancy_ibfk_3` FOREIGN KEY (`geo_locality_id`) REFERENCES `geo_locality` (`id`);

--
-- Constraints for table `contracts_psow`
--
ALTER TABLE `contracts_psow`
  ADD CONSTRAINT `contracts_psow_ibfk_1` FOREIGN KEY (`contract_sow_id`) REFERENCES `contracts_sow` (`id`),
  ADD CONSTRAINT `contracts_psow_ibfk_2` FOREIGN KEY (`cost_center_id`) REFERENCES `cost_centers` (`id`),
  ADD CONSTRAINT `contracts_psow_ibfk_3` FOREIGN KEY (`company_position_id`) REFERENCES `company_position` (`id`);

--
-- Constraints for table `contracts_sow`
--
ALTER TABLE `contracts_sow`
  ADD CONSTRAINT `contracts_sow_ibfk_1` FOREIGN KEY (`subcontractor_company_id`) REFERENCES `company` (`id`),
  ADD CONSTRAINT `contracts_sow_ibfk_2` FOREIGN KEY (`agency_company_id`) REFERENCES `company` (`id`),
  ADD CONSTRAINT `contracts_sow_ibfk_3` FOREIGN KEY (`company_position_id`) REFERENCES `company_position` (`id`),
  ADD CONSTRAINT `contracts_sow_ibfk_4` FOREIGN KEY (`creator_user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `contract_psow_custom_fields`
--
ALTER TABLE `contract_psow_custom_fields`
  ADD CONSTRAINT `contract_psow_custom_fields_ibfk_1` FOREIGN KEY (`contract_psow_id`) REFERENCES `contracts_psow` (`id`),
  ADD CONSTRAINT `contract_psow_custom_fields_ibfk_2` FOREIGN KEY (`owner_user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `contract_sow_agreement_files`
--
ALTER TABLE `contract_sow_agreement_files`
  ADD CONSTRAINT `contract_sow_agreement_files_ibfk_1` FOREIGN KEY (`contract_sow_id`) REFERENCES `contracts_sow` (`id`),
  ADD CONSTRAINT `contract_sow_agreement_files_ibfk_2` FOREIGN KEY (`owner_user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `contract_sow_custom_fields`
--
ALTER TABLE `contract_sow_custom_fields`
  ADD CONSTRAINT `contract_sow_custom_fields_ibfk_1` FOREIGN KEY (`contract_sow_id`) REFERENCES `contracts_sow` (`id`),
  ADD CONSTRAINT `contract_sow_custom_fields_ibfk_2` FOREIGN KEY (`owner_user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `cost_centers`
--
ALTER TABLE `cost_centers`
  ADD CONSTRAINT `cost_centers_ibfk_1` FOREIGN KEY (`agency_company_id`) REFERENCES `company` (`id`),
  ADD CONSTRAINT `cost_centers_ibfk_2` FOREIGN KEY (`assignee_user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `cost_centers_ibfk_3` FOREIGN KEY (`company_id`) REFERENCES `company` (`id`);

--
-- Constraints for table `cost_center_assignment`
--
ALTER TABLE `cost_center_assignment`
  ADD CONSTRAINT `cost_center_assignment_ibfk_1` FOREIGN KEY (`cost_center_id`) REFERENCES `cost_centers` (`id`),
  ADD CONSTRAINT `cost_center_assignment_ibfk_2` FOREIGN KEY (`timecard_customer_id`) REFERENCES `timecard_customers` (`id`),
  ADD CONSTRAINT `cost_center_assignment_ibfk_3` FOREIGN KEY (`assignee_user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `cost_center_custom_fields`
--
ALTER TABLE `cost_center_custom_fields`
  ADD CONSTRAINT `cost_center_custom_fields_ibfk_1` FOREIGN KEY (`cost_center_id`) REFERENCES `cost_centers` (`id`),
  ADD CONSTRAINT `cost_center_custom_fields_ibfk_2` FOREIGN KEY (`owner_user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `geo_locality`
--
ALTER TABLE `geo_locality`
  ADD CONSTRAINT `geo_locality_ibfk_1` FOREIGN KEY (`geo_region_id`) REFERENCES `geo_region` (`id`);

--
-- Constraints for table `geo_region`
--
ALTER TABLE `geo_region`
  ADD CONSTRAINT `geo_region_ibfk_1` FOREIGN KEY (`geo_country_id`) REFERENCES `geo_country` (`id`);

--
-- Constraints for table `geo_zip`
--
ALTER TABLE `geo_zip`
  ADD CONSTRAINT `geo_zip_ibfk_1` FOREIGN KEY (`geo_locality_id`) REFERENCES `geo_locality` (`id`);

--
-- Constraints for table `helpdesk_tickets`
--
ALTER TABLE `helpdesk_tickets`
  ADD CONSTRAINT `helpdesk_tickets_ibfk_1` FOREIGN KEY (`customer_user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `helpdesk_ticket_attaches`
--
ALTER TABLE `helpdesk_ticket_attaches`
  ADD CONSTRAINT `helpdesk_ticket_attaches_ibfk_1` FOREIGN KEY (`helpdesk_ticket_history_id`) REFERENCES `helpdesk_ticket_history` (`id`);

--
-- Constraints for table `helpdesk_ticket_history`
--
ALTER TABLE `helpdesk_ticket_history`
  ADD CONSTRAINT `helpdesk_ticket_history_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `helpdesk_ticket_history_ibfk_2` FOREIGN KEY (`helpdesk_ticket_id`) REFERENCES `helpdesk_tickets` (`id`);

--
-- Constraints for table `holiday_calendar`
--
ALTER TABLE `holiday_calendar`
  ADD CONSTRAINT `holiday_calendar_ibfk_1` FOREIGN KEY (`agency_company_id`) REFERENCES `company` (`id`);

--
-- Constraints for table `invoice_cost_center_bt`
--
ALTER TABLE `invoice_cost_center_bt`
  ADD CONSTRAINT `invoice_cost_center_bt_ibfk_1` FOREIGN KEY (`cost_center_id`) REFERENCES `cost_centers` (`id`),
  ADD CONSTRAINT `invoice_cost_center_bt_ibfk_2` FOREIGN KEY (`owner_user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `invoice_cost_center_bt_ibfk_3` FOREIGN KEY (`owner_company_id`) REFERENCES `company` (`id`),
  ADD CONSTRAINT `invoice_cost_center_bt_ibfk_4` FOREIGN KEY (`invoice_id`) REFERENCES `invoices` (`id`);

--
-- Constraints for table `invoice_cost_center_bt_details`
--
ALTER TABLE `invoice_cost_center_bt_details`
  ADD CONSTRAINT `invoice_cost_center_bt_details_ibfk_1` FOREIGN KEY (`invoice_cost_center_bt_id`) REFERENCES `invoice_cost_center_bt` (`id`),
  ADD CONSTRAINT `invoice_cost_center_bt_details_ibfk_2` FOREIGN KEY (`bt_id`) REFERENCES `bt` (`id`);

--
-- Constraints for table `invoice_cost_center_service`
--
ALTER TABLE `invoice_cost_center_service`
  ADD CONSTRAINT `invoice_cost_center_service_ibfk_2` FOREIGN KEY (`owner_user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `invoice_cost_center_service_ibfk_3` FOREIGN KEY (`cost_center_id`) REFERENCES `cost_centers` (`id`),
  ADD CONSTRAINT `invoice_cost_center_service_ibfk_4` FOREIGN KEY (`owner_company_id`) REFERENCES `company` (`id`),
  ADD CONSTRAINT `invoice_cost_center_service_ibfk_5` FOREIGN KEY (`invoice_id`) REFERENCES `invoices` (`id`);

--
-- Constraints for table `invoice_cost_center_service_details`
--
ALTER TABLE `invoice_cost_center_service_details`
  ADD CONSTRAINT `invoice_cost_center_service_details_ibfk_2` FOREIGN KEY (`timecard_id`) REFERENCES `timecards` (`id`),
  ADD CONSTRAINT `invoice_cost_center_service_details_ibfk_3` FOREIGN KEY (`invoice_cost_center_service_id`) REFERENCES `invoice_cost_center_service` (`id`);

--
-- Constraints for table `sessions`
--
ALTER TABLE `sessions`
  ADD CONSTRAINT `sessions_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `subcontractors_to_agency_mapping`
--
ALTER TABLE `subcontractors_to_agency_mapping`
  ADD CONSTRAINT `subcontractors_to_agency_mapping_ibfk_1` FOREIGN KEY (`subcontractor_company_id`) REFERENCES `company` (`id`),
  ADD CONSTRAINT `subcontractors_to_agency_mapping_ibfk_2` FOREIGN KEY (`agency_company_id`) REFERENCES `company` (`id`);

--
-- Constraints for table `timecards`
--
ALTER TABLE `timecards`
  ADD CONSTRAINT `timecards_ibfk_3` FOREIGN KEY (`contract_sow_id`) REFERENCES `contracts_sow` (`id`),
  ADD CONSTRAINT `timecards_ibfk_4` FOREIGN KEY (`invoice_id`) REFERENCES `invoices` (`id`);

--
-- Constraints for table `timecard_approvals`
--
ALTER TABLE `timecard_approvals`
  ADD CONSTRAINT `timecard_approvals_ibfk_1` FOREIGN KEY (`timecard_id`) REFERENCES `timecards` (`id`),
  ADD CONSTRAINT `timecard_approvals_ibfk_2` FOREIGN KEY (`approver_id`) REFERENCES `timecard_approvers` (`id`);

--
-- Constraints for table `timecard_approvers`
--
ALTER TABLE `timecard_approvers`
  ADD CONSTRAINT `timecard_approvers_ibfk_1` FOREIGN KEY (`approver_user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `timecard_approvers_ibfk_3` FOREIGN KEY (`contract_psow_id`) REFERENCES `contracts_psow` (`id`);

--
-- Constraints for table `timecard_customers`
--
ALTER TABLE `timecard_customers`
  ADD CONSTRAINT `timecard_customers_ibfk_1` FOREIGN KEY (`agency_company_id`) REFERENCES `company` (`id`);

--
-- Constraints for table `timecard_lines`
--
ALTER TABLE `timecard_lines`
  ADD CONSTRAINT `timecard_lines_ibfk_1` FOREIGN KEY (`timecard_id`) REFERENCES `timecards` (`id`),
  ADD CONSTRAINT `timecard_lines_ibfk_2` FOREIGN KEY (`timecard_task_id`) REFERENCES `timecard_tasks` (`id`);

--
-- Constraints for table `timecard_projects`
--
ALTER TABLE `timecard_projects`
  ADD CONSTRAINT `timecard_projects_ibfk_1` FOREIGN KEY (`timecard_customers_id`) REFERENCES `timecard_customers` (`id`);

--
-- Constraints for table `timecard_tasks`
--
ALTER TABLE `timecard_tasks`
  ADD CONSTRAINT `timecard_tasks_ibfk_1` FOREIGN KEY (`timecard_projects_id`) REFERENCES `timecard_projects` (`id`);

--
-- Constraints for table `timecard_task_assignment`
--
ALTER TABLE `timecard_task_assignment`
  ADD CONSTRAINT `timecard_task_assignment_ibfk_1` FOREIGN KEY (`timecard_tasks_id`) REFERENCES `timecard_tasks` (`id`),
  ADD CONSTRAINT `timecard_task_assignment_ibfk_2` FOREIGN KEY (`contract_sow_id`) REFERENCES `contracts_sow` (`id`),
  ADD CONSTRAINT `timecard_task_assignment_ibfk_4` FOREIGN KEY (`assignee_user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `users_avatars`
--
ALTER TABLE `users_avatars`
  ADD CONSTRAINT `users_avatars_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `users` (`id`);

--
-- Constraints for table `users_complains`
--
ALTER TABLE `users_complains`
  ADD CONSTRAINT `users_complains_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `users` (`id`);

--
-- Constraints for table `users_friends`
--
ALTER TABLE `users_friends`
  ADD CONSTRAINT `users_friends_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `users_friends_ibfk_2` FOREIGN KEY (`friendID`) REFERENCES `users` (`id`);

--
-- Constraints for table `users_notification`
--
ALTER TABLE `users_notification`
  ADD CONSTRAINT `users_notification_ibfk_1` FOREIGN KEY (`actionTypeId`) REFERENCES `action_types` (`id`);

--
-- Constraints for table `users_passwd`
--
ALTER TABLE `users_passwd`
  ADD CONSTRAINT `users_passwd_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `users` (`id`);

--
-- Constraints for table `users_watched`
--
ALTER TABLE `users_watched`
  ADD CONSTRAINT `users_watched_ibfk_1` FOREIGN KEY (`watched_userID`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `users_watched_ibfk_2` FOREIGN KEY (`watching_userID`) REFERENCES `users` (`id`);

--
-- Constraints for table `user_bonuses_avia`
--
ALTER TABLE `user_bonuses_avia`
  ADD CONSTRAINT `user_bonuses_avia_ibfk_1` FOREIGN KEY (`airline_id`) REFERENCES `airlines` (`id`),
  ADD CONSTRAINT `user_bonuses_avia_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `user_bonuses_hotels`
--
ALTER TABLE `user_bonuses_hotels`
  ADD CONSTRAINT `user_bonuses_hotels_ibfk_1` FOREIGN KEY (`hotel_chain_id`) REFERENCES `hotel_chains` (`id`),
  ADD CONSTRAINT `user_bonuses_hotels_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `user_bonuses_railroads`
--
ALTER TABLE `user_bonuses_railroads`
  ADD CONSTRAINT `user_bonuses_railroads_ibfk_1` FOREIGN KEY (`railroad_id`) REFERENCES `railroads` (`id`),
  ADD CONSTRAINT `user_bonuses_railroads_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
