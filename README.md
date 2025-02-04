Proje Hakkında
Otel Rezervasyonu Projesi, kullanıcıların belirli tarihler arasında otel odalarını rezervasyon yapmalarını sağlayan basit bir uygulamadır. Uygulama, Windows Forms ile geliştirilmiş olup, SQL Server veritabanını kullanarak otel odalarını ve rezervasyonları yönetir. Kullanıcılar giriş yaptıktan sonra sistem üzerinden müsait odaları görüp, rezervasyon işlemi yapabilirler.

Özellikler
Kullanıcı girişi
Otel odası listesi
Müsaitlik kontrolü
Oda rezervasyonu
Rezervasyon tarih aralığı seçimi
Kullanılan Teknolojiler
Backend: C# (.NET Framework)
Veritabanı: Microsoft SQL Server
ORM: Entity Framework (Opsiyonel)
UI: Windows Forms
Kurulum
1. SQL Server Kurulumu
Projede kullanılan veritabanını kurmak için aşağıdaki SQL komutlarını kullanarak OtelRezervasyonu adlı veritabanını oluşturun.

sql
Kopyala
Düzenle
CREATE DATABASE OtelRezervasyonu;
Daha sonra, veritabanınızdaki gerekli tabloları oluşturun (tabloların yapısı projeye dahil olmalı).

2. Projeyi İndirme ve Çalıştırma
Visual Studio veya Visual Studio Code kullanarak projeyi açın.
connectionString kısmını, bilgisayarınızda çalışan SQL Server'ın bağlantı bilgilerine göre güncelleyin:
csharp
Kopyala
Düzenle
private string connectionString = "Data Source=YOUR_SERVER;Initial Catalog=OtelRezervasyonu;Integrated Security=True";
Projeyi çalıştırın (F5 tuşuna basarak).
3. Veritabanı Bağlantısı
Veritabanı bağlantınızı aşağıdaki gibi ayarlayın:

csharp
Kopyala
Düzenle
private string connectionString = "Data Source=YOUR_SERVER;Initial Catalog=OtelRezervasyonu;Integrated Security=True";
Veritabanı bağlantısını doğru şekilde yapılandırarak, otel odalarınızı ve rezervasyonları yönetebilirsiniz.

Kullanım
1. Giriş Yapın
Sistemi kullanmaya başlamak için bir kullanıcı hesabı oluşturun ve giriş yapın.

2. Oda Seçimi
Müsait olan otel odalarını listeleyin. Her odanın fiyatını, kapasitesini ve özelliklerini görüntüleyebilirsiniz.

3. Rezervasyon Yapın
Oda seçimi yaptıktan sonra tarih aralığını belirleyin ve rezervasyonunuzu tamamlayın.

4. Veritabanı İşlemleri
Yapılan rezervasyonlar veritabanına kaydedilir. Yönetici, rezervasyonları sorgulayabilir ve yönetebilir.
