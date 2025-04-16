#!/usr/bin sh

## OS 확인
if [[ "$OSTYPE" == "darwin"* ]]; then
  echo "Detected macOS"
  npm run macos:build &
  npm run ios:build &
  wait

elif [[ "$OSTYPE" == "cygwin" ]] || [[ "$OSTYPE" == "msys" ]] || [[ "$OSTYPE" == "win32" ]]; then
  echo "Detected Windows"
  npm run windows:build &
  npm run android:build &
  wait

else
  echo "Unknown OS: $OSTYPE"
  exit 1
fi

echo "모든 빌드가 완료되었습니다."
exit 0
