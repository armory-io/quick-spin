How to?

```bash
# build
docker build -t spin .

# run
docker run -p 9000:9000 -p 8084:8084 --name=spin spin

# verify
curl http://localhost:9000
```
