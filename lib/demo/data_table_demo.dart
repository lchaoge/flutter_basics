import 'package:flutter/material.dart';
import 'package:flutter_basics/model/post.dart';

class PostDataSource extends DataTableSource {
  final List<Post> _posts = posts;
  int _selectedCount = 0;

  @override
  // TODO: implement rowCount
  int get rowCount => _posts.length;

  @override
  // TODO: implement isRowCountApproximate
  bool get isRowCountApproximate => false;

  @override
  // TODO: implement selectedRowCount
  int get selectedRowCount => _selectedCount;

  @override
  DataRow getRow(int index) {
    // TODO: implement getRow
    return DataRow.byIndex(index: index, cells: <DataCell>[
      DataCell(Text(_posts[index].title)),
      DataCell(Text(_posts[index].author)),
      DataCell(Image.network(
        _posts[index].imageUrl,
        fit: BoxFit.cover,
      )),
      DataCell(Text(_posts[index].description)),
    ]);
  }
}

class DataTableDemo extends StatefulWidget {
  @override
  _DataTableDemoState createState() => _DataTableDemoState();
}

class _DataTableDemoState extends State<DataTableDemo> {
  int _sortColumnIndex;
  bool _sortAscending = true;

  final PostDataSource _postsDataSource = PostDataSource();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DataTableDemo'),
        elevation: 0.0,
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: ListView(
          children: <Widget>[
            PaginatedDataTable(
              sortColumnIndex: _sortColumnIndex,
              sortAscending: _sortAscending,
              onSelectAll: (bool value) {},
              header: Text('posts'),
              rowsPerPage: 5,
              source: _postsDataSource,
              columns: [
                DataColumn(
                    label: Text('title'),
                    onSort: (int index, bool ascending) {
                      setState(() {
                        _sortColumnIndex = index;
                        _sortAscending = ascending;
                        posts.sort((a, b) {
                          if (!ascending) {
                            final c = a;
                            a = b;
                            b = c;
                          }
                          return a.title.length.compareTo(b.title.length);
                        });
                      });
                    }),
                DataColumn(
                  label: Text('author'),
                ),
                DataColumn(
                  label: Text('image'),
                ),
                DataColumn(
                  label: Container(
                    width: 150.0,
                    child: Text('description'),
                  ),
                ),
              ],
            ),
            DataTable(
                sortColumnIndex: _sortColumnIndex,
                sortAscending: _sortAscending,
                onSelectAll: (bool value) {},
                columns: [
                  DataColumn(
                      label: Text('title'),
                      onSort: (int index, bool ascending) {
                        setState(() {
                          _sortColumnIndex = index;
                          _sortAscending = ascending;
                          posts.sort((a, b) {
                            if (!ascending) {
                              final c = a;
                              a = b;
                              b = c;
                            }
                            return a.title.length.compareTo(b.title.length);
                          });
                        });
                      }),
                  DataColumn(
                    label: Text('author'),
                  ),
                  DataColumn(
                    label: Text('image'),
                  ),
                  DataColumn(
                    label: Container(
                      width: 150.0,
                      child: Text('description'),
                    ),
                  ),
                ],
                rows: posts.map((item) {
                  return DataRow(
                      selected: item.selected,
                      onSelectChanged: (bool value) {
                        setState(() {
                          if (item.selected != value) {
                            item.selected = value;
                          }
                        });
                      },
                      cells: [
                        DataCell(Text(item.title)),
                        DataCell(Text(item.author)),
                        DataCell(Image.network(
                          item.imageUrl,
                          fit: BoxFit.cover,
                        )),
                        DataCell(Text(item.description)),
                      ]);
                }).toList()),
          ],
        ),
      ),
    );
  }
}
