import 'package:flutter/material.dart';
import 'package:my_e_commerce_app/providers/user_providers.dart';
import 'package:provider/provider.dart';

class UserInfo extends StatefulWidget {
  const UserInfo({super.key});

  @override
  State<UserInfo> createState() => _UserInfoState();
}

class _UserInfoState extends State<UserInfo> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(
        20,
      ),
      child: Column(
        children: [
          ClipOval(
            child: Container(
              width: 200,
              height: 200,
              color: Colors.white,
              child:
                  Image.network(context.read<UserProvider>().user?.image ?? ''),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            padding: const EdgeInsets.symmetric(
              vertical: 10,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                20,
              ),
              color: Colors.white,
            ),
            height: 500,
            child: const UserInfoListViewWithDivider(),
          ),
        ],
      ),
    );
  }
}

class UserInfoListViewWithDivider extends StatelessWidget {
  const UserInfoListViewWithDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> userInfoMap = {
      'id': context.read<UserProvider>().user?.id,
      'User': context.read<UserProvider>().user?.username,
      'Gender': context.read<UserProvider>().user?.gender,
      'Email': context.read<UserProvider>().user?.email,
      'First name': context.read<UserProvider>().user?.firstName,
      'Last name': context.read<UserProvider>().user?.lastName,
    };
    List userInfoKey = [...userInfoMap.keys];
    List userInfoValue = [...userInfoMap.values];

    return ListView.separated(
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 20,
            horizontal: 25,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '${userInfoKey[index]}:',
                style: const TextStyle(
                  fontSize: 18,
                ),
              ),
              Text(
                '${userInfoValue[index]}',
                style: const TextStyle(
                  fontSize: 18,
                ),
              ),
            ],
          ),
        );
      },
      separatorBuilder: (context, index) {
        return const Divider(
          thickness: 1,
        );
      },
      itemCount: userInfoMap.length,
    );
  }
}
