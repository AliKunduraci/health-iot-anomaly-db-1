# Ödev Raporu

**Ödev No:** 2  
**Hafta:** 7  
**Tarih:** 27 / 11 / 2026

**Ad Soyad:** Ali Kemal Kunduracı  
**Öğrenci No:** 202607131006  
**Program:** Yapay Zeka Operatörlüğü

**PR Bağlantısı:** [Ödev 2 Pull Request](https://github.com/AliKunduraci/health-iot-anomaly-db-1/pull/1)

---

## 1. Fan-out

**4. soruda toplam kaçtan kaça çıktı?**

JOIN kullanıldığında batarya toplamı 262 yerine 700 olarak hesaplandı. Aradaki 438 fark, bir robotun birden fazla görevi olduğunda batarya değerinin tekrar sayılmasından kaynaklandı.

**Hangi robot kaç kez sayıldı?**

Atlas-01 ve Kartal-01 üçer kez, Mars-01 ve Mars-02 ikişer kez, Kartal-03 üç kez sayıldı.

**Gerçek bir raporda bu hata ne yanlışa yol açar?**

Bu hata, toplam batarya seviyesinin gerçekte olduğundan yüksek görünmesine neden olur. Böylece filo sorumlusu yanlış rapor hazırlayabilir ve hatalı kararlar verebilir.

---

## 2. En Zor ERD Kararı

Kendi Sağlık IoT ERD'mde en çok düşündüğüm karar, `real_measurements` tablosunu diğer tablolardan ayrı tutmaktı.

Bu tabloyu `patients` ve `measurements` tablolarıyla birleştirmek veya bağımsız bırakmak arasında kaldım. Gerçek veri setindeki `subject_id` değerleriyle sistemdeki hasta kimlikleri arasında doğrulanmış bir eşleşme bulunmadığı için tabloyu bağımsız tutmayı tercih ettim. Böylece gerçek ölçüm verileriyle test verilerinin karışmasını önlemiş oldum.

---

## Yapay Zeka Kullanım Beyanı

**Yapay zeka kullandım.**

| Konu | Araç | Ne sordum? | Cevabı nasıl doğruladım? |
|---|---|---|---|
| Fan-out | ChatGPT | JOIN ve EXISTS sonuçlarının farkı | SQL sorgularını çalıştırıp sonuçları karşılaştırdım. |
| ERD ve normalizasyon | ChatGPT | Tabloların ilişkileri ve normalizasyonu | Mevcut tablo ve anahtar bilgileriyle karşılaştırdım. |
| JOIN soruları | ChatGPT | Uygun JOIN türlerini belirleme | Ödev yönergesi ve tablo ilişkileriyle kontrol ettim. |
