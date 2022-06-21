  #!/usr/bin/env bash
   docker run --rm \
  --user $(id -u):$(id -g) \
  -v $PWD/tests:/root/tests \
  -v $PWD/results:/root/results \
  -v $PWD/libs:/root/libs \
  docker-api-robotframework