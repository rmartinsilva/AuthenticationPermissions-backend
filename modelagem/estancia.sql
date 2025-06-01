/*
 Navicat Premium Dump SQL

 Source Server         : Server
 Source Server Type    : MySQL
 Source Server Version : 101111 (10.11.11-MariaDB-0ubuntu0.24.04.2)
 Source Host           : 127.0.0.1:3306
 Source Schema         : estancia

 Target Server Type    : MySQL
 Target Server Version : 101111 (10.11.11-MariaDB-0ubuntu0.24.04.2)
 File Encoding         : 65001

 Date: 21/04/2025 13:38:27
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for acesso_grupo
-- ----------------------------
DROP TABLE IF EXISTS `acesso_grupo`;
CREATE TABLE `acesso_grupo` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `acesso_id` bigint(20) unsigned NOT NULL,
  `grupo_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `acesso_grupo_acesso_id_grupo_id_unique` (`acesso_id`,`grupo_id`),
  KEY `acesso_grupo_grupo_id_foreign` (`grupo_id`),
  CONSTRAINT `acesso_grupo_acesso_id_foreign` FOREIGN KEY (`acesso_id`) REFERENCES `acessos` (`id`) ON DELETE CASCADE,
  CONSTRAINT `acesso_grupo_grupo_id_foreign` FOREIGN KEY (`grupo_id`) REFERENCES `grupos` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of acesso_grupo
-- ----------------------------
BEGIN;
INSERT INTO `acesso_grupo` (`id`, `acesso_id`, `grupo_id`, `created_at`, `updated_at`) VALUES (1, 1, 1, NULL, NULL);
INSERT INTO `acesso_grupo` (`id`, `acesso_id`, `grupo_id`, `created_at`, `updated_at`) VALUES (2, 2, 1, NULL, NULL);
INSERT INTO `acesso_grupo` (`id`, `acesso_id`, `grupo_id`, `created_at`, `updated_at`) VALUES (3, 3, 1, NULL, NULL);
INSERT INTO `acesso_grupo` (`id`, `acesso_id`, `grupo_id`, `created_at`, `updated_at`) VALUES (4, 4, 1, NULL, NULL);
INSERT INTO `acesso_grupo` (`id`, `acesso_id`, `grupo_id`, `created_at`, `updated_at`) VALUES (5, 5, 1, NULL, NULL);
INSERT INTO `acesso_grupo` (`id`, `acesso_id`, `grupo_id`, `created_at`, `updated_at`) VALUES (6, 6, 1, NULL, NULL);
INSERT INTO `acesso_grupo` (`id`, `acesso_id`, `grupo_id`, `created_at`, `updated_at`) VALUES (7, 7, 1, NULL, NULL);
INSERT INTO `acesso_grupo` (`id`, `acesso_id`, `grupo_id`, `created_at`, `updated_at`) VALUES (8, 8, 1, NULL, NULL);
INSERT INTO `acesso_grupo` (`id`, `acesso_id`, `grupo_id`, `created_at`, `updated_at`) VALUES (9, 9, 1, NULL, NULL);
INSERT INTO `acesso_grupo` (`id`, `acesso_id`, `grupo_id`, `created_at`, `updated_at`) VALUES (10, 10, 1, NULL, NULL);
INSERT INTO `acesso_grupo` (`id`, `acesso_id`, `grupo_id`, `created_at`, `updated_at`) VALUES (11, 11, 1, NULL, NULL);
INSERT INTO `acesso_grupo` (`id`, `acesso_id`, `grupo_id`, `created_at`, `updated_at`) VALUES (12, 12, 1, NULL, NULL);
INSERT INTO `acesso_grupo` (`id`, `acesso_id`, `grupo_id`, `created_at`, `updated_at`) VALUES (13, 13, 1, NULL, NULL);
INSERT INTO `acesso_grupo` (`id`, `acesso_id`, `grupo_id`, `created_at`, `updated_at`) VALUES (14, 14, 1, NULL, NULL);
INSERT INTO `acesso_grupo` (`id`, `acesso_id`, `grupo_id`, `created_at`, `updated_at`) VALUES (16, 1, 2, NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for acessos
-- ----------------------------
DROP TABLE IF EXISTS `acessos`;
CREATE TABLE `acessos` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `descricao` varchar(255) NOT NULL,
  `menu` varchar(255) DEFAULT NULL,
  `key` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `acessos_key_unique` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of acessos
-- ----------------------------
BEGIN;
INSERT INTO `acessos` (`id`, `descricao`, `menu`, `key`, `created_at`, `updated_at`) VALUES (1, 'Visualizar Usuários', 'Usuarios', 'view_usuarios', '2025-04-17 21:55:32', '2025-04-17 21:55:32');
INSERT INTO `acessos` (`id`, `descricao`, `menu`, `key`, `created_at`, `updated_at`) VALUES (2, 'Criar Usuários', 'Usuarios', 'create_usuarios', '2025-04-17 21:55:32', '2025-04-17 21:55:32');
INSERT INTO `acessos` (`id`, `descricao`, `menu`, `key`, `created_at`, `updated_at`) VALUES (3, 'Atualizar Usuários', 'Usuarios', 'update_usuarios', '2025-04-17 21:55:32', '2025-04-17 21:55:32');
INSERT INTO `acessos` (`id`, `descricao`, `menu`, `key`, `created_at`, `updated_at`) VALUES (4, 'Excluir Usuários', 'Usuarios', 'delete_usuarios', '2025-04-17 21:55:32', '2025-04-17 21:55:32');
INSERT INTO `acessos` (`id`, `descricao`, `menu`, `key`, `created_at`, `updated_at`) VALUES (5, 'Visualizar Grupos', 'Grupos', 'view_grupos', '2025-04-17 21:55:32', '2025-04-17 21:55:32');
INSERT INTO `acessos` (`id`, `descricao`, `menu`, `key`, `created_at`, `updated_at`) VALUES (6, 'Criar Grupos', 'Grupos', 'create_grupos', '2025-04-17 21:55:32', '2025-04-17 21:55:32');
INSERT INTO `acessos` (`id`, `descricao`, `menu`, `key`, `created_at`, `updated_at`) VALUES (7, 'Atualizar Grupos', 'Grupos', 'update_grupos', '2025-04-17 21:55:32', '2025-04-17 21:55:32');
INSERT INTO `acessos` (`id`, `descricao`, `menu`, `key`, `created_at`, `updated_at`) VALUES (8, 'Excluir Grupos', 'Grupos', 'delete_grupos', '2025-04-17 21:55:32', '2025-04-17 21:55:32');
INSERT INTO `acessos` (`id`, `descricao`, `menu`, `key`, `created_at`, `updated_at`) VALUES (9, 'Gerenciar Acessos do Grupo', 'Grupos', 'manage_grupo_acessos', '2025-04-17 21:55:32', '2025-04-17 21:55:32');
INSERT INTO `acessos` (`id`, `descricao`, `menu`, `key`, `created_at`, `updated_at`) VALUES (10, 'Gerenciar Usuários do Grupo', 'Grupos', 'manage_grupo_usuarios', '2025-04-17 21:55:32', '2025-04-17 21:55:32');
INSERT INTO `acessos` (`id`, `descricao`, `menu`, `key`, `created_at`, `updated_at`) VALUES (11, 'Visualizar Acessos', 'Acessos', 'view_acessos', '2025-04-17 21:55:32', '2025-04-17 21:55:32');
INSERT INTO `acessos` (`id`, `descricao`, `menu`, `key`, `created_at`, `updated_at`) VALUES (12, 'Criar Acessos', 'Acessos', 'create_acessos', '2025-04-17 21:55:32', '2025-04-17 21:55:32');
INSERT INTO `acessos` (`id`, `descricao`, `menu`, `key`, `created_at`, `updated_at`) VALUES (13, 'Atualizar Acessos', 'Acessos', 'update_acessos', '2025-04-17 21:55:32', '2025-04-17 21:55:32');
INSERT INTO `acessos` (`id`, `descricao`, `menu`, `key`, `created_at`, `updated_at`) VALUES (14, 'Excluir Acessos', 'Acessos', 'delete_acessos', '2025-04-17 21:55:32', '2025-04-17 21:55:32');
COMMIT;

-- ----------------------------
-- Table structure for cache
-- ----------------------------
DROP TABLE IF EXISTS `cache`;
CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of cache
-- ----------------------------
BEGIN;
INSERT INTO `cache` (`key`, `value`, `expiration`) VALUES ('laravel_cache_2uh3pUmwihBQC0RE', 'a:1:{s:11:\"valid_until\";i:1745074929;}', 1746284589);
INSERT INTO `cache` (`key`, `value`, `expiration`) VALUES ('laravel_cache_eXn6oGDg3JvzgsGA', 'a:1:{s:11:\"valid_until\";i:1745151285;}', 1746360945);
INSERT INTO `cache` (`key`, `value`, `expiration`) VALUES ('laravel_cache_fZEXBdevt4R2fIET', 'a:1:{s:11:\"valid_until\";i:1745074899;}', 1746284319);
COMMIT;

-- ----------------------------
-- Table structure for cache_locks
-- ----------------------------
DROP TABLE IF EXISTS `cache_locks`;
CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of cache_locks
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for failed_jobs
-- ----------------------------
DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of failed_jobs
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for grupo_usuario
-- ----------------------------
DROP TABLE IF EXISTS `grupo_usuario`;
CREATE TABLE `grupo_usuario` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `usuario_id` bigint(20) unsigned NOT NULL,
  `grupo_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `grupo_usuario_usuario_id_grupo_id_unique` (`usuario_id`,`grupo_id`),
  KEY `grupo_usuario_grupo_id_foreign` (`grupo_id`),
  CONSTRAINT `grupo_usuario_grupo_id_foreign` FOREIGN KEY (`grupo_id`) REFERENCES `grupos` (`id`) ON DELETE CASCADE,
  CONSTRAINT `grupo_usuario_usuario_id_foreign` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of grupo_usuario
-- ----------------------------
BEGIN;
INSERT INTO `grupo_usuario` (`id`, `usuario_id`, `grupo_id`, `created_at`, `updated_at`) VALUES (1, 1, 1, NULL, NULL);
INSERT INTO `grupo_usuario` (`id`, `usuario_id`, `grupo_id`, `created_at`, `updated_at`) VALUES (2, 3, 2, NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for grupos
-- ----------------------------
DROP TABLE IF EXISTS `grupos`;
CREATE TABLE `grupos` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `descricao` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of grupos
-- ----------------------------
BEGIN;
INSERT INTO `grupos` (`id`, `descricao`, `created_at`, `updated_at`) VALUES (1, 'admin', '2025-04-17 21:55:32', '2025-04-17 21:55:32');
INSERT INTO `grupos` (`id`, `descricao`, `created_at`, `updated_at`) VALUES (2, 'semmoral', '2025-04-21 13:28:08', NULL);
COMMIT;

-- ----------------------------
-- Table structure for job_batches
-- ----------------------------
DROP TABLE IF EXISTS `job_batches`;
CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of job_batches
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for jobs
-- ----------------------------
DROP TABLE IF EXISTS `jobs`;
CREATE TABLE `jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) unsigned NOT NULL,
  `reserved_at` int(10) unsigned DEFAULT NULL,
  `available_at` int(10) unsigned NOT NULL,
  `created_at` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of jobs
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for migrations
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of migrations
-- ----------------------------
BEGIN;
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (1, '0001_01_01_000001_create_cache_table', 1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (2, '0001_01_01_000002_create_jobs_table', 1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (3, '2025_04_17_141646_create_usuarios_table', 1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (4, '2025_04_17_145323_create_grupos_table', 1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (5, '2025_04_17_145331_create_grupo_usuario_table', 1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (6, '2025_04_17_145337_create_acessos_table', 1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (7, '2025_04_17_145343_create_acesso_grupo_table', 1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (8, '2025_04_18_020917_create_sessions_table', 2);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (9, '2025_04_18_022238_create_personal_access_tokens_table', 3);
COMMIT;

-- ----------------------------
-- Table structure for personal_access_tokens
-- ----------------------------
DROP TABLE IF EXISTS `personal_access_tokens`;
CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of personal_access_tokens
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for sessions
-- ----------------------------
DROP TABLE IF EXISTS `sessions`;
CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of sessions
-- ----------------------------
BEGIN;
INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES ('BmopJAlMXT0dLl0YygYMZqw16E0SoFAoPFXzCPRl', NULL, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSDl0aFhVajAzVlhyZ1k0b1dHaEIxVk1TcTBOWk5Mdld0aFB0dTUxRiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1745015644);
INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES ('oszyNCxeIseVv9C8BlNB4aPuFz7qaO92nlks0a4Y', NULL, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoieDBiT0RpdzM1aW9JNkVkcU1qMkNWRGJQY2N6aG1nRktQdVJNYUJmcSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1744943826);
INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES ('rAYLCRZSaMkZ1DztAOHZWUxlk8iH2erPFaLSRnzj', NULL, '127.0.0.1', 'PostmanRuntime/7.43.3', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiczBaYzl4YmduMmZtYWVCSjFhWk9EN052RURkNXl4cFBPNE0yNFBvYyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1745019342);
INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES ('uaWM0GmfUxaj8vm2Rg3Jad79Peipup1iLR80NeVM', NULL, '127.0.0.1', 'PostmanRuntime/7.43.3', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiem1XRmpTY0lMZ2tBeFo0YTk2WVgzeVBPb3VsODhvVnFjVUpzdFJXSCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1745069487);
COMMIT;

-- ----------------------------
-- Table structure for usuarios
-- ----------------------------
DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE `usuarios` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `login` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `usuarios_login_unique` (`login`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of usuarios
-- ----------------------------
BEGIN;
INSERT INTO `usuarios` (`id`, `name`, `login`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES (1, 'Administrador', 'admin', '$2y$12$U9fZLGHTDIW4oNZllE7mnOTGJM8WB0GmlXLYrLONBzVrJSJRFJipK', NULL, '2025-04-17 21:55:33', '2025-04-17 21:55:33');
INSERT INTO `usuarios` (`id`, `name`, `login`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES (2, 'Rogério Martins2', 'rogeriomartinsusinaweb.com.br', '$2y$12$arUHcCypi2cMzYQQ3DUjvOrHLKdgivgdzx0MiR2cdql5Bl6mReBJq', NULL, '2025-04-19 13:31:14', '2025-04-19 13:31:14');
INSERT INTO `usuarios` (`id`, `name`, `login`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES (3, 'Sem Moral', 'semmoral', '$2y$12$2zi.O.UE8Ak3/a7VQdgeY.t/5XqQznYl9JdDIIzDnYzn74vxtAW8m', NULL, '2025-04-21 16:29:36', '2025-04-21 16:29:36');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
