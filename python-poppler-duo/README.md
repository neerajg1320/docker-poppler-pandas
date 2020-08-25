Dependencies:
python-poppler-dev-base:latest
##
Above dependency can be created as:

docker build -f Dockerfile.dev -t python-poppler-dev-base .
##

docker-compose -f docker-compose-python-poppler-dev.yml up --build
## 
The above command creates two containers poppler_1 and minimal_1

poppler1:
SSH server is started and configured
SSH access is provided to minimal_1 user root using key pair.
The poppler package with specified version is downloaded.
The package is compiled and installed. 
The pdf* binaries are copied from poppler_1 to minimal_1
The libraries required are copied from poppler_1 to minimal_1
 
minimal_1:
SSH server is started and configured
SSH access is provided to poppler_1 user root using key pair.
##

docker exec -it python-poppler-duo_minimal_1 bash
##
minimal_1
run command 'ldconfig'
run command 'pdftotext -v' to verify things are working
##


Images:
##
poppler_<n>:
This image is created by python-poppler-dev.
The base image is python-poppler-dev-base

minimal_<n>:
This image is created by python-poppler-compact
The base image is python:3.7-slim

python-poppler-dev-base:
The image is create by python-poppler-dev-base.
The base image is python:3.7-slim
##

Output Image:
##
python-poppler:compact
When the pdf binaries and poppler libraries are copied from poppler_1 to minimal_1
We execute ldconfig command on minimal_1
We verify that 'pdftotext -v' is working on minimal_1.
We commit the minimal_1 container to create an image out of it.
We tag the resultant image as python-poppler:compact

docker commit python-poppler-duo_minimal_1
docker tag <hash> neeraj76/python-poppler:latest
docker push neeraj76/python-poppler:latest
##