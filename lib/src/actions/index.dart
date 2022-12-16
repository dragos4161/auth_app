library actions;

import 'package:auth_app/src/models/index.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'login.dart';

part 'index.freezed.dart';

part 'logout.dart';

part 'create_user.dart';

part 'update_username.dart';

typedef ActionResponse = void Function(dynamic action);
