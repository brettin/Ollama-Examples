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

    # and this pulls the llama 2b model which is ideal for debugging (faster response time)
    
    ollama pull llama2
    
  

