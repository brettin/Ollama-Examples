## Build the environment.

Log into a compute host

You need cmake 3.27.5 or later

    module load cmake/3.19.5  
    wget https://go.dev/dl/go1.21.1.linux-amd64.tar.gz
    tar -xzvf go1.21.1.linux-amd64.tar 
    export PATH=$PATH:$(pwd -P)/go/bin

You now clone and build ollama

    git clone https://github.com/jmorganca/ollama.git
    cd ollama
    CUDA_VERSION=$(nvcc --version | sed -n 's/^.*release \([0-9]\+\)\.\([0-9]\+\).*$/\1/p') go generate ./...
    go build .

It is best to set up a ollama model directory that is not defaulted to your home directory.

    cd ..
    mkdir .ollama
    ln -s .ollama $HOME/.ollama


Run the model server

    cd ollama
    export PATH=$PATH:$(pwd -P)/.
    ollama serve
    
Download a set of models

    ollama pull llama2
    ollama pull llama2:70b
    ollama pull falcon:180b
    ollama pull codellama
