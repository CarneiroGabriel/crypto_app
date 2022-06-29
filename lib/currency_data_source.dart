import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'currency.dart';

enum CurrencyColumn { id, rank, name, price, oneHChange, OneDChange, marketCap }

class CurrencyDataSource extends DataGridSource {
  late List<DataGridRow> _currencies;

  @override
  List<DataGridRow> get rows => _currencies;

  CurrencyDataSource({required List<Currency> currencies}) {
    buildDataGrid(currencies);
  }

  void buildDataGrid(List<Currency> currencies) => _currencies = currencies
      .map<DataGridRow>(
        (currency) => DataGridRow(
          cells: CurrencyColumn.values
              .map(
                (colunm) => DataGridCell<Currency>(
                  columnName: colunm.toString(),
                  value: currency,
                ),
              )
              .toList(),
        ),
      )
      .toList();

  @override
  DataGridRowAdapter buildRow(DataGridRow row) => DataGridRowAdapter(
          cells: row.getCells().map<Widget>((dataGridCell) {
        final Currency currency = dataGridCell.value;
        final column = CurrencyColumn.values
            .firstWhere((value) => value.toString() == dataGridCell.columnName);
        print("build|Row ");

        switch (column) {
          case CurrencyColumn.id:
            return buildIdRow(currency);
        }

        return Text("hello");
      }).toList());

  Widget buildIdRow(Currency currency) {
    return Container(
      padding: EdgeInsets.all(12),
      child: Text(
        currency.id,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
