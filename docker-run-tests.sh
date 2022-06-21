  #!/usr/bin/env bash
   docker run --rm \
  --user $(id -u):$(id -g) \
  -v $PWD/tests:/home/robot/tests \
  -v $PWD/results:/home/robot/results \
  -v $PWD/libs:/home/robot/libs \
  docker-api-robotframework