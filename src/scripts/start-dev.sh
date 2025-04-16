#!/usr/bin bash

## OS 확인
if [[ "$OSTYPE" == "darwin"* ]]; then
  echo "Detected macOS"
  npx react-native run-ios &
  npx react-native run-macos &
  wait

elif [[ "$OSTYPE" == "cygwin" ]] || [[ "$OSTYPE" == "msys" ]] || [[ "$OSTYPE" == "win32" ]]; then
  echo "Detected Windows"
  npx react-native run-windows &
  npx react-native run-android &
  wait

else
  echo "Unknown OS: $OSTYPE"
  exit 1
fi

echo "모든 빌드가 완료되었습니다."
exit 0
