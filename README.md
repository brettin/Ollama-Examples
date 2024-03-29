## Table of Contents
1. [Notes on installation](#item-one)
2. [Models are located at](#item-two)
3. [Examples](#item-three)
4. [Saving and reading model files in tmpfs](#item-four)
5. [Things to try next](#item-five)

<a id="item-one"></a>
### Notes on installation

Installation on rbdgx2

    git clone https://github.com/brettin/Ollama-Examples
    cd Ollama-Examples
    source env.sh

Clone the ollama repository, build then start the server

    git clone https://github.com/jmorganca/ollama.git
    cd ollama
    go generate ./...
    go build .
    ./ollama serve

<a id="item-two"></a>
### Models are located at

    ln -s /rbscratch/brettin/.ollama $HOME/.ollama
    ls /rbscratch/brettin/.ollama

Models are automatically downloaded using the ollama pull command, or alternatively a model is downloaded using the ollama run command if the model is not already downloaded.

    ollama run falcon:180b
    ollama pull llama2:70b

And this pulls the llama 2b model which is ideal for debugging (faster response time)
    
    ollama pull llama2

To get a list of the installed models

    ollama list

<pre>
NAME            	ID          	SIZE  	MODIFIED    
codellama:latest	36893bf9bc7f	3.8 GB	6 hours ago	
falcon:180b     	1528c70bad58	102 GB	5 hours ago	
llama2:70b      	fc98e83ed93f	39 GB 	5 hours ago	
llama2:latest   	d5611f7c428c	3.8 GB	6 hours ago	
</pre>

or

    curl http://localhost:11434/api/tags | python -m json.tool

<pre>
{
    "models": [
        {
            "name": "codellama:latest",
            "modified_at": "2023-09-19T11:39:28.784133-05:00",
            "size": 3791811617,
            "digest": "36893bf9bc7ff7ace56557cd28784f35f834290c85d39115c6b91c00a031cfad"
        },
        {
            "name": "llama2:latest",
            "modified_at": "2023-09-19T11:26:47.026252-05:00",
            "size": 3791737662,
            "digest": "d5611f7c428cf71fb05660257d18e043477f8b46cf561bf86940c687c1a59f70"
        }
    ]
}
</pre>

<a id="item-three"></a>
### Examples

    curl -X POST http://localhost:11434/api/generate -d '{
        "model": "llama2",
        "prompt":"Why is the sky blue? Please keep the answer to less than 30 words"
    }' 

THis adds a little perl hack to make the outpput nicer.

    curl -X POST http://localhost:11434/api/generate -d '{
        "model": "llama2",
        "prompt":"Why is the sky blue? Please keep the answer to less than 30 words"
    }' 2>&1  | perl -e 'while(<>){while(/\"response\"\:\"(.*)\",/g){print $1}}print "\n"'


<a id="item-four"></a>
### Saving and reading model files in tmpfs

    # ollama stores models in $HOME/.ollama by default.
    mkdir /dev/shm/.ollama
    chmod g+rwx /dev/shm/.ollama
    
    chmod g+s /dev/shm/.ollama
    setfacl -d -m g::rwx /dev/shm/.ollama
    setfacl -d -m o::rx /dev/shm/.ollama

    mkdir -p /dev/shm/.ollama/models
    chmod g+rwx .ollama .ollama/models

    mkdir $HOME/.ollama
    ln -s /dev/shm/.ollama/models $HOME/.ollama/models
 
    export PATH=$PATH:/rbscratch/brettin/Ollama-Examples/ollama/
    ollama ls
    
    # download a model
    # ollama pull falcon:40b
    
    # run a model
    ollama run falcon:40b

    # resize tmpfs
    # sudo mount -o remount,size=300G /run
    # donload another model
    # ollama pull falcon:180b

<a id="item-five"></a>
### Things to try next:

Building on Linux with GPU support

    CUDA_VERSION=$(nvcc --version | sed -n 's/^.*release \([0-9]\+\)\.\([0-9]\+\).*$/\1/p') go generate ./...

    go build .



    
  

