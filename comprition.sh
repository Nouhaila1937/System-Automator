#!/bin/bash
 
    BACKUP_SRC="/tmp"
    BACKUP_DATE=$(date +%Y%m%d%H%M%S)
    BACKUP_FILENAME="backup_$BACKUP_DATE.tar.gz"
    UID_ROOT=0  
     
    
    if [ "$UID" -ne "$UID_ROOT" ]; then 
        
        echo "error 100 : Permission denied "

    else 
        
        # Création du répertoire de sauvegarde si nécessaire
        mkdir  "compris"

        # Archivage du répertoire source
        cd compris
        tar -czf "$BACKUP_FILENAME" "$BACKUP_SRC"

        # Vérification de la réussite de la sauvegarde
        if [ $? -eq 0 ]; then 
            echo "Sauvegarde réussie : $BACKUP_FILENAME"
        else 
            echo "Sauvegarde échouée"
        fi
    fi
# }

