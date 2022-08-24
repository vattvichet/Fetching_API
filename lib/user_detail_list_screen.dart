import 'package:fetching_api/controller/data_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserDetailListScreen extends StatefulWidget {
  const UserDetailListScreen({Key? key}) : super(key: key);

  @override
  State<UserDetailListScreen> createState() => _UserDetailListScreenState();
}

class _UserDetailListScreenState extends State<UserDetailListScreen> {
  DataController dataController = Get.put(DataController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    dataController.getUserInformationFromApi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => dataController.isDataLoading.value
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemBuilder: (ctx, i) {
                String image = '';
                String title = '';
                String subTitle = '';
//
                try {
                  image = dataController.user_list!.data![i].picture!;
                } catch (e) {
                  image = '';
                }
                try {
                  title = dataController.user_list!.data![i].title!;
                } catch (e) {
                  title = '';
                }
                try {
                  subTitle = dataController.user_list!.data![i].id!;
                } catch (e) {
                  subTitle = '';
                }
                //
                return ListTile(
                  leading: CircleAvatar(
                    radius: 20,
                    backgroundImage: NetworkImage(image),
                  ),
                  title: Text(title),
                  subtitle: Text(subTitle),
                );
              },
              itemCount: dataController.user_list!.data!.length,
            )),
    );
  }
}
