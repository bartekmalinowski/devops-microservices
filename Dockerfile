FROM python:3.9-slim
WORKDIR /app
RUN echo "Hello from my smart microservice" > info.txt
CMD ["cat", "info.txt"]