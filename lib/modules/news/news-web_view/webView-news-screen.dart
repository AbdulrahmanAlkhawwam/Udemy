import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../../../shared/network/local/cache-helper.dart';

class webViewScreen extends StatelessWidget {

  late final String url ;
  webViewScreen(this.url);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SafeArea(
        child: Stack(
          children:[
            WebViewWidget(controller: WebViewController()
              ..setJavaScriptMode(JavaScriptMode.disabled)
              ..loadRequest(Uri.parse(url))
            ),
            Container(
              height: 55.0,
              width: double.infinity,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.center,
                      colors: [
                        CacheHelper.getBoolean(key: 'isDark')!?HexColor('333739'):Colors.white,
                        Color.fromARGB(80, 255, 87, 34),
                ]
                  ),
              ),
              child: IconButton(
                onPressed: (){
                  Navigator.pop(context);
                },
                icon: Row(
                  children: [
                    Icon(
                      Icons.arrow_back_outlined,
                      color: CacheHelper.getBoolean(key: 'isDark')!?Colors.white:Colors.black,
                    ),
                  ],
                ),
              ),
            ),
          ]
        ),
      ),
    );
  }
}
