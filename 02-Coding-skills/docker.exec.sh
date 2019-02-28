docker build --no-cache --rm -f "Dockerfile" -t 02-coding-skills:latest .
docker run --rm -it -p 5000:5000 02-coding-skills:latest