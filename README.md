### Notes on installation

Installation on rbdgx2

    git clone https://github.com/brettin/Ollama-Examples
    cd Ollama-Examples
    source env.sh

Clone the ollama repository and build

    https://github.com/jmorganca/ollama.git
    cd ollama
    go generate ./...
    go build .

Models are located at

    ln -s /rbscratch/brettin/.ollama $HOME/.ollama
    ls /rbscratch/brettin/.ollama

Models are automatically downloaded using the ollama run command, or alterhatively using the ollama pull command.

    ollama run falcon:180b
    ollama pull llama2:70b

And this pulls the llama 2b model which is ideal for debugging (faster response time)
    
    ollama pull llama2

To get a list of the installed models

    ollama show

This is an example:

    curl -X POST http://localhost:11434/api/generate -d '{
        "model": "llama2",
        "prompt":"Why is the sky blue? Please keep the answer to less than 30 words"
    }' 2>&1  | perl -e 'while(<>){while(/\"response\"\:\"(.*)\",:/g){print $1}}'

Tom



    
  

