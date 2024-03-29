import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pr_guide/book_list_app/add_book/add_book_screen.dart';
import 'package:flutter_pr_guide/book_list_app/book_list/book_list_view_model.dart';
import 'package:flutter_pr_guide/book_list_app/model/book.dart';
import 'package:flutter_pr_guide/book_list_app/update_book/update_book_screen.dart';
import 'package:flutterfire_ui/auth.dart';

class BookListScreen extends StatelessWidget {
  BookListScreen({Key? key}) : super(key: key);

  final viewModel = BookListViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('도서 리스트 앱'),
        actions: [
          IconButton(
            onPressed: () {
              viewModel.logout();
            },
            icon: const Icon(Icons.logout),
          ),
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const ProfileScreen(
                          providerConfigs: [
                            EmailProviderConfiguration(),
                            GoogleProviderConfiguration(
                              clientId:
                                  '223854375561-lbtter4cr98vegtclvpacl2oshptb5m2.apps.googleusercontent.com',
                            ),
                          ],
                          avatarSize: 24,
                        )),
              );
            },
            icon: const Icon(Icons.person),
          )
        ],
      ),
      body: StreamBuilder<QuerySnapshot<Book>>(
          stream: viewModel.booksStream,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return const Text('Something went wrong');
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Text("Loading");
            }
            return ListView(
              children: snapshot.data!.docs.map((DocumentSnapshot document) {
                Book book = document.data()! as Book;
                return Dismissible(
                  onDismissed: (_) {
                    viewModel.deleteBook(document.id);
                  },
                  background: Container(
                    alignment: Alignment.centerLeft,
                    color: Colors.red,
                    child: const Icon(Icons.delete, color: Colors.white),
                  ),
                  key: ValueKey(document.id),
                  child: ListTile(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => UpdateBookScreen(document)),
                      );
                    },
                    title: Text(book.title),
                    subtitle: Text(book.author),
                    leading: Image.network(
                      book.imageUrl,
                      width: 100,
                      height: 100,
                    ),
                  ),
                );
              }).toList(),
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddBookScreen()),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
