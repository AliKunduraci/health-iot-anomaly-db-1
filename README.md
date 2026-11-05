# Sağlık IoT Ağı ve Anomali Tespiti

## 1. Proje Hakkında

Bu proje, sağlık IoT sistemlerinde nabız ve kandaki oksijen doygunluğu değerlerini analiz ederek olağan dışı ölçümleri tespit etmeyi amaçlamaktadır.

Sistem, sağlık personelinin incelemesi gereken ölçümleri belirlemek için eşik tabanlı anomali analizi kullanır.

## 2. Projenin Amacı

- Nabız ve oksijen ölçümlerini veritabanında saklamak.
- Sağlık verilerini SQL sorgularıyla analiz etmek.
- Anomali adayı ölçümleri tespit etmek.
- Sensör kaynaklı hatalar ile gerçek sağlık durumlarının ayrıştırılmasına yönelik bir temel oluşturmak.

## 3. Kullanılan Teknolojiler

- Python
- PostgreSQL 18
- pgAdmin 4
- Visual Studio Code
- CSV veri formatı

## 4. Veri Seti

Gerçek veri kaynağı: [Five vital signs of normal people – Zenodo](https://zenodo.org/records/5549632)

- Lisans: CC0
- Katılımcı sayısı: 102
- Ölçüm sayısı: 918
- Ölçülen değerler: Nabız ve oksijen doygunluğu

Veri setinin sınırlamaları ve işlenme yöntemi `data/README.md` dosyasında açıklanmıştır.

## 5. Veritabanı Tabloları

- `patients`: Hasta bilgileri
- `measurements`: Test amaçlı ölçümler
- `alarms`: Test alarm kayıtları
- `real_measurements`: Gerçek veri setinden alınan ölçümler

Gerçek ve sentetik test verileri birbirinden ayrı tutulmuştur.

## 6. Anomali Tespit Yöntemi

Örnek analiz eşikleri:

- Nabız > 100: Yüksek nabız adayı
- Oksijen doygunluğu < 95: Düşük oksijen adayı

Bu eşikler kesin teşhis veya sensör arızası tespiti değildir. İncelenmesi gereken ölçümleri belirlemek amacıyla kullanılmıştır.

## 7. Analiz Sonuçları

| Analiz | Sonuç |
|---|---:|
| Toplam ölçüm | 918 |
| Katılımcı | 102 |
| Ortalama nabız | 82,14 |
| Ortalama oksijen | %97,45 |
| Anomali adayı | 87 |
| Anomali adayı oranı | %9,48 |

## 8. Proje Dosyaları

- `convert_data.py`: CSV dönüştürme kodu
- `data/raw/`: Orijinal veri dosyası
- `data/processed/`: İşlenmiş veri dosyası
- `data/README.md`: Veri seti açıklaması
- `sql/hafta-05.sql`: SQL analiz sorguları

## 9. Önemli Not

Anomali adayları otomatik olarak hastalık veya sensör arızası anlamına gelmez. Sonuçların sağlık personeli tarafından değerlendirilmesi gerekir.