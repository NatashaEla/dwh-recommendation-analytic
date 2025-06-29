# dwh-recommendation-analytic
# Проект: Анализ эффективности рекомендаций в e-commerce

Этот проект направлен на оценку влияния различных типов рекомендаций (персональные, похожие товары, акционные предложения) на поведение пользователей. Мы отслеживаем путь пользователя от показа блока рекомендаций до оформления заказа, чтобы рассчитать ключевые метрики и построить витрину данных.

## Архитектура

Проект включает несколько уровней обработки данных:

1.  STG: загрузка сырых JSON-данных (показы, клики, заказы)
2.  ODS: нормализация и очистка данных
3.  DDS: моделирование измерений и фактов
4. CDM: витрина с метриками по эффективности рекомендаций

## Метрики

В финальной витрине доступны показатели по `rec_type`:

1. Количество показов и кликов
2. CTR (click-through rate)
3. Количество покупок после рекомендации
4. Общая выручка, ассоциированная с рекомендацией

## Структура проекта

/dwh-recommendation-analytics/

raw_data/   # входные JSON-файлы

stg/  # сырой слой

ods/   # нормализованные данные

dds/   # измерения и факты

cdm/   # витрина с метриками

BI/   # визуализация

pipeline/     #для Python-скриптов

README.md



## Статус

Проект находится в разработке. Данные фейковые и используются для демонстрации аналитического и инженерного подхода к построению DWH.
