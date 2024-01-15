PATH=/rbstor/software/20.04/cmake-3.27.5-linux-x86_64/bin:$PATH
PATH=$PATH:/rbscratch/brettin/Ollama-Examples/ollama
PATH=$PATH:/usr/local/go/bin
PATH=$PATH:.

if [[ -L $HOME/.ollama/models || -d $HOME/.ollama/models ]] ; then
	echo "$HOME/.ollama exists."
	echo "Can not create sym link."
	echo "For best performance, models should be staged in /dev/shm/.ollama."
else
	mkdir -p $HOME/.ollama
	ln -s /dev/shm/.ollama/models $HOME/.ollama/models
fi


