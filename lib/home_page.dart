//import 'dart:html';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:projet/CameraPage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:projet/preview_page.dart';
import 'package:projet/res/custom_colors.dart';
import 'package:projet/widgets/app_bar_title.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ImagePicker picker = ImagePicker();
  late XFile selectedImage;
  late String result;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.firebaseNavy,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: CustomColors.firebaseNavy,
        title: const AppBarTitle(),
      ),
      //appBar: AppBar(title: const Text("Le Hangar App")),
      body: SafeArea(
        child: Center(
            child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 60.0),
              child: Center(
                child: Container(
                  //width: 200,
                  //height: 150,
                  child: ElevatedButton(
                    onPressed: () async {
                      await availableCameras().then((value) => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => CameraPage(cameras: value))));
                    },
                    child: Icon(Icons.camera_alt),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 60.0),
              child: Center(
                child: Container(
                  //width: 200,
                  //height: 150,
                  child: ElevatedButton(
                    onPressed: () async {
                      var image = await ImagePicker()
                          .pickImage(source: ImageSource.gallery);

                      setState(() async {
                        selectedImage =
                            XFile(image!.path); // won't have any error now
                        String result = await sendImage(selectedImage);
                      });

                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PreviewPage(
                                  picture: selectedImage, response: result)));
                      //await availableCameras().then((value) => Navigator.push(

                      /*selectedImage =
                          await picker.pickImage(source: ImageSource.gallery);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PreviewPage(
                                    picture: selectedImage,
                                  )));
                    */
                    },
                    child: Icon(Icons.photo_library),
                  ),
                ),
              ),
            ),
            /*
            ElevatedButton(
              onPressed: () async {
                await availableCameras().then((value) => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => CameraPage(cameras: value))));
              },
              //child: const Text("prendre Image"),
              child: Icon(Icons.camera_alt),
            ),
            ElevatedButton(
              onPressed: () async {
                selectedImage =
                    await picker.pickImage(source: ImageSource.gallery);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => PreviewPage(
                              picture: selectedImage,
                            )));
              },
              //child: const Text("prendre Image"),
              child: Icon(Icons.photo_library),
            ),
            */
          ],
        )),
      ),
    );
  }

  Future<String> sendImage(XFile imageFile) async {
    // Send the image to a server
    http.Response response = await http.post(
      Uri.parse('https://your-server.com/upload-image'),
      body: {'image': imageFile},
    );

    // Check the response status code
    if (response.statusCode == 200) {
      return 'Image successfully sent to server!';
    } else {
      return 'Failed to send image to server';
    }
  }
}
