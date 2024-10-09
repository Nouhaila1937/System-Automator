# #!/bin/bash

# # Chemin vers le fichier où sauvegarder l'utilisation de la mémoire
# MEMORY_FILE="/memory_usage.txt"

# # Adresse email à laquelle envoyer la notification
# EMAIL_ADDRESS="lahsaouinouhaila@gmail.com"

# # Calculer l'utilisation de la mémoire et la sauvegarder dans le fichier
# memory_usage=$(free -h | awk 'NR==2{printf "Memory Usage: %s/%s (%.2f%%)\n", $3,$2,$3*100/$2 }')

# # Envoyer l'email
# echo "$memory_usage" | mailx -s "Memory Usage Notification" $EMAIL_ADDRESS
#!/bin/bash
#Defining variables 
#!/bin/bash
# Définition des variables

BACKUP_SRC="/tmp"
BACKUP_DST="/backups"
BACKUP_DATE=$(date +%Y%m%d%H%M%S)
BACKUP_FILENAME="backup_$BACKUP_DATE.tar.gz"

# Création du répertoire de sauvegarde si nécessaire
mkdir -p "$BACKUP_DST/$BACKUP_DATE"

# Archivage du répertoire source
tar -czf "$BACKUP_DST/$BACKUP_DATE/$BACKUP_FILENAME" "$BACKUP_SRC"

# Vérification de la réussite de la sauvegarde
if [ $? -eq 0 ]; then 
    echo "Sauvegarde réussie : $BACKUP_FILENAME"
else 
    echo "Sauvegarde échouée"
fi
