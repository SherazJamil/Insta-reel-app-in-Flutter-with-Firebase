import 'package:flutter/material.dart';
import 'package:reel_app/model_classes/user_model.dart';
import 'package:reel_app/profile_screen/profile_screen_view.dart';
import 'package:reel_app/search_screen/search_functions.dart';

class SearchView extends SearchDelegate {

  List<UserModel> userModel = [];

  void searchUser() async {
    userModel = [];
    userModel = await SearchFunctions.searchUsers(query) ?? [];
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
   return [
     IconButton(
       onPressed: () {
         query = "";
       },
       icon: const Icon(
           Icons.close_sharp,
       ),
     ),
   ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return BackButton();
  }

  @override
  Widget buildResults(BuildContext context) {
    searchUser();
    return ListView.builder(
        itemCount: userModel.length,
        itemBuilder: (context, index) {
          return ListTile(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => ProfileView(
                userUid: userModel[index].uid,
              )));
            },
            leading: CircleAvatar(
              backgroundImage: NetworkImage(
                userModel[index].profileImage,
              ),
              backgroundColor: Colors.grey,
            ),
            title: Text(
                userModel[index].name,
            ),
          );
        });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    searchUser();
    return ListView.builder(
        itemCount: userModel.length,
        itemBuilder: (context, index) {
          return ListTile(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => ProfileView(
                userUid: userModel[index].uid,
              )));
            },
            leading: CircleAvatar(
              backgroundImage: NetworkImage(
                userModel[index].profileImage,
              ),
              backgroundColor: Colors.grey,
            ),
            title: Text(
                userModel[index].username,
            ),
          );
        });
  }


}