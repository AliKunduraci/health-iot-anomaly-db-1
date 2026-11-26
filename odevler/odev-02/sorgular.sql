
-- Ödev 2, Bölüm 1: Filo sorguları
-- Ad Soyad: Ali Kunduracı
-- Veritabanı: robot_fleet


-- Soru 1: Her robotun adı, operatör adı ve operatör telefonu (INNER JOIN)

SELECT
    r.name AS robot_adi,
    o.operator_name AS operator_adi,
    o.phone AS operator_telefonu
FROM robots r
INNER JOIN operators o
    ON r.operator_name = o.operator_name;

-- Yorum: INNER JOIN sonucunda operatörü eşleşen 9 robot listelenmiştir.


-- Soru 2: Aynı liste, bütün robotlar görünsün (LEFT JOIN)

SELECT
    r.name AS robot_adi,
    o.operator_name AS operator_adi,
    o.phone AS operator_telefonu
FROM robots r
LEFT JOIN operators o
    ON r.operator_name = o.operator_name;

-- Yorum: LEFT JOIN ile 10 robotun tamamı listelenmiştir; operatörü olmayan Mars-03 robotu INNER JOIN sonucunda kaybolmuştur.


-- Soru 3: Hiç görev almamış robotların adı ve modeli

SELECT
    r.name AS robot_adi,
    r.model AS robot_modeli
FROM robots r
LEFT JOIN missions m
    ON r.id = m.robot_id
WHERE m.id IS NULL;

-- Yorum: Hiç görev almamış 4 robot Kartal-02, Atlas-03, Mars-03 ve Kartal-04'tür.


-- Soru 4a: JOIN ile hesaplanan toplam batarya (görevi olan robotlar)

SELECT
    SUM(r.battery_level) AS hatali_batarya_toplami
FROM robots r
INNER JOIN missions m
    ON r.id = m.robot_id;


-- Soru 4b: JOIN kullanmadan doğru toplam

SELECT
    SUM(r.battery_level) AS dogru_batarya_toplami
FROM robots r
WHERE EXISTS (
    SELECT 1
    FROM missions m
    WHERE m.robot_id = r.id
);

-- Yorum (iki sonuç ve fark):
-- JOIN ile hatalı toplam 700, EXISTS ile doğru toplam 262 bulunmuştur.
-- Aradaki 438 fark, bir robotun birden fazla görevi olduğunda
-- batarya değerinin JOIN sonucunda tekrar etmesinden kaynaklanmaktadır.


-- Soru 5: Robot başına görev sayısı; count(*) ve count(m.id) yan yana

SELECT
    r.id AS robot_id,
    r.name AS robot_adi,
    COUNT(*) AS count_yildiz,
    COUNT(m.id) AS count_m_id
FROM robots r
LEFT JOIN missions m
    ON r.id = m.robot_id
GROUP BY r.id, r.name
ORDER BY r.id;

-- Yorum (hangi robotlarda ikisi farklı?):
-- Kartal-02, Atlas-03, Mars-03 ve Kartal-04 robotlarında
-- COUNT(*) 1, COUNT(m.id) ise 0 sonuç vermiştir.
-- Çünkü LEFT JOIN eşleşmeyen robotlar için de bir satır oluşturur,
-- ancak m.id değeri NULL olduğu için COUNT(m.id) bu satırı saymaz.
