-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 21, 2020 at 09:30 AM
-- Server version: 10.4.13-MariaDB
-- PHP Version: 7.4.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `kabarnagari`
--

-- --------------------------------------------------------

--
-- Stand-in structure for view `account`
-- (See below for the actual view)
--
CREATE TABLE `account` (
`id_user` int(11)
,`email` varchar(50)
,`password` varchar(200)
,`nama` varchar(50)
,`phone` varchar(13)
,`pekerjaan` varchar(30)
);

-- --------------------------------------------------------

--
-- Table structure for table `berita`
--

CREATE TABLE `berita` (
  `id_berita` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `id_kategori` int(11) NOT NULL,
  `foto` varchar(50) NOT NULL,
  `id_user` int(11) NOT NULL,
  `tanggal_dibuat` date NOT NULL,
  `konten_berita` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `berita`
--

INSERT INTO `berita` (`id_berita`, `title`, `id_kategori`, `foto`, `id_user`, `tanggal_dibuat`, `konten_berita`) VALUES
(10, 'Omnibus Law Jamin Pacu Ekonomi RI? Dahlan Iskan: Belum tentu', 1, '1602406873_ff8152d87a1324ccfe7a.png', 1, '2020-10-11', 'Jakarta - Dahlan Iskan menilai belum ada jaminan Omnibus Law Cipta Kerja dapat memajukan perekonomian nasional. UU sapu jagat yang baru disahkan ini juga menuai penolakan di berbagai kalangan.\r\n\"Belum tentu,\" ujar Dahlan lewat artikel di website pribadinya, disway.id, yang dikutip detikcom, Jumat (9/10/2020).\r\n\r\nDemikian pula bagi kepentingan pengusaha. Dahlan menyebut beleid ini baru benar-benar berarti bagi pengusaha bila pemerintah dapat menjaga stabilitas masyarakat terlebih dahulu. Ia menga'),
(13, 'Netizen Mencibir iPhone 12 \'Kopi Paste\' Desain iPhone 5', 2, '1602641009_5069519ee826181d207c.png', 2, '2020-10-13', 'Jakarta, CNN Indonesia -- iPhone 12 yang diluncurkan mendapat tanggapan miring dari netizen. Fokus utamanya adalah desain iPhone 12 yang dinilai warganet mirip iPhone 5.\r\nSalah satu warganet yang mengejek desain iPhone 12, yaitu pemilik akun @zharifrio\r\n\r\n\"design iphone 12 kayak iphone 5, gak maulah balik ke mantan. udah pernah dicoba soalnya,\" tulisnya\r\n\r\n\r\n\r\n\r\n\r\nNetizen lainnya melepaskan kekeselannya dengan menjelaskan ada penggabungan desain antara iPhone 11 dan iPhone 5, jadinya iPhone 12\r\n\r\n\r\n\r\nUntuk diketahui iPhone mengalami perubahan desain dan jantung penggerak. Seluruh model iPhone 12 memiliki kemampuan jaringan 5G dan menggunakan prosesor cip A14 Bionic.\r\n\r\nCip A14 Bionic adalah cip 5-nanometer pertama di industri dan diklaim 50 persen lebih cepat dari cip ponsel di dunia.\r\n\r\nAda empat model iPhone 12 yang diperkenalkan kepada konsumen yakni iPhone 12 mini, iPhone 12, iPhone 12 Pro, dan iPhone 12 Pro Max yang dijual mulai Rp10 juta sampai Rp20 juta.\r\n\r\nNamun spesifikasi itu tak menyurutkan netizen mencibir iPhone 12. Netizen lainnya, @LewisB1gaming menyebut \"desain iPhone 12 aneh, dan mengingatkan kepada bentuk iPhone 5,\" ucap pemilik akun.'),
(14, 'iPhone 12 Tanpa Colokan Charger, Cas Baterai Cukup Tempel', 2, '1602641123_1f437bc46b21fff1ca90.png', 2, '2020-10-20', 'Jakarta, CNN Indonesia --- Apple memutuskan menjual iPhone 12 tanpa colokan charger dan EarPod. Menurut perusahaan langkah ini untuk mengurangi dampak buruk terhadap lingkungan.\r\nApple pun menyediakan Mag Safe, atau pengisi daya nirkabel (wireless charging) untuk iPhone 12. Cara menggunakannya, pengguna cukup menempelkan perangkat yang akan menempel otomatis di bagian belakang ponsel Apple ini. MagSafe juga memungkinkan untuk mengisi daya baterai Apple Watch.\r\n\r\nMelansir laman resmi Apple, seluruh tipe iPhone 12 mendukung pengisian daya nirkabel MagSafe hingga 15W, pengisian daya nirkabel Qi hingga 7,5W, dan melalui USB ke sistem komputer atau laptop. Perangkat ini dijual terpisah.\r\n\r\n\r\n\r\nLihat juga: Harga dan Spesifikasi iPhone 12 Mini, iPhone 12\r\nApple Mag safe pengisi daya nirkabel wireless chargingApple Mag safe pengisi daya nirkabel wireless charging. (Foto: (dok. screenshot Apple))\r\nApple menjual pengisi daya nirkabel MagSafe dengan harga US$39 atau Rp578 ribu. Sedangkan adaptor USB-C 20 W sebesar US$19 atau Rp281 ribu.\r\n\r\nSedangkan EarPod dengan konektor lightning sebesar US$19 atau Rp281 ribu, AirPods dengan Charging Case senilai US$159 atau Rp2,3 juta, AirPods dengan pengisi daya nirkabel US$199 atau Rp2,3 juta, dan AirPod Pro seharga US$249 atau Rp3,6 juta.\r\n\r\nApple mengklaim dapat mengurangi emisi karbon secara signifikan dengan tidak membuat aksesori di dalam setiap produk ponsel yang dijualnya. Selain itu, Apple mengurangi ukuran kotak pengiriman dari setiap iPhone yang dijual.\r\nMelansir 9to5mac, Apple menyampaikan akan menghemat 2 juta metrik ton karbon setiap tahun dengan tidak menyertakan pengisi daya, earbud, dan mengurangi ukuran kotak iPhone 12.\r\n\r\nVP Apple Lisa Jackson mengatakan bahwa sudah ada lebih dari 2 miliar adaptor daya atau charger piting di dunia.\r\n\r\nDijelaskan Apple, pihaknya terus mendorong penggunaan metode pengisian nirkabel.'),
(15, 'Aplikasi Lokal Bantu Pelajar Pecahkan Soal Matematika', 2, '1602641453_ad89764c895b38e8a731.jpeg', 3, '2020-10-13', 'Jakarta, CNN Indonesia -- Startup edukasi lokal asal Indonesia, CoLearn, meluncurkan aplikasi yang punya fitur \'Tanya\' untuk membantu pelajar menyelesaikan soal Matematika. Fitur ini bisa digunakan dengan cara mengambil dan mengunggah foto soal matematika ke dalam platform.\r\nDalam hitungan detik, CoLearn akan memberikan video penjelasan tentang cara menjawab dan menyelesaikan soal tersebut, secara jelas dan mudah dimengerti.\r\n\r\nFitur Tanya dapat diakses secara gratis melalui aplikasi CoLearn dan juga WhatsApp oleh semua siswa-siswi SMA-SMP di Indonesia.\r\n\r\n\r\n\r\nCoLearn mengatakan hingga saat ini, mata pelajaran matematika masih menjadi sebuah \'momok\' bagi para pelajar. Matematika identik dengan rumus dan soal-soal yang membutuhkan penyelesaian rumit, sehingga banyak pelajar yang kurang menyukainya.\r\n\r\nLihat juga: Unicorn Baru 2020 Berasal dari Startup Edukasi dan Kesehatan\r\nPadahal, matematika merupakan salah satu pelajaran inti yang paling dibutuhkan untuk mendukung STEM (sains, teknologi, engineering, dan matematika).\r\n\r\n\"Pandemi Covid-19 telah membuktikan betapa pentingnya menguasai teknologi yang akan menjadi elemen utama dalam semua kegiatan di masa depan. Karena itu, penguasaan terhadap mata pelajaran sains seperti matematika sangat penting untuk menjadi fondasi bagi kemajuan teknologi yang lebih pesat,\" kata CEO CoLearn, Abhay Saboo.\r\n\r\nCoLearn berasumsi  fitur Tanya juga diharapkan dapat meringankan beban para guru sekolah yang kini memiliki kesibukan ketika mengurus pembelajaran jarah jauh selama pandemi berlangsung.\r\n\r\n\"Saya merasa bisa belajar lebih baik dengan format penjelasan video yang ada di fitur \"Tanya\" karena penjelasan dari guru terkadang belum memadai,\" kata Dian Aminarti, seorang pelajar kelas 11 jurusan IPA\r\n\r\nMampu Jawab Satu Pertanyaan Setiap Detik\r\nHanya dalam waktu 45 hari sejak diluncurkan, CoLearn mampu menjawab lebih dari 1 pertanyaan setiap detiknya. Jumlah tersebut setara dengan lebih dari 3 juta pertanyaan setiap bulan.\r\n\r\nSelain itu, CoLearn juga menghadirkan sesi Live Class untuk mendampingi pelajar Indonesia yang membutuhkan bimbingan belajar online. Saat ini, fitur Live Class dapat diakses secara gratis hingga akhir semester. \r\n\r\nPara pengajar di CoLearn juga telah diseleksi secara ketat. Mereka memiliki kemampuan dan sederet prestasi dengan usia yang relatif muda, sehingga dapat menjadi panutan baik bagi para siswa. Selain itu, terdapat Guru Siaga yang siap membantu murid ketika mereka memiliki pertanyaan di tengah sesi.\r\n\r\n\"Kami melihat selama kegiatan belajar mengajar online berlangsung, banyak pelajar yang merasa bosan karena interaksinya hanya satu arah, dan bahkan ada guru yang hanya memberikan tugas begitu saja tanpa penjelasan yang substansial,\" ujar COO CoLearn Marc Irawan.\r\n\r\nSelain di aplikasi, fitur Tanya juga tersedia di WhatsApp (085759759759). Cara kerja fitur ini sama dengan di aplikasi, pelajar haru mengambil dan mengirim foto soal matematika soal ke nomor tersebut. Namun, jumlah pertanyaan yang bisa ditanya di WhatsApp terbatas setiap harinya,  berbeda dari aplikasi yang tidak dibatasi jumlah pertanyaannya.\r\n\r\nStartup CoLearn didirikan oleh tiga orang veteran praktisi dalam dunia pendidikan, yaitu Abhay Saboo (CEO), Marc Irawan (COO), dan Sandeep Devaram (CPO).\r\n\r\nAbhay merupakan lulusan MBA dari Harvard University, Marc merupakan pendiri startup coding Bright Future Labs di Indonesia, sementara Sandeep adalah salah satu personil awal BYJU\'s, salah satu startup edukasi terbesar di dunia. Aplikasi CoLearn dapat diunduh secara gratis melalui Play Store dan App Store.'),
(16, 'Harga Minyak Menguat Ditopang Permintaan dari China', 1, '1602641651_f63e1fbcf6018a2ca13c.jpeg', 1, '2020-10-13', 'Jakarta, CNN Indonesia -- Harga minyak dunia balik arah (rebound) menguat pada akhir perdagangan Selasa (13/10). Penguatan harga minyak ditopang kenaikan permintaan minyak China. \r\nMengutip Antara, Rabu (14/10), minyak mentah berjangka Brent untuk pengiriman Desember naik 73 sen atau 1,8 persen menjadi US$42,45 per barel.\r\n\r\nSementara, minyak mentah berjangka AS West Texas Intermediate (WTI) untuk pengiriman November bertambah 77 sen atau 2,0 persen menjadi US$40,20 per barel.\r\n\r\n\r\n \r\nLihat juga: Potensi Gas Baru Ditemukan di Natuna\r\nPada perdagangan sebelumnya, kedua kontrak acuan minyak berjangka tersebut jatuh hampir 3 persen.\r\n\r\nChina, importir minyak mentah terbesar dunia, menerima 11,8 juta barel per hari (bph) minyak pada September. Jumlah itu naik 5,5 persen dari posisi Agustus dan naik 17,5 persen dari periode yang sama tahun lalu. Namun, masih di bawah rekor tertinggi 12,94 juta bph pada Juni. \r\n\r\n\"Harga minyak yang mengalami pukulan cukup keras pada hari sebelumnya, mencari titik terang pada Selasa,\" kata Analis pasar minyak senior Rystad Energy Paola Rodriguez-Masiu.\r\n\r\nPun begitu, kenaikan harga minyak dibatasi oleh perkiraan perlambatan pemulihan permintaan minyak global saat kasus virus corona meningkat.\r\n\r\nLihat juga: ESDM Ungkap Tiga Formula Tarif Listrik EBT di Perpres Baru\r\nBadan Energi Internasional (IEA) mengatakan dalam World Energy Outlook bahwa dalam skenario optimis vaksin dan pengobatan dapat memulihkan ekonomi global pada 2021. \r\n\r\nDengan demikian, permintaan energi pulih pada 2023. Tetapi, dalam skenario pemulihan yang tertunda dikatakan bahwa pemulihan permintaan energi bisa mundur ke 2025.\r\n\r\n\"Era pertumbuhan permintaan minyak global akan berakhir dalam 10 tahun ke depan, tetapi tanpa perubahan besar dalam kebijakan pemerintah-pemerintah, saya tidak melihat tanda puncak permintaan minyak,\" kata kepala IEA Fatih Birol. \r\n\r\nSementara itu, Organisasi Negara-negara Pengekspor Minyak (OPEC) juga memperkirakan pemulihan permintaan minyak global lebih lambat. Dalam laporan bulanan OPEC, disebutkan permintaan minyak akan naik 6,54 juta bph tahun depan menjadi 96,84 juta bph, atau lebih rendah 80 ribu bph dari prediksi sebulan lalu. \r\n\r\nPerlambatan pemulihan permintaan minyak diprediksi karena sejumlah negara memberlakukan pembatasan sosial untuk mengurangi penyebaran virus, misalnya Inggris dan Republik Ceko. Sedangkan, Prancis mengisyaratkan penguncian lokal.\r\n\r\nDari sisi pasokan, sejumlah kilang sudah mulai produksi kembali sehingga diprediksi ada tambahan pasokan di pasar. Pekerja kilang minyak telah kembali ke anjungan Teluk Meksiko AS setelah Badai Delta renda dan pekerja di Norwegia kembali ke rig lepas pantai setelah mengakhiri aksi mogok.\r\n\r\nAnggota OPEC, Libya juga telah mencabut keadaan force majeure di ladang minyak Sharara. Total produksi Libya diperkirakan mencapai 355 ribu bph. \r\n\r\n\"Agar harga terus naik, kami pikir peningkatan kapasitas produksi cadangan di antara OPEC+ perlu dikurangi,\" imbuh Analis UBS dalam sebuah catatan.'),
(17, 'Sebelum Omnibus Law, Investasi RI Sudah Lampaui Vietnam', 1, '1602642849_8cc0c5172e9b937065c0.jpeg', 1, '2020-10-13', 'Jakarta, CNN Indonesia -- Aliran investasi asing langsung (foreign direct investment/FDI) ke Indonesia sudah berhasil mengalahkan Thailand dan Vietnam pada 2019 atau sebelum Undang-Undang Omnibus Law Cipta Kerja (UU Cipta Kerja) disahkan. \r\nHal ini terungkap dari laporan Bank Dunia bertajuk Statistik Utang Internasional 2021 yang menyoroti aliran investasi asing di negara-negara berpendapatan rendah dan menengah. Dari laporan yang dikutip CNNIndonesia.com, tertulis aliran investasi asing ke Indonesia mencapai US$25 miliar pada 2019.\r\n\r\n\"Arus masuk FDI ke Indonesia naik 24 persen ke rekor US$25 miliar, dengan investasi yang kuat di bidang manufaktur, pertambangan, dan jasa keuangan,\" tulis Bank Dunia, dikutip Selasa (13/10).\r\nSecara total, Bank Dunia mencatat aliran investasi asing langsung ke negara-negara berpenghasilan rendah dan menengah turun 5 persen menjadi US$55 miliar pada tahun lalu. Sayangnya, Bank Dunia tidak mengungkap alasan di balik naik penurunan aliran investasi asing ke masing-masing negara pesaing Indonesia itu.\r\n\r\nMereka hanya menyatakan penurunan juga dialami China. China sendiri juga mengalami penurunan aliran investasi asing pada tahun lalu.\r\n\r\nJumlahnya turun 29 persen menjadi US$131 miliar.'),
(18, 'Neymar Hattrick, Brasil Tekuk Peru 4-2', 3, '1602643056_1741e324a140fcc2c188.jpeg', 1, '2020-10-13', 'Jakarta, CNN Indonesia -- Timnas Brasil mengalahkan timnas Peru 4-2 dalam lanjutan kualifikasi Piala Dunia 2022 zona Amerika Selatan di Stadion Nasional, Lima, Peru, Rabu (14/10) pagi WIB.\r\nBrasil yang bertindak sebagai tim tamu tertinggal lebih dulu di laga ini. Tuan rumah berhasil unggul 1-0 berkat gol Andre Carrillo saat pertandingan baru berjalan enam menit.\r\nTendangan keras Carrillo dari luar kotak penalti bersarang ke pojok kiri gawang tanpa mampu diantisipasi kiper Brasil, Weverton.\r\nBrasil yang coba mencari gol penyama kedudukan baru bisa membobol gawang Peru pada menit ke-28. Hal itu terjadi setelah Neymar dilanggar Yoshimar Yotun di kotak penalti.\r\n\r\nNeymar mengeksekusi sendiri penalti tersebut. Bintang Paris Saint-Germain itu berhasil melepaskan tendangan yang memperdaya Pedro Gallese.\r\nSkor imbang 1-1 membuat tensi pertandingan semakin tinggi. Peluang demi peluang bisa diciptakan kedua tim.\r\n\r\nPeru mendapatkan peluang melalui Luis Advincula dan Renato Tapia tetapi belum berbuah gol. Brasil juga memiliki kesempatan lewat Roberto Firmino tetapi sundulannya memanfaatkan umpan silang Renan Lodi masih menyamping di gawang Peru.\r\n\r\nDi babak kedua, Peru unggul untuk kali kedua di laga ini. Gol tuan rumah kembali tercipta melalui tendangan dari luar kotak penalti.\r\n\r\nKali ini giliran Tapia yang membobol gawang Weverton pada menit ke-59. Tendangan keras Tapia berhasil menggetarkan gawang Brasil untuk membuat skor jadi 2-1.\r\n\r\nKeunggulan Peru tidak bertahan lama. Lima menit berselang, skuad asuhan Tite membuat skor jadi 2-2 lewat gol yang dicetak Richarlison.'),
(19, 'Ronaldo Kena Covid-19: Presiden Turun Tangan dan Saham Anjlok', 3, '1602643233_c42d4925f93e37c1fa7e.jpeg', 1, '2020-10-13', 'Jakarta, CNN Indonesia -- Beragam reaksi dan respons muncul dari berbagai pihak setelah Cristiano Ronaldo dinyatakan positif Covid-19 pada Selasa (13/10) malam waktu Indonesia.\r\nPresiden Portugal, Marcelo Rebelo de Sousa, lekas menyatakan dukungan kepada timnas Portugal yang ditinggal Ronaldo.\r\nMegabintang sepak bola itu tidak bisa menjalani laga bersama Portugal di ajang UEFA Nations League, Rabu (14/10), karena positif virus corona.De Sousa menyemangati Ronaldo bisa segera pulih dan memastikan bakal hadir mendukung perjuangan timnas Portugal melawan Swedia di Stadion Jose Avalade, Lisbon.\r\n\"Saya sudah berbicara dengan Federasi Sepak Bola Portugal, yang melakukan tes setiap hari. Para pemain datang dari berbagai negara. Ada kontrol untuk situasi yang mereka hadapi. Saya diberitahu tidak ada pemain lain yang positif setelah dites,\" kata De Sousa.\r\n\r\n\"Saya mendoakannya lekas baik dan besok kami akan mendukung tim di sana, dengan mengetahui ada laga yang telah kami lakukan tanpa Cristiano Ronaldo dan kami tetap menang serta bermain dengan baik. Jelas karantina yang dijalankan menyita pengorbanan pribadi, keluarga, dan profesional,\" tambahnya dikutip dari Record.\r\n\r\nSelain turut menarik perhatian pemimpin negara, kasus Covid-19 yang menimpa Ronaldo juga sempat membuat harga saham Juventus menurun.\r\n\r\nDalam sebuah cuitan, seorang pengamat sepak bola Italia Tancredi Palmeri mengunggah harga saham Juventus yang anjlok sesaat Ronaldo diumumkan positif covid-19.\r\n\r\nTentunya respons dari rekan sejawat yang mendoakan kesembuhan Ronaldo pun banyak terdapat di sosial media.\r\n'),
(20, 'Prediksi Susunan Pemain Timnas U-19 vs Makedonia Utara', 3, '1602643636_122a08b606ea9b54ea43.jpeg', 1, '2020-10-13', 'Jakarta, CNN Indonesia -- Pelatih Timnas Indonesia U-19 Shin Tae Yong kemungkinan bakal merotasi beberapa pemain pada pertemuan kedua melawan Makedonia Utara, Rabu (14/10) malam WIB.\r\nPelatih Timnas U-19 Shin Tae Yong menyebut skuad arahannya siap untuk menjalani uji coba jilid kedua melawan Makedonia Utara. Perubahan cuaca juga menjadi sorotan.\r\n\"Kami siap kembali menghadapi Makedonia Utara. Saya akan merotasi beberapa pemain. Kami juga antisipasi bila nanti bermain dalam kondisi cuaca hujan. Karena beberapa hari terakhir di sini hujan kalau sore,\" kata Shin Tae Yong dikutip dari laman resmi PSSI.\r\nElkan Baggott kemungkinan bakal kembali diturunkan sejak menit pertama untuk menambah kesolidan dengan rekan setimnya di lini belakang.\r\n\r\nSebelumnya Baggott diberi kepercayaan tampil penuh pada pertemuan pertama Timnas U-19 vs Makedonia. Pemain Ipswich Town itu tampil tenang dan cukup percaya diri di lini belakang.\r\nKapten tim Rizky Ridho berpeluang dimainkan sejak awal bersama Baggott. Adapun bek sayap, Bagas Kaffa dan Pratama Arhan juga bisa diturunkan sebagai starter.\r\n\r\nDi posisi penjaga gawang, Muhammad Adi Satryo, akan kembali dipercaya turun sejak menit awal. Ia lebih banyak dipercaya Shin Tae Yong selama uji coba di Kroasia.\r\n\r\nSementara di lini tengah, duet David Maulana dan Brylian Aldama bisa diandalkan. Sementara Witan Sulaeman hampir dipastikan bermain sejak menit pertama bersama Imam Zakiri yang sebelumnya turun di babak kedua.\r\n\r\nJack Brown yang sebelumnya turun dari bangku cadangan, berpeluang mendapat kepercayaan sebagai starter. Kepercayaan diri pemain Lincoln City itu sedang menanjak usai mengemas dua gol ke gawang Makedonia.'),
(21, 'TNI Kawal Penanganan Covid-19 di 10 Wilayah Prioritas', 4, '1602643826_d79078de33dae60fd55b.jpeg', 1, '2020-10-13', 'Jakarta, CNN Indonesia -- Kepala Satuan Angkatan Darat (KSAD) TNI sekaligus Wakil Ketua Pelaksana Komite Penanganan Covid-19 dan Pemulihan Ekonomi Nasional (KPC PEN) Andika Perkasa mengaku terus memantau penanganan Covid-19 dengan menjalin komunikasi dengan jajarannya.\r\nHal serupa juga dilakukan dengan tenaga kesehatan di 95 Rumah Sakit Angkatan Darat yang menjadi area pantauannya. Komunikasi internal itu dilakukan setiap pagi untuk memastikan penanganan Covid-19 di wilayah-wilayah prioritas berjalan baik.\r\n\r\n\"Komunikasi 10 Panglima Kodam jadi titik berat operasi sekarang setiap pagi dan pantau rumah sakit Angkatan Darat yang tersebar di Indonesia,\" ujar Andika di Media Center Satuan Tugas Penanganan Covid-19 Graha BNPB Jakarta, dikutip dari laman resmi #SatgasCovid19, Selasa (13/10).\r\n\r\nSelain mengawasi implementasi penerapan protokol kesehatan, pihaknya juga mengawal ketersediaan 20 laboratorium PCR yang didukung oleh BNPB, serta rapid test berbasis antigen dan 17 laboratorium yang didukung oleh Kementerian Pertahanan (Kemenhan).\r\n\r\nAndika menyebut, pihaknya mengerahkan sebanyak 62 ribu jajaran anggota TNI Angkatan Darat dalam penegakkan protokol kesehatan.\r\n\r\nPara anggota TNI ini bersinergi dengan Polri, Satpol PP, dan Kejaksaan dalam Operasi Yustisi Penerapan Protokol Kesehatan di Tanah Air.'),
(22, ' Ganjar Kecam Aksi Joget Bupati Blora Tanpa Masker', 4, '1602643951_a61df03784657625c980.jpg', 1, '2020-10-13', 'Jakarta, CNN Indonesia --\r\nBupati Blora, Djoko Nugroho duet bersama seorang aparatur sipil negara, di sebuah hajatan saat pandemi Covid-19. Djoko Nugroho yang mengenakan seragam dinas saat berjoget, tidak memakai masker dan menjaga jarak.\r\n\r\nVideo berdurasi 30 detik itu mengundang reaksi dari gubernur Jawa Tengah Ganjar Pranowo. Ganjar menyatakan, tidak ada sanksi untuk bupati Blora, tetapi yang bersangkutan bisa menjatuhkan sanksi bagi diri sendiri dan merasa malu.\r\n\r\nSebagai pemimpin tertinggi di daerah, bupati semestinya bisa menjadi teladan bagi warga, termasuk dalam mematuhi protokol kesehatan. Ganjar meminta kepala daerah lainnya di Jawa Tengah untuk menjaga sikap.'),
(23, 'Pasien Reinfeksi Covid-19 Sakit Lebih Parah', 4, '1602644025_3437519e96d34828866c.jpeg', 1, '2020-10-13', 'Jakarta, CNN Indonesia -- Seorang pria berusia 25 tahun dari Nevada mengalami reinfeksi virus corona dan lebih parah dari sebelumnya. Ini adalah kasus pertama reinfeksi atau infeksi ulang virus corona di AS dan kasus reinfeksi kelima yang dikonfirmasi di seluruh dunia.\r\n\"Infeksi kedua secara gejala lebih parah daripada yang pertama,\" penulis penelitian yang dimuat di The Lancet dikutip dari NPR.\r\n\r\nReinfeksi pada pasien Nevada terjadi sekitar enam minggu, menurut sebuah studi kasus yang diterbitkan Senin di jurnal medis The Lancet. Pasien awalnya dinyatakan positif terkena virus pada bulan April dan memiliki gejala termasuk batuk dan mual. Dia pulih dan dites negatif untuk virus pada Mei lalu.\r\nTetapi pada akhir Mei, dia pergi ke pusat perawatan darurat dengan gejala termasuk demam, batuk, dan pusing. Pada awal Juni, dia dinyatakan positif lagi dan berakhir di rumah sakit.\r\n\r\nIni adalah kasus reinfeksi virus corona kedua yang dikonfirmasi di mana pasien menjadi lebih sakit untuk kedua kalinya. Seorang pasien di Ekuador juga menderita kasus COVID-19 yang lebih serius saat kedua kalinya mereka terinfeksi virus.\r\n\r\nIlmuwan tidak yakin mengapa ini mungkin terjadi. Secara teori, sistem kekebalan tubuh harus membuat antibodi setelah infeksi pertama yang membantunya memerangi virus dengan lebih efektif jika orang tersebut terpapar virus yang sama lagi.'),
(24, 'Terancam, BTS 5G Huawei Tergantung Teknologi AS', 2, '1602644191_6f441fd92b6c4e9446c3.jpeg', 3, '2020-10-13', 'Jakarta, CNN Indonesia -- Huawei ternyata masih ketergantungan dengan teknologi Amerika Serikat (AS) untuk membuat menara BTS 5G.\r\nSebab, sekitar 30 persen komponen dari menara telekomunikasi dengan teknologi 5G itu masih menggunakan layanan 5G.\r\n\r\nPadahal penjualan menara BTS 5G menjadi sumber pendapatan terbesar perusahaan asal China itu. Pasalnya, sejak 14 September lalu, AS tengah memberlakukan pelarangan penggunaan teknologi AS untuk Huawei.\r\n\r\nAS san Cina tengah menghadapi perang sengit terkait siapa yang akan menguasai teknologi telekomunikasi masa depan itu.\r\nSaat unit perangkat BTS jaringan generasi kelima Huawei dibongkar, bagian perangkat keras yang bernilai sekitar 30 persen dari nilai produk itu merupakan buatan AS. Selain itu, chip yang menjadi komponen utama perangkat ini juga dipasok oleh perusahaan semikonduktor Taiwan, TSMC.\r\nTemuan ini menunjukkan Huawei saat ini mesti mencari cara untuk bisa tetap menjual perangkat BTS 5G tanpa bergantung dengan AS. Saat ini, perusahaan itu harus puas memproduksi BTS dengan persediaan chip yang ada.\r\n\r\nAS pun sudah memblokir semua perusahaan yang menggunakan teknologi AS untuk memasok perangkat keras dan lunak kepada Huawei. Perusahaan yang melanggar aturan ini terancam mendapat sanksi dari negara adidaya itu.\r\n\r\nPada bagian chip yang menjadi otak perangkat BTS Huawei, tertulis kode, \"Hi1382 TAIWAN\". Kode Hi pada chip ini mewakili HiSilicon, anak perusahaan desain chip Huawei.\r\n\r\nKode ini menunjukkan prosesor ini dikembangkan oleh HiSilicon dan diproduksi oleh Taiwan Semiconductor Manufacturing Co. (TSMC). Ini adalah pabrik semikonduktor yang sebelumnya memegang kontrak produksi chip terbesar di dunia dan pemasok utama Apple.\r\n\r\nKepada investor, TSMC mengumumkan akan menangguhkan pasokan ke Huawei. Sementara pembuat semikonduktor terbesar China menyebut telah mengajukan aplikasi lisensi ekspor ke AS. Dalam lisensi itu mencakup beberapa produk Huawei. Perusahaan itu juga berkomitmen untuk patuh terhadap semua aturan ekspor AS.\r\n\r\nLihat juga: Imbas Sanksi AS HP Huawei Mulai Langka, Harga Seken Naik\r\nSementara itu, MediaTek, pembuat chip seluler terbesar kedua di dunia setelah Qualcomm, juga mengonfirmasi telah mengajukan izin untuk melanjutkan bisnis dengan Huawei.\r\n\r\nNamun, Intel dan AMD sudah berhasil mendapat izin AS. Sementara nasib Qualcomm, Samsung, dan MediaTek, masih belum jelas, seperti dilaporkan GizmoChina. \r\n\r\nNikkei Asia melaporkan mereka membongkar unit baseband 5G Huawei dengan bantuan laboratorium teknis di Tokyo, Fomalhaut Techno Solutions. \r\n\r\nUnit dengan dimensi 48 cm x 9 cm x 34 cm dan berat sekitar 10 kg ini biasanya ditempatkan di atap gedung. Fungsinya untuk memproses telekomunikasi suara dan data untuk komunikasi seluler.\r\n\r\nTotal harga unit BTS Huawei US$1.320 atau sekitar Rp1,9 juta (kurs 1US$=Rp14.764,8). Komponen buatan China untuk unit ini sebesar 48,2 persen. Lebih tinggi dari kadar ponsel buatan Huawei, Mate30 yang hanya 41,8 persen.'),
(39, 'dsjsjsdff', 1, '1603260759_a7fbccb807c029311a30.png', 7, '2020-10-21', 'dndnjsdjjhhjhjb'),
(41, 'sjdiajsd', 1, '1603263673_1b0deb4604618de90af9.png', 9, '2020-10-21', 'dfsfsfdf'),
(43, 'ses', 1, '1603263878_0643a4fa4c1e249974d0.png', 8, '2020-10-21', 'xvdf');

-- --------------------------------------------------------

--
-- Table structure for table `kategori`
--

CREATE TABLE `kategori` (
  `id_kategori` int(11) NOT NULL,
  `nama_kategori` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `kategori`
--

INSERT INTO `kategori` (`id_kategori`, `nama_kategori`) VALUES
(1, 'ekonomi'),
(2, 'teknologi'),
(3, 'olahraga'),
(4, 'kesehatan');

-- --------------------------------------------------------

--
-- Stand-in structure for view `news`
-- (See below for the actual view)
--
CREATE TABLE `news` (
`id_berita` int(11)
,`foto` varchar(50)
,`title` varchar(100)
,`id_user` int(11)
,`tanggal_dibuat` date
,`konten_berita` longtext
,`nama_kategori` varchar(25)
,`nama_Author` varchar(50)
);

-- --------------------------------------------------------

--
-- Table structure for table `profile`
--

CREATE TABLE `profile` (
  `id_user` int(11) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `phone` varchar(13) NOT NULL,
  `pekerjaan` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `profile`
--

INSERT INTO `profile` (`id_user`, `nama`, `phone`, `pekerjaan`) VALUES
(1, 'shak', '+628989836', ''),
(2, 'shushuko', '55558588', 'gamer'),
(3, 'suku', '89634', ''),
(7, 'shaka ', '895', 'gamers'),
(8, ' zbsjs', '565653565', 'sjksizj'),
(9, ' shaka', '55555', 'dfsdfds');

-- --------------------------------------------------------

--
-- Table structure for table `rekomendasi`
--

CREATE TABLE `rekomendasi` (
  `id_rekomen` int(11) NOT NULL,
  `id_berita` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `rekomendasi`
--

INSERT INTO `rekomendasi` (`id_rekomen`, `id_berita`) VALUES
(1, 14),
(4, 15),
(5, 17),
(3, 19),
(2, 24);

-- --------------------------------------------------------

--
-- Stand-in structure for view `rekomen_news`
-- (See below for the actual view)
--
CREATE TABLE `rekomen_news` (
`id_berita` int(11)
,`foto` varchar(50)
,`title` varchar(100)
,`id_user` int(11)
,`tanggal_dibuat` date
,`konten_berita` longtext
,`nama_kategori` varchar(25)
,`nama_Author` varchar(50)
);

-- --------------------------------------------------------

--
-- Table structure for table `userlogin`
--

CREATE TABLE `userlogin` (
  `id_user` int(11) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `userlogin`
--

INSERT INTO `userlogin` (`id_user`, `email`, `password`) VALUES
(1, 'sha@mail.com', '8cb2237d0679ca88db6464eac60da96345513964'),
(2, 'shuk@mail.com', '7c4a8d09ca3762af61e59520943dc26494f8941b'),
(3, 'shuki@mail.com', '7c4a8d09ca3762af61e59520943dc26494f8941b'),
(4, 'sfsfsf@mail.com', '7c4a8d09ca3762af61e59520943dc26494f8941b'),
(5, 'sffdsf@email.com', '7c4a8d09ca3762af61e59520943dc26494f8941b'),
(6, 'aji@mail.com', '7c4a8d09ca3762af61e59520943dc26494f8941b'),
(7, 'shakaatsui29@gmail.com', '7c4a8d09ca3762af61e59520943dc26494f8941b'),
(8, 'shu@mail.com', '7c4a8d09ca3762af61e59520943dc26494f8941b'),
(9, 'shuo@mail.com', '7c4a8d09ca3762af61e59520943dc26494f8941b');

-- --------------------------------------------------------

--
-- Structure for view `account`
--
DROP TABLE IF EXISTS `account`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `account`  AS  select `userlogin`.`id_user` AS `id_user`,`userlogin`.`email` AS `email`,`userlogin`.`password` AS `password`,`profile`.`nama` AS `nama`,`profile`.`phone` AS `phone`,`profile`.`pekerjaan` AS `pekerjaan` from (`userlogin` join `profile` on(`profile`.`id_user` = `userlogin`.`id_user`)) ;

-- --------------------------------------------------------

--
-- Structure for view `news`
--
DROP TABLE IF EXISTS `news`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `news`  AS  select `berita`.`id_berita` AS `id_berita`,`berita`.`foto` AS `foto`,`berita`.`title` AS `title`,`berita`.`id_user` AS `id_user`,`berita`.`tanggal_dibuat` AS `tanggal_dibuat`,`berita`.`konten_berita` AS `konten_berita`,`kategori`.`nama_kategori` AS `nama_kategori`,`profile`.`nama` AS `nama_Author` from (`profile` left join (`berita` left join `kategori` on(`kategori`.`id_kategori` = `berita`.`id_kategori`)) on(`profile`.`id_user` = `berita`.`id_user`)) where `berita`.`id_berita` is not null order by `berita`.`id_berita` desc ;

-- --------------------------------------------------------

--
-- Structure for view `rekomen_news`
--
DROP TABLE IF EXISTS `rekomen_news`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `rekomen_news`  AS  select `rekomendasi`.`id_berita` AS `id_berita`,`berita`.`foto` AS `foto`,`berita`.`title` AS `title`,`berita`.`id_user` AS `id_user`,`berita`.`tanggal_dibuat` AS `tanggal_dibuat`,`berita`.`konten_berita` AS `konten_berita`,`kategori`.`nama_kategori` AS `nama_kategori`,`profile`.`nama` AS `nama_Author` from (((`rekomendasi` join `berita` on(`berita`.`id_berita` = `rekomendasi`.`id_berita`)) join `kategori` on(`kategori`.`id_kategori` = `berita`.`id_kategori`)) join `profile` on(`profile`.`id_user` = `berita`.`id_user`)) order by `rekomendasi`.`id_berita` desc ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `berita`
--
ALTER TABLE `berita`
  ADD PRIMARY KEY (`id_berita`),
  ADD KEY `id_kategori` (`id_kategori`),
  ADD KEY `id_kategori_2` (`id_kategori`),
  ADD KEY `id_user` (`id_user`);

--
-- Indexes for table `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`id_kategori`);

--
-- Indexes for table `profile`
--
ALTER TABLE `profile`
  ADD KEY `id_user` (`id_user`);

--
-- Indexes for table `rekomendasi`
--
ALTER TABLE `rekomendasi`
  ADD PRIMARY KEY (`id_rekomen`),
  ADD KEY `id_berita` (`id_berita`);

--
-- Indexes for table `userlogin`
--
ALTER TABLE `userlogin`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `berita`
--
ALTER TABLE `berita`
  MODIFY `id_berita` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT for table `kategori`
--
ALTER TABLE `kategori`
  MODIFY `id_kategori` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `rekomendasi`
--
ALTER TABLE `rekomendasi`
  MODIFY `id_rekomen` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `userlogin`
--
ALTER TABLE `userlogin`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `berita`
--
ALTER TABLE `berita`
  ADD CONSTRAINT `berita_ibfk_1` FOREIGN KEY (`id_kategori`) REFERENCES `kategori` (`id_kategori`),
  ADD CONSTRAINT `berita_ibfk_2` FOREIGN KEY (`id_user`) REFERENCES `userlogin` (`id_user`);

--
-- Constraints for table `profile`
--
ALTER TABLE `profile`
  ADD CONSTRAINT `profile_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `userlogin` (`id_user`);

--
-- Constraints for table `rekomendasi`
--
ALTER TABLE `rekomendasi`
  ADD CONSTRAINT `rekomendasi_ibfk_1` FOREIGN KEY (`id_berita`) REFERENCES `berita` (`id_berita`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
