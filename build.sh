#!/bin/bash

application_path=.
application_name=httpd-ssh
application_version=$1
dockerfile_path=$PWD/Dockerfile

# validation
if [ -z "$application_version" ]; then
    echo 'A version is requried.  Execute as build.sh <version>'
    exit 1
fi

echo Building ${application_name} ${application_version}.
#  build the application and then execute container build
docker build \
    --build-arg app_version=${application_version} \
    --file ${dockerfile_path} \
    --tag ${application_name}:${application_version} \
    ${application_path}

docker tag ${application_name}:${application_version} corpdtshdbstg.corporate.ge.com/${application_name}:${application_version}
docker push corpdtshdbstg.corporate.ge.com/${application_name}:${application_version}
