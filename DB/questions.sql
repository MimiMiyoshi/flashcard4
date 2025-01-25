-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- ホスト: mysql3104.db.sakura.ne.jp
-- 生成日時: 2025 年 1 月 25 日 23:24
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

--
-- ダンプしたテーブルのインデックス
--

--
-- テーブルのインデックス `questions`
--
ALTER TABLE `questions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pattern_id` (`pattern_id`);

--
-- ダンプしたテーブルの AUTO_INCREMENT
--

--
-- テーブルの AUTO_INCREMENT `questions`
--
ALTER TABLE `questions`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

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
