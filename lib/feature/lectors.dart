import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_sample/common/app_colors.dart';
import 'package:flutter_sample/common/button_widgets.dart';
import 'package:flutter_sample/common/text_widgets.dart';

class Lectors extends ConsumerStatefulWidget {
  const Lectors({super.key});

  @override
  ConsumerState<Lectors> createState() => _LectorsState();
}

class _LectorsState extends ConsumerState<Lectors> {
  List<String> items = List.generate(10, (index) => 'Item ${index + 1}');
  List<bool> itemsIsExpanded = List.generate(10, (index) => false);

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(80),
            child: lectorsAppBar(back: () => Navigator.pop(context)),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: ListView.separated(
              itemCount: items.length,
              itemBuilder: (context, index) {
                return ExpansionTile(
                  onExpansionChanged: (bool expanding) =>
                      setState(() => itemsIsExpanded[index] = expanding),
                  trailing: itemsIsExpanded[index]
                      ? const Icon(Icons.remove)
                      : const Icon(Icons.add),
                  collapsedShape: RoundedRectangleBorder(
                    side: const BorderSide(color: AppColors.primaryText),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(color: AppColors.primaryText),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  title: lectorsLevel1Unit(item: items[index], enter: null),
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Theme(
                        data: Theme.of(context).copyWith(
                          dividerColor: Colors.transparent,
                          dividerTheme: const DividerThemeData(
                            color: Colors.transparent,
                            space: 0,
                            thickness: 0,
                            indent: 0,
                            endIndent: 0,
                          ),
                        ),
                        child: DataTable(
                          horizontalMargin: 0,
                          headingRowColor: MaterialStateColor.resolveWith(
                              (states) => Colors.grey),
                          dataRowMaxHeight: double.infinity,
                          headingRowHeight: 1,
                          columns: const [
                            DataColumn(label: Text('Column A')),
                          ],
                          rows: [
                            DataRow(cells: [
                              DataCell(lectorsLevel2Unit(item: index)),
                            ]),
                            DataRow(cells: [
                              DataCell(lectorsLevel2Unit(item: index)),
                            ]),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              },
              separatorBuilder: (context, index) =>
                  const SizedBox(height: 15.0),
            ),
          ),
        ),
      ),
    );
  }
}

Widget lectorsLevel1Unit({required item, void Function()? enter}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      GestureDetector(
        child: const AppBoxDecorationImage(),
      ),
      const SizedBox(width: 10),
      Column(
        children: [
          Text16Normal(text: item, color: Colors.grey),
          Text(item),
        ],
      ),
    ],
  );
}

Widget lectorsLevel2Unit({required item, void Function()? enter}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      const Icon(Icons.calendar_month_outlined, color: Colors.grey),
      const SizedBox(width: 10),
      Column(
        children: [
          Text('Data ${item + 1}B'),
          Text('Data ${item + 1}B'),
        ],
      ),
      const Spacer(),
      GestureDetector(
        onTap: enter,
        child: const Icon(Icons.keyboard_arrow_right),
      ),
      const SizedBox(width: 10),
    ],
  );
}

AppBar lectorsAppBar({void Function()? back}) {
  return AppBar(
    title: Container(
      margin: const EdgeInsets.only(left: 7, right: 7),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: back,
            child:
                const Text24Normal(text: "講師清單", color: AppColors.primaryText),
          ),
        ],
      ),
    ),
  );
}
