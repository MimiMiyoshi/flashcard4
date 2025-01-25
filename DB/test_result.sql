-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- ホスト: mysql3104.db.sakura.ne.jp
-- 生成日時: 2025 年 1 月 25 日 23:26
-- サーバのバージョン： 8.0.40
-- PHP のバージョン: 8.2.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- データベース: `atuy-amour_gs_db_class`
--

-- --------------------------------------------------------

--
-- テーブルの構造 `test_result`
--

CREATE TABLE `test_result` (
  `id` int NOT NULL,
  `user_id` varchar(255) NOT NULL,
  `score` int NOT NULL,
  `test_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- テーブルのデータのダンプ `test_result`
--

INSERT INTO `test_result` (`id`, `user_id`, `score`, `test_date`) VALUES
(1, 'macci', 4, '2025-01-22 23:34:43'),
(2, 'macci', 0, '2025-01-22 23:48:24'),
(3, 'macci', 1, '2025-01-23 15:54:14'),
(5, 'macci', 4, '2025-01-23 17:53:15'),
(7, 'macci', 1, '2025-01-24 01:36:12'),
(9, 'macci', 1, '2025-01-24 10:31:47'),
(10, 'macci', 0, '2025-01-24 10:38:54'),
(12, 'philip', 5, '2025-01-24 12:54:25'),
(21, 'philip', 3, '2025-01-25 00:42:40'),
(22, 'philip', 5, '2025-01-25 00:54:46'),
(23, 'philip', 0, '2025-01-25 00:55:50'),
(24, 'philip', 5, '2025-01-25 00:56:51'),
(25, 'philip', 5, '2025-01-25 00:59:19'),
(26, 'philip', 0, '2025-01-25 01:00:45'),
(27, 'philip', 2, '2025-01-25 01:01:39'),
(28, 'philip', 1, '2025-01-25 01:03:53'),
(29, 'philip', 5, '2025-01-25 01:14:43'),
(30, 'philip', 5, '2025-01-25 01:18:37'),
(31, 'macci', 5, '2025-01-25 01:24:15'),
(32, 'macci', 5, '2025-01-25 01:43:53'),
(33, 'macci', 5, '2025-01-25 01:50:09'),
(34, 'macci', 3, '2025-01-25 01:53:03'),
(35, 'macci', 3, '2025-01-25 01:55:58'),
(36, 'macci', 5, '2025-01-25 02:03:53'),
(37, 'macci', 3, '2025-01-25 02:14:23'),
(38, 'macci', 2, '2025-01-25 02:22:18'),
(39, 'macci', 0, '2025-01-25 02:22:41'),
(40, 'macci', 5, '2025-01-25 02:27:30'),
(41, 'macci', 0, '2025-01-25 02:28:05'),
(42, 'macci', 1, '2025-01-25 02:50:01'),
(43, 'macci', 0, '2025-01-25 02:57:24'),
(44, 'macci', 5, '2025-01-25 02:58:27'),
(45, 'philip', 3, '2025-01-25 13:32:05'),
(46, 'admin', 1, '2025-01-25 13:34:32'),
(47, 'philip', 3, '2025-01-25 13:34:47'),
(48, 'admin', 1, '2025-01-25 13:34:50');

--
-- ダンプしたテーブルのインデックス
--

--
-- テーブルのインデックス `test_result`
--
ALTER TABLE `test_result`
  ADD PRIMARY KEY (`id`);

--
-- ダンプしたテーブルの AUTO_INCREMENT
--

--
-- テーブルの AUTO_INCREMENT `test_result`
--
ALTER TABLE `test_result`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
