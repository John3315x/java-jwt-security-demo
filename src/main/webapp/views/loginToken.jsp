<%@ page session="false" %>

<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Ingresar Token</title>

    <style>
        body {
            margin: 0;
            height: 100vh;
            font-family: Arial;
            background: #1e1e2f;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .box {
            background: #2c2c3e;
            padding: 30px;
            border-radius: 10px;
            width: 400px;
            text-align: center;
            color: white;
        }

        input {
            width: 100%;
            padding: 10px;
            margin-top: 15px;
            border-radius: 5px;
            border: none;
        }

        button {
            margin-top: 15px;
            padding: 10px;
            width: 100%;
            background: #6c63ff;
            border: none;
            color: white;
            cursor: pointer;
        }
    </style>
</head>
<body>

<div class="box">
    <h2>🔐 Pegar Token</h2>

    <input type="text" id="tokenInput" placeholder="Pega aquí el JWT..." />

    <button onclick="entrar()">Entrar</button>

    <p id="error" style="color:red;"></p>
</div>

<script>
    function entrar() {
        const token = document.getElementById("tokenInput").value;

        fetch(window.location.origin + "/Lab_JWT_war_exploded/home", {
            method: "GET",
            headers: {
                "Authorization": "Bearer " + token
            }
        })
            .then(res => {
                if (res.ok) return res.text();
                throw new Error("Token inválido");
            })
            .then(data => {
                // redirigir y mostrar resultado
                document.body.innerHTML = "<h1>" + data + "</h1>";
            })
            .catch(err => {
                document.getElementById("error").innerText = err.message;
            });
    }
</script>

</body>
</html>