SQL Server: Temelden İleri Seviyeye Sorgu Günlüğüm
Bu depo, @MuratYucedag Murat Yücedağ'ın SQL eğitim serisi boyunca yazdığım, temel CRUD işlemlerinden karmaşık veritabanı mantığına kadar uzanan yaklaşık 1000 satırlık uygulama kodlarını içermektedir.

 Neler Öğrendim & Uyguladım?
-Bu süreçte bir veritabanı geliştiricisi için kritik olan şu konuları adım adım deneyimledim:
-Temel SQL (DML & DDL): Create, Alter, Drop ile tablo yönetimi; Insert, Update, Delete ile veri manipülasyonu.
-İlişkisel Veritabanı Mantığı: Inner Join, Left/Right Join ve Full Join kullanarak tablolar arası bağ kurma.
-Gelişmiş Sorgulama: Subqueries (Alt sorgular), Group By, Having ve karmaşık filtreleme (Like, In, Between).

Programlanabilirlik
Stored Procedures: Tekrar eden işleri otomatize eden parametreli prosedürler.

Triggers: Veri değişimlerinde (Insert/Delete) stok ve sayaç güncelleyen tetikleyiciler.
User Defined Functions: Skaler ve tablo sonuçlu fonksiyonlar ile özel hesaplamalar.

Veri Yönetimi & Performans:
Transaction Yönetimi: Commit ve Rollback ile veri güvenliği.
Indexing: Büyük veri setlerinde (250.000+ satır) Clustered Index kullanarak sorgu performans optimizasyonu ve Statistics IO takibi.

📂 Proje Yapısı
Aşama 1: Temel öğrenci-not sistemi ve temel operatörler.
Aşama 2: SatisVT ve DbYeni veritabanları üzerinden ticari mantık (Stok, Hareket, Kasa takibi).
Aşama 3: T-SQL Değişkenler, döngüler (While), karar yapıları (If-Else, Case).
