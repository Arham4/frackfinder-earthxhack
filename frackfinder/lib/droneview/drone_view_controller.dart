import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

typedef void DroneViewCreatedCallback(DroneViewController controller);

class DroneViewController {
  MethodChannel _channel = new MethodChannel('droneview');
}

class DroneView extends StatefulWidget {
  final DroneViewCreatedCallback onViewCreated;

  DroneView({
    Key key,
    @required this.onViewCreated,
  });

  @override
  _DroneViewState createState() => _DroneViewState();
}

class _DroneViewState extends State<DroneView> {
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
            viewType: 'droneview',
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
    widget.onViewCreated(new DroneViewController());
  }
}
