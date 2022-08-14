import 'package:flutter/material.dart';
import 'package:glarryapp/ApiDara/HttpRequest.dart';
import 'package:glarryapp/ApiDara/Model.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:glarryapp/ApiDara/detailPage.dart';

// Text(_userModel![index].id.toString()),
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late List<GModel>? _userModel = [];
  GModel? alluser;
  @override
  void initState() {
    super.initState();
    _getData();
  }

  void _getData() async {
    _userModel = (await CustomHttpRequest().getGallary())!;
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('My Art works'),
        ),
        body: _userModel == null || _userModel!.isEmpty
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : GridView.builder(
                itemCount: _userModel!.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 1,
                  mainAxisSpacing: 1,
                ),
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => DetailPage(
                                    model: _userModel![index],
                                  ))));
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 8, vertical: 12),
                      height: 150,
                      width: double.infinity,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Stack(
                          children: [
                            Image.network(
                              _userModel![index].downloadUrl.toString(),
                              fit: BoxFit.cover,
                              width: double.infinity,
                              height: double.infinity,
                            ),
                            Positioned(
                              bottom: 5,
                              left: 10,
                              child: Text(
                                _userModel![index].author.toString(),
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w800),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ));
  }
}
