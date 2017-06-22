#!/opt/local/bin/bash
curl -s -X POST http://127.0.0.1:8080/auth/realms/master/protocol/openid-connect/token  -H "Content-Type: application/x-www-form-urlencoded" -d "username=admin" -d 'password=f00b@rIt' -d 'grant_type=password' -d 'client_id=slick-web' |json .access_token > auth/admin
