docker build -t androidotai/multi-client:latest -t androidotai/multi-client:$SHA -f ./client/Dockerfile ./client
docker build -t androidotai/multi-server:latest -t androidotai/multi-server:$SHA -f ./server/Dockerfile ./server
docker build -t androidotai/multi-worker:latest -t androidotai/multi-worker:$SHA -f ./worker/Dockerfile ./worker

# Log in ot the docker CLI
echo "$DOCKER_PASSWORD" | docker login -u "$DOCKER_ID" --password-stdin

docker push androidotai/multi-client:latest
docker push androidotai/multi-server:latest
docker push androidotai/multi-worker:latest

docker push androidotai/multi-client:$SHA
docker push androidotai/multi-server:$SHA
docker push androidotai/multi-worker:$SHA

#kubectl apply -f k8s
#kubectl set image deployments/client-deployment client=androidotai/multi-client:$SHA
#kubectl set image deployments/server-deployment server=androidotai/multi-server:$SHA
#kubectl set image deployments/worker-deployment worker=androidotai/multi-worker:$SHA