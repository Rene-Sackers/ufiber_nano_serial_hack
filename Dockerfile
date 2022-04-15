FROM python:3.7.5-slim

# Add project source
WORKDIR /usr/src/app
COPY ubi_serial_hack.py .

# Install dependencies
RUN python -m pip install \
  paramiko \
  scp

ENTRYPOINT ["python", "ubi_serial_hack.py"]
