import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:glarryapp/ApiDara/Model.dart';
import 'package:glarryapp/ApiDara/gridDemo.dart';
import 'package:path_provider/path_provider.dart';

class DetailPage extends StatefulWidget {
  final String? id;
  final String? author;
  final int? width;
  final int? height;
  final String? url;
  final String? downloadUrl;
  GModel? model;
  DetailPage({
    Key? key,
    this.id,
    this.author,
    this.width,
    this.height,
    this.url,
    this.downloadUrl,
    this.model,
  }) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  Dio dio = Dio();
  double progress = 0.0;

  void startDownloading() async {
    const String url =
        'https://picsum.photos/v2/list?fbclid=IwAR1N3HFTF1lAwuEZhdOXxAy8327z8CtA4RDi4Jw_9YbtjVvVrISGMjoOVno';

    const String fileName = "downloadUrl";

    String path = await _getFilePath(fileName);

    await dio.download(
      url,
      path,
      onReceiveProgress: (recivedBytes, totalBytes) {
        setState(() {
          progress = recivedBytes / totalBytes;
        });

        print(progress);
      },
      deleteOnError: true,
    ).then((_) {
      Navigator.pop(context);
    });
  }

  Future<String> _getFilePath(String filename) async {
    final dir = await getApplicationDocumentsDirectory();
    return "${dir.path}/$filename";
  }

  @override
  void initState() {
    super.initState();
    startDownloading();
  }

  @override
  Widget build(BuildContext context) {
    String downloadingprogress = (progress * 100).toInt().toString();
    return Scaffold(
      body: Column(children: [
        //  CircularProgressIndicator.adaptive(),
        Container(
          child: Image.network(
            '${widget.model!.downloadUrl}',
            height: double.infinity,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          height: MediaQuery.of(context).size.height / 1.1,
          color: Colors.blue,
        ),
        ElevatedButton.icon(
            onPressed: () {},
            icon: Icon(Icons.download),
            label: Text('Download'))
      ]),
    );
  }
}
