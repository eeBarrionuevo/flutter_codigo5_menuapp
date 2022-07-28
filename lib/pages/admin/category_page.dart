
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:menuapp/ui/widgets/my_appbar_widget.dart';

class CategoryPage extends StatelessWidget {

  final CollectionReference _categoryReference = FirebaseFirestore.instance.collection('categories');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.0),
        child: MyAppBarWidget(
          text: "Categorías",
        ),
      ),
      body: StreamBuilder(
        stream: _categoryReference.snapshots(),
        builder: (BuildContext context, AsyncSnapshot snap){
          if(snap.hasData){
            QuerySnapshot collection = snap.data;
            List<Map<String, dynamic>> productsMap = collection.docs.map((e) => e.data() as Map<String, dynamic>).toList();
            print(productsMap);
          }
          return Text("Hola");
        },
      ),
    );
  }
}
