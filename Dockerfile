FROM python:3.9-slim
WORKDIR /app
RUN echo "Hello from my smart microservice" > index.html
CMD ["python", "-m", "http.server", "80"]