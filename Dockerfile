FROM python:3.11-slim

# Налаштування Python у контейнері
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# Робоча директорія всередині контейнера
WORKDIR /app

# Встановлюємо залежності
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Копіюємо Django-проєкт
COPY library/ .

# Порт Django
EXPOSE 8000

# Запуск Django-сервера
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
