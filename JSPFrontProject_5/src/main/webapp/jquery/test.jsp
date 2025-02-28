<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sign In</title>
<!-- Ionicons 최신 버전 -->
<script src="https://unpkg.com/ionicons@5.5.2/dist/ionicons.js"></script>
<style>
/* 전체 페이지 스타일 */
body {
  font-family: Arial, sans-serif;
  background-color: #f4f4f4;
  display: flex;
  justify-content: center;
  align-items: center;
  height: 100vh;
  margin: 0;
}

/* 컨테이너 스타일 */
.container {
  background: white;
  padding: 30px;
  border-radius: 10px;
  box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
  max-width: 400px;
  width: 100%;
}

/* 입력 필드 스타일 */
.input-field {
  width: 100%;
  padding: 10px;
  margin-top: 5px;
  border: 1px solid #ccc;
  border-radius: 5px;
  font-size: 16px;
}

/* 버튼 스타일 */
.input-submit {
  width: 100%;
  padding: 10px;
  background-color: #007bff;
  color: white;
  border: none;
  border-radius: 5px;
  font-size: 16px;
  cursor: pointer;
  margin-top: 10px;
}

/* disabled 상태에서도 디자인 유지 */
.input-submit:disabled {
  background-color: #ccc;
  cursor: not-allowed;
}

/* 기타 스타일 */
.text-links {
  color: #007bff;
  text-decoration: none;
}
.text-links:hover {
  text-decoration: underline;
}

.striped {
  display: flex;
  align-items: center;
  text-align: center;
  margin: 20px 0;
}

.striped-line {
  flex: 1;
  height: 1px;
  background-color: #ddd;
}

.striped-text {
  padding: 0 10px;
  color: #666;
}

.method {
  display: flex;
  flex-direction: column;
  gap: 10px;
}

.method-action {
  display: flex;
  align-items: center;
  justify-content: center;
  border: 1px solid #ccc;
  padding: 10px;
  border-radius: 5px;
  background: white;
  cursor: pointer;
  text-decoration: none;
  color: black;
}

.method-action:hover {
  background: #f4f4f4;
}

.method-action i {
  font-size: 20px;
  margin-right: 10px;
}
</style>
</head>
<body>

<main class="container">
  <section>
    <div class="heading">
      <h1 class="text text-large">Sign In</h1>
      <p class="text text-normal">New user? 
        <span><a href="#" class="text-links">Create an account</a></span>
      </p>
    </div>
    
    <form name="signin" class="form">
      <div class="input-control">
        <label for="email" hidden>Email Address</label>
        <input type="email" name="email" id="email" class="input-field" placeholder="Email Address">
      </div>
      <div class="input-control">
        <label for="password" hidden>Password</label>
        <input type="password" name="password" id="password" class="input-field" placeholder="Password">
      </div>
      <div class="input-control">
        <a href="#" class="text-links">Forgot Password?</a>
        <input type="submit" name="submit" class="input-submit" value="Sign In" disabled>
      </div>
    </form>

    <div class="striped">
      <span class="striped-line"></span>
      <span class="striped-text">Or</span>
      <span class="striped-line"></span>
    </div>

    <div class="method">
      <a href="#" class="method-action">
        <ion-icon name="logo-google"></ion-icon>
        <span>Sign in with Google</span>
      </a>
      <a href="#" class="method-action">
        <ion-icon name="logo-facebook"></ion-icon>
        <span>Sign in with Facebook</span>
      </a>
      <a href="#" class="method-action">
        <ion-icon name="logo-apple"></ion-icon>
        <span>Sign in with Apple</span>
      </a>
    </div>
  </section>
</main>

</body>
</html>
