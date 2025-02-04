
using System;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Threading;

namespace OtelRezervasyonu1
{
    internal class Menu
    {
        private string connectionString = "Data Source=DESKTOP-QI8PFGU;Integrated Security=True";

        public void Baslat()
        {
            if (Giris())
            {
                MainMenu();
            }
        }
        private bool Giris()
        {
            while (true)
            {
                Console.Clear();
                Console.ForegroundColor = ConsoleColor.Cyan;
                Console.WriteLine("OTEL REZERVASYON UYGULAMASI");

                Console.Write("Kullanıcı Adı: ");
                string username = Console.ReadLine();

                Console.Write("Şifre: ");
                string password = Console.ReadLine();

                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    connection.Open();
                    string query = "SELECT COUNT(*) FROM Kullanici WHERE KullaniciAdi = @username AND Sifre = @password ";
                    SqlCommand command = new SqlCommand(query, connection);
                    command.Parameters.AddWithValue("@username", username);
                    command.Parameters.AddWithValue("@password", password);

                    int count = (int)command.ExecuteScalar();

                    if (count > 0)
                    {
                        return true;
                    }
                    else
                    {
                        Console.WriteLine("Hatalı kullanıcı adı veya şifre. Tekrar deneyin.");
                        Thread.Sleep(2000);
                    }
                }
            }
        }
        public void MainMenu()
            {
                while (true)
                {
                    Console.Clear();
                    Console.WriteLine("╔════════════════════════════════════════════════════╗");
                    Console.WriteLine("║     Otel Rezervasyon Uygulamasına Hoşgeldiniz      ║");
                    Console.WriteLine("╠════════════════════════════════════════════════════╣");
                    Console.WriteLine("║                      Ana Menü                      ║");
                    Console.WriteLine("╠════════════════════════════════════════════════════╣");
                    Console.WriteLine("║ 1. Müşteri İşlemleri                               ║");
                    Console.WriteLine("║ 2. Oda İşlemleri                                   ║");
                    Console.WriteLine("║ 3. Rezervasyon İşlemleri                           ║");
                    Console.WriteLine("║ 4. Fatura İşlemleri                                ║");
                    Console.WriteLine("║ 5. Kasa Göster                                     ║");
                    Console.WriteLine("║ 0. Sistemi Kapat                                   ║");
                    Console.WriteLine("╠════════════════════════════════════════════════════╣");
                    Console.WriteLine("║ İşlem Seç:                                         ║");
                    Console.WriteLine("╚════════════════════════════════════════════════════╝");

                    Console.SetCursorPosition(12, 12);
                    string process = Console.ReadLine();

                    Console.Clear();

                    switch (process)
                    {
                        case "1":
                            CustomerMenu();
                            break;
                        case "2":
                            RoomMenu();
                            break;
                        case "3":
                            ReservationMenu();
                            break;
                        case "4":
                            FaturaMenu();
                            break;
                        case "5":
                            KasaMenu();
                            break;
                        case "0":
                            Console.WriteLine("Sistem Kapatılıyor...");
                            Thread.Sleep(3000);
                            Environment.Exit(0);
                            break;
                        default:
                            Console.WriteLine("Tanımsız Seçim.");
                            Thread.Sleep(2000);
                            break;
                    }
                }
            }



            public void CustomerMenu()
            {
                Console.Clear();
                bool status = true;
                while (status)
                {
                    Console.Clear();
                    Console.WriteLine("╔════════════════════════════════════════════════════╗");
                    Console.WriteLine("║                    Otel Rezervasyon                ║");
                    Console.WriteLine("╠════════════════════════════════════════════════════╣");
                    Console.WriteLine("║                   Müşteri İşlemleri                ║");
                    Console.WriteLine("╠════════════════════════════════════════════════════╣");
                    Console.WriteLine("║ 1. Müşteri Listesi                                 ║");
                    Console.WriteLine("║ 2. Müşteri Ekle                                    ║");
                    Console.WriteLine("║ 3. Müşteri Güncelle                                ║");
                    Console.WriteLine("║ 4. Müşteri Sil                                     ║");
                    Console.WriteLine("║ 0. Ana Menüye Dön                                  ║");
                    Console.WriteLine("╠════════════════════════════════════════════════════╣");
                    Console.WriteLine("║ İşlem Seç:                                         ║");
                    Console.WriteLine("╚════════════════════════════════════════════════════╝");

                    string process = Console.ReadLine();

                    Console.Clear();

                    switch (process)
                    {
                        case "1":
                            GetAllCustomers();
                            break;
                        case "2":
                            AddCustomer();
                            break;
                        case "3":
                            UpdateCustomer();
                            break;
                        case "4":
                            DeleteCustomer();
                            break;
                        case "0":
                            Console.WriteLine("Ana Menüye Dönülüyor...");
                            Thread.Sleep(2000);
                            status = false;
                            break;
                        default:
                            Console.WriteLine("Tanımsız Seçim.");
                            Thread.Sleep(2000);
                            break;
                    }
                }
            }
            public void RoomMenu()
            {
                bool status = true;
                while (status)
                {
                    Console.Clear();
                    Console.WriteLine("╔════════════════════════════════════════════════════╗");
                    Console.WriteLine("║                    Otel Rezervasyon                ║");
                    Console.WriteLine("╠════════════════════════════════════════════════════╣");
                    Console.WriteLine("║                     Oda İşlemleri                  ║");
                    Console.WriteLine("╠════════════════════════════════════════════════════╣");
                    Console.WriteLine("║ 1. Oda Listesi                                     ║");
                    Console.WriteLine("║ 2. Oda Ekle                                        ║");
                    Console.WriteLine("║ 3. Oda Güncelle                                    ║");
                    Console.WriteLine("║ 4. Oda Sil                                         ║");
                    Console.WriteLine("║ 0. Ana Menüye Dön                                  ║");
                    Console.WriteLine("╠════════════════════════════════════════════════════╣");
                    Console.WriteLine("║ İşlem Seç:                                         ║");
                    Console.WriteLine("╚════════════════════════════════════════════════════╝");

                    string process = Console.ReadLine();

                    Console.Clear();

                    switch (process)
                    {
                        case "1":
                            GetAllRooms();
                            break;
                        case "2":
                            AddRoom();
                            break;
                        case "3":
                            UpdateRoom();
                            break;
                        case "4":
                            DeleteRoom();
                            break;
                        case "0":
                            Console.WriteLine("Ana Menüye Dönülüyor...");
                            Thread.Sleep(2000);
                            status = false;
                            break;
                        default:
                            Console.WriteLine("Tanımsız Seçim.");
                            Thread.Sleep(2000);
                            break;
                    }
                }
            }
            public void ReservationMenu()
            {
                bool status = true;
                while (status)
                {
                    Console.Clear();
                    Console.WriteLine("╔════════════════════════════════════════════════════╗");
                    Console.WriteLine("║                    Otel Rezervasyon                ║");
                    Console.WriteLine("╠════════════════════════════════════════════════════╣");
                    Console.WriteLine("║                  Rezervasyon İşlemleri             ║");
                    Console.WriteLine("╠════════════════════════════════════════════════════╣");
                    Console.WriteLine("║ 1. Rezervasyon Listesi                             ║");
                    Console.WriteLine("║ 2. Rezervasyon Ekle                                ║");
                    Console.WriteLine("║ 3. Rezervasyon Güncelle                            ║");
                    Console.WriteLine("║ 4. Rezervasyon Sil                                 ║");
                    Console.WriteLine("║ 0. Ana Menüye Dön                                  ║");
                    Console.WriteLine("╠════════════════════════════════════════════════════╣");
                    Console.WriteLine("║ İşlem Seç:                                         ║");
                    Console.WriteLine("╚════════════════════════════════════════════════════╝");

                    string process = Console.ReadLine();

                    Console.Clear();

                    switch (process)
                    {
                        case "1":
                            GetAllReservations();
                            break;
                        case "2":
                            AddReservation();
                            break;
                        case "3":
                            UpdateReservation();
                            break;
                        case "4":
                            DeleteReservation();
                            break;
                        case "0":
                            Console.WriteLine("Ana Menüye Dönülüyor...");
                            Thread.Sleep(2000);
                            status = false;
                            break;
                        default:
                            Console.WriteLine("Tanımsız Seçim.");
                            Thread.Sleep(2000);
                            break;
                    }
                }
            }
            public void FaturaMenu()
            {
                Console.Clear();
                Console.WriteLine($"                          ╔════════════════════════════════════════════════════╗");
                Console.WriteLine($"                          ║                    Fatura Listesi                 ║");
                Console.WriteLine($"                          ╚════════════════════════════════════════════════════╝");

                try
                {
                    using (SqlConnection connection = new SqlConnection(connectionString))
                    {
                        // Faturaları listele
                        SqlCommand command = new SqlCommand("FaturaListele", connection);
                        command.CommandType = CommandType.StoredProcedure;
                        connection.Open();

                        SqlDataReader reader = command.ExecuteReader();

                        bool hasData = false;
                        while (reader.Read())
                        {
                            if (!hasData)
                            {
                                hasData = true;
                            }

                            // Bilgileri konsola yazdır
                            Console.WriteLine($"ID: {reader["FaturaID"],-8} | RezervasyonID: {reader["RezervasyonID"],-14} | ToplamTutar: {reader["ToplamTutar"],-11} | Ödeme Tarihi: {reader["OdemeTarihi"],-10}");
                            Console.WriteLine("---------------------------------------------------------------------------------------------------");
                        }

                        if (!hasData)
                        {
                            Console.WriteLine("Fatura listesinde kayıt bulunmamaktadır.");
                        }

                        reader.Close();
                    }

                    // Kasa tablosunu güncelle
                    using (SqlConnection connection = new SqlConnection(connectionString))
                    {
                        SqlCommand updateKasaCommand = new SqlCommand("KasaGuncelle", connection);
                        updateKasaCommand.CommandType = CommandType.StoredProcedure;
                        connection.Open();
                        updateKasaCommand.ExecuteNonQuery();
                    }
                }
                catch (Exception ex)
                {
                    Console.WriteLine("Bir hata oluştu: " + ex.Message);
                }

                Console.WriteLine("Ana Menüye dönmek için bir tuşa basın...");
                Console.ReadKey();
            }
            private void KasaMenu()
            {
                Console.Clear();
                Console.WriteLine($"                          ╔════════════════════════════════════════════════════╗");
                Console.WriteLine($"                          ║                    Kasa Bilgileri                 ║");
                Console.WriteLine($"                          ╚════════════════════════════════════════════════════╝");

                decimal toplamTutar = 0;

                try
                {
                    using (SqlConnection conn = new SqlConnection(connectionString))
                    {
                        SqlCommand command = new SqlCommand("SELECT KasaID, FaturaID, Tutar, Tarih FROM Kasa WHERE IsDelete = 0", conn);
                        conn.Open();

                        SqlDataReader reader = command.ExecuteReader();

                        bool hasData = false;
                        while (reader.Read())
                        {
                            if (!hasData)
                            {
                                hasData = true;
                            }

                            // Bilgileri konsola yazdır
                            Console.WriteLine($"Kasa ID: {reader["KasaID"],-8} | Fatura ID: {reader["FaturaID"],-10} | Tutar: {reader["Tutar"],-10} | Tarih: {reader["Tarih"],-10}");
                            Console.WriteLine("---------------------------------------------------------------------------------------------------");

                            // Toplam tutarı hesapla
                            toplamTutar += Convert.ToDecimal(reader["Tutar"]);
                        }

                        if (!hasData)
                        {
                            Console.WriteLine("Kasa listesinde kayıt bulunmamaktadır.");
                        }

                        reader.Close();
                    }

                    // Toplam tutarı ekrana yazdır
                    string toplamTutarStr = "Toplam Tutar: " + toplamTutar.ToString("C");
                    int consoleWidth = Console.WindowWidth;
                    int padding = (consoleWidth - toplamTutarStr.Length) / 2;

                    Console.WriteLine();
                    Console.WriteLine(new string(' ', padding) + toplamTutarStr);
                    Console.WriteLine();
                }
                catch (Exception ex)
                {
                    Console.WriteLine("Bir hata oluştu: " + ex.Message);
                }

                Console.WriteLine();
                Console.WriteLine("Ana Menüye dönmek için bir tuşa basın...");
                Console.ReadKey();
            }




            private void GetAllCustomers()
            {
                Console.Clear();
                Console.WriteLine($"                          ╔════════════════════════════════════════════════════╗");
                Console.WriteLine($"                          ║                    Müşteri Listesi                 ║");
                Console.WriteLine($"                          ╚════════════════════════════════════════════════════╝");

                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    SqlCommand command = new SqlCommand("MusteriListele", connection);
                    command.CommandType = System.Data.CommandType.StoredProcedure;

                    connection.Open();
                    SqlDataReader reader = command.ExecuteReader();

                    bool hasData = false;
                    while (reader.Read())
                    {
                        if (!hasData)
                        {
                            hasData = true;
                        }
                        Console.WriteLine($"Id: {reader["MusteriID"],-3} Ad: {reader["Ad"],-15} Soyad: {reader["Soyad"],-15} Telefon: {reader["Telefon"],-15} Email: {reader["Email"],-30}");
                        Console.WriteLine("---------------------------------------------------------------------------------------------------");
                    }

                    if (!hasData)
                    {
                        Console.WriteLine("Müşteri listesinde kayıt bulunmamaktadır.");
                    }

                    reader.Close();
                }

                Console.WriteLine("Ana Menüye dönmek için bir tuşa basın...");
                Console.ReadKey();
            }
            private void GetAllRooms()
            {
                try
                {
                    Console.Clear();
                    Console.WriteLine("                          ╔════════════════════════════════════════════════════╗");
                    Console.WriteLine("                          ║                    Oda Listesi                     ║");
                    Console.WriteLine("                          ╚════════════════════════════════════════════════════╝");

                    using (SqlConnection connection = new SqlConnection(connectionString))
                    {
                        SqlCommand command = new SqlCommand("OdaListele", connection);
                        command.CommandType = CommandType.StoredProcedure;

                        connection.Open();
                        SqlDataReader reader = command.ExecuteReader();

                        if (reader.HasRows)
                        {
                            while (reader.Read())
                            {
                                Console.WriteLine($"Id:{reader["OdaID"],-5} No:{reader["OdaNo"],-10} Yatak:{reader["YatakSayisi"],-10} Durum:{reader["Durum"],-15} Kat:{reader["Kat"],-5} Fiyat:{reader["Fiyat"] + " TL"}");
                                Console.WriteLine("---------------------------------------------------------------------------------------------------");
                            }
                        }
                        else
                        {
                            Console.WriteLine("Listeye ait veri bulunamadı.");
                        }
                        reader.Close();
                    }
                }
                catch (Exception ex)
                {
                    Console.WriteLine($"Bir hata oluştu: {ex.Message}");
                }

                Console.WriteLine("Ana Menüye dönmek için bir tuşa basın...");
                Console.ReadKey();
            }
            private void GetAllReservations()
            {
                Console.Clear();
                Console.WriteLine("                          ╔════════════════════════════════════════════════════╗");
                Console.WriteLine("                          ║                    Rezervasyon Listesi             ║");
                Console.WriteLine("                          ╚════════════════════════════════════════════════════╝");

                try
                {
                    using (SqlConnection connection = new SqlConnection(connectionString))
                    {
                        SqlCommand command = new SqlCommand("RezervasyonListele", connection);
                        command.CommandType = CommandType.StoredProcedure;

                        connection.Open();
                        SqlDataReader reader = command.ExecuteReader();

                        bool hasRecords = false;

                        while (reader.Read())
                        {
                            hasRecords = true;
                            DateTime girisTarihi = (DateTime)reader["GirisTarihi"];
                            DateTime cikisTarihi = (DateTime)reader["CikisTarihi"];
                            decimal toplamFiyat = (decimal)reader["ToplamFiyat"];

                            Console.WriteLine($"Id:{reader["RezervasyonID"],-5} MusteriID:{reader["MusteriID"],-5} OdaID:{reader["OdaID"],-5} GirisTarihi:{girisTarihi:yyyy-MM-dd} CikisTarihi:{cikisTarihi:yyyy-MM-dd} ToplamFiyat:{toplamFiyat,-10} ");
                            Console.WriteLine("---------------------------------------------------------------------------------------------------");
                        }

                        if (!hasRecords)
                        {
                            Console.WriteLine("Hiç rezervasyon bulunamadı.");
                        }

                        reader.Close();
                    }
                }
                catch (Exception ex)
                {
                    Console.WriteLine("Bir hata oluştu: " + ex.Message);
                }

                Console.WriteLine("Ana Menüye dönmek için bir tuşa basın...");
                Console.ReadKey();
            }











            private void AddCustomer()
            {
                Console.Clear();
                Console.WriteLine("                          ╔════════════════════════════════════════════════════╗");
                Console.WriteLine("                          ║                    Müşteri Ekle                    ║");
                Console.WriteLine("                          ╚════════════════════════════════════════════════════╝");
                Console.WriteLine("Müşteri Adı: ");
                string ad = Console.ReadLine().Trim();
                Console.WriteLine("Müşteri Soyadı: ");
                string soyad = Console.ReadLine().Trim();
                Console.WriteLine("Müşteri Telefon: ");
                string telefon = Console.ReadLine().Trim();
                Console.WriteLine("Müşteri Email: ");
                string email = Console.ReadLine().Trim();

                if (string.IsNullOrEmpty(ad) || string.IsNullOrEmpty(soyad) || string.IsNullOrEmpty(telefon) || string.IsNullOrEmpty(email))
                {
                    Console.WriteLine("Hiçbir değer boş bırakılamaz. Ana Menüye dönmek için bir tuşa basın...");
                    Console.ReadKey();
                    return;
                }

                if (telefon.Length != 11 || !telefon.All(char.IsDigit))
                {
                    Console.WriteLine("Telefon numarası 11 haneli olmalı ve sadece rakamlardan oluşmalıdır. Ana Menüye dönmek için bir tuşa basın...");
                    Console.ReadKey();
                    return;
                }

                try
                {
                    using (SqlConnection connection = new SqlConnection(connectionString))
                    {
                        SqlCommand command = new SqlCommand("MusteriEkle", connection);
                        command.CommandType = CommandType.StoredProcedure;

                        command.Parameters.AddWithValue("@Ad", ad);
                        command.Parameters.AddWithValue("@Soyad", soyad);
                        command.Parameters.AddWithValue("@Email", email);
                        command.Parameters.AddWithValue("@Telefon", telefon);

                        connection.Open();
                        command.ExecuteNonQuery();
                    }
                    Console.WriteLine("Müşteri başarıyla eklendi. Ana Menüye dönmek için bir tuşa basın...");
                }
                catch (Exception ex)
                {
                    Console.WriteLine("Bir hata oluştu: " + ex.Message);
                }

                Console.ReadKey();
            }

            private void AddRoom()
            {
                Console.Clear();
                Console.WriteLine("                          ╔════════════════════════════════════════════════════╗");
                Console.WriteLine("                          ║                    Oda Ekle                        ║");
                Console.WriteLine("                          ╚════════════════════════════════════════════════════╝");

                Console.WriteLine("Oda Numarası: ");
                int odaNo = int.Parse(Console.ReadLine());

                Console.WriteLine("Yatak Sayısı: ");
                int yatakSayisi = int.Parse(Console.ReadLine());

                string durum;
                while (true)
                {
                    Console.WriteLine("Oda Durumu (Tadilatta / Boş / Temizleniyor / Dolu / Rezerve): ");
                    durum = Console.ReadLine();

                    // Geçerli durumları tanımla
                    var validDurums = new[] { "Tadilatta", "Boş", "Temizleniyor", "Dolu", "Rezerve" };

                    if (Array.Exists(validDurums, d => d.Equals(durum, StringComparison.OrdinalIgnoreCase)))
                    {
                        break; // Geçerli durum, döngüden çık
                    }
                    else
                    {
                        Console.WriteLine("Geçersiz durum. Lütfen geçerli bir durum girin.");
                    }
                }

                Console.WriteLine("Kat: ");
                int kat = int.Parse(Console.ReadLine());

                Console.WriteLine("Fiyat: ");
                decimal fiyat = decimal.Parse(Console.ReadLine());

                try
                {
                    using (SqlConnection connection = new SqlConnection(connectionString))
                    {
                        connection.Open();

                        // Oda numarasının mevcut olup olmadığını kontrol et
                        string checkQuery = "SELECT COUNT(*) FROM Oda WHERE OdaNo = @OdaNo AND IsDelete = 0";
                        SqlCommand checkCommand = new SqlCommand(checkQuery, connection);
                        checkCommand.Parameters.AddWithValue("@OdaNo", odaNo);
                        int count = (int)checkCommand.ExecuteScalar();

                        if (count > 0)
                        {
                            Console.WriteLine("Bu oda numarası zaten mevcut. Lütfen başka bir numara girin.");
                        }
                        else
                        {
                            // Oda ekleme işlemi
                            SqlCommand command = new SqlCommand("OdaEkle", connection);
                            command.CommandType = CommandType.StoredProcedure;
                            command.Parameters.AddWithValue("@OdaNo", odaNo);
                            command.Parameters.AddWithValue("@YatakSayisi", yatakSayisi);
                            command.Parameters.AddWithValue("@Durum", durum);
                            command.Parameters.AddWithValue("@Kat", kat);
                            command.Parameters.AddWithValue("@Fiyat", fiyat);

                            command.ExecuteNonQuery();
                            Console.WriteLine("Oda başarıyla eklendi. Ana Menüye dönmek için bir tuşa basın...");
                        }
                    }
                }
                catch (Exception ex)
                {
                    Console.WriteLine($"Bir hata oluştu: {ex.Message}");
                }

                Console.ReadKey();
            }
            private void AddReservation()
            {
                Console.Clear();
                Console.WriteLine("                          ╔════════════════════════════════════════════════════╗");
                Console.WriteLine("                          ║                    Rezervasyon Ekle                ║");
                Console.WriteLine("                          ╚════════════════════════════════════════════════════╝");

                Console.WriteLine("Müşteri ID: ");
                int musteriId;
                if (!int.TryParse(Console.ReadLine(), out musteriId))
                {
                    Console.WriteLine("Geçersiz Müşteri ID. Ana Menüye dönmek için bir tuşa basın...");
                    Console.ReadKey();
                    return;
                }

                Console.WriteLine("Oda ID: ");
                int odaId;
                if (!int.TryParse(Console.ReadLine(), out odaId))
                {
                    Console.WriteLine("Geçersiz Oda ID. Ana Menüye dönmek için bir tuşa basın...");
                    Console.ReadKey();
                    return;
                }

                Console.WriteLine("Giriş Tarihi (YYYY-MM-DD): ");
                DateTime girisTarihi;
                if (!DateTime.TryParse(Console.ReadLine(), out girisTarihi))
                {
                    Console.WriteLine("Geçersiz Giriş Tarihi. Ana Menüye dönmek için bir tuşa basın...");
                    Console.ReadKey();
                    return;
                }

                Console.WriteLine("Çıkış Tarihi (YYYY-MM-DD): ");
                DateTime cikisTarihi;
                if (!DateTime.TryParse(Console.ReadLine(), out cikisTarihi))
                {
                    Console.WriteLine("Geçersiz Çıkış Tarihi. Ana Menüye dönmek için bir tuşa basın...");
                    Console.ReadKey();
                    return;
                }

                // Tarih kontrolü
                if (girisTarihi < DateTime.Now.Date || cikisTarihi < DateTime.Now.Date)
                {
                    Console.WriteLine("Geçmiş tarihler için rezervasyon yapılamaz.");
                    Console.WriteLine("Ana Menüye dönmek için bir tuşa basın...");
                    Console.ReadKey();
                    return;
                }

                if (cikisTarihi <= girisTarihi)
                {
                    Console.WriteLine("Çıkış tarihi giriş tarihinden önce veya aynı olamaz.");
                    Console.WriteLine("Ana Menüye dönmek için bir tuşa basın...");
                    Console.ReadKey();
                    return;
                }

                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    SqlCommand command = new SqlCommand("RezervasyonEkle", connection);
                    command.CommandType = CommandType.StoredProcedure;

                    command.Parameters.AddWithValue("@MusteriID", musteriId);
                    command.Parameters.AddWithValue("@OdaID", odaId);
                    command.Parameters.AddWithValue("@GirisTarihi", girisTarihi);
                    command.Parameters.AddWithValue("@CikisTarihi", cikisTarihi);

                    try
                    {
                        connection.Open();
                        command.ExecuteNonQuery();
                        Console.WriteLine("Rezervasyon başarıyla eklendi.");
                    }
                    catch (SqlException ex)
                    {
                        Console.WriteLine("Bir hata oluştu: " + ex.Message);
                    }
                }

                Console.WriteLine("Ana Menüye dönmek için bir tuşa basın...");
                Console.ReadKey();
            }








            private void UpdateCustomer()
            {
                Console.Clear();
                Console.WriteLine("                          ╔════════════════════════════════════════════════════╗");
                Console.WriteLine("                          ║                    Müşteri Güncelle                ║");
                Console.WriteLine("                          ╚════════════════════════════════════════════════════╝");
                Console.WriteLine("Güncellenecek Müşteri ID: ");
                int id = int.Parse(Console.ReadLine());
                Console.WriteLine("Yeni Ad: ");
                string ad = Console.ReadLine();
                Console.WriteLine("Yeni Soyad: ");
                string soyad = Console.ReadLine();
                Console.WriteLine("Yeni Telefon: ");
                string telefon = Console.ReadLine();
                Console.WriteLine("Yeni Email: ");
                string email = Console.ReadLine();

                try
                {
                    using (SqlConnection connection = new SqlConnection(connectionString))
                    {
                        connection.Open();

                        SqlCommand command = new SqlCommand("MusteriGuncelle", connection);
                        command.CommandType = CommandType.StoredProcedure;


                        command.Parameters.AddWithValue("@MusteriID", id);
                        command.Parameters.AddWithValue("@Ad", ad);
                        command.Parameters.AddWithValue("@Soyad", soyad);
                        command.Parameters.AddWithValue("@Telefon", telefon);
                        command.Parameters.AddWithValue("@Email", email);


                        int rowsAffected = command.ExecuteNonQuery();

                        if (rowsAffected > 0)
                        {
                            Console.WriteLine("Müşteri başarıyla güncellendi. Ana Menüye dönmek için bir tuşa basın...");
                        }
                        else
                        {
                            Console.WriteLine("Güncelleme başarısız oldu veya müşteri mevcut değil.");
                        }
                    }
                }
                catch (Exception ex)
                {
                    Console.WriteLine($"Bir hata oluştu: {ex.Message}");
                }

                Console.ReadKey();
            }
            private void UpdateRoom()
            {
                while (true)
                {
                    Console.Clear();
                    Console.WriteLine("                          ╔════════════════════════════════════════════════════╗");
                    Console.WriteLine("                          ║                    Oda Güncelle                    ║");
                    Console.WriteLine("                          ╚════════════════════════════════════════════════════╝");
                    Console.WriteLine("Güncellenecek Oda ID: ");
                    int id;

                    // Girdi kontrolü
                    if (!int.TryParse(Console.ReadLine(), out id))
                    {
                        Console.WriteLine("Geçersiz Oda ID. Ana Menüye dönmek için bir tuşa basın...");
                        Console.ReadKey();
                        return;
                    }

                    Console.WriteLine("Yeni Oda Numarası: ");
                    int odaNo;
                    if (!int.TryParse(Console.ReadLine(), out odaNo))
                    {
                        Console.WriteLine("Geçersiz Oda Numarası. Ana Menüye dönmek için bir tuşa basın...");
                        Console.ReadKey();
                        return;
                    }

                    Console.WriteLine("Yeni Yatak Sayısı: ");
                    int yatakSayisi;
                    if (!int.TryParse(Console.ReadLine(), out yatakSayisi))
                    {
                        Console.WriteLine("Geçersiz Yatak Sayısı. Ana Menüye dönmek için bir tuşa basın...");
                        Console.ReadKey();
                        return;
                    }

                    string durum;
                    while (true)
                    {
                        Console.WriteLine("Yeni Durum (Tadilatta / Boş / Temizleniyor / Dolu / Rezerve): ");
                        durum = Console.ReadLine();

                        // Geçerli durumları tanımla
                        var validDurums = new[] { "Tadilatta", "Boş", "Temizleniyor", "Dolu", "Rezerve" };

                        if (Array.Exists(validDurums, d => d.Equals(durum, StringComparison.OrdinalIgnoreCase)))
                        {
                            break; // Geçerli durum, döngüden çık
                        }
                        else
                        {
                            Console.WriteLine("Geçersiz durum. Lütfen geçerli bir durum girin.");
                        }
                    }

                    Console.WriteLine("Yeni Kat: ");
                    int kat;
                    if (!int.TryParse(Console.ReadLine(), out kat))
                    {
                        Console.WriteLine("Geçersiz Kat. Ana Menüye dönmek için bir tuşa basın...");
                        Console.ReadKey();
                        return;
                    }

                    Console.WriteLine("Yeni Fiyat: ");
                    decimal fiyat;
                    if (!decimal.TryParse(Console.ReadLine(), out fiyat))
                    {
                        Console.WriteLine("Geçersiz Fiyat. Ana Menüye dönmek için bir tuşa basın...");
                        Console.ReadKey();
                        return;
                    }

                    using (SqlConnection connection = new SqlConnection(connectionString))
                    {
                        connection.Open();

                        // Oda ID'sinin mevcut olup olmadığını kontrol et
                        string checkQuery = "SELECT COUNT(*) FROM Oda WHERE OdaID = @OdaID AND IsDelete = 0";
                        SqlCommand checkCommand = new SqlCommand(checkQuery, connection);
                        checkCommand.Parameters.AddWithValue("@OdaID", id);
                        int count = (int)checkCommand.ExecuteScalar();

                        if (count == 0)
                        {
                            Console.WriteLine("Böyle bir ID mevcut değil. Ana Menüye dönmek için bir tuşa basın...");
                            Console.ReadKey();
                            return; // Oda ID'si bulunamadıysa metodu sonlandır
                        }
                        else
                        {
                            // Yeni oda numarasının mevcut olup olmadığını kontrol et
                            string checkOdaNoQuery = "SELECT COUNT(*) FROM Oda WHERE OdaNo = @OdaNo AND OdaID != @OdaID AND IsDelete = 0";
                            SqlCommand checkOdaNoCommand = new SqlCommand(checkOdaNoQuery, connection);
                            checkOdaNoCommand.Parameters.AddWithValue("@OdaNo", odaNo);
                            checkOdaNoCommand.Parameters.AddWithValue("@OdaID", id);
                            int odaNoCount = (int)checkOdaNoCommand.ExecuteScalar();

                            if (odaNoCount > 0)
                            {
                                Console.WriteLine("Bu oda numarası zaten mevcut. Lütfen farklı bir numara girin.");
                                Console.ReadKey();
                                continue; // Kullanıcıyı yeniden yönlendir
                            }

                            try
                            {
                                // Saklı prosedürü çağır
                                SqlCommand command = new SqlCommand("OdaGuncelle", connection);
                                command.CommandType = CommandType.StoredProcedure;

                                // Prosedüre gerekli parametreleri ekle
                                command.Parameters.AddWithValue("@OdaID", id);
                                command.Parameters.AddWithValue("@OdaNo", odaNo);
                                command.Parameters.AddWithValue("@YatakSayisi", yatakSayisi);
                                command.Parameters.AddWithValue("@Durum", durum);
                                command.Parameters.AddWithValue("@Kat", kat);
                                command.Parameters.AddWithValue("@Fiyat", fiyat);

                                int rowsAffected = command.ExecuteNonQuery();
                                if (rowsAffected > 0)
                                {
                                    Console.WriteLine("Oda başarıyla güncellendi. Ana Menüye dönmek için bir tuşa basın...");
                                    Console.ReadKey();
                                    break; // Güncelleme başarılı, döngüden çık
                                }
                                else
                                {
                                    Console.WriteLine("Güncelleme işlemi başarısız oldu. Ana Menüye dönmek için bir tuşa basın...");
                                }
                            }
                            catch (SqlException ex)
                            {
                                Console.WriteLine("Bir hata oluştu: " + ex.Message);
                            }
                        }
                    }
                }
            }
            private void UpdateReservation()
            {
                Console.Clear();
                Console.WriteLine("                          ╔════════════════════════════════════════════════════╗");
                Console.WriteLine("                          ║                    Rezervasyon Güncelle            ║");
                Console.WriteLine("                          ╚════════════════════════════════════════════════════╝");

                Console.WriteLine("Güncellenecek Rezervasyon ID: ");
                int id;
                if (!int.TryParse(Console.ReadLine(), out id))
                {
                    Console.WriteLine("Geçersiz Rezervasyon ID. Ana Menüye dönmek için bir tuşa basın...");
                    Console.ReadKey();
                    return;
                }

                Console.WriteLine("Yeni Müşteri ID: ");
                int musteriId;
                if (!int.TryParse(Console.ReadLine(), out musteriId))
                {
                    Console.WriteLine("Geçersiz Müşteri ID. Ana Menüye dönmek için bir tuşa basın...");
                    Console.ReadKey();
                    return;
                }

                Console.WriteLine("Yeni Oda ID: ");
                int odaId;
                if (!int.TryParse(Console.ReadLine(), out odaId))
                {
                    Console.WriteLine("Geçersiz Oda ID. Ana Menüye dönmek için bir tuşa basın...");
                    Console.ReadKey();
                    return;
                }

                Console.WriteLine("Yeni Giriş Tarihi (YYYY-MM-DD): ");
                DateTime girisTarihi;
                if (!DateTime.TryParse(Console.ReadLine(), out girisTarihi))
                {
                    Console.WriteLine("Geçersiz Giriş Tarihi. Ana Menüye dönmek için bir tuşa basın...");
                    Console.ReadKey();
                    return;
                }

                Console.WriteLine("Yeni Çıkış Tarihi (YYYY-MM-DD): ");
                DateTime cikisTarihi;
                if (!DateTime.TryParse(Console.ReadLine(), out cikisTarihi))
                {
                    Console.WriteLine("Geçersiz Çıkış Tarihi. Ana Menüye dönmek için bir tuşa basın...");
                    Console.ReadKey();
                    return;
                }

                // Tarih kontrolü
                if (girisTarihi < DateTime.Now.Date || cikisTarihi < DateTime.Now.Date)
                {
                    Console.WriteLine("Geçmiş tarihler için rezervasyon yapılamaz.");
                    Console.WriteLine("Ana Menüye dönmek için bir tuşa basın...");
                    Console.ReadKey();
                    return;
                }

                if (cikisTarihi <= girisTarihi)
                {
                    Console.WriteLine("Çıkış tarihi giriş tarihinden önce veya aynı olamaz.");
                    Console.WriteLine("Ana Menüye dönmek için bir tuşa basın...");
                    Console.ReadKey();
                    return;
                }

                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    try
                    {
                        SqlCommand command = new SqlCommand("RezervasyonGuncelle", connection);
                        command.CommandType = CommandType.StoredProcedure;

                        // Saklı prosedüre parametreler ekleniyor
                        command.Parameters.AddWithValue("@RezervasyonID", id);
                        command.Parameters.AddWithValue("@MusteriID", musteriId);
                        command.Parameters.AddWithValue("@OdaID", odaId);
                        command.Parameters.AddWithValue("@GirisTarihi", girisTarihi);
                        command.Parameters.AddWithValue("@CikisTarihi", cikisTarihi);

                        connection.Open();
                        command.ExecuteNonQuery();

                        Console.WriteLine("Rezervasyon başarıyla güncellendi. Ana Menüye dönmek için bir tuşa basın...");
                    }
                    catch (SqlException ex)
                    {
                        // Hata mesajını ayrıştır ve uygun şekilde göster
                        if (ex.Message.Contains("50000"))
                        {
                            Console.WriteLine("Bir hata oluştu: " + ex.Message);
                        }
                        else
                        {
                            Console.WriteLine("Bir hata oluştu: " + ex.Message);
                        }
                    }
                    catch (FormatException ex)
                    {
                        Console.WriteLine("Geçersiz giriş: " + ex.Message);
                    }
                }

                Console.ReadKey();
            }



            private void DeleteCustomer()
            {
                Console.Clear();
                Console.WriteLine("                          ╔════════════════════════════════════════════════════╗");
                Console.WriteLine("                          ║                     Müşteri Sil                    ║");
                Console.WriteLine("                          ╚════════════════════════════════════════════════════╝");
                Console.WriteLine("Silinecek Müşteri ID: ");
                int id;

                if (!int.TryParse(Console.ReadLine(), out id))
                {
                    Console.WriteLine("Geçersiz Müşteri ID. Ana Menüye dönmek için bir tuşa basın...");
                    Console.ReadKey();
                    return;
                }

                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    try
                    {
                        connection.Open();

                        SqlCommand command = new SqlCommand("MusteriSil", connection);
                        command.CommandType = CommandType.StoredProcedure;
                        command.Parameters.AddWithValue("@MusteriID", id);

                        command.ExecuteNonQuery();

                        SqlCommand checkCommand = new SqlCommand("SELECT IsDelete FROM Musteri WHERE MusteriID = @MusteriID", connection);
                        checkCommand.Parameters.AddWithValue("@MusteriID", id);
                        object result = checkCommand.ExecuteScalar();

                        if (result != null && (bool)result == true)
                        {
                            Console.WriteLine("Müşteri başarıyla silindi. Ana Menüye dönmek için bir tuşa basın...");
                        }
                        else
                        {
                            Console.WriteLine("Silme işlemi başarısız oldu veya müşteri bulunamadı. Ana Menüye dönmek için bir tuşa basın...");
                        }
                    }
                    catch (Exception ex)
                    {
                        Console.WriteLine("Bir hata oluştu: " + ex.Message);
                    }
                }

                Console.ReadKey();
            }
            private void DeleteRoom()
            {
                Console.Clear();
                Console.WriteLine("                          ╔════════════════════════════════════════════════════╗");
                Console.WriteLine("                          ║                      Oda Sil                       ║");
                Console.WriteLine("                          ╚════════════════════════════════════════════════════╝");
                Console.WriteLine("Silinecek Oda ID: ");
                int id;

                // Girdi kontrolü
                if (!int.TryParse(Console.ReadLine(), out id))
                {
                    Console.WriteLine("Geçersiz ID. Ana Menüye dönmek için bir tuşa basın...");
                    Console.ReadKey();
                    return;
                }

                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    try
                    {
                        connection.Open();

                        // Oda ID'nin mevcut olup olmadığını kontrol et
                        string checkQuery = "SELECT COUNT(*) FROM Oda WHERE OdaID = @OdaID AND IsDelete = 0";
                        SqlCommand checkCommand = new SqlCommand(checkQuery, connection);
                        checkCommand.Parameters.AddWithValue("@OdaID", id);
                        int count = (int)checkCommand.ExecuteScalar();

                        if (count == 0)
                        {
                            Console.WriteLine("Belirtilen ID'ye sahip oda bulunamadı veya oda zaten silinmiş. Ana Menüye dönmek için bir tuşa basın...");
                        }
                        else
                        {
                            // Saklı prosedürü çağır
                            SqlCommand command = new SqlCommand("OdaSil", connection);
                            command.CommandType = CommandType.StoredProcedure;
                            command.Parameters.AddWithValue("@OdaID", id);

                            int rowsAffected = command.ExecuteNonQuery();
                            if (rowsAffected > 0)
                            {
                                Console.WriteLine("Oda başarıyla silindi. Ana Menüye dönmek için bir tuşa basın...");
                            }
                            else
                            {
                                Console.WriteLine("Oda silme işlemi başarısız oldu. Ana Menüye dönmek için bir tuşa basın...");
                            }
                        }
                    }
                    catch (Exception ex)
                    {
                        Console.WriteLine("Bir hata oluştu: " + ex.Message);
                    }
                }

                Console.ReadKey();
            }
            private void DeleteReservation()
            {
                Console.Clear();
                Console.WriteLine("                          ╔════════════════════════════════════════════════════╗");
                Console.WriteLine("                          ║                    Rezervasyon Sil                ║");
                Console.WriteLine("                          ╚════════════════════════════════════════════════════╝");
                Console.WriteLine("Silinecek Rezervasyon ID: ");
                int id = int.Parse(Console.ReadLine());

                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    SqlCommand command = new SqlCommand($"DELETE FROM Rezervasyon WHERE RezervasyonID = {id}", connection);
                    connection.Open();
                    command.ExecuteNonQuery();
                }
                Console.WriteLine("Rezervasyon başarıyla silindi. Ana Menüye dönmek için bir tuşa basın...");
                Console.ReadKey();
            }
        }
    }