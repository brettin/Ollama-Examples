### Notes on installation

Installation on rbdgx2

    git clone https://github.com/brettin/Ollama-Examples
    cd Ollama-Examples
    source env.sh

Clone the ollama repository, build then start the server

    https://github.com/jmorganca/ollama.git
    cd ollama
    go generate ./...
    go build .
    ./ollama serve

Models are located at

    ln -s /rbscratch/brettin/.ollama $HOME/.ollama
    ls /rbscratch/brettin/.ollama

Models are automatically downloaded using the ollama pull command, or alternatively a model is downloaded using the ollama run command if the model is not already downloaded.

    ollama run falcon:180b
    ollama pull llama2:70b

And this pulls the llama 2b model which is ideal for debugging (faster response time)
    
    ollama pull llama2

To get a list of the installed models

    ollama show

<pre>
NAME            	ID          	SIZE  	MODIFIED    
codellama:latest	36893bf9bc7f	3.8 GB	5 hours ago	
llama2:latest   	d5611f7c428c	3.8 GB	5 hours ago
</pre>

This is an example:

    curl -X POST http://localhost:11434/api/generate -d '{
        "model": "llama2",
        "prompt":"Why is the sky blue? Please keep the answer to less than 30 words"
    }' 

THis adds a little perl hack to make the outpput nicer.

    curl -X POST http://localhost:11434/api/generate -d '{
        "model": "llama2",
        "prompt":"Why is the sky blue? Please keep the answer to less than 30 words"
    }' 2>&1  | perl -e 'while(<>){while(/\"response\"\:\"(.*)\",/g){print $1}}print "\n"'

Things to try next:

Building on Linux with GPU support

    CUDA_VERSION=$(nvcc --version | sed -n 's/^.*release \([0-9]\+\)\.\([0-9]\+\).*$/\1/p') go generate ./...

    go build .



    
  

