<?php
session_start();
require_once('funcs.php');
loginCheck();


//1.  DB接続します
$pdo = db_conn();
$user_id = $_SESSION['user_id'];

// データベースからユーザーの画像パスを取得

$stmt = $pdo->prepare("SELECT profile_image_path FROM users WHERE user_id = :user_id");
$stmt->bindValue(':user_id', $user_id, PDO::PARAM_STR);
$status = $stmt->execute();

if ($status == false) {
    sql_error($stmt); // funcs.phpで定義されているエラー処理関数
}

$row = $stmt->fetch(PDO::FETCH_ASSOC);

$profile_image_path = $row['profile_image_path'];

// 連続日数を計算
try {
    // ユーザーのテスト実施履歴を取得
    $stmt = $pdo->prepare("SELECT DATE(test_date) AS test_date FROM test_result WHERE user_id = ? ORDER BY test_date DESC");
    $stmt->execute([$user_id]);
    $dates = $stmt->fetchAll(PDO::FETCH_COLUMN);

    $consecutiveDays = 0;
    if (!empty($dates)) {
        // 現在の日付
        $today = new DateTime();
        $previousDate = $today;

        // 日付を順番に比較して連続日数を計算
        foreach ($dates as $date) {
            $currentDate = new DateTime($date);
            $interval = $previousDate->diff($currentDate)->days;

            if ($interval === 1 || $interval === 0) {
                // 1日差または同日なら連続
                $consecutiveDays++;
            } else {
                // 連続が途切れたら終了
                break;
            }

            $previousDate = $currentDate;
        }
    }
} catch (PDOException $e) {
    echo "エラー: " . $e->getMessage();
    exit;
}

// 問題パターンを取得
try {
$stmt = $pdo->prepare("SELECT * FROM question_patterns ORDER BY RAND() LIMIT 1");
$stmt->execute();
$pattern = $stmt->fetch(PDO::FETCH_ASSOC);

    // pattern_idをセッションに保存
    // $_SESSION['pattern_id'] = $pattern['id']; // セッションに保存

    // デバッグ: パターンの内容を確認
    // echo "1パターンデータ:";
    var_dump($pattern['id']);

// 問題を取得
$stmt = $pdo->prepare("SELECT * FROM questions WHERE pattern_id = ?");
$stmt->execute([$pattern['id']]);
$questions = $stmt->fetchAll(PDO::FETCH_ASSOC);

$choices = explode(", ", $pattern['choices']);
} catch (PDOException $e) {
    echo "エラー: " . $e->getMessage();
    exit;
}

    // デバッグ: パターンの内容を確認
    // echo "2パターンデータ:";
    // var_dump($pattern);

// フォーム送信後の処理
// テストの採点
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $score = 0;
    $userAnswers = [];

    foreach ($_POST['answers'] as $questionId => $userAnswer) {
        $userAnswers[$questionId] = $userAnswer;

        $stmt = $pdo->prepare("SELECT correct_answer FROM questions WHERE id = ?");
        $stmt->execute([$questionId]);
        $correctAnswer = $stmt->fetchColumn();
        // ユーザーの回答と正解を比較
        if (strtolower($userAnswer) === strtolower($correctAnswer)) {
            $score++;
        }
    }

   try {
    $stmt = $pdo->prepare("INSERT INTO test_result (user_id, score, test_date) VALUES (?, ?, ?)");
    $stmt->execute([$user_id, $score, date('Y-m-d H:i:s')]);


            // 必要なデータをセッションに保存
            $_SESSION['test_result'] = [
                'score' => $score,
                'user_answers' => $userAnswers,
                'pattern_id' => $pattern['id'] 
            ];
            session_write_close(); 

    header("Location: answers.php");
    exit;

} catch (PDOException $e) {
    echo "エラー: " . $e->getMessage();
    exit;
}
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Test</title>
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
    <div class="container-wrapper">
    <div class="id-container">
        <h2><?= $user_id ?>さん</h2>
        <h3>お帰りなさい！</h3>
        <div class="profile-container">
        <?php
        if ($profile_image_path) {
            // 画像パスが存在する場合
            echo '<img src="' . htmlspecialchars($profile_image_path, ENT_QUOTES, 'UTF-8') . '" alt="Profile Image" class="profile-image">'; // 幅を調整
        } else {
            // 画像パスが存在しない場合
            echo '<img src="image/figure.png" alt="Default Profile Image" width="200">'; // 幅を調整
        }
        ?>
        </div>
        <h2 style="color: palevioletred;">連続記録: <?= $consecutiveDays ?> 日</h2>
    </div>
<div class="test-container">
<h1>TEST</h1>
    <p>（ ）の中に入る適切な単語を選択肢から選んでa〜jで回答してね</p>
    <form method="post">
        <?php foreach ($questions as $index => $question): ?>
            <div class="choice">
                <p>問<?= $index + 1 ?>: <?= htmlspecialchars($question['question_text']) ?></p>
                <input type="text" name="answers[<?= $question['id'] ?>]" required>
            </div>
        <?php endforeach; ?>

        <div>
            <div style="margin-top: 30px; font-weight: bold;">
                <p>選択肢：</p>
            </div>
            <div class="choices">
                <?php foreach ($choices as $choice): ?>
                <span><?= htmlspecialchars($choice) ?></span>
            </div>
            <?php endforeach; ?>
        </div>
        <div>
       <button type="submit" class="button" style="text-align: center;">送信</button>
         </div>
    </form>
</div>
</div>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="js/hamburger.js"></script>
</body>
</html>