import 'package:chat_app/services/chat/chat_services.dart';
import 'package:flutter/material.dart';

import '../component/user_tile.dart';
import 'chat_page.dart';
import 'my_drawer.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final ChatServices chatServices = ChatServices();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        elevation: 0.0,
        centerTitle: true,
      ),
      drawer: MyDrawer(),
      body: _buildUserList(),
    );
  }

  Widget _buildUserList() {
    return StreamBuilder(
      stream: chatServices.getUserMessages(),
      builder: (context, snapshot) {
        // error handling
        if (snapshot.hasError) {
          return const Center(
            child: Text('Error loading users'),
          );
        }

        /// loading indicator
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        // return a list of users
        return ListView(
          children: snapshot.data!
              .map<Widget>((userData) => _buildUserListItem(
            userData,
            context,
          ))
              .toList(),
        );
      },
    );
  }

  Widget _buildUserListItem(
      Map<String, dynamic> userData, BuildContext context) {

    return UserTile(
      text: userData['username'],
      onTap: (){

        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ChatPage(
            receiverEmail: userData['email'],
          )),
        );
      },
    );
  }
}
