import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:loadclear/view_model/themecontroller.dart';

// ignore: must_be_immutable
class CustomPopupMenu extends StatelessWidget {
  VoidCallback? onClick;
  CustomPopupMenu({super.key, this.onClick});
  final _controller = Get.put(ThemeController());

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<int>(
      icon: Icon(
        Icons.more_horiz,
        color: _controller.isDarkModeEnabled.value
            ? Colors.white
            : Theme.of(context).hintColor,
      ),
      color: _controller.isDarkModeEnabled.value
          ? Theme.of(context).highlightColor
          : Theme.of(context).scaffoldBackgroundColor,
      itemBuilder: (context) => [
        PopupMenuItem(
          value: 1,
          child: Text(
            'Edit',
            style: TextStyle(
                color: Theme.of(context).secondaryHeaderColor,
                fontSize: 14.sp,
                fontWeight: FontWeight.w400),
          ),
        ),
        PopupMenuItem(
          value: 2,
          child: Text(
            'Delete',
            style: TextStyle(
                color: Theme.of(context).secondaryHeaderColor,
                fontSize: 14.sp,
                fontWeight: FontWeight.w400),
          ),
        ),
      ],
      onSelected: (value) {
        switch (value) {
          case 1:
            showEditNameDialog(context);
            break;
          case 2:
            showDeleteDialog(
              context,
            );
            break;
        }
      },
    );
  }

  void showDeleteDialog(
    BuildContext context,
  ) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: _controller.isDarkModeEnabled.value
            ? Theme.of(context).highlightColor
            : Theme.of(context).scaffoldBackgroundColor,
        title: Text(
          'Delete',
          style: TextStyle(
              fontSize: 20.sp,
              color: Theme.of(context).secondaryHeaderColor,
              fontWeight: FontWeight.w600),
        ),
        content: Text('Are you sure you want to delete?',
            style: TextStyle(
                fontSize: 14.sp,
                color: _controller.isDarkModeEnabled.value
                    ? Theme.of(context).secondaryHeaderColor
                    : Theme.of(context).hintColor,
                fontWeight: FontWeight.w600)),
        actions: [
          TextButton(
            onPressed: onClick,
            child: Text('Yes',
                style: TextStyle(
                    fontSize: 16.sp,
                    color: Theme.of(context).indicatorColor,
                    fontWeight: FontWeight.w600)),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('No',
                style: TextStyle(
                    fontSize: 16.sp,
                    color: Theme.of(context).secondaryHeaderColor,
                    fontWeight: FontWeight.w600)),
          ),
        ],
      ),
    );
  }

  void showEditNameDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: _controller.isDarkModeEnabled.value
            ? Theme.of(context).highlightColor
            : Theme.of(context).scaffoldBackgroundColor,
        title: Text(
          'Edit Name',
          style: TextStyle(
              fontSize: 20.sp,
              color: Theme.of(context).secondaryHeaderColor,
              fontWeight: FontWeight.w600),
        ),
        content: TextField(
          style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              color: Theme.of(context).secondaryHeaderColor),
          decoration: InputDecoration(
              hintText: 'Enter new name',
              hintStyle: TextStyle(
                  color: _controller.isDarkModeEnabled.value
                      ? Theme.of(context).secondaryHeaderColor
                      : Theme.of(context).hintColor)),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('Cancel',
                style: TextStyle(
                    fontSize: 16.sp,
                    color: Theme.of(context).indicatorColor,
                    fontWeight: FontWeight.w600)),
          ),
          TextButton(
            onPressed: () {
              // Handle saving the new name
              Navigator.of(context).pop();
            },
            child: Text('Save',
                style: TextStyle(
                    fontSize: 16.sp,
                    color: Theme.of(context).shadowColor,
                    fontWeight: FontWeight.w600)),
          ),
        ],
      ),
    );
  }
}
