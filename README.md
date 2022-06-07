# Deploying a Python microservice to Tanzu Application Platform

This example builds a `helloworld-python` sample app using Tanzu Application Platform,
and deploys it to a Tanzu Kubernetes Grid cluster.

You can either have TAP do the entire CI/CD pipeline, or you can build a container image locally, and have TAP deploy it.

## Prerequisites

- A Tanzu Kubernetes Grid cluster<br />
  Configure the correct context using a command of the form:<br />
  ``kubectl config use-context <MY-CONTEXT>``
- Tanzu Application Platform
- (Optional, if building an image locally): [Docker](https://www.docker.com) installed and running on your local machine,
  and a Docker Hub account configured.
- Either edit the makefile, or [over-ride variable values on the Make command line](https://www.gnu.org/software/make/manual/html_node/Overriding.html), so as to set two required variables:
  - ``NAMESPACE`` - the Kubernetes namespace into which the app will be deployed;<br />and
  - ``DOCKER_HUB_USERNAME`` - your username on Docker Hub.

## Building and deploying from source code using TAP

1. Execute:<br />
   ``make source``

## Building an image locally, then deploying it using TAP

1. Execute:<br />
   ``make image``

## Verification

1. Use this command to find the domain URL for your service:<br />
  ``make get``

1. Now you can make a request to your app and see the result.
   Either open the URL displayed above in your web browser,
   or in ``curl`` using a command of the form:<br />
   ``curl --verbose --fail <URL>``

## Removing

To remove the sample app from your cluster, execute:<br />
    ``make delete``
