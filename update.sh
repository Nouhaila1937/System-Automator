#!/bin/bash

update(){


    # Vérifier si l'utilisateur est root
    if [ "$(id -u)" -ne 0 ]; then
        echo "Error: Permission denied (You must be root to run this script)" >&2
        exit 1
    fi

    # Mettre à jour la liste des paquets
    echo "Updating package lists..."
    apt update

    # Mettre à jour les paquets
    echo "Upgrading packages..."
    apt upgrade -y

    # Nettoyer le cache des paquets
    echo "Cleaning up..."
    apt autoclean
    apt autoremove --purge

    echo "System update completed successfully."


}

