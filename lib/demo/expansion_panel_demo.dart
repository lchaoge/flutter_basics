import 'package:flutter/material.dart';

class ExpansionPanelItem{
  final String headerText;
  final Widget body;
  bool isExpaned;

  ExpansionPanelItem({
    this.headerText,
    this.body,
    this.isExpaned
  });
}

class ExpansionPanelDemo extends StatefulWidget {
  @override
  _ExpansionPanelDemoState createState() => _ExpansionPanelDemoState();
}

class _ExpansionPanelDemoState extends State<ExpansionPanelDemo> {
  List<ExpansionPanelItem> _expansionPanelItems;

  @override
    void initState() {
      super.initState();
      _expansionPanelItems = <ExpansionPanelItem>[
        ExpansionPanelItem(
          headerText: 'Panel A',
          body: Container(
            padding: EdgeInsets.all(16.0),
            width: double.infinity,
            child: Text('content for panel A'),
          ),
          isExpaned: false
        ),
        ExpansionPanelItem(
          headerText: 'Panel B',
          body: Container(
            padding: EdgeInsets.all(16.0),
            width: double.infinity,
            child: Text('content for panel B'),
          ),
          isExpaned: false
        ),
        ExpansionPanelItem(
          headerText: 'Panel C',
          body: Container(
            padding: EdgeInsets.all(16.0),
            width: double.infinity,
            child: Text('content for panel C'),
          ),
          isExpaned: false
        ),
      ];
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Scaffold(
      appBar: AppBar(
        title: Text('ExpansionPanelDemo'),
        elevation: 0.0,
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 16.0,
            ),
            ExpansionPanelList(
              expansionCallback: (int panelIndex, bool isExpaned) {
                print(isExpaned);
                setState(() {
                  _expansionPanelItems[panelIndex].isExpaned = !isExpaned;
                });
              },
              children: 
                _expansionPanelItems.map(
                  (ExpansionPanelItem item){
                  return ExpansionPanel(
                    headerBuilder: (BuildContext context, bool isExpansion) {
                      return Container(
                        padding: EdgeInsets.all(16.0),
                        child: Text(item.headerText,
                            style: Theme.of(context).textTheme.title),
                      );
                    },
                    body: item.body,
                    isExpanded: item.isExpaned,
                  );
                }).toList(),
            )
          ],
        ),
      ),
    ));
  }
}
