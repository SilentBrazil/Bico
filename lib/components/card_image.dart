import 'package:flutter/material.dart';

class CardImage extends StatelessWidget {
  final image;

  const CardImage({Key key, this.image}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      clipBehavior: Clip.antiAlias,
      child: Container(
        width: 200,
        decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.cover,
              image: new NetworkImage(
                  image) //site gera imagem dinamicamente"
          ),
        ),
      ),
    );
  }
}
