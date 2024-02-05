-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Feb 05, 2024 at 12:57 PM
-- Server version: 10.4.25-MariaDB
-- PHP Version: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `task_management`
--

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_100000_create_password_resets_table', 1),
(2, '2016_06_01_000001_create_oauth_auth_codes_table', 1),
(3, '2016_06_01_000002_create_oauth_access_tokens_table', 1),
(4, '2016_06_01_000003_create_oauth_refresh_tokens_table', 1),
(5, '2016_06_01_000004_create_oauth_clients_table', 1),
(6, '2016_06_01_000005_create_oauth_personal_access_clients_table', 1),
(7, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(8, '2024_02_01_134755_create_roles_table', 1),
(9, '2024_02_01_134813_create_permissions_table', 1),
(10, '2024_02_01_134899_create_users_table', 1),
(11, '2024_02_01_134900_create_tasks_table', 1),
(12, '2024_02_03_135947_create_role_user_table', 1),
(13, '2024_02_03_140111_create_permission_role_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_access_tokens`
--

INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('17e992a66ec5877c080ab806f77984208a9cf587108dcc33502d59dd7f1a09cfacdaaa0c5dbe7b27', 1, 10, NULL, '[]', 0, '2024-02-03 12:58:53', '2024-02-03 12:58:53', '2025-02-03 17:58:53'),
('31c4fa8f7daf2bdde2ac517fdd8368eb212bbc077ecae30b103b2f133ab5412c46f75c898998753a', 1, 10, NULL, '[]', 0, '2024-02-03 13:03:30', '2024-02-03 13:03:30', '2025-02-03 18:03:30'),
('4cc03157771707933bbabf1ad0b60803be0368cc5ff611357354ad0074618b0959d68af6de0957bf', 1, 10, NULL, '[]', 0, '2024-02-03 12:55:35', '2024-02-03 12:55:35', '2025-02-03 17:55:35'),
('703b43295632aa45ad81ac8441faca8ee0ff6bb9f941eb87380987301a1e69c16cb800b81f6226e9', 1, 10, NULL, '[]', 0, '2024-02-03 12:51:51', '2024-02-03 12:51:51', '2025-02-03 17:51:51'),
('8ea0325cd0c56518b7f94d5439bf71856f369a862ce2a658a34ce165b1d6b8f25cf17e667626fc4d', 1, 10, NULL, '[]', 0, '2024-02-03 13:04:29', '2024-02-03 13:04:29', '2025-02-03 18:04:29'),
('bbe0690d22a757ab511135130e887339d772e9be4c085bcd4ce5f8628f289d661c64fbfd648090d1', 1, 10, NULL, '[]', 0, '2024-02-03 12:55:50', '2024-02-03 12:55:50', '2025-02-03 17:55:50'),
('bff492c3f1ced9477001e170a0f42847aef826ba9bbc58860bef5d558ab0f3b5374e77652b5201fa', 1, 10, NULL, '[]', 0, '2024-02-03 12:54:47', '2024-02-03 12:54:47', '2025-02-03 17:54:47'),
('ccd0cc267f6b1930af37bda6f9d258841de590ae899a89c9d5f800e1ecfb7b2c2304fc55267857b0', 1, 10, NULL, '[]', 0, '2024-02-03 12:57:40', '2024-02-03 12:57:40', '2025-02-03 17:57:40'),
('fe054142f5785f03c228b3c88234eacfa8191344e1f50eb7e89340aaf9f64b5e8e8757b5e075abde', 1, 10, NULL, '[]', 0, '2024-02-03 12:58:31', '2024-02-03 12:58:31', '2025-02-03 17:58:31');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_clients`
--

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `provider`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Laravel Personal Access Client', 'MrxLcjYVYYyAksl4uZyMdBNVAE9c1zkxnubtFC9L', NULL, 'http://localhost', 1, 0, 0, '2024-02-03 10:26:10', '2024-02-03 10:26:10'),
(2, NULL, 'Laravel Password Grant Client', 'sw6TLQ8CcSil4WANewO7GGqq9gJKeEO6035m2OKW', 'users', 'http://localhost', 0, 1, 0, '2024-02-03 10:26:10', '2024-02-03 10:26:10'),
(3, NULL, 'Laravel Personal Access Client', 'ULK9ybzeH8m30B4knCclEsloIpfHlisL3DwtAzCN', NULL, 'http://localhost', 1, 0, 0, '2024-02-03 11:58:46', '2024-02-03 11:58:46'),
(4, NULL, 'Laravel Password Grant Client', 'Q1IcdxdndssOLh3XSxt5z2iimDSD11NzQOHiKNY5', 'users', 'http://localhost', 0, 1, 0, '2024-02-03 11:58:46', '2024-02-03 11:58:46'),
(5, NULL, 'Laravel Personal Access Client', 'tW0qBnefdyMNkNl1WuJx2lHn2KJ5MrO9SHTQv7ju', NULL, 'http://localhost', 1, 0, 0, '2024-02-03 12:19:58', '2024-02-03 12:19:58'),
(6, NULL, 'Laravel Password Grant Client', 'JPuG8p1TiYb9XsBUOXR7tt9Y4kNb43eXKahl0OTJ', 'users', 'http://localhost', 0, 1, 0, '2024-02-03 12:19:58', '2024-02-03 12:19:58'),
(7, NULL, 'Laravel Personal Access Client', '9N9VvK7woV9CadrGWbZmIO1HB6GwSdWIeL1871Xk', NULL, 'http://localhost', 1, 0, 0, '2024-02-03 12:20:18', '2024-02-03 12:20:18'),
(8, NULL, 'Laravel Password Grant Client', 'cx7fA4g2ZPBepkeOCuPBtlJAUWwX7ieMVWupbFvH', 'users', 'http://localhost', 0, 1, 0, '2024-02-03 12:20:18', '2024-02-03 12:20:18'),
(9, NULL, 'Laravel Personal Access Client', 'mea1xjGF2Mx8xch0DAETtlV39QR2TwvrPQG9yhdK', NULL, 'http://localhost', 1, 0, 0, '2024-02-03 12:45:27', '2024-02-03 12:45:27'),
(10, NULL, 'Laravel Password Grant Client', 'Ys7JhKLPHUDtc3xkNaV3NFrV8OXyMxX5ipcYNqA1', 'users', 'http://localhost', 0, 1, 0, '2024-02-03 12:45:27', '2024-02-03 12:45:27');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_personal_access_clients`
--

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2024-02-03 10:26:10', '2024-02-03 10:26:10'),
(2, 3, '2024-02-03 11:58:46', '2024-02-03 11:58:46'),
(3, 5, '2024-02-03 12:19:58', '2024-02-03 12:19:58'),
(4, 7, '2024-02-03 12:20:18', '2024-02-03 12:20:18'),
(5, 9, '2024-02-03 12:45:27', '2024-02-03 12:45:27');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_refresh_tokens`
--

INSERT INTO `oauth_refresh_tokens` (`id`, `access_token_id`, `revoked`, `expires_at`) VALUES
('0fb6bc24cd980c8e098c55b5d4e9032e4869f1937766c42ef8b6eb86dbf7dee3e2f5d23bbf191766', 'fe054142f5785f03c228b3c88234eacfa8191344e1f50eb7e89340aaf9f64b5e8e8757b5e075abde', 0, '2025-02-03 17:58:31'),
('1a327c9677512088247e0b6bfb6ff4d6b829ce17f277bf69c908f4571f1bee7a0d46e28e7d40bff8', '703b43295632aa45ad81ac8441faca8ee0ff6bb9f941eb87380987301a1e69c16cb800b81f6226e9', 0, '2025-02-03 17:51:51'),
('47f216b72ca1a39289125b0c741294a926e8ec8060afa881e8893a278b9189d042e7d61a1922d75b', '8ea0325cd0c56518b7f94d5439bf71856f369a862ce2a658a34ce165b1d6b8f25cf17e667626fc4d', 0, '2025-02-03 18:04:29'),
('85f27de5f98d2b70ec56d80f2bea571de5f25be022bea31488fb6e0c98175b85b29697a297f0f988', 'ccd0cc267f6b1930af37bda6f9d258841de590ae899a89c9d5f800e1ecfb7b2c2304fc55267857b0', 0, '2025-02-03 17:57:40'),
('8c26f4c5d4d6974c6e9328993757dce6e848d7d51c63fbee7d59025b4f9a4a468aaa8f9e444d0045', '31c4fa8f7daf2bdde2ac517fdd8368eb212bbc077ecae30b103b2f133ab5412c46f75c898998753a', 0, '2025-02-03 18:03:30'),
('9a219617a548cf44f9f9ef6773c2b89fa3b267fab2f42872ca4648e69df7d363d86a0f510079dab4', '17e992a66ec5877c080ab806f77984208a9cf587108dcc33502d59dd7f1a09cfacdaaa0c5dbe7b27', 0, '2025-02-03 17:58:53'),
('ae6afc7aac7fdb12f5ec0914c7fd3b5ec6d91a987f90957f5296bc4dcd4a5fcf4dedaec87a4da4b3', '4cc03157771707933bbabf1ad0b60803be0368cc5ff611357354ad0074618b0959d68af6de0957bf', 0, '2025-02-03 17:55:35'),
('ed1097b5fd489672e5e3d8623c459b536d7c4474d88276a758c2a6deb82fc84c1635690c509ef47d', 'bff492c3f1ced9477001e170a0f42847aef826ba9bbc58860bef5d558ab0f3b5374e77652b5201fa', 0, '2025-02-03 17:54:47'),
('edfc2230000a6e57c3a8c3422a0b03d116cfb9517aa81f29e3b498c82b916ed2d5e01e8a5c04416d', 'bbe0690d22a757ab511135130e887339d772e9be4c085bcd4ce5f8628f289d661c64fbfd648090d1', 0, '2025-02-03 17:55:50');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permission_role`
--

CREATE TABLE `permission_role` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `role_user`
--

CREATE TABLE `role_user` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tasks`
--

CREATE TABLE `tasks` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tasks`
--

INSERT INTO `tasks` (`id`, `user_id`, `title`, `description`, `status`, `created_at`, `updated_at`) VALUES
(20, 1, 'Task about Email', 'this is email task', 'In_progress', '2024-02-05 04:05:21', '2024-02-05 04:05:21'),
(21, 1, 'hello', 'hvbsjh', 'In_progress', '2024-02-05 04:05:57', '2024-02-05 04:05:57'),
(22, 1, 'rhwkurbgf', 'rfsbrgb', 'In_progress', '2024-02-05 04:06:56', '2024-02-05 04:06:56'),
(23, 1, 'bkfeabkeefahkbgku bwurgtrhwurtiugi', 'wfhot58', 'In_progress', '2024-02-05 04:07:39', '2024-02-05 04:07:39'),
(24, 1, 'bgktxuetk', 'rsbgkj', 'In_progress', '2024-02-05 04:08:31', '2024-02-05 04:08:31'),
(25, 1, 'urkfubv', 'gbkrbg', 'In_progress', '2024-02-05 04:11:41', '2024-02-05 04:11:41'),
(26, 1, 'Email task', 'this is email task', 'Completed', '2024-02-05 04:13:38', '2024-02-05 04:13:38'),
(27, 1, 'to check email', 'this is email task', 'In_progress', '2024-02-05 04:45:51', '2024-02-05 04:45:51'),
(28, 1, 'email task', 'this is email task', 'Completed', '2024-02-05 04:48:19', '2024-02-05 04:48:19'),
(29, 1, 'email task', 'this is email task', 'In_progress', '2024-02-05 05:13:02', '2024-02-05 05:13:02'),
(30, 1, 'email task', 'this is email task', 'In_progress', '2024-02-05 05:15:14', '2024-02-05 05:15:14'),
(31, 1, 'Email Task', 'this is Email Task', 'Completed', '2024-02-05 05:24:53', '2024-02-05 05:24:53'),
(32, 2, 'testing task', 'testing the task i have done', 'Completed', '2024-02-05 05:29:28', '2024-02-05 05:29:28'),
(33, 2, 'task two', 'this is s task two', 'In_progress', '2024-02-05 06:01:46', '2024-02-05 06:01:46'),
(34, 2, 'task three', 'this is task three', 'Completed', '2024-02-05 06:02:10', '2024-02-05 06:02:10');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'muneeb', 'muneeb@gmail.com', NULL, '$2y$10$EuZ5FqYSNPhbi7iw.lGFAuHmj3Ec7Z2/K3k2LpXSwo5sV8iibgBda', NULL, '2024-02-03 10:06:47', '2024-02-03 10:06:47'),
(2, 'Muneeb Ahmed', 'muneebahmed@gmail.com', NULL, '$2y$10$Ac4DCC6W/6WKf.NQ4wIPguMa21L6VK1l4oQ15pKLMINiyxkL5zl6C', NULL, '2024-02-05 05:28:54', '2024-02-05 05:28:54');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_access_tokens_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_auth_codes`
--
ALTER TABLE `oauth_auth_codes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_auth_codes_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_clients_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_name_unique` (`name`);

--
-- Indexes for table `permission_role`
--
ALTER TABLE `permission_role`
  ADD PRIMARY KEY (`id`),
  ADD KEY `permission_role_permission_id_foreign` (`permission_id`),
  ADD KEY `permission_role_role_id_foreign` (`role_id`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_unique` (`name`);

--
-- Indexes for table `role_user`
--
ALTER TABLE `role_user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `role_user_role_id_foreign` (`role_id`),
  ADD KEY `role_user_user_id_foreign` (`user_id`);

--
-- Indexes for table `tasks`
--
ALTER TABLE `tasks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tasks_user_id_foreign` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `permission_role`
--
ALTER TABLE `permission_role`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `role_user`
--
ALTER TABLE `role_user`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tasks`
--
ALTER TABLE `tasks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `permission_role`
--
ALTER TABLE `permission_role`
  ADD CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`),
  ADD CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`);

--
-- Constraints for table `role_user`
--
ALTER TABLE `role_user`
  ADD CONSTRAINT `role_user_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`),
  ADD CONSTRAINT `role_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `tasks`
--
ALTER TABLE `tasks`
  ADD CONSTRAINT `tasks_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
