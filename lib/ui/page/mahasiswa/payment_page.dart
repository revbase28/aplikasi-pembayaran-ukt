import 'dart:io';

import 'package:aplikasi_pembayaran_ukt/core/const.dart';
import 'package:aplikasi_pembayaran_ukt/core/midtrans_config.dart';
import 'package:flutter/material.dart';
import 'package:midtrans_snap/midtrans_snap.dart';
import 'package:midtrans_snap/models.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PaymentPage extends StatelessWidget {
  const PaymentPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _snapToken = ModalRoute.of(context)!.settings.arguments as String;

    var loadingPercentage = 0;
    final webViewController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            loadingPercentage = progress;
          },
        ),
      )
      ..addJavaScriptChannel('Print', onMessageReceived: (receiver) {
        //toast(receiver.message);
        print(receiver.message);
        if (receiver.message != 'undefined') {
          if (receiver.message == 'close') {
            Navigator.pushNamedAndRemoveUntil(context,
                RouteConsants.mahasiswaDashboardRoute, (route) => false);
          }
        }
      })
      ..addJavaScriptChannel('Android', onMessageReceived: (receiver) async {
        //toast(receiver.message);
        if (Platform.isAndroid) {
          if (receiver.message != 'undefined') {
            if (receiver.message == 'close') {
              Navigator.pushNamedAndRemoveUntil(context,
                  RouteConsants.mahasiswaDashboardRoute, (route) => false);
            } else if (receiver.message == 'ok') {
              Navigator.pushNamedAndRemoveUntil(context,
                  RouteConsants.mahasiswaDashboardRoute, (route) => false);
            } else {
              Navigator.pushNamedAndRemoveUntil(context,
                  RouteConsants.mahasiswaDashboardRoute, (route) => false);
            }
          }
        }
      })
      ..loadHtmlString(_snapMidtransHtml(_snapToken));

    // return SafeArea(
    //   child: Scaffold(
    //     body: MidtransSnap(
    //       mode: MidtransEnvironment.sandbox,
    //       token: snapToken,
    //       midtransClientKey: "SB-Mid-client-dhIH2Urcyl3HgyEv",
    //       onPageFinished: (url) {
    //         print("onPageFinished $url");
    //       },
    //       onPageStarted: (url) {
    //         print("onPageStarted $url");
    //       },
    //       onResponse: (result) {
    //         if(result.statusMessage == 'Success'){
    //           Navigator.pushNamedAndRemoveUntil(context, RouteConsants.mahasiswaDashboardRoute, (route) => false);
    //         }
    //         print("Midtrans : ${result.statusMessage}");
    //       },
    //     ),
    //   ),
    // );

    return SafeArea(
        child: Scaffold(body: WebViewWidget(controller: webViewController)));
  }
}

String _snapMidtransHtml(String snapToken) {
  return '''<html>
      <head>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <script 
          type="text/javascript"
          src="${MidtransConfig.midtransUrl}"
          data-client-key="${MidtransConfig.midtransClientKey}"
        ></script>
      </head>
      <body onload="setTimeout(function(){pay()}, 1000)">
        <script type="text/javascript">
            function pay() {
                snap.pay('$snapToken', {
                  // Optional
                  onSuccess: function(result) {
                    Android.postMessage('ok');
                    Print.postMessage(result);
                  },
                  // Optional
                  onPending: function(result) {
                    Android.postMessage('pending');
                    Print.postMessage(result);
                  },
                  // Optional
                  onError: function(result) {
                    Android.postMessage('error');
                    Print.postMessage(result);
                  },
                  onClose: function() {
                    Android.postMessage('close');
                    Print.postMessage('close');
                  }
                });
            }
        </script>
      </body>
    </html>''';
}
