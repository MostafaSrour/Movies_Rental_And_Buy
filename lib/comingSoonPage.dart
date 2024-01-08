import 'package:flutter/material.dart';

class ComingSoonPage extends StatefulWidget {
  ComingSoonPage(this.icon, {Key? key}) : super(key: key);

  final IconData icon;

  @override
  _ComingSoonPageState createState() => _ComingSoonPageState();
}

class _ComingSoonPageState extends State<ComingSoonPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Icon(widget.icon, color: Colors.white, size: 96),
            const Padding(padding: EdgeInsets.only(bottom: 36)),
            Text('Coming soon!',
                style: Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.apply(color: Colors.white)),
            const Padding(padding: EdgeInsets.only(bottom: 8)),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 64),
              child: Text("Stay Tuned!",
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .headlineMedium!
                      .apply(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}
