Cap. 8 - DC/OS
--------------

Demo:
 - services
 - jobs
 - subnetting
 - Universe
 - scale
 - Internal load balancing
 - oAuth
 
Example
 
```
{
  "volumes": null,
  "id": "/hellos",
  "cmd": null,
  "args": null,
  "user": null,
  "env": null,
  "instances": 3,
  "cpus": 1,
  "mem": 1024,
  "disk": 0,
  "gpus": 0,
  "executor": null,
  "constraints": null,
  "fetch": null,
  "storeUrls": null,
  "backoffSeconds": 1,
  "backoffFactor": 1.15,
  "maxLaunchDelaySeconds": 3600,
  "container": {
    "docker": {
      "image": "dockercloud/hello-world",
      "forcePullImage": false,
      "privileged": false,
      "portMappings": [
        {
          "containerPort": 80,
          "protocol": "tcp",
          "servicePort": 10111
        },
        {
          "containerPort": 443,
          "protocol": "tcp",
          "servicePort": 10112
        }
      ],
      "network": "BRIDGE"
    }
  },
  "healthChecks": null,
  "readinessChecks": null,
  "dependencies": null,
  "upgradeStrategy": {
    "minimumHealthCapacity": 1,
    "maximumOverCapacity": 1
  },
  "labels": {
    "DCOS_SERVICE_SCHEME": "http",
    "DCOS_SERVICE_NAME": "hello",
    "DCOS_SERVICE_PORT_INDEX": "0",
    "DCOS_PACKAGE_NAME": "hello",
    "DCOS_PACKAGE_IS_FRAMEWORK": "false"
  },
  "acceptedResourceRoles": [
    "*"
  ],
  "residency": null,
  "secrets": null,
  "taskKillGracePeriodSeconds": null,
  "portDefinitions": [
    {
      "port": 10111,
      "protocol": "tcp",
      "labels": {}
    },
    {
      "port": 10112,
      "protocol": "tcp",
      "labels": {}
    }
  ],
  "requirePorts": false
}
```
 
 
### Exercise create our redis service
 
### Exercise create our bash_d service

### Create a job that clear flush-all redis each 1000 seconds

### External load balancer for bash_d service
  
### Create a group prod