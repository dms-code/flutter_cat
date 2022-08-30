
import 'package:flutter/material.dart';

class RefreshButton extends StatelessWidget{

  final void Function()? onPressed;

  const RefreshButton({Key? key, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(4),
      child: Stack(
        children: <Widget>[
          Positioned.fill(
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: <Color>[
                    Color(0xFFB621EF),
                    Color(0xCB5406B4),
                    Color(0xFF8A42F5),
                  ],
                ),
              ),
            ),
          ),
          TextButton(
            style: TextButton.styleFrom(
              padding: const EdgeInsets.all(16.0),
              primary: Colors.white,
              textStyle: const TextStyle(fontSize: 20),
            ),
            onPressed: onPressed,
            child: const Text('Meow'),
          ),
        ],
      ),
    );
}

}