import 'package:flutter/material.dart';
import 'package:webview_flutter_plus/webview_flutter_plus.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  WebViewPlusController? _controller;
  double _height = 1;
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: CustomScrollView(
          slivers: <Widget>[
            // SLIVER APP BAR (LOGO INAKLUG, TULISAN INAKLUG, ICON BURGER, 2 WARNA AGAK TRANSPARENT)
            SliverAppBar(
              pinned: true,
              expandedHeight: 80,
              flexibleSpace: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.blue.withOpacity(0.9),
                      Colors.purple.withOpacity(0.9),
                    ],
                  ),
                ),
              ),
              title: Row(
                children: <Widget>[
                  Image.asset(
                    'images/inaklug.png',
                    fit: BoxFit.contain,
                    height: 50,
                  ),
                  const Text('Inaklug'),
                ],
              ),
              actions: <Widget>[
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Builder(
                    builder: (context) {
                      return IconButton(
                        icon: Icon(Icons.menu),
                        onPressed: () {
                          Scaffold.of(context).openEndDrawer();
                        },
                      );
                    },
                  ),
                ),
              ],
              backgroundColor: Colors.transparent,
            ),

            // SLIVER LIST HUBUNGI KAMI
            SliverList(
              delegate: SliverChildListDelegate([
                Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(),
                      child: ClipRRect(
                        child: Image.asset("images/berlin.jpg"),
                      ),
                    ),
                    Positioned(
                      bottom: 20,
                      left: 125,
                      child: Container(
                        padding: EdgeInsets.all(0),
                        alignment: Alignment.center,
                        child: Text(
                          "HUBUNGI KAMI",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 25.0,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Times New Roman',
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ]),
            ),

            // SLIVER LIST TULISAN KIRIM PESAN
            SliverList(
              delegate: SliverChildListDelegate([
                Padding(
                  padding: EdgeInsets.only(top: 50),
                  child: Center(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              "KIRIM PESAN",
                              style: TextStyle(
                                  fontSize: 30.0, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        // TULISAN NAMA
                        Row(
                          children: [
                            Text(
                              "Nama*",
                              style: TextStyle(fontSize: 16.0),
                            ),
                          ],
                        ),
                        TextField(
                          decoration: InputDecoration(labelText: 'Nama'),
                        ),

                        // PERUSAHAAN / ORGANISASI
                        Row(
                          children: [
                            Text(
                              "Perusahaan / Organisasi",
                              style: TextStyle(fontSize: 16.0),
                            ),
                          ],
                        ),
                        TextField(
                          decoration: InputDecoration(
                              labelText: 'Nama Perusahaan / Organisasi'),
                        ),

                        // ALAMAT EMAIL
                        Row(
                          children: [
                            Text(
                              "Alamat Email",
                              style: TextStyle(fontSize: 16.0),
                            ),
                          ],
                        ),
                        TextField(
                          decoration: InputDecoration(
                              labelText: 'Alamat Email Anda'),
                        ),

                        // NO TELEPON/HANDPHONE
                        Row(
                          children: [
                            Text(
                              "Telephone / Handphone",
                              style: TextStyle(fontSize: 16.0),
                            ),
                          ],
                        ),
                        TextField(
                          decoration: InputDecoration(
                              labelText: 'Nomor Telepon Anda'),
                        ),

                        // PESAN ANDA
                        Row(
                          children: [
                            Text(
                              "Pesan Anda",
                              style: TextStyle(fontSize: 16.0),
                            ),
                          ],
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 16.0),
                          margin: EdgeInsets.only(bottom: 20.0),
                          child: TextField(
                            maxLines: 7,
                            decoration: InputDecoration(
                              labelText: 'Isi Pesan Anda',
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: _height,
                          child: WebViewPlus(
                            onWebViewCreated: (controller) {
                              this._controller = controller;
                              controller.loadUrl('assets/webpages/index.html');
                            },
                            onPageFinished: (url) {
                              _controller?.getHeight().then((double height) {
                                print("Height: " + height.toString());
                                // You need to implement a State class to use setState
                                // setState(() {
                                //   _height = height;
                                // });
                              });
                            },
                            javascriptMode: JavascriptMode.unrestricted,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ]),
            ),

            // SLIVER LIST TOMBOL kirim pesan
            SliverList(
              delegate: SliverChildListDelegate([
                Padding(
                  padding: const EdgeInsets.only(
                      top: 20.0, left: 70, right: 70, bottom: 50),
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          Colors.white),
                      shape: MaterialStateProperty.all<OutlinedBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(45.0),
                          side: BorderSide(
                            color: Colors.black,
                            width: 1.0,
                          ),
                        ),
                      ),
                    ),
                    child: Text(
                      "KIRIM PESAN",
                      style: TextStyle(
                        fontFamily: 'Times New Roman',
                        color: Colors.blue,
                      ),
                    ),
                  ),
                ),
              ]),
            ),

            // SLIVER LIST TULISAN LOKASI KAMI DAN ISINYA
            SliverList(
              delegate: SliverChildListDelegate([
                Container(
                  padding: EdgeInsets.all(30.0),
                  child: Column(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(bottom: 10.0),
                        child: Row(
                          children: [
                            Text(
                              'LOKASI KAMI',
                              style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Times New Roman',
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 10.0),
                        child: Row(
                          children: [
                            Text(
                              'Kantor Pusat',
                              style: TextStyle(
                                fontSize: 18.0,
                                fontFamily: 'Times New Roman',
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 10.0),
                        child: Row(
                          children: [
                            Text(
                              'MULA BY GALERIA JAKARTA,\nCILANDAK TOWN SQUARE, LT. \nBASEMENT.',
                              style: TextStyle(
                                fontSize: 16.0,
                                fontFamily: 'Times New Roman',
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 10.0),
                        child: Row(
                          children: [
                            Text(
                              'PHONE : 0852-8675-4052',
                              style: TextStyle(
                                fontSize: 16.0,
                                fontFamily: 'Times New Roman',
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ]),
            ),

            // SLIVER LIST FOOTER UNTUK COPYRIGHT
            SliverList(
              delegate: SliverChildListDelegate([
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [Colors.blue, Colors.purple],
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: Text(
                        "Copyright 2023 - inaklug Indonesia Hak Cipta dilindungi Undang-undang",
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Times New Roman',
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ]),
            ),
          ],
        ),

        // ISI BURGER ICON
        endDrawer: Center(
          child: Container(
            width: double.infinity,
            margin: EdgeInsets.only(
                bottom: MediaQuery.of(context).size.height * 0.47),
            child: Drawer(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Builder(
                    builder: (BuildContext builderContext) => Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset(
                          "images/Inaklug.png",
                          height: 70,
                          fit: BoxFit.contain,
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.close,
                            size: 35,
                          ),
                          onPressed: () {
                            // Close the drawer when the close button is pressed
                            Navigator.of(builderContext).pop();
                          },
                        ),
                      ],
                    ),
                  ),
                  ListTile(
                    title: Text('HOME', style: TextStyle(fontSize: 20)),
                    onTap: () {},
                    contentPadding: EdgeInsets.only(left: 140),
                  ),
                  ListTile(
                    title: Text('TENTANG KAMI', style: TextStyle(fontSize: 20)),
                    onTap: () {},
                    contentPadding: EdgeInsets.only(left: 140),
                  ),
                  ListTile(
                    title: Text('LAYANAN KAMI', style: TextStyle(fontSize: 20)),
                    onTap: () {},
                    contentPadding: EdgeInsets.only(left: 140),
                  ),
                  ListTile(
                    title: Text('ARTIKEL', style: TextStyle(fontSize: 20)),
                    onTap: () {},
                    contentPadding: EdgeInsets.only(left: 140),
                  ),
                  ListTile(
                    title: Text('HUBUNGI KAMI', style: TextStyle(fontSize: 20)),
                    onTap: () {},
                    contentPadding: EdgeInsets.only(left: 140),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
