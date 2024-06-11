import 'package:app_no_smoke/database/database.dart';
import 'package:drift/drift.dart';
import 'package:get/get.dart' hide Value;

class SmokeController extends GetxController {
  final smokeDao = Get.find<AppDatabase>().smokeDao;
  final data = <SmokeTableData>[].obs;
  final Rx<SmokeTableData?> first = Rx<SmokeTableData?>(null);
  final Rx<SmokeTableData?> lastYes = Rx<SmokeTableData?>(null);
  final secondCounter = 0.obs;
  final minuteCounter = 0.obs;
  final hourCounter = 0.obs;
  final dayCounter = 0.obs;
  final lastYesDateTime = DateTime.now().obs;

  @override
  void onReady() {
    super.onReady();
    _getData();
    _updateCleanCounter();
  }

  void _getData() async {
    data.value = await smokeDao.getAll();
  }

  void yes() async {
    var nowDateTime = DateTime.now();
    print('yes');
    await smokeDao.insertOne(SmokeTableCompanion.insert(
      value: Value(true),
      createdAt: Value(nowDateTime),
    ));
    data.value = await smokeDao.getAll();
    lastYesDateTime.value = nowDateTime;
  }

  void no() async {
    print('no');
    await smokeDao.insertOne(SmokeTableCompanion.insert(
      value: Value(false),
      createdAt: Value(DateTime.now()),
    ));
    data.value = await smokeDao.getAll();
  }

  void delete(SmokeTableData inventoryItem) async {
    await smokeDao.deleteOne(inventoryItem);
    data.removeWhere((element) => element.id == inventoryItem.id);
  }

  void _updateCleanCounter() async {
    if (lastYes.value == null) {
      first.value ??= await smokeDao.getFirst();
      SmokeTableData? lastYesResult = await smokeDao.getLastYes();
      lastYes.value = lastYesResult;
      lastYesDateTime.value = lastYes.value?.createdAt ?? lastYesDateTime.value;
    }
    Duration difference = DateTime.now().difference(lastYesDateTime.value);
    dayCounter.value = difference.inDays;
    hourCounter.value = difference.inHours % 24;
    minuteCounter.value = difference.inMinutes % 60;
    secondCounter.value = difference.inSeconds % 60;
    await 1.delay();
    _updateCleanCounter();
  }
}
