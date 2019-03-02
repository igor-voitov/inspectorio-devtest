docker build --no-cache --rm -f "Dockerfile" -t igorvoitov/02-coding-skills:latest .
docker build --no-cache --rm -f "Dockerfile" -t devtest01registry01.azurecr.io/02-coding-skills:latest .
docker run --rm -it -p 5000:5000 igorvoitov/02-coding-skills:latest