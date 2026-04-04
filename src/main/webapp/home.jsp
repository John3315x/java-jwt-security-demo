<%@ page session="false" %>

<h2>BIENVENIDO: </h2>
<hr>
<form method="get" action="home">
    <input type="text" name="msg">
    <button type="submit">Enviar</button>
</form>

<p>Mensaje:</p><%= request.getParameter("msg") %>

<hr>