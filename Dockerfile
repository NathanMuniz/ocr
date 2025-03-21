# Use the official Python image as base
FROM python:3.10

# Set the working directory

# Copy the requirements file and install dependencies
# COPY requirements.txt .
# RUN pip install --no-cache-dir -r requirements.txt
RUN pip install uv
# Copy the application files
COPY . .

# Expose the port Streamlit runs on
EXPOSE 8501

# Run the Streamlit app
CMD ["uv", "run", "streamlit", "run", "src/especialista_deliberado/ocr.py", "--server.port=8501", "--server.address=0.0.0.0"]
