# app/Dockerfile
FROM python:3.11-slim-bullseye

# Define o diretório de trabalho
WORKDIR /app

# Copia os arquivos de dependências do repositório
COPY ./pyproject.toml .

ENV UV_HTTP_TIMEOUT=120000

# Atualiza o pip e instala o uv
RUN pip install --upgrade pip && pip install uv

# Cria o ambiente virtual e sincroniza as dependências conforme o pyproject.toml
RUN uv lock && uv venv .venv && uv sync

# Copia o código da aplicação para dentro do container
COPY . .

# Comando para iniciar a aplicação (exemplo com uvicorn)
CMD ["uv", "run", "streamlit", "run", "ocr.py", "--server.port=8501", "--server.address=0.0.0.0"]
