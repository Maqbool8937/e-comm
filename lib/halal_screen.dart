import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class PunjabiPoetryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      appBar: AppBar(
        title: Text('Punjabi Poetry'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('poetry')
            .doc('bM89BSkaAMKKapoVjsFy') // Replace with your sub-collection document ID
            .collection('punjabipoetry') // Sub-collection name
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text('Error fetching data'));
          }

          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return Center(child: Text('No Punjabi poetry found'));
          }

          // Extract the list of documents
          var poetryDocs = snapshot.data!.docs;

          return ListView.builder(
            itemCount: poetryDocs.length,
            itemBuilder: (context, index) {
              var doc = poetryDocs[index];
              var poetryData = doc.data() as Map<String, dynamic>;

              // Extract document ID and fields
              String docId = doc.id; // Document ID
              String title = poetryData['title'] ?? 'Untitled';
              String content = poetryData['age']?.toString() ?? 'No content available';

              return Card(
                margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                child: ListTile(
                  title: Text(
                    title,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(content),
                      SizedBox(height: 4),
                      Text('Document ID: $docId', style: TextStyle(fontSize: 12, color: Colors.grey)),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
