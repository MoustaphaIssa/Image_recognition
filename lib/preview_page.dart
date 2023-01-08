import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:projetversion1/res/custom_colors.dart';
import 'package:projetversion1/widgets/app_bar_title.dart';

import 'package:tflite/tflite.dart';

class PreviewPage extends StatefulWidget {
  const PreviewPage({Key? key, required this.picture}) : super(key: key);
  final XFile picture;
  @override
  _PreviewPageState createState() => _PreviewPageState();
}

class _PreviewPageState extends State<PreviewPage> {
  late List _result;
  late String _conf = "";
  late String _name = "";
  //late String _number = "";

  @override
  void initState() {
    super.initState();
    //initCamera(widget.cameras![0]);
    loadImageModel();
    applyImageModel(widget.picture);
  }

  loadImageModel() async {
    var result = await Tflite.loadModel(
        labels: "assets/labels.txt", model: "assets/model_unquant.tflite");
    print("Result is *****************: $result");
  }

  applyImageModel(XFile file) async {
    var res = await Tflite.runModelOnImage(
        path: file.path,
        numResults: 2,
        threshold: 0.5,
        imageMean: 127.5,
        imageStd: 127.5);
    setState(() {
      _result = res!;
      String str = _result[0]["label"];
      _name = str.substring(2);
      _conf = _result != null
          ? (_result[0]['confidence'] * 100.0).toString().substring(0, 2) + '%'
          : "bla bla";
      print("************");
      //_conf= _result != null ? (_result[0]['confidence']);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.firebaseNavy,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: CustomColors.firebaseNavy,
        title: const AppBarTitle(),
      ),
      body: Center(
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          Image.file(File(widget.picture.path), fit: BoxFit.cover, width: 250),
          const SizedBox(height: 24),
          //Text(widget.picture.name),
          Column(
            children: [Text("It's $_name with confidence : $_conf %")],
          )
        ]),
      ),
    );
  }
}
/*
class PreviewPage extends StatelessWidget {
  const PreviewPage({Key? key, required this.picture}) : super(key: key);

  final XFile picture;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Preview Page')),
      body: Center(
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          Image.file(File(picture.path), fit: BoxFit.cover, width: 250),
          const SizedBox(height: 24),
          Text(picture.name)
        ]),
      ),
    );
  }

  loadImageModel() async {
    var result = await Tflite.loadModel(
        labels: "assets/labels.txt", model: "assets/model_unquant.tflite");
    print("Result is : $result");
  }
}
*/
