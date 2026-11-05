-- SORGU 1: Gerçek veri setinin genel istatistiklerini hesapla.
SELECT
    COUNT(*) AS toplam_olcum,
    COUNT(DISTINCT subject_id) AS kisi_sayisi,
    ROUND(AVG(pulse), 2) AS ortalama_nabiz,
    ROUND(AVG(oxygen_pct), 2) AS ortalama_oksijen
FROM real_measurements;


-- SORGU 2: Her kişinin ortalama nabız ve oksijen değerlerini bul.
SELECT
    subject_id,
    COUNT(*) AS olcum_sayisi,
    ROUND(AVG(pulse), 2) AS ortalama_nabiz,
    ROUND(AVG(oxygen_pct), 2) AS ortalama_oksijen
FROM real_measurements
GROUP BY subject_id
ORDER BY subject_id;


-- SORGU 3: Yüksek nabız ve düşük oksijen adaylarını say.
SELECT
    COUNT(*) FILTER (
        WHERE pulse > 100 OR oxygen_pct < 95
    ) AS toplam_anomali,
    COUNT(*) FILTER (
        WHERE pulse > 100
    ) AS yuksek_nabiz,
    COUNT(*) FILTER (
        WHERE oxygen_pct < 95
    ) AS dusuk_oksijen
FROM real_measurements;


-- SORGU 4: Anomali adayı olan ölçümleri listele.
SELECT
    subject_id,
    reading_no,
    pulse,
    oxygen_pct,
    CASE
        WHEN pulse > 100 AND oxygen_pct < 95
            THEN 'Her iki değer anomali adayı'
        WHEN pulse > 100
            THEN 'Yüksek nabız adayı'
        WHEN oxygen_pct < 95
            THEN 'Düşük oksijen adayı'
    END AS anomali_turu
FROM real_measurements
WHERE pulse > 100 OR oxygen_pct < 95
ORDER BY subject_id, reading_no;


-- SORGU 5: Anomali ve normal ölçümlerin yüzdesini hesapla.
SELECT
    ROUND(
        COUNT(*) FILTER (
            WHERE pulse > 100 OR oxygen_pct < 95
        ) * 100.0 / COUNT(*), 2
    ) AS anomali_yuzdesi,
    ROUND(
        COUNT(*) FILTER (
            WHERE pulse <= 100 AND oxygen_pct >= 95
        ) * 100.0 / COUNT(*), 2
    ) AS normal_yuzdesi
FROM real_measurements;