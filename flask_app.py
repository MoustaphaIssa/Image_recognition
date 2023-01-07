from flask import Flask, request, jsonify
from PIL import Image
import tensorflow as tf
import json
import requests
import numpy as np
import pathlib

app = Flask(__name__)

@app.route("/", methods=["POST"])
def prediction():
      # Récupérer l'image à partir de la requête HTTP
    image = request.files["image"]

    # Ouvrir l'image avec PIL
    img = Image.open(image)
    img = decode_img(img).numpy().tolist()

    data = json.dumps({"signature_name": "serving_default", "instances": [img]})

    headers = {"content-type": "application/json"}
    json_response = requests.post('http://localhost:8501/v1/models/flowers:predict', data=data, headers=headers)
    predictions = json.loads(json_response.text)['predictions']
    class_name = class_names[np.argmax(predictions[0])]

    # Traiter les données et générer une réponse
    response_data = {
        "result": class_name,
    }

    # Renvoyer la réponse en tant que réponse HTTP
    return jsonify(response_data)


batch_size = 32
img_height = 180
img_width = 180

dataset_url = "/home/nejib/Documents/Projet_Prog/Code/Back/flower_photos"
data_dir = pathlib.Path(dataset_url)
train_ds = tf.keras.utils.image_dataset_from_directory(
  data_dir,
  validation_split=0.2,
  subset="training",
  seed=123,
  image_size=(img_height, img_width),
  batch_size=batch_size)
class_names = train_ds.class_names

def decode_img(img):
  # Convert the compressed string to a 3D uint8 tensor
  #img = tf.io.decode_jpeg(img, channels=3)
  # Resize the image to the desired size
  return tf.image.resize(img, [img_height, img_width])