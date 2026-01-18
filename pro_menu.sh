#!/bin/bash

# Empreinte SHA-256 (Le secret de Magadju Tech)
HASH_VALIDE="b9dc508e6e8cb6b243ef9d9210c47b433b1ecc10a9f03d5b0981047e2f7eef70"

# --- SYSTÈME D'AUTHENTIFICATION ---
clear
echo -e "\033[0;32m###############################################\033[0m"
echo -e "\033[0;32m#\033[0m \033[1;37mACCÈS SÉCURISÉ - IR ÉLU MAGADJU TECH\033[0m      \033[0;32m#\033[0m"
echo -e "\033[0;32m###############################################\033[0m"
echo ""

# Saisie du mot de passe (invisible à l'écran)
read -sp "Entrez votre clé d'accès secrète : " mdp_saisi
echo ""

# Vérification par hachage
MDP_HASH=$(echo -n "$mdp_saisi" | sha256sum | cut -d' ' -f1)

if [ "$MDP_HASH" != "$HASH_VALIDE" ]; then
    echo -e "\033[0;31m[!] ERREUR : Clé invalide. Accès refusé.\033[0m"
    exit 1
fi

echo -e "\033[0;32m[+] Authentification réussie. Chargement...\033[0m"
sleep 1
clear

# --- BANNIÈRE FIGLET ---
echo -e "\033[0;32m"
figlet "MAGADJU TECH"
echo -e "\033[0m"

echo -e "\033[0;32m###############################################\033[0m"
echo -e "\033[0;32m#\033[0m \033[1;37mAUTEUR  : Ir Élu magadju tech\033[0m             \033[0;32m#\033[0m"
echo -e "\033[0;32m#\033[0m \033[1;37mCONTACT : +243 971726328\033[0m                  \033[0;32m#\033[0m"
echo -e "\033[0;32m###############################################\033[0m"
echo ""

# --- MENU DES OPTIONS ---
echo -e "\033[0;34m---------- PANNEAU DE CONTRÔLE ----------\033[0m"
echo -e "\033[1;33m 1)\033[0m Lancer/Installer Ban WhatsApp"
echo -e "\033[1;33m 2)\033[0m Lancer Zphisher (Phishing)"
echo -e "\033[1;33m 3)\033[0m Vérifier mon IP \033[0;32m(Sécurité VPN)\033[0m"
echo -e "\033[1;33m 4)\033[0m Nettoyer les traces (Logs)"
echo -e "\033[1;33m 5)\033[0m Contacter l'auteur (WhatsApp)"
8) Lancer John the Ripper
echo -e "\033[0;31m 6) Quitter\033[0m"
echo -e "\033[0;34m-----------------------------------------\033[0m"

read -p "Fais ton choix : " choix

case $choix in
    1) dir=$(find ~ -type d -name "Tool_Ban_Whatsapp" | head -n 1)
       if [ -d "$dir" ]; then cd "$dir" && python whatsapp_tool.py
       else cd ~ && git clone https://github.com/elumagadju-dotcom/Magadju.git; fi ;;
    2) dir_z=$(find ~ -type d -name "zphisher" | head -n 1)
       if [ -d "$dir_z" ]; then cd "$dir_z" && bash zphisher.sh
       else cd ~ && git clone https://github.com/htr-tech/zphisher.git; fi ;;
    3) curl -s ifconfig.me ; echo "" ;;
    4) rm -rf ~/.bash_history && history -c && echo -e "\033[0;32mTraces nettoyées.\033[0m" ;;
    5) termux-open-url "https://wa.me/243971726328" ;;
7) echo -e "\033[0;32m[+] Mise à jour...\033[0m" && git pull origin main && exit ;;
    6) exit ;;
    *) ./pro_menu.sh ;;
esac

elif [[ $choice == "8" ]]; then
    ~/john/run/john
