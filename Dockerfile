FROM python:3.9-slim
WORKDIR /app
COPY app.py .
ARG VERSION=0.0.0
ENV VERSION=${VERSION}
CMD ["python", "app.py"]
