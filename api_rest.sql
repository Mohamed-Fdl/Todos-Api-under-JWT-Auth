-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Sep 10, 2021 at 04:14 PM
-- Server version: 8.0.18
-- PHP Version: 7.4.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `api_rest_2`
--

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uuid` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(36, '2014_10_12_000000_create_users_table', 1),
(37, '2014_10_12_100000_create_password_resets_table', 1),
(38, '2019_08_19_000000_create_failed_jobs_table', 1),
(39, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(40, '2021_08_31_133932_create_todos_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
CREATE TABLE IF NOT EXISTS `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `todos`
--

DROP TABLE IF EXISTS `todos`;
CREATE TABLE IF NOT EXISTS `todos` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `completed` int(11) NOT NULL DEFAULT '0',
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `todos`
--

INSERT INTO `todos` (`id`, `title`, `body`, `completed`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 'Dolore sunt eligendi dicta nesciunt praesentium tenetur.', 'Ut aliquam illo quidem et perferendis. Necessitatibus quis quo corporis aut et et. Ea dolor aut aut quia omnis accusamus.', 0, 2, '2021-08-31 20:12:42', '2021-08-31 20:12:42'),
(2, 'jabshire@example.org', 'password', 0, 2, '2021-08-31 20:12:42', '2021-08-31 20:18:21'),
(11, 'jabshire@example.org', 'password', 0, 2, '2021-08-31 20:47:47', '2021-08-31 20:47:47'),
(3, 'Veniam cumque omnis perspiciatis voluptate non nesciunt ea.', 'Repellat velit deleniti a rem nisi cupiditate optio ut. Dolor impedit atque velit quas rem. Aut in qui voluptatibus illo maiores.', 0, 6, '2021-08-31 20:12:42', '2021-08-31 20:12:42'),
(4, 'Repellendus ducimus expedita iste fuga laboriosam similique velit sed.', 'Ut alias facere in animi deleniti reprehenderit et quis. Iure assumenda ipsum aut repellendus reiciendis. Architecto placeat architecto recusandae unde.', 1, 8, '2021-08-31 20:12:42', '2021-08-31 20:12:42'),
(5, 'Consectetur unde voluptates ut unde et.', 'Qui ducimus molestiae ducimus rem ut ipsam. Placeat recusandae assumenda molestias. Nostrum qui error aut veniam excepturi. Aut et qui delectus aperiam laudantium id. Quam rerum doloremque dolorum.', 1, 2, '2021-08-31 20:12:42', '2021-08-31 20:12:42'),
(6, 'Ut quis veritatis quo temporibus exercitationem facere sint.', 'In labore rem quia nulla. Vero id aperiam qui accusamus vero aliquid. Quos distinctio quis numquam ut suscipit consequatur officia accusamus.', 1, 1, '2021-08-31 20:12:42', '2021-08-31 20:12:42'),
(7, 'Quidem laudantium eos soluta labore autem.', 'Est quisquam voluptas odit id debitis. Labore nesciunt ea iusto voluptate dignissimos. Quis doloremque consequuntur repudiandae exercitationem quia maxime nisi. Labore dolor vel excepturi fugiat consequatur.', 1, 3, '2021-08-31 20:12:42', '2021-08-31 20:12:42'),
(8, 'Doloremque modi neque tempora omnis natus iste sunt.', 'Et dicta blanditiis qui eum dolor. Placeat id aut tenetur id ducimus consequatur. Aliquam consectetur est possimus quae delectus eum.', 1, 4, '2021-08-31 20:12:42', '2021-08-31 20:12:42'),
(9, 'Doloremque quia facere delectus omnis excepturi ex.', 'Quae debitis nesciunt consectetur deserunt. Molestias beatae porro voluptatem voluptatum. Libero doloribus voluptatem eveniet vero quo alias eos rerum.', 0, 10, '2021-08-31 20:12:42', '2021-08-31 20:12:42'),
(10, 'Quia corrupti aliquid deleniti iusto rem voluptas temporibus.', 'Officiis neque eaque eius minima corrupti beatae. Cupiditate commodi sequi error esse ducimus qui. Aut voluptatem itaque tempore dolorum quisquam est et.', 1, 7, '2021-08-31 20:12:42', '2021-08-31 20:12:42');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Clemmie Stanton', 'zschulist@example.com', '2021-08-31 20:12:41', '$2y$10$Nyf4mMtkxD29LSaLSLkwR.SZvy147IHqK7hAcKUASO2pvPKCJ.6Nu', 'mke8cCFkXg', '2021-08-31 20:12:42', '2021-08-31 20:12:42'),
(2, 'Callie Swift', 'jabshire@example.org', '2021-08-31 20:12:41', '$2y$10$RXqAHUPcxG.c9SeZS72GleW/SYZ/TS6lyHwseVMbs4Sy3j/G74dRK', 'M5a6XOHl9m', '2021-08-31 20:12:42', '2021-08-31 20:12:42'),
(3, 'Riley Cummings', 'taurean.price@example.net', '2021-08-31 20:12:41', '$2y$10$R/jYZtPB3G05WRTmZGpSh.NjyYQR/i40YWTD6ymGLEmHuw6G5FJdW', '4PmDzGk4a3', '2021-08-31 20:12:42', '2021-08-31 20:12:42'),
(4, 'Gust West', 'iva97@example.com', '2021-08-31 20:12:41', '$2y$10$tqXIy.RSR4u/fIr3S4SPgeUzaXHyEYf1AmJcuJeCNYOx7U3ZlDydi', 'HPUphSNmUJ', '2021-08-31 20:12:42', '2021-08-31 20:12:42'),
(5, 'Dr. Jerod Runolfsdottir Jr.', 'davis.allen@example.com', '2021-08-31 20:12:42', '$2y$10$OP2H6zLtdYAC6PWSdffZ1Os4tsZGrDxJ85lp0N39FupIUZRYne5Li', 'jyDbZvBpNh', '2021-08-31 20:12:42', '2021-08-31 20:12:42'),
(6, 'Jada Brakus', 'lempi.schuppe@example.org', '2021-08-31 20:12:42', '$2y$10$1bB19XFmNTOFJEd4VOXTTO6XSguoFdaIdDwgb5wdBD8MUURsNhRYe', 'Ob0HkOd1OX', '2021-08-31 20:12:42', '2021-08-31 20:12:42'),
(7, 'Ms. Maurine Anderson II', 'asauer@example.org', '2021-08-31 20:12:42', '$2y$10$cfj7Y2KMRZGI.7aHi2jP8e9jGVAPrDks/Fk0IrdlVv9JU2Y7R8Vj.', 'Q21goIuvl3', '2021-08-31 20:12:42', '2021-08-31 20:12:42'),
(8, 'Dr. Alberto Monahan V', 'friesen.royce@example.net', '2021-08-31 20:12:42', '$2y$10$WnjHSaCeom0ZW1U0IBB7U.C8E.EJnRD3limkP6hAhtQMuMBsjhDrG', 'wLCJWWwc5C', '2021-08-31 20:12:42', '2021-08-31 20:12:42'),
(9, 'Amparo Gerhold DVM', 'sven.pollich@example.net', '2021-08-31 20:12:42', '$2y$10$VnYI8TtFwAteXncJ58fs0O06aKr.BlsqX2BQl8ezZmStY7PFHiCO2', 'pE99xhd8Ep', '2021-08-31 20:12:42', '2021-08-31 20:12:42'),
(10, 'Prof. Freddy Gleichner', 'golda.parisian@example.com', '2021-08-31 20:12:42', '$2y$10$1PwlbAIi2N.HxpguvZXmQ.bQJ2EMQmewHQMjAvaFnHGY/6tcwwGQm', '4AYXgC6WZO', '2021-08-31 20:12:42', '2021-08-31 20:12:42');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
