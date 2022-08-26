How to?

```bash
# build
docker build -t spin ./Docker

# run
docker run -p 9000:80 --name=spin spin

# verify
curl http://localhost:9000
```
