import 'package:flutter_meedu/providers.dart';
import 'package:flutter_meedu/notifiers.dart';

import 'session_state.dart';

final sessionGP = Provider.state<SessionGC, SessionState>(
  (_) => SessionGC(SessionState.initialState),
  autoDispose: false,
);

class SessionGC extends StateNotifier<SessionState> {
  SessionGC(super.initialState);
}
