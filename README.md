```
 __   __   __   __  ___  ___  __              ___       __   __       
|__) /  \ |__) /  \  |  |__  |__)  /\   |\/| |__  |  | /  \ |__) |__/ 
|  \ \__/ |__) \__/  |  |    |  \ /~~\  |  | |___ |/\| \__/ |  \ |  \ 
                                                                     
      __                                                              
 /\  |__) |                                                           
/~~\ |    |                                                           
                                                                      
 __   __   __        ___  __                                          
|  \ /  \ /  ` |__/ |__  |__)                                         
|__/ \__/ \__, |  \ |___ |  \                                         

Robotframework based API testing in Docker                                                                      
```
## Getting started ##
- build the docker image from the Dockerfile from the Repository
- Run your tests with the following command

```docker
    docker run --rm \
  --user $(id -u):$(id -g) \
  -v $PWD/tests:/home/robot/tests \
  -v $PWD/results:/home/robot/results \
  -v $PWD/libs:/home/robot/libs \
  IMAGENAME
```
## Configuration ##

### Testing with python unit tests ### 

### Change parallel/single test executing from Robotframework tests ###

- By default the pabot tests are executed with two workers (you can increase workers by defining an environment variable with a vaule of the amount of workers)
- Use `--env PABOT_PARALLEL_WORKER=6` in your docker run command
- If you like to run your tests serial you can set the value to 1

## Contributing ##
- Contributing on that project is always welcome!