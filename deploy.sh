#!/bin/bash
set -e

echo "🚀 Деплой infra начался..."

# Обновляем код из репозитория
echo "📥 Обновляем git..."
git pull origin main
git submodule update --init --recursive --remote

# Останавливаем и удаляем старые контейнеры
echo "🛑 Останавливаем старые контейнеры..."
docker compose down

# Пересобираем и запускаем
echo "🔨 Пересобираем и запускаем новые контейнеры..."
docker compose up -d --build

echo "✅ Деплой успешно завершен!"
docker ps
