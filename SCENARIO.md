# Sağlık IoT Ağı ve Anomali Tespiti Senaryosu

## 1. Problem Tanımı

Hastanelerde kullanılan sağlık IoT sistemleri, hastaların nabız ve kandaki oksijen doygunluğu değerlerini takip edebilir. Ancak sensör bağlantı sorunları veya hatalı ölçümler yanlış alarmlara neden olabilir.

Bu projenin amacı, olağan dışı ölçümleri belirleyerek sağlık personelinin incelemesine yardımcı olmaktır.

## 2. Hedef Kullanıcı

- Hastane hemşireleri
- Doktorlar
- Sağlık bilgi sistemleri personeli

## 3. Kullanılacak Veri Tabloları

- patients: Anonim hasta bilgileri
- measurements: Nabız ve oksijen ölçümleri
- alarms: Alarm kayıtları
- real_measurements: Gerçek veri setinden alınan ölçümler

## 4. Yapay Zekâ Bileşeni

Projenin ilerleyen aşamalarında anomali tespiti için makine öğrenmesi yöntemlerinin kullanılması planlanmaktadır.

İlk aşamada nabız ve oksijen değerleri eşik tabanlı SQL sorgularıyla analiz edilmektedir.

## 5. Veri Kaynakları

Gerçek ölçümler için Zenodo üzerinde yayımlanan Five vital signs of normal people veri seti kullanılmıştır.

Kaynak: https://zenodo.org/records/5549632

Lisans: CC0

Veri setinde 102 katılımcıya ait 918 ölçüm bulunmaktadır.

## 6. Beklenen Sonuç

Sistem, nabız ve oksijen değerlerini analiz ederek olağan dışı ölçümleri belirlemeyi ve yanlış alarm sorununu incelemek için temel oluşturmayı hedeflemektedir.