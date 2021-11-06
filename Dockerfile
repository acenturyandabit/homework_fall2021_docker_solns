FROM ubuntu:18.04

# ignore clock skew, update
RUN apt-get -o Acquire::Check-Valid-Until=false -o Acquire::Check-Date=false update

# get python and pip
RUN apt install -y python3
RUN apt install -y python3-pip


# setup mucojo
RUN apt install -y libosmesa6-dev libgl1-mesa-glx libglfw3 libglu1-mesa libglu1-mesa-dev patchelf wget unzip 
#    libxi-dev libxmu-dev 
COPY setupScripts /root/setupScripts
RUN /bin/bash /root/setupScripts/get_mucojo.sh

COPY hw1 /root/hw1

# # avoid openCV error 'missing skbuild'
RUN pip3 install --upgrade pip

RUN cd /root/hw1 && pip3 install -r requirements.txt && pip install -e .
# COPY hw2 /root/hw2
# COPY hw3 /root/hw3 
# COPY hw4 /root/hw4 
# COPY hw5 /root/hw5 

# #COPY hw1_sln /root/hw1_sln 
# #COPY hw2_sln /root/hw2_sln
# #COPY hw3_sln /root/hw3_sln