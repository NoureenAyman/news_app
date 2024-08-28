import 'package:flutter/material.dart';
import 'package:newss_app/Home/tabs/tab_widget.dart';
import 'package:newss_app/Model/SourceResponse.dart';
import 'package:newss_app/api/api_manager.dart';
import 'package:newss_app/appcolors.dart';

class HomeScreen extends StatefulWidget {
  static String routeName = 'home_screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        color: Appcolors.WhiteColor,
        child: Image.asset("assets/images/pattern_background.png",
            height: double.infinity, width: double.infinity, fit: BoxFit.fill),
      ),
      Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Appcolors.GreenColor,
          centerTitle: true,
          title: Text(
            "News App",
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        body: FutureBuilder<SourceResponse?>(
            future: ApiManager.getsources(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(
                    color: Appcolors.GreenColor,
                  ),
                );
              } else if (snapshot.hasError) {
                return Column(
                  children: [
                    Center(child: Text("Something went wrong")),
                    Center(
                      child: ElevatedButton(
                        onPressed: () {
                          ApiManager.getsources();
                          setState(() {});
                        },
                        child: Text('Try Again'),
                      ),
                    )
                  ],
                );
              }
              if (snapshot.data!.status != 'ok') {
                return Column(children: [
                  Center(child: Text(snapshot.data!.message!)),
                  Center(
                      child: ElevatedButton(
                          onPressed: () {
                            ApiManager.getsources();
                            setState(() {

                            });
                          },
                          child: Text('Try Again')))
                ]);
              }
              var sourcesList = snapshot.data!.sources!;
              return TabWidget(sourcesList: sourcesList);
            }),
      )
    ]);
  }
}