// Ce fichier contient pour l'instant:
        - Étapes de l'installation des outils
        - Création d'un venv Python
        - Installation des bibliothèques Python
        - Extraction du modèle de reconnaissance d'images
        - Démarrage du serveur Tensorflow
        - Démarrage de l'application Flask
        - Envoie de requête HTTP vers l'app Flask

// Une explication du contenu de chaque fichier de ce projet va être bientôt ajoutée 


// Pour faire extraire le modèle:
        - Créer un virtuel env Python et installer les "requirements" dans requirements.txt avec les commandes
            python3 -m venv env
            source env/bin/activate
            python3 -m pip install -r requirements.txt

        - Dans le fichier "model.py":
            - Vérifier le chemin du dataset pour la variable "dataset_url"
            - Vérifier le chemin du répertoire d'extraction des modèles pour la variable "MODEL_DIR"

        - Exécuter le fichier "model.py"


// Pour démarrer le serveur Tensorflow avec le modèle:
        - Installer "Tensorflow model server" avec la commande:
            sudo apt-get install tensorflow-model-server

        - Vérifier le chemin du répertoire d'extraction des modèles pour l'option "model_base_path" dans le fichier serve_tensorflow.sh

        - Lancer la commande:
            sh ./serve_tensorflow.sh
        
        - Pour la détection des changements des données:
            - Vérifier le chemin du dataset dans le fichier "script.sh" pour la variable "watchdir"
            - Lancer la commande:
                  sh ./script.sh


// Pour démarrer l'application Flask:
        - Assurer que le venv est activé

        - Dans le fichier "flask_app.py", vérifier le chemin du dataset pour la variable "dataset_url"

        - Exécuter le fichier "flask_app.py"


// Envoie de requête vers l'application Flask:
        - La requête doit être une requête http de type POST avec une image avec key=image
        - URL: http://127.0.0.1:5000/
        - La requête retourne la classe de l'image envoyée