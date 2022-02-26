import 'package:get/get.dart';

class Localization extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en': {
          'title.analog.clock': 'Analag Clock',
          'label.clock': 'Clock',
          'label.hour': 'Hour',
          'label.minute': 'minute',
          'label.second': 'second',
          'alarm.set': 'Alarm Set',
        },
        'id': {
          'title.analog.clock': 'Jam Analog',
          'label.clock': 'Jam',
          'label.hour': 'Jam',
          'label.minute': 'Menit',
          'label.second': 'Detik',
          'alarm.set': 'Set Alaram',
        },
      };
}
