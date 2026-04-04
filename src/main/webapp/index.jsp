<%@ page session="false" %>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Login JWT</title>

    <style>
        body {
            margin: 0;
            height: 100vh;
            font-family: Arial, sans-serif;
            background: linear-gradient(135deg, #1e1e2f, #3a3a5a);
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .login-container {
            background: #2c2c3e;
            padding: 40px;
            border-radius: 12px;
            width: 320px;
            box-shadow: 0 10px 25px rgba(0,0,0,0.5);
            text-align: center;
        }

        .login-container h2 {
            color: #fff;
            margin-bottom: 25px;
        }

        .input-group {
            margin-bottom: 15px;
            text-align: left;
        }

        .input-group label {
            color: #ccc;
            font-size: 14px;
        }

        .input-group input {
            width: 100%;
            padding: 10px;
            margin-top: 5px;
            border: none;
            border-radius: 6px;
            background: #1e1e2f;
            color: #fff;
        }

        .input-group input:focus {
            outline: 2px solid #6c63ff;
        }

        .login-btn {
            width: 100%;
            padding: 12px;
            margin-top: 20px;
            background: #6c63ff;
            border: none;
            border-radius: 6px;
            color: white;
            font-weight: bold;
            cursor: pointer;
            transition: 0.3s;
        }

        .login-btn:hover {
            background: #5848e5;
        }

        .footer {
            margin-top: 15px;
            font-size: 12px;
            color: #aaa;
        }
    </style>
</head>
<body>

<div class="login-container">
    <h2>🔐 Login JWT</h2>

    <form action="login" method="post">

        <div class="input-group">
            <label>Usuario</label>
            <input type="text" name="username" required />
        </div>

        <div class="input-group">
            <label>Password</label>
            <input type="password" name="password" required />
        </div>

        <button class="login-btn" type="submit">Iniciar sesión</button>
    </form>

    <div class="footer">
        Proyecto Java + JWT
    </div>
</div>

</body>
</html>