PATH=/rbstor/software/20.04/cmake-3.27.5-linux-x86_64/bin:$PATH
PATH=$PATH:/rbscratch/brettin/Ollama-Examples/ollama
PATH=$PATH:/usr/local/go/bin
PATH=$PATH:.

if [[ -L $HOME/.ollama || -d $HOME/.ollama ]] ; then
	echo "$HOME/.ollama exists."
	echo "Can not create sym link."
	echo "For best performance, models should be staged in /dev/shm/.ollama."
else
	ln -s /dev/shm/.ollama $HOME/.ollama
fi


