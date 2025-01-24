<?php
session_start();
require_once('funcs.php');
loginCheck();


//1.  DB接続します
$pdo = db_conn();
$user_id = $_SESSION['user_id'];

// if (!isset($_GET['pattern_id']) ) {

//     echo "パターンIDが指定されていません";
//     exit;
// }

// $patternId = $_GET['pattern_id'];


if (!isset($_SESSION['test_result'])) {
    echo "テスト結果がありません";
    exit;
}
$patternId = $_SESSION['test_result']['pattern_id'];
$score = $_SESSION['test_result']['score'];
$userAnswers = $_SESSION['test_result']['user_answers'];
// $testResults = $_SESSION['test_result'];
// $score = $testResults['score'];
// $userAnswers = $testResults['user_answers'];


try {
    // 問題パターンを取得
    $stmt = $pdo->prepare("SELECT * FROM question_patterns WHERE id = ?");
    $stmt->execute([$patternId]);
    $pattern = $stmt->fetch(PDO::FETCH_ASSOC);

    // 問題を取得
    $stmt = $pdo->prepare("SELECT * FROM questions WHERE pattern_id = ?");
    $stmt->execute([$pattern['id']]);
    $questions = $stmt->fetchAll(PDO::FETCH_ASSOC);

    $choices = explode(", ", $pattern['choices']);
} catch (PDOException $e) {
    echo "エラー: " . $e->getMessage();
    exit;

}
unset($_SESSION['test_result']);
unset($_SESSION['pattern_id']);
?>

<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <title>Resultat</title>
    <link rel="stylesheet" href="css/test.css" />
    <link rel="stylesheet" href="css/hamburger.css">
    <link rel="stylesheet" href="css/background.css" />

</head>
<body>
<div id="register-screen" class="screen">
<div id="background"></div>

   <!-- ハンバーガーメニュー -->
   <div class="hamburger" onclick="toggleMenu()">
        <div class="bar"></div>
        <div class="bar"></div>
        <div class="bar"></div>
    </div>

    <!-- 背景のオーバーレイ -->
    <div class="overlay" onclick="toggleMenu()"></div>

    <!-- メニュー -->
    <div class="menu-container">
        <div class="menu-header">
            <h2> </h2>
            <button class="close-btn" onclick="toggleMenu()">×</button>
        </div>
        <div class="menu">
        <a href="index.php">登録画面</a>
            <a href="search.php">単語検索</a>
            <a href="list.php">一覧</a>
            <a href="flashcard.php">単語帳</a>
            <a href="jeu1.php">ゲーム⭐︎</a>
            <a href="test.php">テスト</a>
            <a href="logout.php">ログアウト</a>
        </div>
    </div>

    <div class="test-container">
        <h2>結果</h2>
        <h3><?php echo htmlspecialchars($user_id, ENT_QUOTES, 'UTF-8'); ?>さんのスコア: <?= htmlspecialchars($score)  ?> 点</h3>
    <?php if ($score == 5){ ?>
        <h3 class="result-message5">おめでとうございます！全問正解です！</h3>  
    <?php }elseif ($score == 4){ ?>
        <h3 class="result-message">おしい！　あともう少し！</h3>
    <?php }elseif ($score == 0){ ?>
        <h3 class="result-message">残念！　また次ね！</h3>

    <?php } ?>

        <table border="1">
        <thead>
            <tr>
                <th>質問</th>
                <th>あなたの回答</th>
                <th>正しい回答</th>
            </tr>
        </thead>
        <tbody>
    <?php 
        // // デバッグ: $questions と $userAnswers を確認
        // echo "<pre>";
        // echo "Questions:\n";
        // var_dump($questions);
        // echo "User Answers:\n";
        // var_dump($userAnswers);
        // echo "</pre>";
    
    foreach ($questions as $question): ?>
        <tr>
            <td><?= htmlspecialchars($question['question_text']) ?></td>
            <td style="text-align: center;">
                <?= htmlspecialchars($userAnswers[$question['id']] ?? '未回答') ?>
            </td>
            <td style="text-align: center;">
                <?= htmlspecialchars($question['correct_answer']) ?>
            </td>
        </tr>
    <?php endforeach; ?>
</tbody>
    </table>

        <!-- ここに回答内容の表示を追加 -->
        <!-- <div class="answers-section"> -->
            <!-- <h2>回答内容</h2> -->
            <!-- PHPで回答内容を表示 -->
        <!-- </div> -->

        <a href='test.php' class='button'>もう一度テストを受ける</a>
    </div>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="js/hamburger.js"></script>
</body>
</html>