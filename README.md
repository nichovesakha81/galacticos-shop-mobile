**[Tugas Individu 7 (TI-7)]**

# [Nomor 1: Jelaskan apa itu widget tree pada Flutter dan bagaimana hubungan parent-child (induk-anak) bekerja antar widget.]
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

# [Nomor 2: Sebutkan semua widget yang kamu gunakan dalam proyek ini dan jelaskan fungsinya.]
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

# [Nomor 3: Apa fungsi dari widget MaterialApp? Jelaskan mengapa widget ini sering digunakan sebagai widget root.]
MaterialApp adalah widget root yang saya gunakan di main.dart. 
Fungsinya adalah menyediakan fungsionalitas dasar Material Design, 
seperti mengatur title aplikasi ('Galacticos Shop'), menyediakan theme 
global, dan yang terpenting, mengelola navigasi halaman (dimulai 
dengan home: MyHomePage()). Widget ini harus berada di puncak widget 
tree agar dapat "mewariskan" informasi tema dan navigasi ke semua 
widget di bawahnya (semua "turunan" widget), seperti Scaffold dan Card.

# [Nomor 4: Jelaskan perbedaan antara StatelessWidget dan StatefulWidget. Kapan kamu memilih salah satunya?]
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

# [Nomor 5: Apa itu BuildContext dan mengapa penting di Flutter? Bagaimana penggunaannya di metode build?]
BuildContext pada dasarnya adalah "alamat" atau "lokasi" dari sebuah 
widget di dalam widget tree. BuildContext penting karena menjadi 
"kunci" bagi widget untuk berinteraksi dengan lingkungannya, terutama 
untuk menemukan widget leluhur (ancestor). Dalam metode build, saya 
menerima context yang saya gunakan untuk "naik" ke tree dan menemukan 
widget lain. Contohnya, di ItemCard, saya menggunakan 
ScaffoldMessenger.of(context) untuk menemukan ScaffoldMessenger 
terdekat dan menampilkan SnackBar. Di InfoCard, MediaQuery.of(context) 
digunakan untuk mendapatkan informasi ukuran layar.

# [Nomor 6: Jelaskan konsep "hot reload" di Flutter dan bagaimana bedanya dengan "hot restart".]
Selama pengembangan, saya sangat terbantu oleh dua fitur ini. Hot 
Reload menyuntikkan kode baru dengan cepat tanpa me-restart aplikasi, 
memungkinkan saya melihat perubahan UI (seperti ganti warna AppBar) 
secara instan, dan yang terpenting, state aplikasi tidak hilang. 
Sebaliknya, Hot Restart memulai ulang aplikasi dari awal (fungsi main() 
dieksekusi lagi). Hal ini diperlukan saat saya membuat perubahan besar 
(seperti mengubah constructor atau inisialisasi state) dan semua state 
akan di-reset ke nilai awal.

**[Tugas Individu 8 (TI-8)]**

# [Nomor 1: Perbedaan antara Navigator.push() dan Navigator.pushReplacement() pada Flutter. Dalam kasus apa sebaiknya masing-masing digunakan pada aplikasi Football Shop kamu]

Perbedaan utamanya terletak pada cara kedua fungsi ini mengelola tumpukan (stack) navigasi halaman. Navigator.push() menambahkan halaman baru di atas halaman saat ini, sehingga pengguna bisa menekan tombol "kembali" (back) untuk kembali ke halaman sebelumnya. Saya menggunakan ini pada file item_card.dart saat menekan kartu "Create Product", agar setelah selesai mengisi form, pengguna bisa kembali ke halaman menu. Sebaliknya, Navigator.pushReplacement() mengganti halaman saat ini dengan halaman baru, sehingga halaman yang lama dihapus dari tumpukan dan pengguna tidak bisa kembali ke sana. Saya menggunakan ini di left_drawer.dart untuk navigasi menu utama, agar saat berpindah halaman (misalnya dari Menu ke Tambah Produk), tumpukan halaman tidak menumpuk dan alur navigasi tetap bersih.

# [Nomor 2: Pemanfaatan hierarchy widget seperti Scaffold, AppBar, dan Drawer untuk membangun struktur halaman yang konsisten di seluruh aplikasi?]

Saya memanfaatkan Scaffold, AppBar, dan Drawer sebagai kerangka dasar untuk membangun struktur halaman yang konsisten. Scaffold menyediakan struktur visual dasar (seperti body dan appBar). Di setiap halaman utama (seperti menu.dart dan product_form.dart), saya memasang AppBar pada properti appBar di Scaffold untuk menampilkan judul halaman secara konsisten di bagian atas. Saya juga memasukkan LeftDrawer yang sama ke dalam properti drawer di setiap Scaffold, sehingga menu navigasi samping (drawer) selalu dapat diakses dan memiliki tampilan serta fungsionalitas yang sama di seluruh aplikasi.

# [Nomor 3: Dalam konteks desain antarmuka, apa kelebihan menggunakan layout widget seperti Padding, SingleChildScrollView, dan ListView saat menampilkan elemen-elemen form? Berikan contoh penggunaannya dari aplikasi kamu.]

Dalam desain form di product_form.dart, Padding dan SingleChildScrollView sangat penting untuk kenyamanan user. Saya menggunakan Padding untuk membungkus setiap TextFormField (seperti Nama, Harga, Deskripsi) agar ada jarak atau ruang kosong di sekelilingnya. Hal tersebut membuat form terlihat lebih rapi, tidak sempit, dan lebih mudah dibaca oleh pengguna. Sementara itu, saya membungkus seluruh Column yang berisi form dengan SingleChildScrollView. Kelebihannya adalah, jika konten form lebih panjang dari layar (terutama saat keyboard virtual muncul di layar kecil), pengguna tetap dapat menggulir (scroll) ke bawah untuk melihat dan mengisi semua bagian form yang mungkin tertutup.

# [Nomor 4: Bagaimana kamu menyesuaikan warna tema agar aplikasi Football Shop memiliki identitas visual yang konsisten dengan brand toko?]

Untuk memastikan identitas visual yang konsisten, saya mengatur tema utama aplikasi di file main.dart. Di dalam widget MaterialApp, saya menggunakan properti theme dan mengisinya dengan ThemeData. Di dalamnya, saya mendefinisikan colorScheme menggunakan ColorScheme.fromSwatch(primarySwatch: Colors.blue). Dengan menentukan primarySwatch di satu tempat ini, Flutter secara otomatis menerapkan warna biru ini (dan variasinya) ke banyak komponen di seluruh aplikasi, seperti AppBar di menu.dart yang mengambil warna dari Theme.of(context).colorScheme.primary. Cara tersebut memastikan bahwa warna utama aplikasi (yang mewakili brand "Galacticos Shop") konsisten tanpa perlu mengaturnya satu per satu di setiap halaman.

**[Tugas Individu 9 (TI-9)]**

# [Nomor 1: Jelaskan mengapa kita perlu membuat model Dart saat mengambil/mengirim data JSON? Apa konsekuensinya jika langsung memetakan Map<String, dynamic> tanpa model (terkait validasi tipe, null-safety, maintainability)?]

Pembuatan model Dart sangat krusial untuk menjamin keamanan tipe (type safety) dan struktur data yang konsisten dalam aplikasi. Jika kita langsung memetakan data JSON menggunakan Map<String, dynamic>, kita kehilangan validasi saat kompilasi, yang meningkatkan risiko runtime error akibat kesalahan penulisan kunci atau ketidakcocokan tipe data (misalnya, memperlakukan string sebagai integer). Sebaliknya, penggunaan model memberikan null-safety yang memaksa penanganan nilai kosong secara eksplisit dan meningkatkan maintainability kode melalui dukungan autocomplete serta dokumentasi struktur data yang terdefinisi dengan jelas.

# [Nomor 2: Apa fungsi package http dan CookieRequest dalam tugas ini? Jelaskan perbedaan peran http vs CookieRequest.]

Package http berfungsi sebagai protokol dasar untuk melakukan pertukaran data standar (seperti GET dan POST) namun bersifat stateless, artinya tidak menyimpan riwayat atau sesi koneksi antar request. Di sisi lain, CookieRequest adalah kelas pembungkus (wrapper) yang dibangun di atas http dengan fitur spesifik untuk manajemen sesi autentikasi. Peran utama CookieRequest adalah menyimpan cookies (seperti sessionid) secara otomatis setelah proses login berhasil dan menyertakannya kembali pada setiap request berikutnya, sehingga memungkinkan server Django mengenali pengguna yang sedang aktif tanpa perlu melakukan autentikasi ulang secara manual.

# [Nomor 3:  Jelaskan mengapa instance CookieRequest perlu untuk dibagikan ke semua komponen di aplikasi Flutter.]

Instance CookieRequest harus dibagikan ke seluruh komponen aplikasi menggunakan Provider untuk memastikan konsistensi status login (shared state). Karena token sesi autentikasi disimpan secara lokal di dalam variabel instance objek tersebut, pembuatan instance baru di setiap halaman (navigasi) akan menyebabkan hilangnya data sesi yang tersimpan, sehingga server akan menganggap permintaan tersebut berasal dari pengguna anonim. Dengan menerapkan pola singleton melalui Provider, satu instance tunggal digunakan di seluruh siklus hidup aplikasi, sehingga menjamin status login tetap persisten di semua halaman.

# [Nomor 4:  Jelaskan konfigurasi konektivitas yang diperlukan agar Flutter dapat berkomunikasi dengan Django. Mengapa kita perlu menambahkan 10.0.2.2 pada ALLOWED_HOSTS, mengaktifkan CORS dan pengaturan SameSite/cookie, dan menambahkan izin akses internet di Android? Apa yang akan terjadi jika konfigurasi tersebut tidak dilakukan dengan benar?]

Agar Flutter dapat berkomunikasi dengan Django, diperlukan konfigurasi jaringan yang spesifik pada kedua sisi. Penambahan 10.0.2.2 pada ALLOWED_HOSTS diperlukan khusus untuk emulator Android agar dapat mengenali localhost komputer induk. Pengaktifan CORS dan pengaturan SameSite pada cookie diperlukan agar browser atau klien mobile diizinkan melakukan permintaan lintas domain dan mengirimkan kredensial sesi dengan aman. Terakhir, izin akses internet pada AndroidManifest.xml wajib ditambahkan karena sistem operasi Android membatasi akses jaringan aplikasi secara default. Kegagalan dalam konfigurasi ini akan menyebabkan aplikasi mengalami error koneksi (socket exception) atau penolakan akses (forbidden) oleh server.

# [Nomor 5: Jelaskan mekanisme pengiriman data mulai dari input hingga dapat ditampilkan pada Flutter.]

Mekanisme pengiriman data dimulai ketika pengguna memasukkan informasi pada elemen formulir Flutter, yang kemudian disimpan dalam variabel state lokal. Setelah validasi input terpenuhi, data tersebut diserialisasi (diubah) menjadi format JSON dan dikirimkan melalui permintaan HTTP POST menggunakan CookieRequest ke endpoint Django. Server Django menerima, mem-parsing, dan menyimpan data tersebut ke dalam database, lalu mengirimkan respons sukses kembali ke klien. Aplikasi Flutter kemudian merespons status sukses tersebut dengan memperbarui antarmuka pengguna, seperti menampilkan notifikasi SnackBar atau me-refresh daftar item yang ditampilkan.

# [Nomor 6: Jelaskan mekanisme autentikasi dari login, register, hingga logout. Mulai dari input data akun pada Flutter ke Django hingga selesainya proses autentikasi oleh Django dan tampilnya menu pada Flutter.]

Proses autentikasi dimulai dengan registrasi, di mana data akun dikirim ke server untuk membuat entitas pengguna baru di database. Saat login, aplikasi mengirimkan kredensial ke server; jika valid, Django membuat sesi di sisi server dan mengirimkan cookie sessionid ke klien yang kemudian disimpan oleh CookieRequest. Selama sesi aktif, CookieRequest menyertakan cookie ini di setiap permintaan agar server mengenali pengguna. Proses logout melibatkan pengiriman permintaan ke server untuk menghapus sesi aktif di database, yang diikuti dengan penghapusan cookie sesi di sisi klien, sehingga mengembalikan aplikasi ke status tidak terautentikasi.

# [Nomor 7: Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step! (bukan hanya sekadar mengikuti tutorial).]

**1. Memastikan deployment proyek tugas Django kamu telah berjalan dengan baik**
- Mengecek kembali konfigurasi settings.py pada proyek Django, memastikan ALLOWED_HOSTS sudah mencakup localhost, 127.0.0.1, dan domain deployment PBP.
- Menjalankan proyek di lingkungan lokal (localhost) untuk memastikan tidak ada error sebelum dihubungkan dengan Flutter.
**2. Mengimplementasikan fitur registrasi akun pada proyek tugas Flutter**
Backend (Django):
- Membuat fungsi register pada authentication/views.py yang menerima data JSON, memvalidasi input, dan membuat pengguna baru.
- Menambahkan routing URL untuk fungsi tersebut di authentication/urls.py.
Frontend (Flutter):
- Membuat file lib/screens/register.dart.
- Menggunakan TextEditingController untuk menangkap input username dan password.
- Menggunakan CookieRequest.postJson untuk mengirim data registrasi ke Django secara asinkron.
- Menambahkan navigasi ke halaman Login jika registrasi berhasil.
**3. Membuat halaman login pada proyek tugas Flutter**
Backend (Django):
- Membuat fungsi login pada authentication/views.py yang menggunakan fungsi authenticate dan login bawaan Django.
- Menambahkan routing URL di authentication/urls.py.
Frontend (Flutter):
- Membuat file lib/screens/login.dart.
- Mengatur halaman ini sebagai halaman awal (home) di main.dart.
- Menggunakan CookieRequest.login untuk mengautentikasi pengguna dan menyimpan sesi (cookie) secara lokal.
**4. Mengintegrasikan sistem autentikasi Django dengan proyek tugas Flutter**
Persiapan Django:
- Membuat aplikasi authentication (python manage.py startapp authentication) dan mendaftarkannya di INSTALLED_APPS.
- Menginstal django-cors-headers dan mengonfigurasinya di settings.py agar mengizinkan permintaan dari aplikasi Flutter (termasuk pengaturan CORS_ALLOW_ALL_ORIGINS).
- Menambahkan 10.0.2.2 pada ALLOWED_HOSTS untuk akses dari Emulator Android.
Persiapan Flutter:
- Menginstal paket provider dan pbp_django_auth.
- Membungkus root widget (MaterialApp) di main.dart dengan Provider yang menyediakan satu instance CookieRequest ke seluruh aplikasi.
Implementasi Logout:
- Membuat fungsi logout di Django dan menghubungkannya dengan tombol Logout di Flutter yang memanggil request.logout.
**5. Membuat model kustom sesuai dengan proyek aplikasi Django**
- Membuka endpoint JSON (/json/) dari proyek Django di browser dan menyalin data JSON tersebut.
- Menggunakan situs Quicktype untuk mengonversi JSON tersebut menjadi kode model Dart.
- Membuat file lib/models/product_entry.dart dan menempelkan kode hasil generasi.
- Menyesuaikan kode model (terutama pada bagian fromJson) untuk menangani null safety, misalnya memberikan nilai default pada atribut seperti brand.
**6. Membuat halaman yang berisi daftar semua item (JSON Endpoint)**
Backend (Django):
- Memastikan fungsi show_json di views.py mengembalikan seluruh data produk.
- Menambahkan fungsi proxy_image di views.py dan URL-nya untuk menangani pengambilan gambar dari URL eksternal (mengatasi masalah CORS gambar).
Frontend (Flutter):
- Menambahkan paket http dan izin internet pada AndroidManifest.xml.
- Membuat widget ProductEntryCard di lib/widgets/ untuk menampilkan ringkasan produk (thumbnail, nama, harga, dll).
- Membuat halaman ProductEntryListPage di lib/screens/ yang menggunakan request.get ke endpoint /json/.
- Menggunakan FutureBuilder untuk menampilkan daftar produk secara asinkron.
**7. Membuat halaman detail untuk setiap item**
- Membuat file lib/screens/product_detail.dart.
- Membuat kelas ProductDetailPage yang menerima objek ProductEntry melalui konstruktornya.
- Menyusun tampilan detail menggunakan widget seperti Column, Row, dan SingleChildScrollView untuk menampilkan informasi lengkap produk.
**8. Tampilkan seluruh atribut pada model item kamu pada halaman ini**
- Di dalam ProductDetailPage, menampilkan seluruh atribut data yang ada pada model ProductEntry (seperti name, price, description, stock, brand, rating, category, dan is_featured).
- Menggunakan Image.network dengan URL proxy untuk menampilkan gambar produk secara penuh.
**9. Tambahkan tombol untuk kembali ke halaman daftar item**
- Menghubungkan kartu produk di halaman ProductEntryListPage dengan halaman detail menggunakan Navigator.push.
- Secara otomatis, Flutter akan menambahkan tombol "Back" (panah kembali) pada AppBar di halaman detail, yang memungkinkan pengguna kembali ke halaman daftar item sebelumnya.
**10. Melakukan filter pada halaman daftar item (My Products)**
Backend (Django):
- Memastikan fungsi get_products_json di main/views.py memiliki logika untuk memfilter produk berdasarkan request.user jika parameter filter=my diberikan.
Frontend (Flutter):
- Membuat halaman khusus MyProductListPage di lib/screens/my_product_list.dart.
- Mengonfigurasi fungsi fetchMyProducts untuk memanggil endpoint /get-products/?filter=my.
- Melakukan parsing manual pada respon JSON (karena format JSON kustom berbeda dengan serializer bawaan Django).
- Menambahkan navigasi ke halaman ini melalui menu Drawer dan tombol "My Products" pada halaman utama.