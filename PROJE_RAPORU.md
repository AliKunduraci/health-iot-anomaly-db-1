# SAĞLIK IoT AĞI VE ANOMALİ TESPİTİ
**Proje Raporu**

### 1. Projenin Amacı

Bu projenin amacı, hastanelerde kullanılan sağlık IoT sistemlerinden elde edilen nabız ve kandaki oksijen doygunluğu (SpO₂) ölçümlerini analiz ederek olağan dışı değerleri tespit etmektir. Sistem, sağlık personelinin incelemesi gereken ölçümleri belirlemeyi ve yanlış alarm sorununu araştırmak için temel oluşturmayı hedeflemektedir.

### 2. Kullanılan Teknolojiler

Projenin geliştirilmesinde Python, PostgreSQL 18, pgAdmin 4 ve Visual Studio Code kullanılmıştır. Verilerin düzenlenmesi ve dönüştürülmesi Python ile, saklanması ve analiz edilmesi ise PostgreSQL ve SQL sorguları ile gerçekleştirilmiştir.

### 3. Veri Seti ve Veri İşleme

Projede Zenodo platformunda yayımlanan “Five vital signs of normal people” veri seti kullanılmıştır.

- Veri kaynağı: https://zenodo.org/records/5549632
- Lisans: CC0
- Katılımcı sayısı: 102
- Toplam ölçüm sayısı: 918

Orijinal CSV dosyası Python kullanılarak geniş formattan uzun formata dönüştürülmüş ve PostgreSQL veritabanına aktarılmıştır. Gerçek ölçümler, sentetik test verilerinden ayrı bir tabloda saklanmıştır.

### 4. Anomali Tespit Yöntemi

İlk aşamada eşik tabanlı anomali analizi uygulanmıştır. Nabız değerinin 100'ün üzerinde olması ve oksijen doygunluğunun %95'in altında olması inceleme gerektiren ölçümler olarak belirlenmiştir.

SQL sorguları kullanılarak yüksek nabız, düşük oksijen ve her iki koşulu birlikte sağlayan kayıtlar analiz edilmiştir.

### 5. Analiz Sonuçları

918 ölçüm üzerinde yapılan analiz sonucunda:

- Ortalama nabız: 82,14
- Ortalama oksijen doygunluğu: %97,45
- Yüksek nabız adayı: 36 ölçüm
- Düşük oksijen adayı: 52 ölçüm
- Her iki koşulu sağlayan: 1 ölçüm
- Toplam anomali adayı: 87 ölçüm
- Anomali adayı oranı: %9,48

### 6. Sonuç ve Gelecek Çalışmalar

Proje kapsamında gerçek sağlık ölçümleri PostgreSQL veritabanına aktarılmış ve SQL sorgularıyla analiz edilmiştir. Belirlenen eşiklere göre ölçümlerin %9,48'i anomali adayı olarak işaretlenmiştir.

Gelecek aşamalarda makine öğrenmesi yöntemlerinin kullanılması, sensör kaynaklı hatalı ölçümlerin gerçek sağlık durumlarından ayrıştırılması ve alarm sisteminin geliştirilmesi planlanmaktadır.

**Not:** Kullanılan veri seti gerçek insan ölçümlerinden oluşmakla birlikte sürekli giyilebilir IoT cihazlarından alınmış bir veri akışı değildir. Anomali adayları kesin hastalık veya sensör arızası anlamına gelmemektedir.