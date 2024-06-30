import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_sample/common/app_colors.dart';
import 'package:flutter_sample/common/button_widgets.dart';
import 'package:flutter_sample/common/routes.dart';
import 'package:flutter_sample/common/text_widgets.dart';
import 'package:flutter_sample/feature/lectors/lectors_vm.dart';
import 'package:flutter_sample/feature/lesson/lesson_vm.dart';

class Lectors extends ConsumerStatefulWidget {
  const Lectors({super.key});

  @override
  ConsumerState<Lectors> createState() => _LectorsState();
}

class _LectorsState extends ConsumerState<Lectors> {
  late List<bool> itemsIsExpanded;

  @override
  void didChangeDependencies() {
    itemsIsExpanded = List.generate(10, (index) => false);
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
              itemCount: ref.watch(lectorsVMProvider).length,
              itemBuilder: (context, index) {
                itemsIsExpanded = List.generate(
                    ref.watch(lectorsVMProvider).length, (index) => false);
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
                  title: lectorsLevel1Unit(
                    item: ref.watch(lectorsVMProvider)[index],
                    enter: () {
                      testRiverpodInstantUpdate(ref, index);
                    },
                  ),
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 17),
                      child: Divider(thickness: 1, color: Colors.grey),
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount:
                          ref.watch(lectorsVMProvider)[index].courses.length,
                      itemBuilder: (context, courseIndex) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16.0,
                            vertical: 8,
                          ),
                          child: lectorsLevel2Unit(
                            item: ref
                                .watch(lectorsVMProvider)[index]
                                .courses[courseIndex],
                            enter: () {
                              ref.read(lessonVMProvider.notifier).onChange(
                                  ref.read(lectorsVMProvider)[index].courses[courseIndex]);
                              Navigator.pushNamed(
                                  context, AppRoutesNames.LESSON);
                            },
                          ),
                        );
                      },
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
        onTap: enter,
        child: const AppBoxDecorationImage(),
      ),
      const SizedBox(width: 10),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text16Normal(text: item.title, color: Colors.grey),
          Text(item.name),
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(item.name),
          Text(item.time),
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

void testRiverpodInstantUpdate(WidgetRef ref, int index) {
  // ref.read(lectorsVMProvider.notifier).onChange(
  //       List.generate(
  //         5,
  //         (index) => LectorsItem(
  //           avatarPath: "",
  //           title: "T $index",
  //           name: "N $index",
  //           courses: List.generate(
  //             4,
  //             (courseIndex) => LectorsCourse(
  //               time: "T $courseIndex",
  //               name: "C $courseIndex",
  //             ),
  //           ),
  //         ),
  //       ),
  //     );
  ref.read(lectorsVMProvider.notifier).onIndexChange(
      index: index,
      title: "tt",
      name: "nn",
      courses: List.generate(
        4,
        (courseIndex) => LectorsCourse(
          time: "tt $courseIndex",
          name: "cc $courseIndex",
        ),
      ));
}
