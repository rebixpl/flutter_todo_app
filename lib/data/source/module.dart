import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_todo_app/data/source/files.dart';
import 'package:flutter_todo_app/data/source/files_impl.dart';

final filesProvider = Provider<Files>((ref) {
  return FilesImpl();
});
