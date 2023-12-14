<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="styles.css">
<title>Insert title here</title>
</head>
<body>
 <div class="header">
        <div class="notice-container" id="notice-container">
            <div class="notice" onclick="goToNoticePage('Notice 1')">Notice 1</div>
            <div class="notice" onclick="goToNoticePage('Notice 2')">Notice 2</div>
            <div class="notice" onclick="goToNoticePage('Notice 3')">Notice 3</div>
            <!-- Add more notices as needed -->
        </div>
    </div>

    <div class="content">
        <!-- 페이지의 본문 내용을 추가하세요 -->
        test중입니다...
    </div>

    <script src="script.js"></script>
</body>
</html>