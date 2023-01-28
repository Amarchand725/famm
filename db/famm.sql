-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jan 28, 2023 at 01:01 AM
-- Server version: 5.7.36
-- PHP Version: 8.0.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `famm`
--

-- --------------------------------------------------------

--
-- Table structure for table `about_us`
--

DROP TABLE IF EXISTS `about_us`;
CREATE TABLE IF NOT EXISTS `about_us` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `currency` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency_symbol` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fast_delivery` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `free_shipping` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `best_quality` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `banner` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `banner_title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `banner_content` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subscriber_content` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `about_us`
--

INSERT INTO `about_us` (`id`, `currency`, `currency_symbol`, `fast_delivery`, `free_shipping`, `best_quality`, `banner`, `banner_title`, `banner_content`, `subscriber_content`, `created_at`, `updated_at`) VALUES
(1, 'USD', '$', 'variations of passages of Lorem Ipsum available', 'variations of passages of Lorem Ipsum available', 'variations of passages of Lorem Ipsum available', '1674757763.png', 'Taryn Barrows', 'Non eum eveniet tempora deleniti velit consectetur.', 'Et eius praesentium eveniet deleniti distinctio voluptatum.', '2023-01-26 13:00:38', '2023-01-26 13:29:24');

-- --------------------------------------------------------

--
-- Table structure for table `blogs`
--

DROP TABLE IF EXISTS `blogs`;
CREATE TABLE IF NOT EXISTS `blogs` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `created_by` bigint(20) NOT NULL,
  `category_id` bigint(20) DEFAULT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `short_description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `full_description` text COLLATE utf8mb4_unicode_ci,
  `mime_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `post` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `deleted_at` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `blogs`
--

INSERT INTO `blogs` (`id`, `created_by`, `category_id`, `title`, `slug`, `short_description`, `full_description`, `mime_type`, `post`, `status`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 9, NULL, 'Et quisquam quia maxime quo consequatur.', 'et-quisquam-quia-maxime-quo-consequatur', 'Ad ut laudantium eligendi necessitatibus sed.', 'Iste aliquid nihil dignissimos impedit. Ut voluptatem voluptatibus saepe saepe. Quia labore aspernatur voluptatibus quia voluptas et in.', 'data:image', '1674687846.webp', 1, NULL, '2023-01-25 16:09:04', '2023-01-25 18:04:07'),
(2, 3, NULL, 'Vel dolor at aut nobis reprehenderit.', 'vel-dolor-at-aut-nobis-reprehenderit', 'Placeat dolore et voluptates voluptate vel.', 'Odio perspiciatis blanditiis veniam vitae tempore. Accusamus eaque saepe explicabo est est est a. Minima vel animi cupiditate placeat ex. Expedita corrupti minima voluptate error.', 'data:image', '1674687836.jpeg', 0, NULL, '2023-01-25 16:09:04', '2023-01-25 18:03:57'),
(3, 7, NULL, 'Dignissimos illo iusto eos ipsum nesciunt reprehenderit.', 'dignissimos-illo-iusto-eos-ipsum-nesciunt-reprehenderit', 'Et voluptatum neque deserunt.', 'Incidunt veniam iste et et harum nulla. Nostrum consequatur at molestiae atque culpa doloremque ex. Ut numquam voluptatem provident qui.', 'data:image', '1674687826.jpeg', 0, NULL, '2023-01-25 16:09:04', '2023-01-25 18:03:46'),
(4, 1, NULL, 'Eaque mollitia quaerat quidem aliquam est.', 'eaque-mollitia-quaerat-quidem-aliquam-est', 'Sapiente et et est consequatur deleniti quaerat natus ratione.', 'Nostrum ratione reiciendis et non aspernatur enim. Id veniam eos aut officiis ea eum. Odit officiis voluptatem facilis odio eius laudantium qui ullam.', 'data:image', '1674687817.jpeg', 1, NULL, '2023-01-25 16:09:04', '2023-01-25 18:03:37'),
(5, 9, NULL, 'Error commodi officiis mollitia veritatis maiores sed unde error.', 'error-commodi-officiis-mollitia-veritatis-maiores-sed-unde-error', 'Quis non nihil repudiandae porro earum.', 'Cupiditate necessitatibus nihil repellendus aut in ea. Dignissimos aut nemo voluptate aliquam quia et. Unde ab aliquid doloremque iusto aut odit iure.', 'data:image', '1674687811.jpeg', 0, NULL, '2023-01-25 16:09:04', '2023-01-25 18:03:31'),
(6, 6, NULL, 'Nobis consequuntur voluptas dolores aut magni.', 'nobis-consequuntur-voluptas-dolores-aut-magni', 'Itaque ut nisi commodi consequatur nobis sit atque.', 'Odit consequuntur quis id omnis quibusdam ut. Iure sed neque consequuntur. Explicabo sint aut voluptas optio. Quia accusantium eum sed libero quidem alias. Molestias sed eos in animi.', 'data:image', '1674687804.webp', 0, NULL, '2023-01-25 16:09:04', '2023-01-25 18:03:24'),
(7, 11, NULL, 'Ut quis hic quia necessitatibus non minus cum.', 'ut-quis-hic-quia-necessitatibus-non-minus-cum', 'Neque voluptas velit pariatur alias.', 'Voluptas soluta neque voluptate itaque expedita quis. Consequuntur impedit ducimus est reiciendis deserunt.', 'data:image', '1674687796.webp', 1, NULL, '2023-01-25 16:09:04', '2023-01-25 18:03:16'),
(8, 2, NULL, 'Voluptatem eligendi doloribus assumenda et ipsam velit.', 'voluptatem-eligendi-doloribus-assumenda-et-ipsam-velit', 'Porro voluptatibus perferendis quia saepe.', 'Ut doloremque ullam facilis quibusdam est a. Aut facere dolores velit ducimus eum et ratione. Nihil tempore blanditiis laborum. Quasi nihil autem voluptates magnam ex maxime.', 'data:image', '1674687790.webp', 0, NULL, '2023-01-25 16:09:04', '2023-01-25 18:03:10'),
(9, 3, NULL, 'Reprehenderit pariatur facilis odio.', 'reprehenderit-pariatur-facilis-odio', 'Voluptas aut consequatur sit.', 'Commodi impedit eos rerum necessitatibus in. Culpa corrupti nam facilis vero exercitationem. Ex id et dolores aperiam laboriosam voluptatum voluptates autem. Sed earum ut ratione aut.', 'data:image', '1674687778.webp', 1, NULL, '2023-01-25 16:09:04', '2023-01-25 18:02:58'),
(10, 9, NULL, 'Ea autem incidunt aliquid eius.', 'ea-autem-incidunt-aliquid-eius', 'Et provident autem eius temporibus.', 'Quasi qui quia velit alias. Illo mollitia in laudantium facere totam hic consequuntur. Cumque laudantium et provident. Odio itaque et sunt eum dolores quam dolores.', 'data:image', '1674687770.jpeg', 0, NULL, '2023-01-25 16:09:04', '2023-01-25 18:02:50'),
(11, 1, NULL, 'Quia id ut labore q updated', 'quia-id-ut-labore-q-updated', 'Veniam quis similiq updated', 'Quisquam consequatur updated', 'data:image', '1674685210.png', 1, NULL, '2023-01-25 17:09:48', '2023-01-25 17:20:10');

-- --------------------------------------------------------

--
-- Table structure for table `carts`
--

DROP TABLE IF EXISTS `carts`;
CREATE TABLE IF NOT EXISTS `carts` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `product_id` bigint(20) NOT NULL,
  `quantity` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `carts`
--

INSERT INTO `carts` (`id`, `user_id`, `product_id`, `quantity`, `created_at`, `updated_at`) VALUES
(9, 1, 9, 2, '2023-01-27 19:55:44', '2023-01-27 20:00:43'),
(8, 1, 10, 2, '2023-01-27 19:55:40', '2023-01-27 20:00:33');

-- --------------------------------------------------------

--
-- Table structure for table `contacted_us`
--

DROP TABLE IF EXISTS `contacted_us`;
CREATE TABLE IF NOT EXISTS `contacted_us` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `deleted_at` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `contacted_us`
--

INSERT INTO `contacted_us` (`id`, `name`, `email`, `subject`, `message`, `status`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'Zane Johns', 'wolf.maribel@hotmail.com', 'Exercitationem magni culpa fugit dolor.', 'Dolores ut sunt et libero ullam. Temporibus iure ut dolorem impedit consequatur impedit aut. Enim ea aut pariatur provident. Aut quia illum ipsam sunt deserunt modi.', 1, NULL, '2023-01-25 17:33:11', '2023-01-25 17:33:11'),
(2, 'Nadia Spencer', 'marvin.lowell@cole.net', 'Alias qui ut sit quidem tempore laudantium quos.', 'Vero non libero aliquam eaque. Ab sunt voluptatem et qui iusto. Necessitatibus commodi sit maiores eum tenetur animi.', 0, NULL, '2023-01-25 17:33:11', '2023-01-25 17:33:11'),
(3, 'Prof. Rosanna Schamberger Sr.', 'alda57@yahoo.com', 'Ut magnam consequatur eos at sapiente aut rerum.', 'Dignissimos corrupti alias reprehenderit facere minima mollitia. Ut dicta voluptatem cumque non aut. Suscipit aliquam ut et et qui labore. Sit voluptas repudiandae aut ducimus quos et.', 0, NULL, '2023-01-25 17:33:11', '2023-01-25 17:33:11'),
(4, 'Armando Labadie', 'paucek.delia@treutel.biz', 'In et ex nostrum dolorem voluptas.', 'Architecto reprehenderit suscipit impedit. Tenetur natus quidem velit dolorum et et cum.', 0, NULL, '2023-01-25 17:33:11', '2023-01-25 17:33:11'),
(5, 'Carleton Skiles', 'lexi17@orn.biz', 'Est dicta consequatur ipsa sunt dolorem veritatis.', 'Voluptatem voluptate earum modi et repellat impedit a quos. Illo autem atque quaerat aperiam sint quas sequi. Ducimus architecto rerum nihil dicta.', 1, NULL, '2023-01-25 17:33:11', '2023-01-25 17:33:11'),
(6, 'Mr. Furman Ernser', 'antoinette56@yahoo.com', 'Et facere consequuntur et voluptatum nam.', 'Dolor minus possimus esse cumque. Dolore facere distinctio officiis voluptatem cumque architecto ratione omnis.', 0, NULL, '2023-01-25 17:33:11', '2023-01-25 17:33:11'),
(7, 'Prof. Lorenza Williamson', 'zion50@fay.com', 'Voluptates repudiandae molestiae molestiae quam molestiae.', 'Fugiat vel eligendi eligendi numquam. Numquam molestias autem commodi quasi. Non et optio nihil praesentium officia.', 0, NULL, '2023-01-25 17:33:11', '2023-01-25 17:33:11'),
(8, 'Kaitlin Brown', 'kian.fisher@breitenberg.com', 'Temporibus quae quae est porro quia molestiae.', 'Vel asperiores vitae numquam accusantium voluptatum. Porro occaecati laboriosam est mollitia qui et illo. Labore deleniti in a repellendus. Hic iste aliquam nam rerum.', 0, NULL, '2023-01-25 17:33:11', '2023-01-25 17:33:11'),
(9, 'Keshawn Howe Jr.', 'wfriesen@rutherford.com', 'Delectus possimus aliquid molestiae et.', 'Ad qui natus iste. Pariatur sit ipsa et dolorem dolores iure aliquam. Quod reprehenderit repellendus omnis a sit.', 0, NULL, '2023-01-25 17:33:11', '2023-01-25 17:33:11'),
(10, 'Jeanie Bahringer', 'ivory24@yahoo.com', 'Rerum tempore repudiandae ut autem minus incidunt aut.', 'Corporis magnam dolor occaecati corporis earum. Sed omnis libero fuga rerum. Amet eos velit deleniti aliquid eum magnam soluta. Vitae sint id vero accusamus cum error.', 1, NULL, '2023-01-25 17:33:11', '2023-01-25 17:33:11');

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
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2023_01_20_220555_add_profile_to_users_table', 2),
(6, '2023_01_20_220811_add_mobile_to_users_table', 2),
(7, '2023_01_20_223733_create_sliders_table', 3),
(10, '2023_01_25_163137_create_products_table', 4),
(11, '2023_01_25_163421_create_product_images_table', 4),
(12, '2023_01_25_185126_create_subscribers_table', 5),
(13, '2023_01_25_191734_create_testimonials_table', 6),
(16, '2023_01_25_204854_create_blogs_table', 7),
(17, '2023_01_25_222628_create_contacted_us_table', 8),
(18, '2023_01_26_165615_create_settings_table', 9),
(19, '2023_01_26_175042_create_about_us_table', 10),
(20, '2023_01_27_010036_create_wish_lists_table', 11),
(22, '2023_01_27_222235_create_carts_table', 12);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
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
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=MyISAM AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 1, 'MyApp', '49fa9c155216ea7c1be0a50e8c7bdf3d67a46428577a425e1ffed2f939185ab2', '[\"*\"]', NULL, NULL, '2023-01-17 16:38:30', '2023-01-17 16:38:30'),
(2, 'App\\Models\\User', 1, 'MyApp', '52cbfe13f14854324132fe3057eae4a75fa4884ad7ab112263e741bcfe9e98dd', '[\"*\"]', NULL, NULL, '2023-01-17 16:42:23', '2023-01-17 16:42:23'),
(3, 'App\\Models\\User', 1, 'MyApp', '86e6f6da0d4fbf063f8a7369a62278083bce72abffe7ff05e735320875695f34', '[\"*\"]', NULL, NULL, '2023-01-17 18:51:01', '2023-01-17 18:51:01'),
(4, 'App\\Models\\User', 1, 'MyApp', '5241e7eb5e90b350e2f23d3cbcca090f719b88aac7807af1052dc36423204ab7', '[\"*\"]', NULL, NULL, '2023-01-17 18:55:28', '2023-01-17 18:55:28'),
(5, 'App\\Models\\User', 1, 'MyApp', '0aee94f0e89ce1c4631b1cda61bd66c303ba659c28cf9bd8f9ae05b1b12e1e3b', '[\"*\"]', NULL, NULL, '2023-01-18 18:14:47', '2023-01-18 18:14:47'),
(6, 'App\\Models\\User', 1, 'MyApp', 'e08446f25e1ee0ffb44d837c12563304723a2b5ea8b05dd4d59875b89692a4a7', '[\"*\"]', NULL, NULL, '2023-01-18 18:59:41', '2023-01-18 18:59:41'),
(7, 'App\\Models\\User', 1, 'MyApp', '213ebd64c71675541df2178506c2d37a74ef4131105d1f18ba466f99099200dd', '[\"*\"]', NULL, NULL, '2023-01-18 19:06:55', '2023-01-18 19:06:55'),
(8, 'App\\Models\\User', 1, 'MyApp', 'ca7dac8929e4b28abc250b4c9e7a1024a9b9ac493f7c3e5e3f09826b5bb3d89c', '[\"*\"]', NULL, NULL, '2023-01-18 19:14:48', '2023-01-18 19:14:48'),
(9, 'App\\Models\\User', 1, 'MyApp', 'addfe0391887020d666834dbe63f61747f54692fe1f5565135f827a4cb7f5dbe', '[\"*\"]', NULL, NULL, '2023-01-18 19:24:21', '2023-01-18 19:24:21'),
(10, 'App\\Models\\User', 1, 'MyApp', '1aa430fa18e8c5bd0bcf8b9fd85355822aefeed026545b3cd9c76d1a16036383', '[\"*\"]', NULL, NULL, '2023-01-19 12:18:29', '2023-01-19 12:18:29'),
(11, 'App\\Models\\User', 1, 'MyApp', '83f95f7dd1b2677b3ecc200db7421b2e095a557b3a33727c346608fc0b8ab250', '[\"*\"]', NULL, NULL, '2023-01-19 12:19:48', '2023-01-19 12:19:48'),
(12, 'App\\Models\\User', 1, 'MyApp', '0160f2fd211e40a8afb9572273b4555b62e569c9cec7b546fcb2716e02b55dd3', '[\"*\"]', NULL, NULL, '2023-01-19 12:20:45', '2023-01-19 12:20:45'),
(13, 'App\\Models\\User', 1, 'MyApp', '0cc98fc72a336bba4753d266e76b9ccfed4e294d0e69bb365ddbeabddd919e75', '[\"*\"]', NULL, NULL, '2023-01-19 12:20:47', '2023-01-19 12:20:47'),
(14, 'App\\Models\\User', 1, 'MyApp', '00a1642a40fd885535f59c705bff72232867cf6d9f9a1fc6a9c96bd785095e77', '[\"*\"]', NULL, NULL, '2023-01-19 12:20:51', '2023-01-19 12:20:51'),
(15, 'App\\Models\\User', 1, 'MyApp', 'a5a30e979ee72be128291e4ea1506d84b86eefe3792f51b8147bfbaa8f08ceca', '[\"*\"]', NULL, NULL, '2023-01-19 12:20:56', '2023-01-19 12:20:56'),
(16, 'App\\Models\\User', 1, 'MyApp', '12a872e478a702047c4d8826147b25ec2484038500cfb4a2fa977bf7b1f94c04', '[\"*\"]', NULL, NULL, '2023-01-19 12:22:32', '2023-01-19 12:22:32'),
(17, 'App\\Models\\User', 1, 'MyApp', '97a2667501d84979d7c5981d1fc9801c95ff952b741b1d638070b558df594697', '[\"*\"]', NULL, NULL, '2023-01-19 12:22:44', '2023-01-19 12:22:44'),
(18, 'App\\Models\\User', 1, 'MyApp', 'dd77f2d0224996f1fc7e01e45aa20cefec4c032ce8671389452536da9d86defa', '[\"*\"]', NULL, NULL, '2023-01-19 12:59:14', '2023-01-19 12:59:14'),
(19, 'App\\Models\\User', 1, 'MyApp', 'dbc79109925d010110d68b604e18ba576551357f157a9c5f9aee37ced05a1022', '[\"*\"]', NULL, NULL, '2023-01-19 13:07:22', '2023-01-19 13:07:22'),
(20, 'App\\Models\\User', 1, 'MyApp', '91d9c6e27250515e2dfe79c69443c5cd12f3c35163eb3c64f35e3dc51ffadd37', '[\"*\"]', NULL, NULL, '2023-01-19 13:12:01', '2023-01-19 13:12:01'),
(21, 'App\\Models\\User', 1, 'MyApp', '37211d3149d55dd37b2ac1f3d02ed10cefedeb04411ec4ac3f1fc36776cba0a7', '[\"*\"]', NULL, NULL, '2023-01-19 13:12:36', '2023-01-19 13:12:36'),
(22, 'App\\Models\\User', 1, 'MyApp', 'e2bc1ba3767be2393dcec5d4e166685f61d664a60357f54daf07d1cdb6e90cf9', '[\"*\"]', NULL, NULL, '2023-01-19 14:02:36', '2023-01-19 14:02:36'),
(23, 'App\\Models\\User', 1, 'MyApp', '24d08f4ea82c1e0e4b12d74893c8de41569220498bdd76b334d17adb72488c2a', '[\"*\"]', NULL, NULL, '2023-01-19 14:05:18', '2023-01-19 14:05:18'),
(24, 'App\\Models\\User', 1, 'MyApp', '29d67f1ed636cb53223e5fe1749381a184a3fda86ee3b820006a2ee6f8fe7ca6', '[\"*\"]', NULL, NULL, '2023-01-19 15:28:07', '2023-01-19 15:28:07'),
(25, 'App\\Models\\User', 1, 'MyApp', 'ffe66736e85a2fc1a80f59b2b65d007801ed2d1c7c9bede215ae78cf0cbacf00', '[\"*\"]', NULL, NULL, '2023-01-19 15:30:31', '2023-01-19 15:30:31'),
(26, 'App\\Models\\User', 1, 'MyApp', 'b859f69d85235930f478f1b434d6437b6a44015d2e75cbda4be8b518a8c1dc8e', '[\"*\"]', NULL, NULL, '2023-01-19 15:32:34', '2023-01-19 15:32:34'),
(27, 'App\\Models\\User', 1, 'MyApp', '1b521d3fbc5fb26a21c2b85636ccf53afdb1dac261b2bd7da183d4a65a21e1a1', '[\"*\"]', '2023-01-20 16:10:18', NULL, '2023-01-19 17:19:03', '2023-01-20 16:10:18'),
(28, 'App\\Models\\User', 1, 'MyApp', 'd1b276d209fe744f3054f1bf099d919e65f8a452e3f0a762d8d07a62d74c645b', '[\"*\"]', NULL, NULL, '2023-01-20 17:17:34', '2023-01-20 17:17:34'),
(29, 'App\\Models\\User', 1, 'MyApp', 'fcd7e0b3aa30ac44f9dc860f106d3843a3514a7ddbbea0023e5a993000d00d72', '[\"*\"]', NULL, NULL, '2023-01-23 12:09:33', '2023-01-23 12:09:33'),
(30, 'App\\Models\\User', 1, 'MyApp', 'e75702b1dd1caaaddb8034580cf3ca946a3db4aab2c071b10de4853ca6fe3eb9', '[\"*\"]', NULL, NULL, '2023-01-27 15:32:23', '2023-01-27 15:32:23');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
CREATE TABLE IF NOT EXISTS `products` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `category_id` bigint(20) DEFAULT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sale_price` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `thumbnail` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `deleted_at` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `category_id`, `title`, `slug`, `price`, `sale_price`, `description`, `thumbnail`, `status`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Men\'s Shirt', 'mens-shirt-1', '50', '45', 'Lorem ipsum', '1674672149.png', 1, NULL, '2023-01-25 12:45:52', '2023-01-25 13:42:29'),
(2, NULL, 'Men\'s Shirt Black', 'mens-shirt-black', '70', '80', 'lorem ipsm', '1674687183.png', 1, NULL, '2023-01-25 17:53:03', '2023-01-25 17:53:03'),
(3, NULL, 'Women dress skirt', 'women-dress-skirt', '68', '60', 'lorem ipsm', '1674687219.png', 1, NULL, '2023-01-25 17:53:39', '2023-01-25 17:53:39'),
(4, NULL, 'Women Dress Red Skirt', 'women-dress-red-skirt', '70', '65', 'lorem ipsm', '1674687287.png', 1, NULL, '2023-01-25 17:54:47', '2023-01-25 17:54:47'),
(5, NULL, 'Women Dress Brinjal', 'women-dress-brinjal', '75', '70', NULL, '1674687327.png', 1, NULL, '2023-01-25 17:55:27', '2023-01-25 17:55:27'),
(6, NULL, 'Women Dress skirt', 'women-dress-skirt', '58', '55', NULL, '1674687359.png', 1, NULL, '2023-01-25 17:55:59', '2023-01-25 17:55:59'),
(7, NULL, 'Women Black Skirt', 'women-black-skirt', '80', '78', NULL, '1674687382.png', 1, NULL, '2023-01-25 17:56:23', '2023-01-25 17:56:23'),
(8, NULL, 'Men Blue Shirt', 'men-blue-shirt', '65', '62', NULL, '1674687409.png', 1, NULL, '2023-01-25 17:56:50', '2023-01-25 17:56:50'),
(9, NULL, 'Men\'s Shirt', 'mens-shirt-2', '65', '63', 'Lorem ipsm ', '1674687440.png', 1, NULL, '2023-01-25 17:57:20', '2023-01-25 17:57:20'),
(10, NULL, 'Men\'s Green Shirt', 'mens-green-shirt', '70', '70', 'lorem ipusm', '1674687483.png', 1, NULL, '2023-01-25 17:58:03', '2023-01-25 17:58:03'),
(11, NULL, 'Men\'s Red Shirt', 'mens-red-shirt', '55', '50', NULL, '1674687504.png', 1, NULL, '2023-01-25 17:58:24', '2023-01-25 17:58:24'),
(12, NULL, 'Women Pink Skirt', 'women-pink-skirt', '78', '65', NULL, '1674687531.png', 1, NULL, '2023-01-25 17:58:51', '2023-01-25 17:58:51');

-- --------------------------------------------------------

--
-- Table structure for table `product_images`
--

DROP TABLE IF EXISTS `product_images`;
CREATE TABLE IF NOT EXISTS `product_images` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) NOT NULL,
  `mime_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
CREATE TABLE IF NOT EXISTS `settings` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `about_us` text COLLATE utf8mb4_unicode_ci,
  `logo` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `name`, `address`, `phone`, `email`, `about_us`, `logo`, `created_at`, `updated_at`) VALUES
(1, 'Famm', '697 Michale Extension\nStantonside, MI 15600-6019', '1-443-847-1816', 'emmanuelle.kozey@hotmail.com', 'variations of passages of Lorem Ipsum available', '1674754316.png', '2023-01-26 12:03:18', '2023-01-26 13:54:34');

-- --------------------------------------------------------

--
-- Table structure for table `sliders`
--

DROP TABLE IF EXISTS `sliders`;
CREATE TABLE IF NOT EXISTS `sliders` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sub_title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sliders`
--

INSERT INTO `sliders` (`id`, `title`, `sub_title`, `description`, `image`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'Itaque sit mollit e', 'Dignissimos error ci', 'Ut aut quidem conseq', '1674495140.jpeg', '2023-01-24 23:55:58', '2023-01-23 12:32:20', '2023-01-24 18:55:58'),
(2, 'Sale 20% Off', 'On Everything', 'Explicabo esse amet tempora quibusdam laudantium, laborum eaque magnam fugiat hic? Esse dicta aliquid error repudiandae earum suscipit fugiat molestias, veniam, vel architecto veritatis delectus repellat modi impedit sequi.', '1674607427.jpeg', NULL, '2023-01-24 17:43:19', '2023-01-24 19:44:25'),
(3, 'Molestias tempor dol', 'Aute labore ipsa na', 'Ea exercitation nequ', '1674687897.jpeg', NULL, '2023-01-25 18:04:57', '2023-01-25 18:04:57');

-- --------------------------------------------------------

--
-- Table structure for table `subscribers`
--

DROP TABLE IF EXISTS `subscribers`;
CREATE TABLE IF NOT EXISTS `subscribers` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'Active',
  `deleted_at` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `subscribers`
--

INSERT INTO `subscribers` (`id`, `email`, `status`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'john@mail.com', 1, '2023-01-25 19:11:49', '2023-01-25 14:05:54', '2023-01-25 14:11:49'),
(2, 'skye90@gmail.com', 1, NULL, '2023-01-25 14:08:40', '2023-01-25 14:08:40'),
(3, 'kirlin.mckenna@mcclure.net', 1, NULL, '2023-01-25 14:08:40', '2023-01-25 14:08:40'),
(4, 'pearline.hyatt@yahoo.com', 1, NULL, '2023-01-25 14:08:40', '2023-01-25 14:08:40'),
(5, 'magdalen71@hotmail.com', 1, NULL, '2023-01-25 14:08:40', '2023-01-25 14:08:40'),
(6, 'beatrice92@gmail.com', 1, NULL, '2023-01-25 14:08:40', '2023-01-25 14:08:40'),
(7, 'dolly00@barrows.net', 1, NULL, '2023-01-25 14:08:40', '2023-01-25 14:08:40'),
(8, 'idella.little@gmail.com', 1, NULL, '2023-01-25 14:08:40', '2023-01-25 14:08:40'),
(9, 'ashlee51@hotmail.com', 1, NULL, '2023-01-25 14:08:40', '2023-01-25 14:08:40'),
(10, 'von.berenice@orn.biz', 1, NULL, '2023-01-25 14:08:40', '2023-01-25 14:08:40'),
(11, 'zgislason@pouros.net', 1, NULL, '2023-01-25 14:08:40', '2023-01-25 14:08:40'),
(12, 'buckridge.harmony@gmail.com', 1, NULL, '2023-01-25 14:16:38', '2023-01-25 14:16:38'),
(13, 'shania.dare@hotmail.com', 1, NULL, '2023-01-25 14:16:38', '2023-01-25 14:16:38'),
(14, 'sauer.aditya@gmail.com', 1, NULL, '2023-01-25 14:16:38', '2023-01-25 14:16:38'),
(15, 'genoveva08@parisian.biz', 1, NULL, '2023-01-25 14:16:38', '2023-01-25 14:16:38'),
(16, 'lamar18@gmail.com', 1, NULL, '2023-01-25 14:16:38', '2023-01-25 14:16:38'),
(17, 'rosenbaum.jany@collins.com', 1, NULL, '2023-01-25 14:16:38', '2023-01-25 14:16:38'),
(18, 'heidenreich.rashawn@hotmail.com', 1, NULL, '2023-01-25 14:16:38', '2023-01-25 14:16:38'),
(19, 'shauck@rosenbaum.org', 1, NULL, '2023-01-25 14:16:38', '2023-01-25 14:16:38'),
(20, 'yokeefe@toy.net', 1, NULL, '2023-01-25 14:16:38', '2023-01-25 14:16:38'),
(21, 'leonardo.kihn@mckenzie.com', 1, NULL, '2023-01-25 14:16:38', '2023-01-25 14:16:38'),
(22, 'jyboc@mailinator.com', 1, NULL, '2023-01-25 19:13:41', '2023-01-25 19:13:41'),
(23, 'narazofubu@mailinator.com', 1, NULL, '2023-01-25 19:30:19', '2023-01-25 19:30:19');

-- --------------------------------------------------------

--
-- Table structure for table `testimonials`
--

DROP TABLE IF EXISTS `testimonials`;
CREATE TABLE IF NOT EXISTS `testimonials` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `testimonial` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `deleted_at` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `testimonials`
--

INSERT INTO `testimonials` (`id`, `user_id`, `testimonial`, `status`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 7, 'Dicta tempore saepe odio illo perferendis. Ullam molestiae accusantium sit omnis animi in reprehenderit.', 1, NULL, '2023-01-25 14:26:52', '2023-01-25 14:26:52'),
(2, 6, 'Sunt inventore ut officiis debitis incidunt vero. Et corrupti velit sint corrupti. Doloremque labore ea est accusantium molestiae voluptas mollitia. Corporis sed ex qui voluptatem.', 1, NULL, '2023-01-25 14:26:52', '2023-01-25 14:26:52'),
(3, 7, 'Quasi et quae eos aut a eos. Expedita illum aut iste dolorum quasi voluptas. Atque sit non voluptates at.', 0, NULL, '2023-01-25 14:26:52', '2023-01-25 14:26:52'),
(4, 8, 'Repudiandae saepe distinctio ipsa quae ut. Velit quibusdam excepturi adipisci deleniti possimus sed distinctio. Voluptas omnis ratione est voluptas. Expedita unde id aliquam dolores.', 1, NULL, '2023-01-25 14:26:52', '2023-01-25 14:26:52'),
(5, 9, 'Neque ab reiciendis cupiditate hic ut nisi. Commodi sit ut aperiam dolorum quibusdam dignissimos. Aut consequatur accusantium fugit sunt omnis adipisci nulla.', 0, NULL, '2023-01-25 14:26:52', '2023-01-25 14:26:52'),
(6, 5, 'Fugiat ea cumque quo eos placeat. Earum quia a voluptatem maxime rerum veritatis et. Voluptatibus asperiores autem aspernatur qui qui.', 0, NULL, '2023-01-25 14:26:52', '2023-01-25 14:26:52'),
(7, 2, 'Autem et et ut exercitationem eaque ab nobis. Facere itaque molestias voluptatibus sint. Qui unde neque iure saepe quia.', 1, NULL, '2023-01-25 14:26:52', '2023-01-25 14:26:52'),
(8, 11, 'Quia possimus debitis nobis quis. Maxime voluptate voluptas officiis facere sit ut.', 1, NULL, '2023-01-25 14:26:52', '2023-01-25 14:26:52'),
(9, 9, 'Suscipit quis consequatur necessitatibus qui est praesentium voluptate. Sint itaque nostrum sit. Atque inventore totam et ipsum aut.', 0, NULL, '2023-01-25 14:26:52', '2023-01-25 14:26:52'),
(10, 9, 'Facilis et aut et suscipit. Ut nihil qui maxime dolorem id enim voluptatem animi. Cupiditate quod placeat cupiditate ut quia.', 0, NULL, '2023-01-25 14:26:52', '2023-01-25 14:26:52');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mobile` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `profile` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `mobile`, `profile`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'admin@gmail.com', NULL, NULL, '2023-01-17 16:37:13', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'SORQiKZ02O', '2023-01-17 16:37:13', '2023-01-17 16:37:13'),
(2, 'Avery Kertzmann II', 'hackett.floy@botsford.info', NULL, NULL, '2023-01-25 14:16:37', '25be73e4070dcf74143b0fada3322c956d62fcd4', 's1oJfUnL9u', '2023-01-25 14:16:37', '2023-01-25 14:16:37'),
(3, 'Lola Paucek', 'romaguera.hilda@okuneva.com', NULL, NULL, '2023-01-25 14:16:37', '82a46c7fc456720d2ea76842139fcff0a2fa3489', 'Qbrbr7aY4r', '2023-01-25 14:16:38', '2023-01-25 14:16:38'),
(4, 'Dr. Myrl Fritsch', 'frederic.schroeder@yahoo.com', NULL, NULL, '2023-01-25 14:16:37', 'b32d9c0020aa2ab2ac83436e8ffdbf338c82a211', 'qhnBA0jnCC', '2023-01-25 14:16:38', '2023-01-25 14:16:38'),
(5, 'Bette Rippin I', 'zoie19@mcdermott.com', NULL, NULL, '2023-01-25 14:16:37', '7dc8fcd092cdbd9da4b8deb1a965b318d759a3e1', 'x6VIXKrwKY', '2023-01-25 14:16:38', '2023-01-25 14:16:38'),
(6, 'Mr. Berry Breitenberg II', 'ronaldo.breitenberg@hills.info', NULL, NULL, '2023-01-25 14:16:37', 'e60945c50b5a866f156b7cad8f0505b6cef386ac', 'VDzcZvCOvZ', '2023-01-25 14:16:38', '2023-01-25 14:16:38'),
(7, 'Herminio Conroy', 'rzemlak@hotmail.com', NULL, NULL, '2023-01-25 14:16:37', '726c7a8fbdf96659232176020e38edc2950d974e', 'sYLqtXdaSZ', '2023-01-25 14:16:38', '2023-01-25 14:16:38'),
(8, 'Mr. Don Boyle', 'heidenreich.berta@yahoo.com', NULL, NULL, '2023-01-25 14:16:37', 'ef7fbd50e2064d22cf5ad46e3fde8d332c6899b3', 'hn6AV3n5BY', '2023-01-25 14:16:38', '2023-01-25 14:16:38'),
(9, 'Liana Herzog PhD', 'herzog.alvis@howell.com', NULL, NULL, '2023-01-25 14:16:37', 'd33a55905aff3092fbadceb5687db60259b54fac', 'rzLcmYBgEP', '2023-01-25 14:16:38', '2023-01-25 14:16:38'),
(10, 'Estelle Jacobson III', 'skiles.tessie@yahoo.com', NULL, NULL, '2023-01-25 14:16:37', '4578c9430f5fc612bb40dcd3c3de45cefcf7a270', 'eXmnykoR05', '2023-01-25 14:16:38', '2023-01-25 14:16:38'),
(11, 'Prof. Shane Morar', 'philip.johnson@franecki.com', NULL, NULL, '2023-01-25 14:16:37', '867f54fad558ac35c07efbede123054830d8f86c', '5l6bRmxtDc', '2023-01-25 14:16:38', '2023-01-25 14:16:38');

-- --------------------------------------------------------

--
-- Table structure for table `wish_lists`
--

DROP TABLE IF EXISTS `wish_lists`;
CREATE TABLE IF NOT EXISTS `wish_lists` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `product_id` bigint(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wish_lists`
--

INSERT INTO `wish_lists` (`id`, `user_id`, `product_id`, `created_at`, `updated_at`) VALUES
(1, 1, 4, '2023-01-27 12:32:29', '2023-01-27 12:32:29'),
(2, 10, 8, '2023-01-27 12:32:29', '2023-01-27 12:32:29'),
(3, 7, 2, '2023-01-27 12:32:29', '2023-01-27 12:32:29'),
(4, 9, 11, '2023-01-27 12:32:29', '2023-01-27 12:32:29'),
(7, 6, 4, '2023-01-27 12:32:29', '2023-01-27 12:32:29'),
(8, 4, 10, '2023-01-27 12:32:29', '2023-01-27 12:32:29'),
(9, 9, 2, '2023-01-27 12:32:29', '2023-01-27 12:32:29'),
(27, 1, 12, '2023-01-27 16:06:33', '2023-01-27 16:06:33');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
