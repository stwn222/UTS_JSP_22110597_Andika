<%@ page import="java.util.*" %>
<%@ page session="true" %>
<%
    List<?> daftarFilm = (List<?>) session.getAttribute("daftarFilm");
     String selectedFilmIndexParam = request.getParameter("filmIndex");
    int selectedFilmIndex = (selectedFilmIndexParam != null) ? Integer.parseInt(selectedFilmIndexParam) : 0;

    Object selectedFilm = daftarFilm.get(selectedFilmIndex);
    java.lang.reflect.Field fJam = selectedFilm.getClass().getDeclaredField("jamTayang");
    fJam.setAccessible(true);
    List<String> jamList = (List<String>) fJam.get(selectedFilm);
%>

<html>
<head>
    <title>Form Pemesanan</title>
    <link rel="stylesheet" href="style.css"/>
</head>
<body>
    <div class="film">

        <div class="card">
    <h2>Form Pemesanan Tiket</h2>

    <form action="struk.jsp" method="post">
        <div class="nama">
            <label>Nama Pemesan:</label>
            <input type="text" name="nama" required>
        </div>
        <div class="tiket">
            <label>Jumlah Tiket:</label>
            <input type="number" name="jumlah" required min="1">
        </div>
        <div class="pilihan">
            <label>Pilih Film:</label>
            <select name="filmIndex" required>
                <% for (int i = 0; i < daftarFilm.size(); i++) {
                    Object o = daftarFilm.get(i);
                    java.lang.reflect.Field field = o.getClass().getDeclaredField("judul");
                    field.setAccessible(true);
                    String judul = (String) field.get(o);
                %>
                    <option value="<%= i %>"><%= judul %></option>
                <% } %>
            </select>
        </div>
        <div class="jam">
            <label>Jam Tayang:</label>
            <select name="jam" required>
                <% for (String jam : jamList) { %>
                    <option value="<%= jam %>"><%= jam %></option>
                <% } %>
            </select>
        </div>
        <button type="submit" class="btn">Pesan</button>
    </form>
    </div>
    </div>
    </div>
</body>
</html>
