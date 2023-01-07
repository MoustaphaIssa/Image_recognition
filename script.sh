#!/bin/bash

# Le répertoire à surveiller
watchdir="/home/nejib/Documents/Projet_Prog/Code/Back/flower_photos"

# Exécutez une boucle infinie
while true; do
  # Obtenez la liste des répertoires dans le répertoire
  directories=$(find $watchdir -type d)

  # Stockez la liste de répertoires dans un fichier de référence
  echo "$directories" > /tmp/watched_directory_reference

  # Attendre jusqu'à minuit
  sleep "$(( $(date -d "tomorrow 0" +%s) - $(date +%s) ))"
  
  # Obtenez la liste des répertoires dans le répertoire
  directories=$(find $watchdir -type d)

  # Stockez la nouvelle liste de répertoires dans un fichier pour la comparaison
  echo "$directories" > /tmp/watched_directory_reference_compare

  # Si la liste de répertoires est différente de la référence, exécutez le code
  if ! diff /tmp/watched_directory_reference /tmp/watched_directory_reference_compare; then
    # Un répertoire a été ajouté ou supprimé!

    # Trouver le processus TensorFlow en cours d'exécution
    process_id=$(ps aux | grep tensorflow | awk '{print $2}')

    # Arrêter le processus
    kill $process_id

    # Exporter le modele
    env/bin/python3 model.py

    # Serve model
    # Chemin du script à exécuter
    script_path="serve_tensorflow.sh"
    # Exécutez le script
    bash $script_path
  fi
done
