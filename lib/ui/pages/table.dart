part of 'pages.dart';

class TableExample extends StatefulWidget {
  @override
  _TableExampleState createState() => _TableExampleState();
}

class _TableExampleState extends State<TableExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Table(
          border: TableBorder.all(
              color: Colors.black26, width: 1, style: BorderStyle.solid),
          children: [
            TableRow(
              children: [
                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.middle,
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Text('No'),
                    )
                  )
                ),
                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.middle,
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Text('Invoice Number'),
                    )
                  ),
                ),
                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.middle,
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Text('Shipping Number'),
                    )
                  )
                ),
                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.middle,
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Text('Shipping Date/Status'),
                    )
                  )
                ),
              ]
            ),
            TableRow(
              children: [
                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.middle,
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Text('1'),
                    )
                  )
                ),
                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.middle,
                  child: Center(
                    child: Text('')
                  ),
                ),
                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.middle,
                  child: Center(
                    child: Text('')
                  )
                ),
                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.middle,
                  child: Center(
                    child: Text('')
                  )
                ),
              ]
            ),
            TableRow(
              children: [
                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.middle,
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Text('2'),
                    )
                  )
                ),
                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.middle,
                  child: Center(
                    child: Text('')
                  ),
                ),
                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.middle,
                  child: Center(
                    child: Text('')
                  )
                ),
                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.middle,
                  child: Center(
                    child: Text('')
                  )
                ),
              ]
            ),
            TableRow(
              children: [
                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.middle,
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Text('3'),
                    )
                  )
                ),
                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.middle,
                  child: Center(
                    child: Text('')
                  ),
                ),
                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.middle,
                  child: Center(
                    child: Text('')
                  )
                ),
                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.middle,
                  child: Center(
                    child: Text('')
                  )
                ),
              ]
            ),
          ],
        ),
      ),
    );
  }
}