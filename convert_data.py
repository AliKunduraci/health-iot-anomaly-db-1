import csv
import os

input_file = "data/raw/five vital signs of normal people.csv"
output_folder = "data/processed"
output_file = os.path.join(output_folder, "real_measurements.csv")

os.makedirs(output_folder, exist_ok=True)

with open(input_file, "r", encoding="utf-8-sig", newline="") as file:
    reader = csv.DictReader(file)
    rows = []

    for person in reader:
        subject_id = person["Subject ID"]

        for i in range(1, 10):
            rows.append({
                "subject_id": subject_id,
                "reading_no": i,
                "pulse": person[f"Heart rate reading {i}"],
                "oxygen_pct": person[f"Oxygen saturation reading {i}"]
            })

with open(output_file, "w", encoding="utf-8-sig", newline="") as file:
    writer = csv.DictWriter(
        file,
        fieldnames=["subject_id", "reading_no", "pulse", "oxygen_pct"]
    )
    writer.writeheader()
    writer.writerows(rows)

print("Veri dönüştürme tamamlandı!")
print("Toplam ölçüm:", len(rows))