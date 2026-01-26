import 'package:bookly_app/core/utilities/app_consts.dart';
import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/features/home/data/models/book_model/image_links.dart';
import 'package:bookly_app/features/home/data/models/book_model/volume_info.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> openUrl({required String bookUrl}) async {
final Uri url = Uri.parse(bookUrl);
await launchUrl(url);
}

Future<void> setUpHive() async {
  await Hive.initFlutter();
  Hive.registerAdapter(BookModelAdapter());
  Hive.registerAdapter(VolumeInfoAdapter());
  Hive.registerAdapter(ImageLinksAdapter());
  await Hive.openBox<BookModel>(kFavBooks);
}