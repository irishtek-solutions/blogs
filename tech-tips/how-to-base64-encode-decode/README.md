# How to base64 encode and decode

## How to base64 encode

1. **Input**: echo -n 'username:password' | base64
2. **Output**: dXNlcm5hbWU6cGFzc3dvcmQ=

## How to base64 decode

1. **Input**: echo -n 'dXNlcm5hbWU6cGFzc3dvcmQ=' | base64 --decode
2. **Output**: username:password