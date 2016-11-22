Cap. 5 - docker-compose
------------------

    cd 5-bash_d
    docker-compose up
    docker-compose down
    docker-compose ps
    docker-compose push

### Exercise 5.a

Create your docker-compose file that executes the daemon you built in 2.a
    
## Execute tests

    docker-compose -f docker-compose.yml -f docker-compose_test.yml up

## Scale
 
    docker-compose up
    docker-compose scale web=3
 
How to balance?


## Decoupling 5_bash_d

see folder 5-microservices
    