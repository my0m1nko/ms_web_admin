import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final Stream<QuerySnapshot> categoriesStream = FirebaseFirestore.instance.collection('categories').snapshots();
  return StreamBuilder<QuerySnapshot>(
      stream: categoriesStream, 
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if(snapshot.hasError){
          return const Center(child: Text('Something went wrong'));
        }
        if(snapshot.connectionState == ConnectionState.waiting){
          return const Center(child: CircularProgressIndicator(color: Colors.deepOrange,));
        }
        if(snapshot.hasData){
          return GridView.builder(
            shrinkWrap: true,
            itemCount: snapshot.data!.size,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 6,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
              childAspectRatio: 1.5
            ),
            itemBuilder: (context, index){
              final categoryData = snapshot.data!.docs[index];
              return Column(
                children: [
                  SizedBox(
                    height: 100,
                    width: 100,
                    child: Image.network(categoryData['image']),

                  ),
                  Text(
                    categoryData['categoryName'],
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.normal
                    ),
                  ),
                ],
              );
            });
          // return ListView.builder(
          //   itemCount: snapshot.data.docs.length,
          //   itemBuilder: (BuildContext context, int index) {
          //     return ListTile(
          //       title: Text(snapshot.data.docs[index]['categoryName']),
          //       leading: Image.network(snapshot.data.docs[index]['image']),
          //       trailing: IconButton(
          //         icon:const  Icon(Icons.delete),
          //         onPressed: (){
          //           _firestore.collection('categories').doc(snapshot.data.docs[index].id).delete();
          //         },
          //       ),
          //     );
          //   },
          // );
        }
        else{
          return const Center(child: CircularProgressIndicator());
        }
      });
  }
}