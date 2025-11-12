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

**[Tugas Individu 8 (TI-8)]**

[Nomor 1: Perbedaan antara Navigator.push() dan Navigator.pushReplacement() pada Flutter. Dalam kasus apa sebaiknya masing-masing digunakan pada aplikasi Football Shop kamu]

Perbedaan utamanya terletak pada cara kedua fungsi ini mengelola tumpukan (stack) navigasi halaman. Navigator.push() menambahkan halaman baru di atas halaman saat ini, sehingga pengguna bisa menekan tombol "kembali" (back) untuk kembali ke halaman sebelumnya. Saya menggunakan ini pada file item_card.dart saat menekan kartu "Create Product", agar setelah selesai mengisi form, pengguna bisa kembali ke halaman menu. Sebaliknya, Navigator.pushReplacement() mengganti halaman saat ini dengan halaman baru, sehingga halaman yang lama dihapus dari tumpukan dan pengguna tidak bisa kembali ke sana. Saya menggunakan ini di left_drawer.dart untuk navigasi menu utama, agar saat berpindah halaman (misalnya dari Menu ke Tambah Produk), tumpukan halaman tidak menumpuk dan alur navigasi tetap bersih.

[Nomor 2: Pemanfaatan hierarchy widget seperti Scaffold, AppBar, dan Drawer untuk membangun struktur halaman yang konsisten di seluruh aplikasi?]

Saya memanfaatkan Scaffold, AppBar, dan Drawer sebagai kerangka dasar untuk membangun struktur halaman yang konsisten. Scaffold menyediakan struktur visual dasar (seperti body dan appBar). Di setiap halaman utama (seperti menu.dart dan product_form.dart), saya memasang AppBar pada properti appBar di Scaffold untuk menampilkan judul halaman secara konsisten di bagian atas. Saya juga memasukkan LeftDrawer yang sama ke dalam properti drawer di setiap Scaffold, sehingga menu navigasi samping (drawer) selalu dapat diakses dan memiliki tampilan serta fungsionalitas yang sama di seluruh aplikasi.

[Nomor 3: Dalam konteks desain antarmuka, apa kelebihan menggunakan layout widget seperti Padding, SingleChildScrollView, dan ListView saat menampilkan elemen-elemen form? Berikan contoh penggunaannya dari aplikasi kamu.]

Dalam desain form di product_form.dart, Padding dan SingleChildScrollView sangat penting untuk kenyamanan user. Saya menggunakan Padding untuk membungkus setiap TextFormField (seperti Nama, Harga, Deskripsi) agar ada jarak atau ruang kosong di sekelilingnya. Hal tersebut membuat form terlihat lebih rapi, tidak sempit, dan lebih mudah dibaca oleh pengguna. Sementara itu, saya membungkus seluruh Column yang berisi form dengan SingleChildScrollView. Kelebihannya adalah, jika konten form lebih panjang dari layar (terutama saat keyboard virtual muncul di layar kecil), pengguna tetap dapat menggulir (scroll) ke bawah untuk melihat dan mengisi semua bagian form yang mungkin tertutup.

[Nomor 4: Bagaimana kamu menyesuaikan warna tema agar aplikasi Football Shop memiliki identitas visual yang konsisten dengan brand toko?]

Untuk memastikan identitas visual yang konsisten, saya mengatur tema utama aplikasi di file main.dart. Di dalam widget MaterialApp, saya menggunakan properti theme dan mengisinya dengan ThemeData. Di dalamnya, saya mendefinisikan colorScheme menggunakan ColorScheme.fromSwatch(primarySwatch: Colors.blue). Dengan menentukan primarySwatch di satu tempat ini, Flutter secara otomatis menerapkan warna biru ini (dan variasinya) ke banyak komponen di seluruh aplikasi, seperti AppBar di menu.dart yang mengambil warna dari Theme.of(context).colorScheme.primary. Cara tersebut memastikan bahwa warna utama aplikasi (yang mewakili brand "Galacticos Shop") konsisten tanpa perlu mengaturnya satu per satu di setiap halaman.