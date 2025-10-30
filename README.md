[Tugas Individu 7]

# [Nomor 1: Jelaskan apa itu widget tree pada Flutter dan bagaimana
hubungan parent-child (induk-anak) bekerja antar widget.
]
Dalam proyek ini, saya membangun antarmuka pengguna (UI) menggunakan 
konsep Widget Tree, yang pada dasarnya adalah struktur hierarki dari 
semua widget. Di proyek saya, akarnya adalah MyApp, yang berisi 
MaterialApp, yang kemudian berisi MyHomePage. Hubungan Parent-Child 
(Induk-Anak) adalah fondasi dari layout Flutter. Sebuah widget 
(parent) berisi dan mengontrol widget lain (child/children). 
Contohnya, di menu.dart, Scaffold (parent) memiliki body: yang saya 
isi dengan Padding (child). Padding kemudian menjadi parent bagi 
Column, yang memungkinkannya mengontrol Column (child) agar memberi 
jarak dari tepi layar.

# [Nomor 2: Sebutkan semua widget yang kamu gunakan dalam proyek ini dan 
jelaskan fungsinya.
]
Proyek galacticos_shop ini menggunakan beberapa widget inti. Di main.dart, 
saya memakai MyApp (sebuah StatelessWidget) sebagai root yang 
mengembalikan MaterialApp. Di menu.dart, saya menggunakan Scaffold 
sebagai kerangka utama halaman, yang berisi AppBar (dengan Text untuk 
judul) dan body:. Untuk menata layout, saya mengimplementasikan Column 
(menyusun widget secara vertikal), Row (menyusun InfoCard secara 
horizontal), Padding, Center, SizedBox (untuk memberi spasi), dan 
GridView.count (untuk 3 tombol item). Card (di InfoCard) dan Material 
(di ItemCard) saya gunakan untuk desain kartu. InkWell saya gunakan 
untuk memberi aksi klik pada ItemCard, yang kemudian memanggil 
ScaffoldMessenger untuk menampilkan notifikasi SnackBar.

# [Nomor 3: Apa fungsi dari widget MaterialApp? Jelaskan mengapa widget 
ini sering digunakan sebagai widget root.
]
MaterialApp adalah widget root yang saya gunakan di main.dart. 
Fungsinya adalah menyediakan fungsionalitas dasar Material Design, 
seperti mengatur title aplikasi ('Galacticos Shop'), menyediakan theme 
global, dan yang terpenting, mengelola navigasi halaman (dimulai 
dengan home: MyHomePage()). Widget ini harus berada di puncak widget 
tree agar dapat "mewariskan" informasi tema dan navigasi ke semua 
widget di bawahnya (semua "turunan" widget), seperti Scaffold dan Card.

# [Nomor 4: Jelaskan perbedaan antara StatelessWidget dan 
StatefulWidget. Kapan kamu memilih salah satunya?
]
Perbedaan fundamentalnya adalah pada pengelolaan "state" (data 
internal). StatelessWidget (Widget Statis) adalah widget yang 
propertinya tidak bisa berubah setelah dibuat; tampilannya statis dan 
digambar sekali. Seluruh widget kustom dalam proyek ini (MyApp, 
MyHomePage, InfoCard, ItemCard) adalah StatelessWidget karena mereka 
hanya menampilkan data yang sudah final. Sebaliknya, StatefulWidget 
(Widget Dinamis) dapat mengelola state internal yang dapat berubah. 
Saya akan menggunakannya di masa depan jika saya memerlukan UI yang 
berubah berdasarkan interaksi pengguna (seperti checkbox atau form), 
di mana perubahan data di dalam setState() akan memicu rebuild (gambar 
ulang) widget tersebut.

# [Nomor 5: Apa itu BuildContext dan mengapa penting di Flutter? 
Bagaimana penggunaannya di metode build?
]
BuildContext pada dasarnya adalah "alamat" atau "lokasi" dari sebuah 
widget di dalam widget tree. BuildContext penting karena menjadi 
"kunci" bagi widget untuk berinteraksi dengan lingkungannya, terutama 
untuk menemukan widget leluhur (ancestor). Dalam metode build, saya 
menerima context yang saya gunakan untuk "naik" ke tree dan menemukan 
widget lain. Contohnya, di ItemCard, saya menggunakan 
ScaffoldMessenger.of(context) untuk menemukan ScaffoldMessenger 
terdekat dan menampilkan SnackBar. Di InfoCard, MediaQuery.of(context) 
digunakan untuk mendapatkan informasi ukuran layar.

# [Nomor 6: Jelaskan konsep "hot reload" di Flutter dan bagaimana 
bedanya dengan "hot restart".
]
Selama pengembangan, saya sangat terbantu oleh dua fitur ini. Hot 
Reload menyuntikkan kode baru dengan cepat tanpa me-restart aplikasi, 
memungkinkan saya melihat perubahan UI (seperti ganti warna AppBar) 
secara instan, dan yang terpenting, state aplikasi tidak hilang. 
Sebaliknya, Hot Restart memulai ulang aplikasi dari awal (fungsi main() 
dieksekusi lagi). Hal ini diperlukan saat saya membuat perubahan besar 
(seperti mengubah constructor atau inisialisasi state) dan semua state 
akan di-reset ke nilai awal.