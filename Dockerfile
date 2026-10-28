FROM python:3.14-slim

# .pyc 파일을 만들지 않고, 로그를 버퍼 없이 바로 출력한다 (CloudWatch에 즉시 찍히도록).
ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1

WORKDIR /app

# 의존성을 먼저 복사해야 코드만 바뀌었을 때 이 레이어를 캐시로 재사용한다.
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY app/ ./app/

# root가 아닌 사용자로 실행한다.
RUN useradd --create-home appuser
USER appuser

ARG APP_VERSION=local
ENV APP_VERSION=${APP_VERSION}

EXPOSE 8080

CMD ["gunicorn", "--bind", "0.0.0.0:8080", "--workers", "2", "app.main:app"]
