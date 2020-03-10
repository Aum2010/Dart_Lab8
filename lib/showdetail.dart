import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class BookDetail extends StatefulWidget {
  final String _idi; //if you have multiple values add here
  BookDetail(this._idi, {Key key})
      : super(key: key); //add also..example this.abc,this...

  @override
  _BookDetailState createState() => _BookDetailState();
}

class _BookDetailState extends State<BookDetail> {
  Firestore _firestore = Firestore.instance;
  @override
  Widget build(BuildContext context) {
    String _id = widget._idi;
    return StreamBuilder(
        stream: getBook(_id),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          return Scaffold(
            appBar: AppBar(
              title: Text("Detail Books"),
            ),
            body: snapshot.hasData
                ? buildBookList(snapshot.data)
                : Center(
                    child: CircularProgressIndicator(),
                  ),
          );
        });
  }

  ListView buildBookList(QuerySnapshot data) {
    return ListView.builder(
      itemCount: data.documents.length,
      itemBuilder: (BuildContext context, int index) {
        var model = data.documents.elementAt(index);
        String a = model['detail'] + '  ' + model['price'].toString();
        return ListTile(
          title: Text(model['title']),
          //    subtitle: Text(model['detail'] + Text("${model['price']}")),
          subtitle: Text(a),
          trailing: RaisedButton(
              child: Text('Delete'),
              onPressed: () {
                
                deleteValue(model.documentID);
                Navigator.pop(context);
              }),
        );
      },
    );
  }

  Stream<QuerySnapshot> getBook(String titleName) {
    // Firestore _firestore = Firestore.instance;
    return _firestore
        .collection('books')
        .where('title', isEqualTo: titleName)
        .snapshots();
  }
  
  Future<void> deleteValue(String titleName) async {
    await _firestore 
          .collection('books')
          .document(titleName)
          .delete()
          .catchError((onError) {
              print(onError);
          });
  }
}


