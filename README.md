# pyml-docker-env
Dockerized env for labs around python/machine learning based on miniconda

## how to use it
Inside the base path, there is a **notebooks** folder which is mapped to the inner notebooks path in Conda, so that, anything inside that folder will be able to be used

To run the service you must use the runAnaconda.sh script:
```
# ./runAnaconda.sh
```
Before the 
Once the container have been started, you will see at the end of the output some likes like those:
```
    Or copy and paste one of these URLs:
        http://localhost:8888/tree?token=xxxxxxxxxxxxxx
        http://127.0.0.1:8888/tree?token=xxxxxxxxxxxxxx
```
In your host, open a browser and navigate to the url mentioned above

## Adding things
. In the Dockerfile you will be able to add Python libraries using `pip install`
. Remember rebuild the docker image to use it
. The runAnaconda.sh script has 2 functions(_execute_before_start_ and _execute_after_start_) 
  . those functions run to pull from github all the repos living in ./notebooks/mines folder
  .  and also push changes after the server is terminated
. Similar to the runAnaconda.sh script, in the assets/entrypoint.sh scrip you will find a set of functions to run whatever you need before and after the service really starts
