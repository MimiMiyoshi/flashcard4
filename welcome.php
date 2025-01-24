<?php
session_start();
require_once('funcs.php');
$pdo = db_conn();

// セッションにuser_idが存在するか確認
if (!isset($_SESSION['user_id'])) { // isset()の結果を反転させて簡略化
    header('Location: login.php');
    exit();
}

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
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title> Welcome</title>
    <style>
        body {
            background-image: url('css/files/yellow.webp');
            margin: 0;
            padding: 0;
            min-height: 100vh; /* 画面の高さいっぱいに表示 */
            background-size: cover; /* 画像を大きさいっぱいに表示 */
            background-position: center; /* 画像を中央に表示 */
            background-repeat: no-repeat; /* 画像を繰り返さない */
            font-family: Arial, sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            background-color: #f5f5f5;
        }
        .message-box {
            /* background: white; */
            /* padding: 20px 40px; */
            /* border-radius: 10px; */
            /* box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1); */
            text-align: center;
        }
  
        h1 {
            text-align: center;
            margin: 10px 0;
            font-size: 40px;
            font-weight: bold;
            color: white;
            text-shadow: 3px 3px 6px black, -3px -3px 6px black;
            }

        p {
            text-align: center;
            font-size: 20px;
            font-weight: bold;
            color: white;
            text-shadow: 2px 2px 4px black, -2px -2px 4px black;
        }
        .profile-image {
            width: 150px;  /* 幅を固定 */
            height: 200px; /* 高さを大きく設定して縦長に */
            border-radius: 75px / 100px; /* 縦長の楕円形を作成 */
            object-fit: cover; /* 画像のアスペクト比を保持 */
            border: 3px solid #fff;
            box-shadow: 0 0 10px rgba(0,0,0,0.2);
        }

        .profile-container {
            text-align: center;
            margin: 20px auto;
        }
    </style>
    <script>
        // 5秒後に自動的にindex.phpにリダイレクト
        setTimeout(() => {
            window.location.href = 'index.php';
        }, 5000);
    </script>
</head>
<body>
    <div class="message-box">
        <h1>  Welcome!</h1>
        <p>  <?php echo htmlspecialchars($user_id, ENT_QUOTES, 'UTF-8'); ?>さん、今日も頑張りましょう！</p>
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
    </div>
    
</body>
</html>
