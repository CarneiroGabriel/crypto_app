import 'package:crypto_app/currency_data_source.dart';
import 'package:crypto_app/currency_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class CurrenciesWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CurrencyProvider>(context);
    final currencyDataSource = provider.currencyDataSource;

    if (currencyDataSource == null) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    } else {
      return SfDataGrid(
        columns: buildGridColumns(),
        source: currencyDataSource,
      );
    }
  }

  List<GridColumn> buildGridColumns() => <GridColumn>[
        GridColumn(
          columnName: CurrencyColumn.id.toString(),
          label: buildLabel("ID"),
        ),
        GridColumn(
          columnName: CurrencyColumn.rank.toString(),
          label: buildLabel("Rank"),
        ),
        GridColumn(
          columnName: CurrencyColumn.name.toString(),
          label: buildLabel("Name"),
        ),
        GridColumn(
          columnName: CurrencyColumn.price.toString(),
          label: buildLabel("Price"),
        ),
        GridColumn(
          columnName: CurrencyColumn.oneHChange.toString(),
          label: buildLabel("Last 1 Hour"),
        ),
        GridColumn(
          columnName: CurrencyColumn.oneHChange.toString(),
          label: buildLabel("Last 1 Day"),
        ),
      ];

  Widget buildLabel(String text) => Text(
        text,
      );
}
