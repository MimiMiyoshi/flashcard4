-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- ホスト: mysql3104.db.sakura.ne.jp
-- 生成日時: 2025 年 1 月 25 日 23:23
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
-- テーブルの構造 `question_patterns`
--

CREATE TABLE `question_patterns` (
  `id` int NOT NULL,
  `choices` text NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- テーブルのデータのダンプ `question_patterns`
--

INSERT INTO `question_patterns` (`id`, `choices`, `created_at`) VALUES
(1, 'a) à  b) avec  c) dans  d) de  e) en  f) envers  g) par  h) pour  i) sauf  j) sur', '2025-01-23 18:30:31'),
(2, 'a) à  b) avec  c) contre  d) de  e) en  f) par  g) pour  h) sans  i) sur  j) vers', '2025-01-23 18:30:31'),
(3, 'a) à  b) avec  c) dans  d) de  e) en  f) par  g) pendant  h) sous  i) sur  j) vers', '2025-01-23 18:30:31'),
(4, 'a) à  b) avant  c) contre  d) dans  e) de  f) en  g) envers  h) par  i) sous  j) sur', '2025-01-23 18:30:31'),
(5, 'a) à  b) contre  c) dans  d) de  e) en  f) entre  g) envers  h) sauf  i) sous  j) sur', '2025-01-23 18:30:31');

--
-- ダンプしたテーブルのインデックス
--

--
-- テーブルのインデックス `question_patterns`
--
ALTER TABLE `question_patterns`
  ADD PRIMARY KEY (`id`);

--
-- ダンプしたテーブルの AUTO_INCREMENT
--

--
-- テーブルの AUTO_INCREMENT `question_patterns`
--
ALTER TABLE `question_patterns`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
