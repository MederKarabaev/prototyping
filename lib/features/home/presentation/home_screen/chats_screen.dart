import 'package:flutter/material.dart';

class ChatsScreen extends StatefulWidget {
  const ChatsScreen({super.key});

  @override
  State<ChatsScreen> createState() => _ChatsScreenState();
}

class _ChatsScreenState extends State<ChatsScreen> {
  int ii = 0;
  List chatViews = [
    const ChatsBlocView(),
    const MainChatView(),
  ];

  void ontNav(int i) {
    ii = i;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return ii == 0
        ? MainChatView(voidC: () => ontNav(1))
        : ChatsBlocView(voidC: () => ontNav(0));
  }
}

class MainChatView extends StatefulWidget {
  const MainChatView({super.key, this.voidC});
  final VoidCallback? voidC;

  @override
  State<MainChatView> createState() => _MainChatViewState();
}

class _MainChatViewState extends State<MainChatView> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          elevation: 0,
          pinned: true,
          floating: false,
          expandedHeight: 50.0,
          flexibleSpace: FlexibleSpaceBar(
            centerTitle: true,
            title: const Text(
              'Chats',
              style: TextStyle(fontSize: 17),
            ),
            background: Container(
              color: Colors.white,
            ),
          ),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(1.0),
            child: Container(
              color: Colors.black.withOpacity(.3),
              height: 0.5,
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return InkWell(
                onTap: widget.voidC,
                child: SizedBox(
                  height: 100,
                  child: Column(
                    children: [
                      const Expanded(
                          child: Padding(
                        padding: EdgeInsets.only(
                            top: 16, left: 16, right: 16, bottom: 20),
                        child: Row(
                          children: [
                            CircleAvatar(
                                backgroundColor: Colors.blue, radius: 32),
                            SizedBox(width: 16),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'James',
                                  style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w600),
                                ),
                                SizedBox(height: 6),
                                Text(
                                  'Thank you! That was very helpful!',
                                  style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                          ],
                        ),
                      )),
                      ColoredBox(
                        color: Colors.black.withOpacity(.3),
                        child:
                            const SizedBox(height: .5, width: double.infinity),
                      ),
                    ],
                  ),
                ),
              );
            },
            childCount: 4,
          ),
        ),
      ],
    );
  }
}

class ChatsBlocView extends StatefulWidget {
  const ChatsBlocView({super.key, this.voidC});
  final VoidCallback? voidC;

  @override
  State<ChatsBlocView> createState() => _ChatsBlocViewState();
}

class _ChatsBlocViewState extends State<ChatsBlocView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: widget.voidC,
        ),
        title: const Text('James'),
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1.0),
          child: Container(
            color: Colors.black.withOpacity(.3),
            height: 0.5,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: ListView.builder(
          itemCount: 4,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.only(bottom: 24, top: index == 0 ? 32 : 0),
              child: Row(
                children: index % 2 == 0
                    ? [
                        Flexible(
                          fit: FlexFit.tight,
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              color: const Color(0xff000000).withOpacity(.03),
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(6),
                                bottomLeft: Radius.circular(6),
                                bottomRight: Radius.circular(6),
                              ),
                            ),
                            child: const Padding(
                              padding: EdgeInsets.all(16.0),
                              child: Text('Элемент четный',
                                  softWrap: true, textAlign: TextAlign.end),
                            ),
                          ),
                        ),
                        const SizedBox(width: 16),
                        const CircleAvatar(backgroundColor: Colors.amber),
                      ]
                    : [
                        const CircleAvatar(backgroundColor: Colors.amber),
                        const SizedBox(width: 16),
                        Flexible(
                          fit: FlexFit.tight,
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              color: const Color(0xff000000).withOpacity(.03),
                              borderRadius: const BorderRadius.only(
                                topRight: Radius.circular(6),
                                bottomLeft: Radius.circular(6),
                                bottomRight: Radius.circular(6),
                              ),
                            ),
                            child: const Padding(
                              padding: EdgeInsets.all(16.0),
                              child: Text('Элемент нечетный', softWrap: true),
                            ),
                          ),
                        ),
                      ],
              ),
            );
          },
        ),
      ),
    );
  }
}
