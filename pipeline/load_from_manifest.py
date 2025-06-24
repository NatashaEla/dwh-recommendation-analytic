import json
import os
import pandas as pd

# Пути к директориям
RAW_DATA_DIR = "raw_data"
MANIFEST_PATH = os.path.join(RAW_DATA_DIR, "_manifest.json")

# Список типов данных, которые мы обрабатываем
DATASETS = ["rec_logs", "rec_clicks", "orders", "products", "users", "ab_groups"]

def load_manifest(manifest_path):
    #Загружает манифест из JSON и возвращает как словарь.
    with open(manifest_path, "r", encoding="utf-8") as f:
        return json.load(f)

def load_json_file(file_path):
    #Загружает JSON-файл и превращает его в pandas.DataFrame.
    with open(file_path, "r", encoding="utf-8") as f:
        data = json.load(f)
    return pd.json_normalize(data)

def run_ingestion():
    # Проходит по манифесту и загружает каждый указанный файл.
    print("Загрузка по манифесту\n")
    manifest = load_manifest(MANIFEST_PATH)

    for dataset in DATASETS:
        files = manifest.get(dataset, [])
        if not files:
            print(f"{dataset}: файлов нет — пропускаем")
            continue

        for file_name in files:
            file_path = os.path.join(RAW_DATA_DIR, file_name)

            if not os.path.exists(file_path):
                print(f"Файл не найден: {file_name}")
                continue

            try:
                df = load_json_file(file_path)
                print(f"{dataset}: загружен {file_name} — {len(df)} строк")
                # Здесь можно добавить запись в БД или сохранение в parquet/csv
            except Exception as e:
                print(f"Ошибка при загрузке {file_name}: {e}")

if __name__ == "__main__":
    run_ingestion()
