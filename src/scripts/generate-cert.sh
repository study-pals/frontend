#!/bin/bash
mkdir -p mkcert
cd mkcert

## OS 확인
if [[ "$OSTYPE" == "darwin"* ]]; then
  echo "Detected macOS"
  arch=$(uname -m)
  if [[ "$arch" == "arm64" ]]; then
    echo "Downloading mkcert for Apple Silicon (arm64)"
    curl -L -o mkcert https://github.com/FiloSottile/mkcert/releases/latest/download/mkcert-v1.4.4-darwin-arm64
  else
    echo "Downloading mkcert for Intel (amd64)"
    curl -L -o mkcert https://github.com/FiloSottile/mkcert/releases/latest/download/mkcert-v1.4.4-darwin-amd64
  fi
  chmod +x mkcert

elif [[ "$OSTYPE" == "cygwin" ]] || [[ "$OSTYPE" == "msys" ]] || [[ "$OSTYPE" == "win32" ]]; then
  echo "Detected Windows"
  echo "Downloading mkcert for Windows"
  curl -L -o mkcert.exe https://github.com/FiloSottile/mkcert/releases/latest/download/mkcert-v1.4.4-windows-amd64.exe

else
  echo "Unknown OS: $OSTYPE"
  exit 1
fi

./mkcert -install
./mkcert localhost 127.0.0.1
rm -f mkcert
mv localhost+1.pem cert.pem
mv localhost+1-key.pem key.pem

echo "Certificate generated successfully. Be sure not to expose .pem files externally!"