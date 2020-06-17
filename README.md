# vscode

## run
docker run -d -p 8080:8080 \
    --env PASSWORD="xxxxxxxxxx" \
    -v "$PWD:/home/coder/project" \
    -v "/var/run/docker.sock:/tmp/docker.sock:ro" \
    -u "$(id -u):$(id -g)" \
    teradak/vscode:latest \
    --auth=password

## build
docker build --tag=teradak/vscode . 
docker push teradak/vscode