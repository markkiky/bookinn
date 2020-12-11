-- phpMyAdmin SQL Dump
-- version 4.4.15.10
-- https://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Nov 30, 2020 at 01:07 PM
-- Server version: 5.5.64-MariaDB
-- PHP Version: 7.2.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hillpark`
--

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

CREATE TABLE IF NOT EXISTS `countries` (
  `id` mediumint(8) unsigned NOT NULL,
  `name` varchar(100) NOT NULL,
  `iso3` char(3) DEFAULT NULL,
  `iso2` char(2) DEFAULT NULL,
  `phonecode` varchar(255) DEFAULT NULL,
  `capital` varchar(255) DEFAULT NULL,
  `currency` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `flag` tinyint(1) NOT NULL DEFAULT '1',
  `wikiDataId` varchar(255) DEFAULT NULL COMMENT 'Rapid API GeoDB Cities',
  `is_active` varchar(40) NOT NULL DEFAULT '1',
  `date` varchar(40) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=248 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `countries`
--

INSERT INTO `countries` (`id`, `name`, `iso3`, `iso2`, `phonecode`, `capital`, `currency`, `created_at`, `updated_at`, `flag`, `wikiDataId`, `is_active`, `date`) VALUES
(1, 'Afghanistan', 'AFG', 'AF', '93', 'Kabul', 'AFN', '2018-07-20 11:41:03', '2019-08-02 16:38:23', 1, 'Q889', '1', NULL),
(2, 'Aland Islands', 'ALA', 'AX', '+358-18', 'Mariehamn', 'EUR', '2018-07-20 11:41:03', '2018-07-20 11:41:03', 1, NULL, '1', NULL),
(3, 'Albania', 'ALB', 'AL', '355', 'Tirana', 'ALL', '2018-07-20 11:41:03', '2019-08-02 16:38:23', 1, 'Q222', '1', NULL),
(4, 'Algeria', 'DZA', 'DZ', '213', 'Algiers', 'DZD', '2018-07-20 11:41:03', '2019-08-02 16:38:23', 1, 'Q262', '1', NULL),
(5, 'American Samoa', 'ASM', 'AS', '+1-684', 'Pago Pago', 'USD', '2018-07-20 11:41:03', '2018-07-20 11:41:03', 1, NULL, '1', NULL),
(6, 'Andorra', 'AND', 'AD', '376', 'Andorra la Vella', 'EUR', '2018-07-20 11:41:03', '2019-08-02 16:38:23', 1, 'Q228', '1', NULL),
(7, 'Angola', 'AGO', 'AO', '244', 'Luanda', 'AOA', '2018-07-20 11:41:03', '2019-08-02 16:38:23', 1, 'Q916', '1', NULL),
(8, 'Anguilla', 'AIA', 'AI', '+1-264', 'The Valley', 'XCD', '2018-07-20 11:41:03', '2018-07-20 11:41:03', 1, NULL, '1', NULL),
(9, 'Antarctica', 'ATA', 'AQ', '', '', '', '2018-07-20 11:41:03', '2018-07-20 11:41:03', 1, NULL, '1', NULL),
(10, 'Antigua And Barbuda', 'ATG', 'AG', '+1-268', 'St. John''s', 'XCD', '2018-07-20 11:41:03', '2019-08-02 16:38:23', 1, 'Q781', '1', NULL),
(11, 'Argentina', 'ARG', 'AR', '54', 'Buenos Aires', 'ARS', '2018-07-20 11:41:03', '2019-08-02 16:38:23', 1, 'Q414', '1', NULL),
(12, 'Armenia', 'ARM', 'AM', '374', 'Yerevan', 'AMD', '2018-07-20 11:41:03', '2019-08-02 16:38:23', 1, 'Q399', '1', NULL),
(13, 'Aruba', 'ABW', 'AW', '297', 'Oranjestad', 'AWG', '2018-07-20 11:41:03', '2018-07-20 11:41:03', 1, NULL, '1', NULL),
(14, 'Australia', 'AUS', 'AU', '61', 'Canberra', 'AUD', '2018-07-20 11:41:03', '2019-08-02 16:38:23', 1, 'Q408', '1', NULL),
(15, 'Austria', 'AUT', 'AT', '43', 'Vienna', 'EUR', '2018-07-20 11:41:03', '2019-08-02 16:38:23', 1, 'Q40', '1', NULL),
(16, 'Azerbaijan', 'AZE', 'AZ', '994', 'Baku', 'AZN', '2018-07-20 11:41:03', '2019-08-02 16:38:23', 1, 'Q227', '1', NULL),
(17, 'Bahamas The', 'BHS', 'BS', '+1-242', 'Nassau', 'BSD', '2018-07-20 11:41:03', '2019-08-02 16:38:23', 1, 'Q778', '1', NULL),
(18, 'Bahrain', 'BHR', 'BH', '973', 'Manama', 'BHD', '2018-07-20 11:41:03', '2019-08-02 16:38:23', 1, 'Q398', '1', NULL),
(19, 'Bangladesh', 'BGD', 'BD', '880', 'Dhaka', 'BDT', '2018-07-20 11:41:03', '2019-08-02 16:38:23', 1, 'Q902', '1', NULL),
(20, 'Barbados', 'BRB', 'BB', '+1-246', 'Bridgetown', 'BBD', '2018-07-20 11:41:03', '2019-08-02 16:38:23', 1, 'Q244', '1', NULL),
(21, 'Belarus', 'BLR', 'BY', '375', 'Minsk', 'BYR', '2018-07-20 11:41:03', '2019-08-02 16:38:23', 1, 'Q184', '1', NULL),
(22, 'Belgium', 'BEL', 'BE', '32', 'Brussels', 'EUR', '2018-07-20 11:41:03', '2019-08-02 16:38:23', 1, 'Q31', '1', NULL),
(23, 'Belize', 'BLZ', 'BZ', '501', 'Belmopan', 'BZD', '2018-07-20 11:41:03', '2019-08-02 16:38:23', 1, 'Q242', '1', NULL),
(24, 'Benin', 'BEN', 'BJ', '229', 'Porto-Novo', 'XOF', '2018-07-20 11:41:03', '2019-08-02 16:38:23', 1, 'Q962', '1', NULL),
(25, 'Bermuda', 'BMU', 'BM', '+1-441', 'Hamilton', 'BMD', '2018-07-20 11:41:03', '2018-07-20 11:41:03', 1, NULL, '1', NULL),
(26, 'Bhutan', 'BTN', 'BT', '975', 'Thimphu', 'BTN', '2018-07-20 11:41:03', '2019-08-02 16:38:23', 1, 'Q917', '1', NULL),
(27, 'Bolivia', 'BOL', 'BO', '591', 'Sucre', 'BOB', '2018-07-20 11:41:03', '2019-08-02 16:38:23', 1, 'Q750', '1', NULL),
(28, 'Bosnia and Herzegovina', 'BIH', 'BA', '387', 'Sarajevo', 'BAM', '2018-07-20 11:41:03', '2019-08-02 16:38:23', 1, 'Q225', '1', NULL),
(29, 'Botswana', 'BWA', 'BW', '267', 'Gaborone', 'BWP', '2018-07-20 11:41:03', '2019-08-02 16:38:23', 1, 'Q963', '1', NULL),
(30, 'Bouvet Island', 'BVT', 'BV', '', '', 'NOK', '2018-07-20 11:41:03', '2018-07-20 11:41:03', 1, NULL, '1', NULL),
(31, 'Brazil', 'BRA', 'BR', '55', 'Brasilia', 'BRL', '2018-07-20 11:41:03', '2019-08-02 16:38:23', 1, 'Q155', '1', NULL),
(32, 'British Indian Ocean Territory', 'IOT', 'IO', '246', 'Diego Garcia', 'USD', '2018-07-20 11:41:03', '2018-07-20 11:41:03', 1, NULL, '1', NULL),
(33, 'Brunei', 'BRN', 'BN', '673', 'Bandar Seri Begawan', 'BND', '2018-07-20 11:41:03', '2019-08-02 16:38:23', 1, 'Q921', '1', NULL),
(34, 'Bulgaria', 'BGR', 'BG', '359', 'Sofia', 'BGN', '2018-07-20 11:41:03', '2019-08-02 16:38:23', 1, 'Q219', '1', NULL),
(35, 'Burkina Faso', 'BFA', 'BF', '226', 'Ouagadougou', 'XOF', '2018-07-20 11:41:03', '2019-08-02 16:38:23', 1, 'Q965', '1', NULL),
(36, 'Burundi', 'BDI', 'BI', '257', 'Bujumbura', 'BIF', '2018-07-20 11:41:03', '2019-08-02 16:38:23', 1, 'Q967', '1', NULL),
(37, 'Cambodia', 'KHM', 'KH', '855', 'Phnom Penh', 'KHR', '2018-07-20 11:41:03', '2019-08-02 16:38:23', 1, 'Q424', '1', NULL),
(38, 'Cameroon', 'CMR', 'CM', '237', 'Yaounde', 'XAF', '2018-07-20 11:41:03', '2019-08-02 16:38:23', 1, 'Q1009', '1', NULL),
(39, 'Canada', 'CAN', 'CA', '1', 'Ottawa', 'CAD', '2018-07-20 11:41:03', '2019-08-02 16:38:23', 1, 'Q16', '1', NULL),
(40, 'Cape Verde', 'CPV', 'CV', '238', 'Praia', 'CVE', '2018-07-20 11:41:03', '2019-08-02 16:38:23', 1, 'Q1011', '1', NULL),
(41, 'Cayman Islands', 'CYM', 'KY', '+1-345', 'George Town', 'KYD', '2018-07-20 11:41:03', '2018-07-20 11:41:03', 1, NULL, '1', NULL),
(42, 'Central African Republic', 'CAF', 'CF', '236', 'Bangui', 'XAF', '2018-07-20 11:41:03', '2019-08-02 16:38:23', 1, 'Q929', '1', NULL),
(43, 'Chad', 'TCD', 'TD', '235', 'N''Djamena', 'XAF', '2018-07-20 11:41:03', '2019-08-02 16:38:23', 1, 'Q657', '1', NULL),
(44, 'Chile', 'CHL', 'CL', '56', 'Santiago', 'CLP', '2018-07-20 11:41:03', '2019-08-02 16:38:23', 1, 'Q298', '1', NULL),
(45, 'China', 'CHN', 'CN', '86', 'Beijing', 'CNY', '2018-07-20 11:41:03', '2019-08-02 16:38:23', 1, 'Q148', '1', NULL),
(46, 'Christmas Island', 'CXR', 'CX', '61', 'Flying Fish Cove', 'AUD', '2018-07-20 11:41:03', '2018-07-20 11:41:03', 1, NULL, '1', NULL),
(47, 'Cocos (Keeling) Islands', 'CCK', 'CC', '61', 'West Island', 'AUD', '2018-07-20 11:41:03', '2018-07-20 11:41:03', 1, NULL, '1', NULL),
(48, 'Colombia', 'COL', 'CO', '57', 'Bogota', 'COP', '2018-07-20 11:41:03', '2019-08-02 16:38:23', 1, 'Q739', '1', NULL),
(49, 'Comoros', 'COM', 'KM', '269', 'Moroni', 'KMF', '2018-07-20 11:41:03', '2019-08-02 16:38:23', 1, 'Q970', '1', NULL),
(50, 'Congo', 'COG', 'CG', '242', 'Brazzaville', 'XAF', '2018-07-20 11:41:03', '2019-08-02 16:38:23', 1, 'Q971', '1', NULL),
(51, 'Congo The Democratic Republic Of The', 'COD', 'CD', '243', 'Kinshasa', 'CDF', '2018-07-20 11:41:03', '2019-08-02 16:38:23', 1, 'Q974', '1', NULL),
(52, 'Cook Islands', 'COK', 'CK', '682', 'Avarua', 'NZD', '2018-07-20 11:41:03', '2019-08-02 16:38:23', 1, 'Q26988', '1', NULL),
(53, 'Costa Rica', 'CRI', 'CR', '506', 'San Jose', 'CRC', '2018-07-20 11:41:03', '2019-08-02 16:38:23', 1, 'Q800', '1', NULL),
(54, 'Cote D''Ivoire (Ivory Coast)', 'CIV', 'CI', '225', 'Yamoussoukro', 'XOF', '2018-07-20 11:41:03', '2019-08-02 16:38:23', 1, 'Q1008', '1', NULL),
(55, 'Croatia (Hrvatska)', 'HRV', 'HR', '385', 'Zagreb', 'HRK', '2018-07-20 11:41:03', '2019-08-02 16:38:23', 1, 'Q224', '1', NULL),
(56, 'Cuba', 'CUB', 'CU', '53', 'Havana', 'CUP', '2018-07-20 11:41:03', '2019-08-02 16:38:23', 1, 'Q241', '1', NULL),
(57, 'Cyprus', 'CYP', 'CY', '357', 'Nicosia', 'EUR', '2018-07-20 11:41:03', '2019-08-02 16:38:23', 1, 'Q229', '1', NULL),
(58, 'Czech Republic', 'CZE', 'CZ', '420', 'Prague', 'CZK', '2018-07-20 11:41:03', '2019-08-02 16:38:23', 1, 'Q213', '1', NULL),
(59, 'Denmark', 'DNK', 'DK', '45', 'Copenhagen', 'DKK', '2018-07-20 11:41:03', '2019-08-02 16:38:23', 1, 'Q35', '1', NULL),
(60, 'Djibouti', 'DJI', 'DJ', '253', 'Djibouti', 'DJF', '2018-07-20 11:41:03', '2019-08-02 16:38:23', 1, 'Q977', '1', NULL),
(61, 'Dominica', 'DMA', 'DM', '+1-767', 'Roseau', 'XCD', '2018-07-20 11:41:03', '2019-08-02 16:38:23', 1, 'Q784', '1', NULL),
(62, 'Dominican Republic', 'DOM', 'DO', '+1-809 and 1-829', 'Santo Domingo', 'DOP', '2018-07-20 11:41:03', '2019-08-02 16:38:23', 1, 'Q786', '1', NULL),
(63, 'East Timor', 'TLS', 'TL', '670', 'Dili', 'USD', '2018-07-20 11:41:03', '2019-08-02 16:38:23', 1, 'Q574', '1', NULL),
(64, 'Ecuador', 'ECU', 'EC', '593', 'Quito', 'USD', '2018-07-20 11:41:03', '2019-08-02 16:38:23', 1, 'Q736', '1', NULL),
(65, 'Egypt', 'EGY', 'EG', '20', 'Cairo', 'EGP', '2018-07-20 11:41:03', '2019-08-02 16:38:23', 1, 'Q79', '1', NULL),
(66, 'El Salvador', 'SLV', 'SV', '503', 'San Salvador', 'USD', '2018-07-20 11:41:03', '2019-08-02 16:38:23', 1, 'Q792', '1', NULL),
(67, 'Equatorial Guinea', 'GNQ', 'GQ', '240', 'Malabo', 'XAF', '2018-07-20 11:41:03', '2019-08-02 16:38:23', 1, 'Q983', '1', NULL),
(68, 'Eritrea', 'ERI', 'ER', '291', 'Asmara', 'ERN', '2018-07-20 11:41:03', '2019-08-02 16:38:23', 1, 'Q986', '1', NULL),
(69, 'Estonia', 'EST', 'EE', '372', 'Tallinn', 'EUR', '2018-07-20 11:41:03', '2019-08-02 16:38:23', 1, 'Q191', '1', NULL),
(70, 'Ethiopia', 'ETH', 'ET', '251', 'Addis Ababa', 'ETB', '2018-07-20 11:41:03', '2019-08-02 16:38:23', 1, 'Q115', '1', NULL),
(71, 'Falkland Islands', 'FLK', 'FK', '500', 'Stanley', 'FKP', '2018-07-20 11:41:03', '2018-07-20 11:41:03', 1, NULL, '1', NULL),
(72, 'Faroe Islands', 'FRO', 'FO', '298', 'Torshavn', 'DKK', '2018-07-20 11:41:03', '2018-07-20 11:41:03', 1, NULL, '1', NULL),
(73, 'Fiji Islands', 'FJI', 'FJ', '679', 'Suva', 'FJD', '2018-07-20 11:41:03', '2019-08-02 16:38:23', 1, 'Q712', '1', NULL),
(74, 'Finland', 'FIN', 'FI', '358', 'Helsinki', 'EUR', '2018-07-20 11:41:03', '2019-08-02 16:38:23', 1, 'Q33', '1', NULL),
(75, 'France', 'FRA', 'FR', '33', 'Paris', 'EUR', '2018-07-20 11:41:03', '2019-08-02 16:38:23', 1, 'Q142', '1', NULL),
(76, 'French Guiana', 'GUF', 'GF', '594', 'Cayenne', 'EUR', '2018-07-20 11:41:03', '2018-07-20 11:41:03', 1, NULL, '1', NULL),
(77, 'French Polynesia', 'PYF', 'PF', '689', 'Papeete', 'XPF', '2018-07-20 11:41:03', '2018-07-20 11:41:03', 1, NULL, '1', NULL),
(78, 'French Southern Territories', 'ATF', 'TF', '', 'Port-aux-Francais', 'EUR', '2018-07-20 11:41:03', '2018-07-20 11:41:03', 1, NULL, '1', NULL),
(79, 'Gabon', 'GAB', 'GA', '241', 'Libreville', 'XAF', '2018-07-20 11:41:03', '2019-08-02 16:38:23', 1, 'Q1000', '1', NULL),
(80, 'Gambia The', 'GMB', 'GM', '220', 'Banjul', 'GMD', '2018-07-20 11:41:03', '2019-08-02 16:38:23', 1, 'Q1005', '1', NULL),
(81, 'Georgia', 'GEO', 'GE', '995', 'Tbilisi', 'GEL', '2018-07-20 11:41:03', '2019-08-02 16:38:23', 1, 'Q230', '1', NULL),
(82, 'Germany', 'DEU', 'DE', '49', 'Berlin', 'EUR', '2018-07-20 11:41:03', '2019-08-02 16:38:23', 1, 'Q183', '1', NULL),
(83, 'Ghana', 'GHA', 'GH', '233', 'Accra', 'GHS', '2018-07-20 11:41:03', '2019-08-02 16:38:23', 1, 'Q117', '1', NULL),
(84, 'Gibraltar', 'GIB', 'GI', '350', 'Gibraltar', 'GIP', '2018-07-20 11:41:03', '2018-07-20 11:41:03', 1, NULL, '1', NULL),
(85, 'Greece', 'GRC', 'GR', '30', 'Athens', 'EUR', '2018-07-20 11:41:03', '2019-08-02 16:38:23', 1, 'Q41', '1', NULL),
(86, 'Greenland', 'GRL', 'GL', '299', 'Nuuk', 'DKK', '2018-07-20 11:41:03', '2018-07-20 11:41:03', 1, NULL, '1', NULL),
(87, 'Grenada', 'GRD', 'GD', '+1-473', 'St. George''s', 'XCD', '2018-07-20 11:41:03', '2019-08-02 16:38:23', 1, 'Q769', '1', NULL),
(88, 'Guadeloupe', 'GLP', 'GP', '590', 'Basse-Terre', 'EUR', '2018-07-20 11:41:03', '2018-07-20 11:41:03', 1, NULL, '1', NULL),
(89, 'Guam', 'GUM', 'GU', '+1-671', 'Hagatna', 'USD', '2018-07-20 11:41:03', '2018-07-20 11:41:03', 1, NULL, '1', NULL),
(90, 'Guatemala', 'GTM', 'GT', '502', 'Guatemala City', 'GTQ', '2018-07-20 11:41:03', '2019-08-02 16:38:23', 1, 'Q774', '1', NULL),
(91, 'Guernsey and Alderney', 'GGY', 'GG', '+44-1481', 'St Peter Port', 'GBP', '2018-07-20 11:41:03', '2018-07-20 11:41:03', 1, NULL, '1', NULL),
(92, 'Guinea', 'GIN', 'GN', '224', 'Conakry', 'GNF', '2018-07-20 11:41:03', '2019-08-02 16:38:23', 1, 'Q1006', '1', NULL),
(93, 'Guinea-Bissau', 'GNB', 'GW', '245', 'Bissau', 'XOF', '2018-07-20 11:41:03', '2019-08-02 16:38:23', 1, 'Q1007', '1', NULL),
(94, 'Guyana', 'GUY', 'GY', '592', 'Georgetown', 'GYD', '2018-07-20 11:41:03', '2019-08-02 16:38:23', 1, 'Q734', '1', NULL),
(95, 'Haiti', 'HTI', 'HT', '509', 'Port-au-Prince', 'HTG', '2018-07-20 11:41:03', '2019-08-02 16:38:23', 1, 'Q790', '1', NULL),
(96, 'Heard and McDonald Islands', 'HMD', 'HM', ' ', '', 'AUD', '2018-07-20 11:41:03', '2018-07-20 11:41:03', 1, NULL, '1', NULL),
(97, 'Honduras', 'HND', 'HN', '504', 'Tegucigalpa', 'HNL', '2018-07-20 11:41:03', '2019-08-02 16:38:23', 1, 'Q783', '1', NULL),
(98, 'Hong Kong S.A.R.', 'HKG', 'HK', '852', 'Hong Kong', 'HKD', '2018-07-20 11:41:03', '2018-07-20 11:41:03', 1, NULL, '1', NULL),
(99, 'Hungary', 'HUN', 'HU', '36', 'Budapest', 'HUF', '2018-07-20 11:41:03', '2019-08-02 16:38:23', 1, 'Q28', '1', NULL),
(100, 'Iceland', 'ISL', 'IS', '354', 'Reykjavik', 'ISK', '2018-07-20 11:41:03', '2019-08-02 16:38:23', 1, 'Q189', '1', NULL),
(101, 'India', 'IND', 'IN', '91', 'New Delhi', 'INR', '2018-07-20 11:41:03', '2019-08-02 16:38:23', 1, 'Q668', '1', NULL),
(102, 'Indonesia', 'IDN', 'ID', '62', 'Jakarta', 'IDR', '2018-07-20 11:41:03', '2019-08-02 16:38:23', 1, 'Q252', '1', NULL),
(103, 'Iran', 'IRN', 'IR', '98', 'Tehran', 'IRR', '2018-07-20 11:41:03', '2019-08-02 16:38:23', 1, 'Q794', '1', NULL),
(104, 'Iraq', 'IRQ', 'IQ', '964', 'Baghdad', 'IQD', '2018-07-20 11:41:03', '2019-08-02 16:38:23', 1, 'Q796', '1', NULL),
(105, 'Ireland', 'IRL', 'IE', '353', 'Dublin', 'EUR', '2018-07-20 11:41:03', '2019-08-02 16:38:23', 1, 'Q27', '1', NULL),
(106, 'Israel', 'ISR', 'IL', '972', 'Jerusalem', 'ILS', '2018-07-20 11:41:03', '2019-08-02 16:38:23', 1, 'Q801', '1', NULL),
(107, 'Italy', 'ITA', 'IT', '39', 'Rome', 'EUR', '2018-07-20 11:41:03', '2019-08-02 16:38:23', 1, 'Q38', '1', NULL),
(108, 'Jamaica', 'JAM', 'JM', '+1-876', 'Kingston', 'JMD', '2018-07-20 11:41:03', '2019-08-02 16:38:23', 1, 'Q766', '1', NULL),
(109, 'Japan', 'JPN', 'JP', '81', 'Tokyo', 'JPY', '2018-07-20 11:41:03', '2019-08-02 16:38:23', 1, 'Q17', '1', NULL),
(110, 'Jersey', 'JEY', 'JE', '+44-1534', 'Saint Helier', 'GBP', '2018-07-20 11:41:03', '2019-08-02 16:38:23', 1, 'Q785', '1', NULL),
(111, 'Jordan', 'JOR', 'JO', '962', 'Amman', 'JOD', '2018-07-20 11:41:03', '2019-08-02 16:38:23', 1, 'Q810', '1', NULL),
(112, 'Kazakhstan', 'KAZ', 'KZ', '7', 'Astana', 'KZT', '2018-07-20 11:41:03', '2019-08-02 16:38:23', 1, 'Q232', '1', NULL),
(113, 'Kenya', 'KEN', 'KE', '254', 'Nairobi', 'KES', '2018-07-20 11:41:03', '2019-08-02 16:38:23', 1, 'Q114', '1', NULL),
(114, 'Kiribati', 'KIR', 'KI', '686', 'Tarawa', 'AUD', '2018-07-20 11:41:03', '2019-08-02 16:38:23', 1, 'Q710', '1', NULL),
(115, 'Korea North\n', 'PRK', 'KP', '850', 'Pyongyang', 'KPW', '2018-07-20 11:41:03', '2019-08-02 16:38:23', 1, 'Q423', '1', NULL),
(116, 'Korea South', 'KOR', 'KR', '82', 'Seoul', 'KRW', '2018-07-20 11:41:03', '2019-08-02 16:38:23', 1, 'Q884', '1', NULL),
(117, 'Kuwait', 'KWT', 'KW', '965', 'Kuwait City', 'KWD', '2018-07-20 11:41:03', '2019-08-02 16:38:23', 1, 'Q817', '1', NULL),
(118, 'Kyrgyzstan', 'KGZ', 'KG', '996', 'Bishkek', 'KGS', '2018-07-20 11:41:03', '2019-08-02 16:38:23', 1, 'Q813', '1', NULL),
(119, 'Laos', 'LAO', 'LA', '856', 'Vientiane', 'LAK', '2018-07-20 11:41:03', '2019-08-02 16:38:23', 1, 'Q819', '1', NULL),
(120, 'Latvia', 'LVA', 'LV', '371', 'Riga', 'EUR', '2018-07-20 11:41:03', '2019-08-02 16:38:23', 1, 'Q211', '1', NULL),
(121, 'Lebanon', 'LBN', 'LB', '961', 'Beirut', 'LBP', '2018-07-20 11:41:03', '2019-08-02 16:38:23', 1, 'Q822', '1', NULL),
(122, 'Lesotho', 'LSO', 'LS', '266', 'Maseru', 'LSL', '2018-07-20 11:41:03', '2019-08-02 16:38:23', 1, 'Q1013', '1', NULL),
(123, 'Liberia', 'LBR', 'LR', '231', 'Monrovia', 'LRD', '2018-07-20 11:41:03', '2019-08-02 16:38:23', 1, 'Q1014', '1', NULL),
(124, 'Libya', 'LBY', 'LY', '218', 'Tripolis', 'LYD', '2018-07-20 11:41:03', '2019-08-02 16:38:23', 1, 'Q1016', '1', NULL),
(125, 'Liechtenstein', 'LIE', 'LI', '423', 'Vaduz', 'CHF', '2018-07-20 11:41:03', '2019-08-02 16:38:23', 1, 'Q347', '1', NULL),
(126, 'Lithuania', 'LTU', 'LT', '370', 'Vilnius', 'LTL', '2018-07-20 11:41:03', '2019-08-02 16:38:23', 1, 'Q37', '1', NULL),
(127, 'Luxembourg', 'LUX', 'LU', '352', 'Luxembourg', 'EUR', '2018-07-20 11:41:03', '2019-08-02 16:38:23', 1, 'Q32', '1', NULL),
(128, 'Macau S.A.R.', 'MAC', 'MO', '853', 'Macao', 'MOP', '2018-07-20 11:41:03', '2018-07-20 11:41:03', 1, NULL, '1', NULL),
(129, 'Macedonia', 'MKD', 'MK', '389', 'Skopje', 'MKD', '2018-07-20 11:41:03', '2019-08-02 16:38:23', 1, 'Q221', '1', NULL),
(130, 'Madagascar', 'MDG', 'MG', '261', 'Antananarivo', 'MGA', '2018-07-20 11:41:03', '2019-08-02 16:38:23', 1, 'Q1019', '1', NULL),
(131, 'Malawi', 'MWI', 'MW', '265', 'Lilongwe', 'MWK', '2018-07-20 11:41:03', '2019-08-02 16:38:23', 1, 'Q1020', '1', NULL),
(132, 'Malaysia', 'MYS', 'MY', '60', 'Kuala Lumpur', 'MYR', '2018-07-20 11:41:03', '2019-08-02 16:38:23', 1, 'Q833', '1', NULL),
(133, 'Maldives', 'MDV', 'MV', '960', 'Male', 'MVR', '2018-07-20 11:41:03', '2019-08-02 16:38:23', 1, 'Q826', '1', NULL),
(134, 'Mali', 'MLI', 'ML', '223', 'Bamako', 'XOF', '2018-07-20 11:41:03', '2019-08-02 16:38:23', 1, 'Q912', '1', NULL),
(135, 'Malta', 'MLT', 'MT', '356', 'Valletta', 'EUR', '2018-07-20 11:41:03', '2019-08-02 16:38:23', 1, 'Q233', '1', NULL),
(136, 'Man (Isle of)', 'IMN', 'IM', '+44-1624', 'Douglas, Isle of Man', 'GBP', '2018-07-20 11:41:03', '2018-07-20 11:41:03', 1, NULL, '1', NULL),
(137, 'Marshall Islands', 'MHL', 'MH', '692', 'Majuro', 'USD', '2018-07-20 11:41:03', '2019-08-02 16:38:23', 1, 'Q709', '1', NULL),
(138, 'Martinique', 'MTQ', 'MQ', '596', 'Fort-de-France', 'EUR', '2018-07-20 11:41:03', '2018-07-20 11:41:03', 1, NULL, '1', NULL),
(139, 'Mauritania', 'MRT', 'MR', '222', 'Nouakchott', 'MRO', '2018-07-20 11:41:03', '2019-08-02 16:38:23', 1, 'Q1025', '1', NULL),
(140, 'Mauritius', 'MUS', 'MU', '230', 'Port Louis', 'MUR', '2018-07-20 11:41:03', '2019-08-02 16:38:23', 1, 'Q1027', '1', NULL),
(141, 'Mayotte', 'MYT', 'YT', '262', 'Mamoudzou', 'EUR', '2018-07-20 11:41:03', '2018-07-20 11:41:03', 1, NULL, '1', NULL),
(142, 'Mexico', 'MEX', 'MX', '52', 'Mexico City', 'MXN', '2018-07-20 11:41:03', '2019-08-02 16:38:23', 1, 'Q96', '1', NULL),
(143, 'Micronesia', 'FSM', 'FM', '691', 'Palikir', 'USD', '2018-07-20 11:41:03', '2019-08-02 16:38:23', 1, 'Q702', '1', NULL),
(144, 'Moldova', 'MDA', 'MD', '373', 'Chisinau', 'MDL', '2018-07-20 11:41:03', '2019-08-02 16:38:23', 1, 'Q217', '1', NULL),
(145, 'Monaco', 'MCO', 'MC', '377', 'Monaco', 'EUR', '2018-07-20 11:41:03', '2018-07-20 11:41:03', 1, NULL, '1', NULL),
(146, 'Mongolia', 'MNG', 'MN', '976', 'Ulan Bator', 'MNT', '2018-07-20 11:41:03', '2019-08-02 16:38:23', 1, 'Q711', '1', NULL),
(147, 'Montenegro', 'MNE', 'ME', '382', 'Podgorica', 'EUR', '2018-07-20 11:41:03', '2019-08-02 16:38:23', 1, 'Q236', '1', NULL),
(148, 'Montserrat', 'MSR', 'MS', '+1-664', 'Plymouth', 'XCD', '2018-07-20 11:41:03', '2018-07-20 11:41:03', 1, NULL, '1', NULL),
(149, 'Morocco', 'MAR', 'MA', '212', 'Rabat', 'MAD', '2018-07-20 11:41:03', '2019-08-02 16:38:23', 1, 'Q1028', '1', NULL),
(150, 'Mozambique', 'MOZ', 'MZ', '258', 'Maputo', 'MZN', '2018-07-20 11:41:03', '2019-08-02 16:38:23', 1, 'Q1029', '1', NULL),
(151, 'Myanmar', 'MMR', 'MM', '95', 'Nay Pyi Taw', 'MMK', '2018-07-20 11:41:03', '2019-08-02 16:38:23', 1, 'Q836', '1', NULL),
(152, 'Namibia', 'NAM', 'NA', '264', 'Windhoek', 'NAD', '2018-07-20 11:41:03', '2019-08-02 16:38:23', 1, 'Q1030', '1', NULL),
(153, 'Nauru', 'NRU', 'NR', '674', 'Yaren', 'AUD', '2018-07-20 11:41:03', '2019-08-02 16:38:23', 1, 'Q697', '1', NULL),
(154, 'Nepal', 'NPL', 'NP', '977', 'Kathmandu', 'NPR', '2018-07-20 11:41:03', '2019-08-02 16:38:23', 1, 'Q837', '1', NULL),
(155, 'Netherlands Antilles', 'ANT', 'AN', '', '', '', '2018-07-20 11:41:03', '2018-07-20 11:41:03', 1, NULL, '1', NULL),
(156, 'Netherlands The', 'NLD', 'NL', '31', 'Amsterdam', 'EUR', '2018-07-20 11:41:03', '2019-08-02 16:38:23', 1, 'Q55', '1', NULL),
(157, 'New Caledonia', 'NCL', 'NC', '687', 'Noumea', 'XPF', '2018-07-20 11:41:03', '2018-07-20 11:41:03', 1, NULL, '1', NULL),
(158, 'New Zealand', 'NZL', 'NZ', '64', 'Wellington', 'NZD', '2018-07-20 11:41:03', '2019-08-02 16:38:23', 1, 'Q664', '1', NULL),
(159, 'Nicaragua', 'NIC', 'NI', '505', 'Managua', 'NIO', '2018-07-20 11:41:03', '2019-08-02 16:38:23', 1, 'Q811', '1', NULL),
(160, 'Niger', 'NER', 'NE', '227', 'Niamey', 'XOF', '2018-07-20 11:41:03', '2019-08-02 16:38:23', 1, 'Q1032', '1', NULL),
(161, 'Nigeria', 'NGA', 'NG', '234', 'Abuja', 'NGN', '2018-07-20 11:41:03', '2019-08-02 16:38:23', 1, 'Q1033', '1', NULL),
(162, 'Niue', 'NIU', 'NU', '683', 'Alofi', 'NZD', '2018-07-20 11:41:03', '2019-08-02 16:38:23', 1, 'Q34020', '1', NULL),
(163, 'Norfolk Island', 'NFK', 'NF', '672', 'Kingston', 'AUD', '2018-07-20 11:41:03', '2018-07-20 11:41:03', 1, NULL, '1', NULL),
(164, 'Northern Mariana Islands', 'MNP', 'MP', '+1-670', 'Saipan', 'USD', '2018-07-20 11:41:03', '2018-07-20 11:41:03', 1, NULL, '1', NULL),
(165, 'Norway', 'NOR', 'NO', '47', 'Oslo', 'NOK', '2018-07-20 11:41:03', '2019-08-02 16:38:23', 1, 'Q20', '1', NULL),
(166, 'Oman', 'OMN', 'OM', '968', 'Muscat', 'OMR', '2018-07-20 11:41:03', '2019-08-02 16:38:23', 1, 'Q842', '1', NULL),
(167, 'Pakistan', 'PAK', 'PK', '92', 'Islamabad', 'PKR', '2018-07-20 11:41:03', '2019-08-02 16:38:23', 1, 'Q843', '1', NULL),
(168, 'Palau', 'PLW', 'PW', '680', 'Melekeok', 'USD', '2018-07-20 11:41:03', '2019-08-02 16:38:23', 1, 'Q695', '1', NULL),
(169, 'Palestinian Territory Occupied', 'PSE', 'PS', '970', 'East Jerusalem', 'ILS', '2018-07-20 11:41:03', '2018-07-20 11:41:03', 1, NULL, '1', NULL),
(170, 'Panama', 'PAN', 'PA', '507', 'Panama City', 'PAB', '2018-07-20 11:41:03', '2019-08-02 16:38:23', 1, 'Q804', '1', NULL),
(171, 'Papua new Guinea', 'PNG', 'PG', '675', 'Port Moresby', 'PGK', '2018-07-20 11:41:03', '2019-08-02 16:38:23', 1, 'Q691', '1', NULL),
(172, 'Paraguay', 'PRY', 'PY', '595', 'Asuncion', 'PYG', '2018-07-20 11:41:03', '2019-08-02 16:38:23', 1, 'Q733', '1', NULL),
(173, 'Peru', 'PER', 'PE', '51', 'Lima', 'PEN', '2018-07-20 11:41:03', '2019-08-02 16:38:23', 1, 'Q419', '1', NULL),
(174, 'Philippines', 'PHL', 'PH', '63', 'Manila', 'PHP', '2018-07-20 11:41:03', '2019-08-02 16:38:23', 1, 'Q928', '1', NULL),
(175, 'Pitcairn Island', 'PCN', 'PN', '870', 'Adamstown', 'NZD', '2018-07-20 11:41:03', '2018-07-20 11:41:03', 1, NULL, '1', NULL),
(176, 'Poland', 'POL', 'PL', '48', 'Warsaw', 'PLN', '2018-07-20 11:41:03', '2019-08-02 16:38:23', 1, 'Q36', '1', NULL),
(177, 'Portugal', 'PRT', 'PT', '351', 'Lisbon', 'EUR', '2018-07-20 11:41:03', '2019-08-02 16:38:23', 1, 'Q45', '1', NULL),
(178, 'Puerto Rico', 'PRI', 'PR', '+1-787 and 1-939', 'San Juan', 'USD', '2018-07-20 11:41:03', '2018-07-20 11:41:03', 1, NULL, '1', NULL),
(179, 'Qatar', 'QAT', 'QA', '974', 'Doha', 'QAR', '2018-07-20 11:41:03', '2019-08-02 16:38:23', 1, 'Q846', '1', NULL),
(180, 'Reunion', 'REU', 'RE', '262', 'Saint-Denis', 'EUR', '2018-07-20 11:41:03', '2018-07-20 11:41:03', 1, NULL, '1', NULL),
(181, 'Romania', 'ROU', 'RO', '40', 'Bucharest', 'RON', '2018-07-20 11:41:03', '2019-08-02 16:38:23', 1, 'Q218', '1', NULL),
(182, 'Russia', 'RUS', 'RU', '7', 'Moscow', 'RUB', '2018-07-20 11:41:03', '2019-08-02 16:38:23', 1, 'Q159', '1', NULL),
(183, 'Rwanda', 'RWA', 'RW', '250', 'Kigali', 'RWF', '2018-07-20 11:41:03', '2019-08-02 16:38:23', 1, 'Q1037', '1', NULL),
(184, 'Saint Helena', 'SHN', 'SH', '290', 'Jamestown', 'SHP', '2018-07-20 11:41:03', '2018-07-20 11:41:03', 1, NULL, '1', NULL),
(185, 'Saint Kitts And Nevis', 'KNA', 'KN', '+1-869', 'Basseterre', 'XCD', '2018-07-20 11:41:03', '2019-08-02 16:38:23', 1, 'Q763', '1', NULL),
(186, 'Saint Lucia', 'LCA', 'LC', '+1-758', 'Castries', 'XCD', '2018-07-20 11:41:03', '2019-08-02 16:38:23', 1, 'Q760', '1', NULL),
(187, 'Saint Pierre and Miquelon', 'SPM', 'PM', '508', 'Saint-Pierre', 'EUR', '2018-07-20 11:41:03', '2018-07-20 11:41:03', 1, NULL, '1', NULL),
(188, 'Saint Vincent And The Grenadines', 'VCT', 'VC', '+1-784', 'Kingstown', 'XCD', '2018-07-20 11:41:03', '2019-08-02 16:38:23', 1, 'Q757', '1', NULL),
(189, 'Saint-Barthelemy', 'BLM', 'BL', '590', 'Gustavia', 'EUR', '2018-07-20 11:41:03', '2018-07-20 11:41:03', 1, NULL, '1', NULL),
(190, 'Saint-Martin (French part)', 'MAF', 'MF', '590', 'Marigot', 'EUR', '2018-07-20 11:41:03', '2018-07-20 11:41:03', 1, NULL, '1', NULL),
(191, 'Samoa', 'WSM', 'WS', '685', 'Apia', 'WST', '2018-07-20 11:41:03', '2019-08-02 16:38:23', 1, 'Q683', '1', NULL),
(192, 'San Marino', 'SMR', 'SM', '378', 'San Marino', 'EUR', '2018-07-20 11:41:03', '2019-08-02 16:38:23', 1, 'Q238', '1', NULL),
(193, 'Sao Tome and Principe', 'STP', 'ST', '239', 'Sao Tome', 'STD', '2018-07-20 11:41:03', '2019-08-02 16:38:23', 1, 'Q1039', '1', NULL),
(194, 'Saudi Arabia', 'SAU', 'SA', '966', 'Riyadh', 'SAR', '2018-07-20 11:41:03', '2019-08-02 16:38:23', 1, 'Q851', '1', NULL),
(195, 'Senegal', 'SEN', 'SN', '221', 'Dakar', 'XOF', '2018-07-20 11:41:03', '2019-08-02 16:38:23', 1, 'Q1041', '1', NULL),
(196, 'Serbia', 'SRB', 'RS', '381', 'Belgrade', 'RSD', '2018-07-20 11:41:03', '2019-08-02 16:38:23', 1, 'Q403', '1', NULL),
(197, 'Seychelles', 'SYC', 'SC', '248', 'Victoria', 'SCR', '2018-07-20 11:41:03', '2019-08-02 16:38:23', 1, 'Q1042', '1', NULL),
(198, 'Sierra Leone', 'SLE', 'SL', '232', 'Freetown', 'SLL', '2018-07-20 11:41:03', '2019-08-02 16:38:23', 1, 'Q1044', '1', NULL),
(199, 'Singapore', 'SGP', 'SG', '65', 'Singapur', 'SGD', '2018-07-20 11:41:03', '2019-08-02 16:38:23', 1, 'Q334', '1', NULL),
(200, 'Slovakia', 'SVK', 'SK', '421', 'Bratislava', 'EUR', '2018-07-20 11:41:03', '2019-08-02 16:38:23', 1, 'Q214', '1', NULL),
(201, 'Slovenia', 'SVN', 'SI', '386', 'Ljubljana', 'EUR', '2018-07-20 11:41:03', '2019-08-02 16:38:23', 1, 'Q215', '1', NULL),
(202, 'Solomon Islands', 'SLB', 'SB', '677', 'Honiara', 'SBD', '2018-07-20 11:41:03', '2019-08-02 16:38:23', 1, 'Q685', '1', NULL),
(203, 'Somalia', 'SOM', 'SO', '252', 'Mogadishu', 'SOS', '2018-07-20 11:41:03', '2019-08-02 16:38:23', 1, 'Q1045', '1', NULL),
(204, 'South Africa', 'ZAF', 'ZA', '27', 'Pretoria', 'ZAR', '2018-07-20 11:41:03', '2019-08-02 16:38:23', 1, 'Q258', '1', NULL),
(205, 'South Georgia', 'SGS', 'GS', '', 'Grytviken', 'GBP', '2018-07-20 11:41:03', '2018-07-20 11:41:03', 1, NULL, '1', NULL),
(206, 'South Sudan', 'SSD', 'SS', '211', 'Juba', 'SSP', '2018-07-20 11:41:03', '2019-08-02 16:38:23', 1, 'Q958', '1', NULL),
(207, 'Spain', 'ESP', 'ES', '34', 'Madrid', 'EUR', '2018-07-20 11:41:03', '2019-08-02 16:38:23', 1, 'Q29', '1', NULL),
(208, 'Sri Lanka', 'LKA', 'LK', '94', 'Colombo', 'LKR', '2018-07-20 11:41:03', '2019-08-02 16:38:23', 1, 'Q854', '1', NULL),
(209, 'Sudan', 'SDN', 'SD', '249', 'Khartoum', 'SDG', '2018-07-20 11:41:03', '2019-08-02 16:38:23', 1, 'Q1049', '1', NULL),
(210, 'Suriname', 'SUR', 'SR', '597', 'Paramaribo', 'SRD', '2018-07-20 11:41:03', '2019-08-02 16:38:23', 1, 'Q730', '1', NULL),
(211, 'Svalbard And Jan Mayen Islands', 'SJM', 'SJ', '47', 'Longyearbyen', 'NOK', '2018-07-20 11:41:03', '2018-07-20 11:41:03', 1, NULL, '1', NULL),
(212, 'Swaziland', 'SWZ', 'SZ', '268', 'Mbabane', 'SZL', '2018-07-20 11:41:03', '2019-08-02 16:38:23', 1, 'Q1050', '1', NULL),
(213, 'Sweden', 'SWE', 'SE', '46', 'Stockholm', 'SEK', '2018-07-20 11:41:03', '2019-08-02 16:38:23', 1, 'Q34', '1', NULL),
(214, 'Switzerland', 'CHE', 'CH', '41', 'Berne', 'CHF', '2018-07-20 11:41:03', '2019-08-02 16:38:23', 1, 'Q39', '1', NULL),
(215, 'Syria', 'SYR', 'SY', '963', 'Damascus', 'SYP', '2018-07-20 11:41:03', '2019-08-02 16:38:23', 1, 'Q858', '1', NULL),
(216, 'Taiwan', 'TWN', 'TW', '886', 'Taipei', 'TWD', '2018-07-20 11:41:03', '2019-08-02 16:38:23', 1, 'Q865', '1', NULL),
(217, 'Tajikistan', 'TJK', 'TJ', '992', 'Dushanbe', 'TJS', '2018-07-20 11:41:03', '2019-08-02 16:38:23', 1, 'Q863', '1', NULL),
(218, 'Tanzania', 'TZA', 'TZ', '255', 'Dodoma', 'TZS', '2018-07-20 11:41:03', '2019-08-02 16:38:23', 1, 'Q924', '1', NULL),
(219, 'Thailand', 'THA', 'TH', '66', 'Bangkok', 'THB', '2018-07-20 11:41:03', '2019-08-02 16:38:23', 1, 'Q869', '1', NULL),
(220, 'Togo', 'TGO', 'TG', '228', 'Lome', 'XOF', '2018-07-20 11:41:03', '2019-08-02 16:38:23', 1, 'Q945', '1', NULL),
(221, 'Tokelau', 'TKL', 'TK', '690', '', 'NZD', '2018-07-20 11:41:03', '2018-07-20 11:41:03', 1, NULL, '1', NULL),
(222, 'Tonga', 'TON', 'TO', '676', 'Nuku''alofa', 'TOP', '2018-07-20 11:41:03', '2019-08-02 16:38:23', 1, 'Q678', '1', NULL),
(223, 'Trinidad And Tobago', 'TTO', 'TT', '+1-868', 'Port of Spain', 'TTD', '2018-07-20 11:41:03', '2019-08-02 16:38:23', 1, 'Q754', '1', NULL),
(224, 'Tunisia', 'TUN', 'TN', '216', 'Tunis', 'TND', '2018-07-20 11:41:03', '2019-08-02 16:38:23', 1, 'Q948', '1', NULL),
(225, 'Turkey', 'TUR', 'TR', '90', 'Ankara', 'TRY', '2018-07-20 11:41:03', '2019-08-02 16:38:23', 1, 'Q43', '1', NULL),
(226, 'Turkmenistan', 'TKM', 'TM', '993', 'Ashgabat', 'TMT', '2018-07-20 11:41:03', '2019-08-02 16:38:23', 1, 'Q874', '1', NULL),
(227, 'Turks And Caicos Islands', 'TCA', 'TC', '+1-649', 'Cockburn Town', 'USD', '2018-07-20 11:41:03', '2018-07-20 11:41:03', 1, NULL, '1', NULL),
(228, 'Tuvalu', 'TUV', 'TV', '688', 'Funafuti', 'AUD', '2018-07-20 11:41:03', '2019-08-02 16:38:23', 1, 'Q672', '1', NULL),
(229, 'Uganda', 'UGA', 'UG', '256', 'Kampala', 'UGX', '2018-07-20 11:41:03', '2019-08-02 16:38:23', 1, 'Q1036', '1', NULL),
(230, 'Ukraine', 'UKR', 'UA', '380', 'Kiev', 'UAH', '2018-07-20 11:41:03', '2019-08-02 16:38:23', 1, 'Q212', '1', NULL),
(231, 'United Arab Emirates', 'ARE', 'AE', '971', 'Abu Dhabi', 'AED', '2018-07-20 11:41:03', '2019-08-02 16:38:23', 1, 'Q878', '1', NULL),
(232, 'United Kingdom', 'GBR', 'GB', '44', 'London', 'GBP', '2018-07-20 11:41:03', '2019-08-02 16:38:23', 1, 'Q145', '1', NULL),
(233, 'United States', 'USA', 'US', '1', 'Washington', 'USD', '2018-07-20 11:41:03', '2019-08-02 16:38:23', 1, 'Q30', '1', NULL),
(234, 'United States Minor Outlying Islands', 'UMI', 'UM', '1', '', 'USD', '2018-07-20 11:41:03', '2018-07-20 11:41:03', 1, NULL, '1', NULL),
(235, 'Uruguay', 'URY', 'UY', '598', 'Montevideo', 'UYU', '2018-07-20 11:41:03', '2019-08-02 16:38:23', 1, 'Q77', '1', NULL),
(236, 'Uzbekistan', 'UZB', 'UZ', '998', 'Tashkent', 'UZS', '2018-07-20 11:41:03', '2019-08-02 16:38:23', 1, 'Q265', '1', NULL),
(237, 'Vanuatu', 'VUT', 'VU', '678', 'Port Vila', 'VUV', '2018-07-20 11:41:03', '2019-08-02 16:38:23', 1, 'Q686', '1', NULL),
(238, 'Vatican City State (Holy See)', 'VAT', 'VA', '379', 'Vatican City', 'EUR', '2018-07-20 11:41:03', '2019-08-02 16:38:22', 1, 'Q237', '1', NULL),
(239, 'Venezuela', 'VEN', 'VE', '58', 'Caracas', 'VEF', '2018-07-20 11:41:03', '2019-08-02 16:38:23', 1, 'Q717', '1', NULL),
(240, 'Vietnam', 'VNM', 'VN', '84', 'Hanoi', 'VND', '2018-07-20 11:41:03', '2019-08-02 16:38:23', 1, 'Q881', '1', NULL),
(241, 'Virgin Islands (British)', 'VGB', 'VG', '+1-284', 'Road Town', 'USD', '2018-07-20 11:41:03', '2018-07-20 11:41:03', 1, NULL, '1', NULL),
(242, 'Virgin Islands (US)', 'VIR', 'VI', '+1-340', 'Charlotte Amalie', 'USD', '2018-07-20 11:41:03', '2018-07-20 11:41:03', 1, NULL, '1', NULL),
(243, 'Wallis And Futuna Islands', 'WLF', 'WF', '681', 'Mata Utu', 'XPF', '2018-07-20 11:41:03', '2018-07-20 11:41:03', 1, NULL, '1', NULL),
(244, 'Western Sahara', 'ESH', 'EH', '212', 'El-Aaiun', 'MAD', '2018-07-20 11:41:03', '2018-07-20 11:41:03', 1, NULL, '1', NULL),
(245, 'Yemen', 'YEM', 'YE', '967', 'Sanaa', 'YER', '2018-07-20 11:41:03', '2019-08-02 16:38:23', 1, 'Q805', '1', NULL),
(246, 'Zambia', 'ZMB', 'ZM', '260', 'Lusaka', 'ZMK', '2018-07-20 11:41:03', '2019-08-02 16:38:23', 1, 'Q953', '1', NULL),
(247, 'Zimbabwe', 'ZWE', 'ZW', '263', 'Harare', 'ZWL', '2018-07-20 11:41:03', '2019-08-02 16:38:23', 1, 'Q954', '1', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `countries`
--
ALTER TABLE `countries`
  MODIFY `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=248;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
