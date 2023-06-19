#!/bin/sh

echo "Building an operator \n"
echo "Enter the name of the project directory"
read directory
mkdir $directory
cd $directory

echo "Enter the domain name for the operator"
read domainName
echo "Enter the repository name of the operator"
read repoName

operator-sdk init --domain $domainName --repo $repoName

echo "Enter the api group"
read apiGroup
echo "Enter the api version"
read apiVersion
echo "Enter the resource kind"
read resourceKind
operator-sdk create api --group $apiGroup --version $apiVersion --kind $resourceKind --resource --controller


echo "Enter the version of the image"
read version
echo "Enter the tag of the repository where the image is to be pushed"
read tag
make docker-build docker-push VERSION=$version IMAGE_TAG_BASE=$tag IMG=$tag":"$version