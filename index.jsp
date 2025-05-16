<%@ page import="java.util.*, java.text.*" %>
<%@ page session="true" %>
<%
    class Film {
        String judul, genre, deskripsi, gambar;
        int durasi, harga;
        List<String> jamTayang;

        Film(String judul, String genre, String deskripsi, String gambar, int durasi, int harga, List<String> jamTayang) {
            this.judul = judul;
            this.genre = genre;
            this.deskripsi = deskripsi;
            this.gambar = gambar;
            this.durasi = durasi;
            this.harga = harga;
            this.jamTayang = jamTayang;
        }
    }

    List<Film> daftarFilm = new ArrayList<>();
    daftarFilm.add(new Film(
        "Avengers: Endgame", "Action", "Pertarungan epik melawan Thanos.",
        "https://upload.wikimedia.org/wikipedia/id/0/0d/Avengers_Endgame_poster.jpg",
        180, 50000, Arrays.asList("10:00", "13:00", "18:00")
    ));
     daftarFilm.add(new Film(
        "Inside Out", "Animation", "Petualangan emosi dalam pikiran seorang gadis kecil.",
        "https://upload.wikimedia.org/wikipedia/en/0/0a/Inside_Out_%282015_film%29_poster.jpg",
        102, 42000, Arrays.asList("08:00", "11:00", "15:00")
    ));
    daftarFilm.add(new Film(
        "Interstellar", "Sci-Fi", "Misi luar angkasa demi menyelamatkan umat manusia.",
        "https://upload.wikimedia.org/wikipedia/en/b/bc/Interstellar_film_poster.jpg",
        169, 55000, Arrays.asList("11:00", "15:00", "20:00")
    ));

    session.setAttribute("daftarFilm", daftarFilm);
%>

<html>
<head>
    <title>Daftar Film</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <div class="film">
        <h1 class="heading">Bioskop XYZ</h1>
        <%
            for (Film f : daftarFilm) {
        %>
        <div class="card">
                <img src="<%= f.gambar %>" class="card-img-top" alt="<%= f.judul %>">
                <div class="card-content">
                    <h5 class="judul"><%= f.judul %></h5>
                    <h6 class="genre"><%= f.genre %></h6>
                    <p class="deskripsi"><%= f.deskripsi %></p>
                    <p class="info"><strong>Durasi:</strong> <%= f.durasi %> menit</p>
                    <p class="info"><strong>Harga Tiket:</strong> Rp <%= f.harga %></p>
                    <p class="info"><strong>Jam Tayang:</strong> <%= String.join(", ", f.jamTayang) %></p>
                <div class="button-container">
                    <a class="btn" href='formPesan.jsp'>Pesan Sekarang</a>
                </div>
                </div>
            </div>
            <% } %>
        </div>
        
</body>
</html>