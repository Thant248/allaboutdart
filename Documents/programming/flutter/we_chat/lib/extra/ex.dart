import 'package:flutter/material.dart';

class WorkspaceView extends StatefulWidget {
  @override
  _CreateWorkspaceViewState createState() => _CreateWorkspaceViewState();
}

class _CreateWorkspaceViewState extends State<WorkspaceView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.3,
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: Colors.grey),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          GestureDetector(
            child: ListTile(
              title: Text("Jump to.."),
            ),
            onTap: () {},
          ),
          Column(
            children: [
              ListTile(
                leading: const Icon(Icons.list),
                title: const Text('Canvases'),
              ),
              ListTile(
                leading: const Icon(Icons.list),
                title: const Text('Draft & send'),
              ),
              ListTile(
                leading: const Icon(Icons.list),
                title: const Text('Later'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
