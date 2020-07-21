import 'package:flutter/material.dart';
import 'color_bloc.dart';

class StreamControllerPage extends StatefulWidget {
  @override
  _StreamControllerPageState createState() => _StreamControllerPageState();
}

class _StreamControllerPageState extends State<StreamControllerPage> {
  ColorBloc bloc = ColorBloc();
  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Bloc State Management ( Stream Controller )",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ),
      backgroundColor: Colors.blueGrey,
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            backgroundColor: Colors.greenAccent,
            onPressed: () {
              bloc.eventSink.add(ColorEvent.to_greenAcccent);
            },
          ),
          SizedBox(
            height: 50,
            width: 320,
          ),
          FloatingActionButton(
              backgroundColor: Colors.redAccent,
              onPressed: () {
                bloc.eventSink.add(ColorEvent.to_redAccent);
              }),
        ],
      ),
      body: Center(
        child: StreamBuilder(
          stream: bloc.stateStream,
          initialData: Colors.greenAccent,
          builder: (context, snapshot) {
            return AnimatedContainer(
              duration: Duration(milliseconds: 500),
              color: snapshot.data,
              width: 200,
              height: 200,
            );
          },
        ),
      ),
    );
  }
}
