#!/bin/bash
clear
R='\e[1;31m' ; B='\e[1;34m' ; V='\e[1;32m' ; J='\e[1;33m' 
M='\e[1;35m' ; C='\e[1;36m' ; W='\e[1;37m' ; N='\e[0m'

# Interface MGDJ
echo -e "${R}   __  __  ${B}  ____      _ "
echo -e "${R}  |  \/  | ${B} / ___|    | |"
echo -e "${R}  | |\/| | ${B}| |  _  _  | |"
echo -e "${R}  | |  | | ${B}| |_| || |_| |"
echo -e "${R}  |_|  |_| ${B} \____| \___/  ${V}v5.3${N}"
echo -e "${R}      MGDJ ${B} TECH - EXPERT GLOBAL${N}"
echo -e "${B}------------------------------------------------${N}"
echo -e "${J}  ADMIN : Ir Élu | BATTERIE : $(termux-battery-status | grep percentage | awk -F: '{print $2}' | tr -d ' ,%')%${N}"
echo -e "${B}------------------------------------------------${N}"

echo -e "${V}[ ÉLECTRONIQUE & SANS-FIL ]${N}    ${C}[ PHISHING & RÉSEAU ]${N}"
echo -e "1) Lampe / Relais ON           11) ZPHISHER (Multi-sites)"
echo -e "2) Lampe / Relais OFF          12) Page Facebook / WA Pro"
echo -e "3) Vitesse Moteur (PWM)        13) Scan Nmap (IP & Ports)"
echo -e "4) Lecture Capteurs DHT        14) Détection Vulnérabilité"
echo -e "5) Scan USB Serial             15) Metasploit Console"
echo -e "6) SCAN WIFI (Auto-Detect)     16) SCAN BLUETOOTH (Radio)"
echo -e "7) TV : Power ON/OFF (IP)      17) RADIO : Play/Pause (BT)"
echo -e "8) TV : Volume +/-             18) RADIO : Suivant/Précédent"
echo -e "9) Scanner Réseau Local        19) Vérifier mon IP Publique"
echo -e "10) État Connexion Sans-fil    20) Test de Ping Continu"

echo -e "\n${R}[ BANNISSEMENT WA ]${N}           ${M}[ MAINTENANCE & SYSTEM ]${N}"
echo -e "21) BAN WHATSAPP (PRO)         26) Nettoyer les Logs"
echo -e "22) SIGNALEMENT MASSIF         27) Débloquer Fichiers 777"
echo -e "23) BAN DÉFINITIF              28) INFO APPAREIL (Neo)"
echo -e "24) SUPPRIMER COMPTE           29) ANALYSE MÉMOIRE RAM"
echo -e "25) ÉTAT DES SERVEURS          30) CONTACTER L'AUTEUR"
echo -e "${B}------------------------------------------------${N}"
read -p "Commande MGDJ > " ch

case $ch in
    1|2|3|4|5) echo -e "${V}Connexion USB/Arduino requise...${N}" ;;
    6|9|13) 
        MY_IP=$(ifconfig | grep -w "inet" | awk '{print $2}' | grep -v '127.0.0.1' | head -n 1)
        RANGE=$(echo $MY_IP | cut -d. -f1-3).0/24
        echo -e "${J}Scan sur $RANGE...${N}"
        nmap -sn $RANGE ;;
    16) termux-bluetooth-scan ;;
    11|12) [ -d ~/zphisher ] && cd ~/zphisher && bash zphisher.sh || echo "Installer Zphisher" ;;
    19) curl ifconfig.me ; echo "" ;;
    21|22|23|24) read -p "Numéro : " n ; echo -e "${R}Protocole de ban sur $n...${N}" ;;
    26) rm -rf ~/.bash_history && history -c && echo "Logs nettoyés" ;;
    27) chmod -R 777 ~/Magadju && echo "Permissions débloquées" ;;
    28) neofetch || pkg install neofetch -y && neofetch ;;
    29) free -h ;;
    30) termux-open-url https://wa.me/243971726328 ;;
    *) echo "Option invalide" ;;
esac
echo -e "${J}Retour au menu...${N}" ; sleep 2 ; bash ~/Magadju/pro_menu.sh
