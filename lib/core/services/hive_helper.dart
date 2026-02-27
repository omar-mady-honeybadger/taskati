import 'package:hive_ce/hive.dart';
import 'package:taskati/core/models/task_model.dart';

class HiveHelper {
  static late Box<TaskModel> tasksBox;
  static String tasksBoxName = 'tasksBox';

  static Future<void> init() async {
    tasksBox = await Hive.openBox(tasksBoxName);
  }

   static Future<void> cacheTask(String key, TaskModel value){
    return tasksBox.put(key, value);
  }
  static TaskModel? getCachedTAsk(String key) {
    return tasksBox.get(key);
  }
}