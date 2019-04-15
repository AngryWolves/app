import 'package:flutter/material.dart';
import 'package:flutter_ijkplayer/flutter_ijkplayer.dart';

class PlayerPage extends StatefulWidget {
  @override
  _PlayerPageState createState() => _PlayerPageState();
}

class _PlayerPageState extends State<PlayerPage> {

    IjkMediaController _controller = IjkMediaController();

  @override
  void initState() {
    super.initState();
    _controller.setNetworkDataSource('rtmp://live.hkstv.hk.lxdns.com/live/hks1', autoPlay: true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
            height: 400.0,
            child: IjkPlayer(mediaController: _controller),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller?.dispose();
  }
}
