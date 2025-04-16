#!/usr/bin pwsh

## OS 확인
if [[ "$OSTYPE" == "darwin"* ]]; then
  echo "Detected OS: macOS"
  npm run ios &
  npm run macos &
  wait

elif [[ "$OSTYPE" == "cygwin" ]] || [[ "$OSTYPE" == "msys" ]] || [[ "$OSTYPE" == "win32" ]]; then
  echo "Detected OS: Windows"
  npm run windows &
  npm run android &
  wait

else
  echo "Unknown OS: $OSTYPE"
  exit 1
fi

echo "모든 빌드가 완료되었습니다."
exit 0
