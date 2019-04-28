import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

typedef void TextureViewCreatedCallback(TextureViewController controller);

class TextureViewController {
  MethodChannel _channel = new MethodChannel('textureview');

  Future<void> loadUrl(String url) async {
    assert(url != null);
    return _channel.invokeMethod('loadUrl', url);
  }
}

class TextureView extends StatefulWidget {
  final TextureViewCreatedCallback onViewCreated;

  TextureView({
    Key key,
    @required this.onViewCreated,
  });

  @override
  _TextureViewState createState() => _TextureViewState();
}

class _TextureViewState extends State<TextureView> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text("test"),
        Container(
          width: 300,
          height: 300,
          decoration: BoxDecoration(color: Colors.blue),
          child: AndroidView(
            viewType: 'textureview',
            onPlatformViewCreated: onPlatformViewCreated,
            creationParamsCodec: const StandardMessageCodec(),
          ),
        )
      ],
    );
  }

  Future<void> onPlatformViewCreated(id) async {
    if (widget.onViewCreated == null) {
      return;
    }
    widget.onViewCreated(new TextureViewController());
  }
}
