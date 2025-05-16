<%@ page import="java.util.*" %>
<%@ page session="true" %>
<%
    String nama = request.getParameter("nama");
    int jumlah = Integer.parseInt(request.getParameter("jumlah"));
    int index = Integer.parseInt(request.getParameter("filmIndex"));
    String jam = request.getParameter("jam");

    List<?> daftarFilm = (List<?>) session.getAttribute("daftarFilm");
    Object filmObj = daftarFilm.get(index);

    java.lang.reflect.Field fJudul = filmObj.getClass().getDeclaredField("judul");
    java.lang.reflect.Field fHarga = filmObj.getClass().getDeclaredField("harga");
    fJudul.setAccessible(true);
    fHarga.setAccessible(true);

    String judul = (String) fJudul.get(filmObj);
    int harga = (int) fHarga.get(filmObj);

    int total = jumlah * harga;
%>

<html>
<head>
    <title>Struk Pemesanan</title>
    <link rel="stylesheet" href="style2.css">
</head>
<body class="p-4">
     <div class="struk-container">
        <h2>Struk Pemesanan</h2>
        <div class="item">
            <div class="label">Nama Pemesan:</div>
            <div><%= nama %></div>
        </div>
        <div class="item">
            <div class="label">Film:</div>
            <div><%= judul %></div>
        </div>
        <div class="item">
            <div class="label">Jam Tayang:</div>
            <div><%= jam %></div>
        </div>
        <div class="item">
            <div class="label">Jumlah Tiket:</div>
            <div><%= jumlah %></div>
        </div>
        <div class="item">
            <div class="label">Total Harga:</div>
            <div>Rp <%= total %></div>
        </div>
        <div class="back-button">
            <a href="index.jsp">Kembali ke Halaman Utama</a>
        </div>
    </div>
</body>
</html>
