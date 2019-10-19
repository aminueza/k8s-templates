# Minikube environment
All kubernetes configuration scripts and yaml files for creating minikube clusters as default environment for devs.

# How to deploy to minikube

1. Install and start minikube following up [this tutorial](https://kubernetes.io/docs/tasks/tools/install-minikube).
2. Apply the image in the cluster by executing

```
$ kubectl apply -f type-of-service.yaml
```

# AMQP Management

AMQP management service is available running:

```
$ minikube service rabbitmq
```

**Login**: amqp
**Password**: amqp123
