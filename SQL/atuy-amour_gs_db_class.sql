-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- ホスト: mysql3104.db.sakura.ne.jp
-- 生成日時: 2025 年 1 月 26 日 10:38
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
-- テーブルの構造 `flashcard`
--

CREATE TABLE `flashcard` (
  `id` int NOT NULL,
  `word` varchar(64) NOT NULL,
  `type` varchar(64) NOT NULL,
  `meaning` text NOT NULL,
  `phrase` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- テーブルのデータのダンプ `flashcard`
--

INSERT INTO `flashcard` (`id`, `word`, `type`, `meaning`, `phrase`) VALUES
(1, 'une distillerie', 'noun', '蒸留所', 'wisky'),
(2, 'une ruelle', 'noun', '路地、小路、裏通り', 'Les ruelles des vieux quartiers sont malsaines.'),
(4, 'une grande roue', '名詞', '大きな観覧車', 'Il y a une grande roue au parc d\'attractions.'),
(7, 'avoir', '動詞', '持っている、〜がある', 'J\'ai un livre.'),
(9, 'aller', '動詞', '行く', 'Je vais à Paris.'),
(10, 'une biche', 'noun', '雌鹿', 'une femme douce comme une biche'),
(11, 'une licorne', 'noun', 'ユニコーン', 'J\'ai rêvé d\'une licorne qui volait dans le ciel étoilé.'),
(12, 'exiger', 'verb', '要求する、必要とする', 'On exige ce diplôme pour le poste en question.'),
(13, 'intime', '副詞', '親密に、内密に', 'Ils se sont parlé intimement.'),
(16, 'ruban', '名詞', 'リボン', 'Un joli ruban rouge.'),
(17, 'bailler', '動詞', 'あくびをする', 'Il a baillé pendant la réunion.'),
(18, 'lobe de l\'oreille', '名詞', '耳たぶ', 'J\'ai une boucle d\'oreille dans mon lobe de l\'oreille.'),
(19, '当別', 'noun', '地方', '札幌から近い'),
(20, 'secouer', '動詞', '振る、揺さぶる', 'Il secoue le flacon.'),
(21, 'secouer', '動詞', '振る、揺さぶる', 'Il secoue le flacon.'),
(22, 'secouer', '動詞', '振る、揺さぶる', 'Il secoue le flacon.'),
(23, 'visqueux', '形容詞', '粘り気のある、ねばねばした', 'La confiture est visqueuse.'),
(25, 'visqueux', '形容詞', '粘り気のある、ねばねばした', 'La confiture est visqueuse.'),
(26, 'Amertume', '名詞', '苦味、苦み（感情的な苦さや悔しさも含む）', 'J\'ai une amertume dans le cœur.');

-- --------------------------------------------------------

--
-- テーブルの構造 `questions`
--

CREATE TABLE `questions` (
  `id` int NOT NULL,
  `pattern_id` int NOT NULL,
  `question_text` text NOT NULL,
  `correct_answer` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- テーブルのデータのダンプ `questions`
--

INSERT INTO `questions` (`id`, `pattern_id`, `question_text`, `correct_answer`) VALUES
(1, 1, 'Dans ce pays, le revenu (___) ménage est extrêmement bas.', 'd'),
(2, 1, 'Les journaux ne parlent de ce procès que (___) les grandes lignes.', 'c'),
(3, 1, 'Les salaires doivent être déterminés (___) fonction du prix moyen des choses nécessaires à la vie.', 'e'),
(4, 1, 'Puisqu\'on lui a promis de ne pas revenir (___) cette affaire, il ne faut plus en parler.', 'j'),
(5, 1, 'Un accord a été signé par la direction (___) l\'issue de négociations avec les syndicats.', 'a'),
(6, 2, 'Il me dépasse (___) loin en talent.', 'd'),
(7, 2, 'Le théâtre est fermé (___) travaux.', 'g'),
(8, 2, 'Vous devez m\'expliquer (___) étapes, sinon je n\'y comprends rien.', 'f'),
(9, 2, '(___) toute apparence, c\'est Philippe qui a raison.', 'c'),
(10, 2, '(___) une croissance de 0,6 %, la France est parmi les premiers pays de la zone euro.', 'b'),
(11, 3, 'Cette semaine, le temps sera variable (___) quelques averses.', 'b'),
(12, 3, 'Mon chien est méchant (___) l\'occasion.', 'a'),
(13, 3, 'On ne doit pas passer (___) silence ce crime contre la liberté.', 'h'),
(14, 3, 'Tu as raison, du moins (___) certains côtés.', 'f'),
(15, 3, '(___) l\'ensemble, l\'oral s\'est bien passé.', 'c'),
(16, 4, 'A agir (___) le coup de l\'émotion, ça peut coûter cher !.', 'i'),
(17, 4, 'Elle est insensible (___) les autres.', 'g'),
(18, 4, 'Je me bornerai (___) dire qu\'il n\'est pas innocent.', 'a'),
(19, 4, 'Notre ville est petite (___) la taille, mais elle est très belle.', 'h'),
(20, 4, 'Victor s\'est trompé (___) les intentions de son père.', 'j'),
(21, 5, 'Des vêtements? Je m\'en achèterai (___) nouveaux.', 'd'),
(22, 5, 'J\'épargne (___) mes dépenses de nourriture pour déménager.', 'j'),
(23, 5, 'Julien t\'expliquera (___) détail le fonctionnement du système de sécurité.', 'e'),
(24, 5, 'Les journalistes ont fait le parallèle (___) les deux attentats.', 'f'),
(25, 5, 'Lors des exercices, les soldats se mettent (___) plat ventre.', 'a');

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

-- --------------------------------------------------------

--
-- テーブルの構造 `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` varchar(50) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `profile_image_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `admin_flg` tinyint(1) DEFAULT '0',
  `is_active` tinyint(1) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- テーブルのデータのダンプ `users`
--

INSERT INTO `users` (`id`, `user_id`, `password_hash`, `profile_image_path`, `admin_flg`, `is_active`) VALUES
(2, 'admin', '$2y$10$iAr0KIR9Y2.NMY4fOC.pIuTaNDmkruqSWI4clT7wPBQcpUjCv73gK', NULL, 1, 1),
(3, 'mimi', '$2y$10$FQYHKbuzphRa/psLf9bUzO3FJmOH1B20xCOUa6nYoRRNR3xaPk0xi', NULL, 0, 1),
(5, 'philip', '$2y$10$OnPnnVXyH2gJ4i5QvtyQou3nRdg1fRAOePYWN2UXYQ1bXmHgyY7Yy', 'image/IMG_3133.jpeg', 0, 1),
(6, 'macci', '$2y$10$b1UQ6aGFMYlkqEfcnjbT6OgnH4GSD3ulPS62Kz5/rzB7VBQ9Z/rSO', 'image/IMG_3137.jpeg', 0, 1),
(9, 'coco', '$2y$10$Y.qXtq7nf8m0VDfLOxlrjOwAMMI3nPK8vFKgRIb6xg8x1tkqtKP4.', 'image/IMG_3165.jpeg', 0, 1),
(11, 'nono', '$2y$10$SzqoW8JdHGhW1utCng7EO.dySkorPRpUD1WELxW/lTu9S06MeVV5i', 'image/IMG_2734.jpeg', 0, 1),
(12, 'meguru', '$2y$10$Wxnz3r6iXPBEJ00ZN7O0Ke3TivAPvFvittXFmbYDSq86w.owjZCEK', 'image/ダウンロード.jpeg', 0, 1),
(13, 'harry', '$2y$10$roN4DUwujtEon72jEpLLUe/HjJbT949mMXKzvHfIaXIWBW.Y0AMpq', 'image/www.imdb.com_name_nm4089170_mediaviewer_rm3979488256__ref_=nm_ov_ph.png', 0, 1),
(14, 'aaa', '$2y$10$N7aT/zT2mn/it06dQtxkoeadz1oI3KfBNzutBP4Q0JjfHjIS.XT5.', NULL, 0, 1),
(15, 'test', '$2y$10$vo16XZwIBTAUryptrhrHG.3wuBCjeJSu4Lx.mqQmklMeqajfA2Dry', NULL, 0, 1);

--
-- ダンプしたテーブルのインデックス
--

--
-- テーブルのインデックス `flashcard`
--
ALTER TABLE `flashcard`
  ADD PRIMARY KEY (`id`);

--
-- テーブルのインデックス `questions`
--
ALTER TABLE `questions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pattern_id` (`pattern_id`);

--
-- テーブルのインデックス `question_patterns`
--
ALTER TABLE `question_patterns`
  ADD PRIMARY KEY (`id`);

--
-- テーブルのインデックス `test_result`
--
ALTER TABLE `test_result`
  ADD PRIMARY KEY (`id`);

--
-- テーブルのインデックス `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD UNIQUE KEY `user_id` (`user_id`);

--
-- ダンプしたテーブルの AUTO_INCREMENT
--

--
-- テーブルの AUTO_INCREMENT `flashcard`
--
ALTER TABLE `flashcard`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- テーブルの AUTO_INCREMENT `questions`
--
ALTER TABLE `questions`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- テーブルの AUTO_INCREMENT `question_patterns`
--
ALTER TABLE `question_patterns`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- テーブルの AUTO_INCREMENT `test_result`
--
ALTER TABLE `test_result`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- テーブルの AUTO_INCREMENT `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- ダンプしたテーブルの制約
--

--
-- テーブルの制約 `questions`
--
ALTER TABLE `questions`
  ADD CONSTRAINT `questions_ibfk_1` FOREIGN KEY (`pattern_id`) REFERENCES `question_patterns` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
