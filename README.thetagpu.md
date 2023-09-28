## Build the environment.

Log into a compute host

You need cmake 3.27.5 or later

    module load cmake/3.19.5  
    wget https://go.dev/dl/go1.21.1.linux-amd64.tar.gz
    tar -xzvf go1.21.1.linux-amd64.tar 
    export PATH=$PATH:$(pwd -P)/go/bin

You now clone and build ollama

