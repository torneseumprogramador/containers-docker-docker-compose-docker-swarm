docker build -t didox/umatag -f Dockerfile .
docker push didox/umatag

export ROOT_URL="https://umhost.com.br"
export MONGO_URL="mongodb://mongodb:27017/umhost"
docker run -d -e ROOT_URL -e MONGO_URL --link ID_CONTAINER_MONGO:db -p 5001:3000 --name container didox/container:umatag