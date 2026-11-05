# Gerçek Veri Seti – Sağlık IoT Anomali Tespiti

## 1. Veri Kaynağı
- Veri seti: https://doi.org/10.5281/zenodo.5549632
- Veri seti: Five vital signs of normal people
- Kaynak: [Zenodo](https://zenodo.org/records/5549632)
- Lisans: CC0 (Public Domain Dedication)
- Katılımcı sayısı: 102
- Her katılımcı için ölçüm sayısı: 9
- Toplam ölçüm: 918

## 2. Veri İçeriği

Veri setinde nabız (Heart Rate) ve kandaki oksijen doygunluğu (Oxygen Saturation) değerleri bulunmaktadır.

CSV dosyası Python kullanılarak dönüştürülmüş ve PostgreSQL veritabanına aktarılmıştır.

## 3. Veri Sözlüğü

| Alan | Açıklama |
|---|---|
| subject_id | Anonim katılımcı numarası |
| reading_no | Ölçüm sırası |
| pulse | Nabız değeri |
| oxygen_pct | Oksijen doygunluğu yüzdesi |

## 4. Veri İşleme

Orijinal CSV dosyası geniş formatta olduğu için Python ile uzun formata dönüştürülmüştür.

Dönüştürülen dosya:
`data/processed/real_measurements.csv`

Veriler PostgreSQL içerisinde `real_measurements` tablosuna aktarılmıştır.

## 5. Veri Sınırlamaları

Bu veri seti gerçek insan ölçümlerinden oluşmaktadır. Ancak ölçümler sürekli çalışan giyilebilir IoT cihazlarından değil, doktor tarafından alınan ölçümlerden oluşmaktadır.

Bu nedenle veri seti gerçek sağlık ölçümleri için kullanılmıştır; sürekli IoT akışı olarak değerlendirilmemelidir.

Veri setinde sağlıklı bireylere ait ölçümler bulunmaktadır. Projede kullanılan anomali eşikleri analiz amacıyla belirlenmiştir. Anomali adayı olarak işaretlenen kayıtlar kesin hastalık veya sensör arızası anlamına gelmez.

## 6. Anomali Analizi

Kullanılan örnek eşikler:

- Nabız > 100: Yüksek nabız adayı
- Oksijen doygunluğu < 95: Düşük oksijen adayı

Analiz sonucunda 918 ölçümün 87 tanesi (%9,48) anomali adayı olarak belirlenmiştir.