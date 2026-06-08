#!/bin/bash
# Публікація звіту Retail Partner Activation Strategy на GitHub Pages.
# Копіює актуальний HTML у index.html, комітить і пушить у repo retail-partner-report.
set -e

SRC="/Users/yuliia.nikolaieva/Downloads/Cursor/05_MS % getplaced/Retail_Partner_Activation_Strategy_2026.html"
DIR="$(cd "$(dirname "$0")" && pwd)"

if [ ! -f "$SRC" ]; then
  echo "Не знайдено вихідний файл: $SRC"
  exit 1
fi

echo "Копіюю свіжий звіт у index.html..."
cp "$SRC" "$DIR/index.html"

cd "$DIR"
git add index.html
if git diff --cached --quiet; then
  echo "Змін немає — нічого публікувати."
  exit 0
fi

git commit -m "Update Retail Partner Activation report ($(date '+%Y-%m-%d %H:%M'))"
git push origin main

echo "Готово. Live: https://yuliianikolaieva.github.io/retail-partner-report/"
