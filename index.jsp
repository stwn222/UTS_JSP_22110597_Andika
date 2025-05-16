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
    "Dune", "Sci-Fi", "Paul Atreides harus menyelamatkan masa depan keluarganya dan planet Arrakis.",
    "https://upload.wikimedia.org/wikipedia/en/8/8e/Dune_%282021_film%29.jpg",
    155, 53000, Arrays.asList("10:00", "14:00", "19:00")
));

daftarFilm.add(new Film(
    "Coco", "Animation", "Miguel menjelajah Dunia Arwah untuk memahami arti keluarga dan musik.",
    "https://upload.wikimedia.org/wikipedia/en/9/98/Coco_%282017_film%29_poster.jpg",
    105, 40000, Arrays.asList("09:00", "13:00", "17:00")
));
daftarFilm.add(new Film(
    "Tenet", "Sci-Fi", "Seorang agen rahasia harus memanipulasi waktu untuk mencegah Perang Dunia ketiga.",
    "https://upload.wikimedia.org/wikipedia/en/1/14/Tenet_movie_poster.jpg",
    150, 54000, Arrays.asList("12:00", "16:00", "20:00")
));
daftarFilm.add(new Film(
    "La La Land", "Musical", "Kisah cinta antara musisi jazz dan aktris yang mengejar impian di Los Angeles.",
    "https://upload.wikimedia.org/wikipedia/en/a/ab/La_La_Land_%28film%29.png",
    128, 50000, Arrays.asList("10:00", "14:00", "18:00")
));
daftarFilm.add(new Film(
    "Knives Out", "Mystery", "Seorang detektif menyelidiki kematian misterius dari seorang penulis kaya.",
    "https://upload.wikimedia.org/wikipedia/en/1/1f/Knives_Out_poster.jpeg",
    131, 48000, Arrays.asList("11:00", "15:00", "19:00")
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
