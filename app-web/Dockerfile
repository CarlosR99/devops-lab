FROM python:3.12-slim

WORKDIR /app

COPY app.py .

ENV APP_ENV=development

EXPOSE 8000

CMD ["python", "-u", "app.py"]
