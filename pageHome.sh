#!/bin/bash

source cleaning.sh  #include file cleaning.sh to this file
source monitoring.sh  #include file monitoring.sh to this file 
source update.sh  #include file update.sh to this file
source comprition.sh  #include file comprition.sh to this file
echo "==================== Systeme Automator ======================" ;

#Système Automator => Cela souligne leur capacité à automatiser différentes tâches liées à la surveillance, à la maintenance et à la mise à jour du système.

echo " Hello to our Script that can do a lot of services  . \n "
echo " choose a service : \n" ;
echo " ==>  1 : System Monitoring ( monitor system performance) . Click A ";
echo " ==>  2 : System Cleaning ( clean the system by deleting temporary files ) . Click B ";
echo " ==>  3 : Update Script ( displays available updates and performs the updates. ) . Click C ";
echo " ==>  4 : Comprition Script ( compriser le continue de fils. ) . Click d ";
echo "============================================================="
read chose ;

# bool for take the chose of the user 
case $chose in 
    A|a)
        echo "System Monitoring";
        monitoring;
        ;;
    B|b)
        echo "System Cleaning";
        Cleaning;
        ;;
    C|c)
        echo "Update Script";
        update;
        ;;
    D|d)
        echo "comprition Script";
        comprition;
        ;;
    *)
        echo " ERROR !! "
        ;;
esac

