import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: WhatsAppHome(),
    );
  }
}

class WhatsAppHome extends StatefulWidget {
  const WhatsAppHome({super.key});

  @override
  _WhatsAppHomeState createState() => _WhatsAppHomeState();
}

class _WhatsAppHomeState extends State<WhatsAppHome>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "WhatsApp",
          style: TextStyle(color: Colors.green),
        ),
        actions: [
          Icon(Icons.camera_alt, color: Colors.black54),
          SizedBox(width: 20),
          Icon(Icons.search, color: Colors.black54),
          SizedBox(width: 20),
          Icon(Icons.more_vert, color: Colors.black54),
        ],
        bottom: TabBar(
          controller: _tabController,
          // labelColor: Colors.green,
          // unselectedLabelColor: Colors.black54,
          // indicatorColor: Colors.green,
          tabs: [
            Tab(text: "All"),
            Tab(text: "Unread"),
            Tab(text: "Groups"),
            Tab(
              text: "Calls",
            )
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          buildChatsList(),
          buildUnreadList(),
          buildGroupsList(),
          buildCallsList(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.message),
        backgroundColor: Colors.green,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _tabController.index,
        onTap: (index) {
          setState(() {
            _tabController.index = index;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.chat), label: "Chats"),
          BottomNavigationBarItem(icon: Icon(Icons.update), label: "Updates"),
          BottomNavigationBarItem(
              icon: Icon(Icons.groups), label: "Communities"),
          BottomNavigationBarItem(icon: Icon(Icons.call), label: "Calls"),
        ],
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.black54,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }

  Widget buildChatsList() {
    return ListView(
      children: [
        buildChatItem("Besties", "Sarah: For tn: 🥾 or 👠?", "11:26 AM",
            pinned: true),
        buildChatItem(
          "Jonathan Miller",
          "Sticker",
          "9:28 AM",
          newMessage: true,
        ),
        buildChatItem(
          "Maya Townsend",
          "Dinner soon? 🍝🍷",
          "8:15 AM",
          sent: true,
        ),
        buildChatItem(
          "Lillian Evaro",
          "GIF",
          "8:03 AM",
          newMessage: true,
        ),
        buildChatItem("Cristiano Alves",
            "pls tell me you follow SingleCatClub...", "Yesterday",
            sent: true),
        buildChatItem(
          "The Hendricks",
          "Mom: How was this 10 yrs ago?",
          "Yesterday",
        ),
      ],
    );
  }

  Widget buildChatItem(String name, String message, String time,
      {bool pinned = false, bool sent = false, bool newMessage = false}) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage(
            'https://lh3.googleusercontent.com/a/ACg8ocKpscRADdRviAd--l9ulwzFp51lb1KrKF5c_qwE6mHK8FUFDxO3=s360-c-no'), // Replace with actual image assets or network image
      ),
      title: Text(name),
      subtitle: Row(
        children: [
          if (sent) Icon(Icons.check, size: 16, color: Colors.green),
          if (sent)SizedBox(width: 4),
          Text(message, style: TextStyle(color: Colors.black54),),
        ],
      ),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          if (!newMessage)
            Text(time, style: TextStyle(fontSize: 12, color: Colors.grey))
          else
            Text(time, style: TextStyle(fontSize: 12, color: Colors.green)),
          if (newMessage)
            Container(
              height: 20,
              width: 20,
              decoration:
              BoxDecoration(color: Colors.green, shape: BoxShape.circle),
              child: Center(
                child: Text('1', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.white),),
              ),
            ),
          if (pinned)
            Icon(
              Icons.push_pin,
              size: 14,
              color: Colors.grey,
            ),
        ],
      ),
    );
  }

  Widget buildUnreadList() {
    // Implementation similar to buildChatsList with unread-specific logic
    return Center(child: Text("Unread Messages"));
  }

  Widget buildGroupsList() {
    // Implementation similar to buildChatsList with group-specific logic
    return Center(child: Text("Groups"));
  }

  Widget buildCallsList() {
    // Implementation similar to buildChatsList with group-specific logic
    return Center(child: Text("Calls"));
  }
}
