import 'dart:async';
import 'dart:convert';
import 'dart:math';

import 'package:web_socket_channel/web_socket_channel.dart';

/// Visitor-side transport. Configure with --dart-define=CHAT_WS_URL=wss://…
/// Outgoing: {type: message, sessionId, sender: visitor, text}.
/// Incoming: {type: message, sessionId, sender: owner, text}.
class PhoneChatSocket {
  PhoneChatSocket({
    required this.url,
    required this.onMessage,
    required this.onConnectionChanged,
  }) : sessionId = '${DateTime.now().microsecondsSinceEpoch.toRadixString(36)}'
            '-${Random().nextInt(1 << 32).toRadixString(36)}';

  final String url;
  final String sessionId;
  final void Function(String) onMessage;
  final void Function(bool) onConnectionChanged;

  WebSocketChannel? _channel;
  StreamSubscription<dynamic>? _subscription;
  bool _connected = false;
  bool _disposed = false;

  bool get connected => _connected;

  Future<void> connect() async {
    final uri = Uri.tryParse(url);
    if (uri == null || !{'ws', 'wss'}.contains(uri.scheme) || uri.host.isEmpty) {
      onConnectionChanged(false);
      return;
    }
    try {
      final channel = WebSocketChannel.connect(uri);
      _channel = channel;
      await channel.ready;
      if (_disposed) {
        await channel.sink.close();
        return;
      }
      _connected = true;
      onConnectionChanged(true);
      _subscription = channel.stream.listen(_handleFrame,
        onError: (_) => _markDisconnected(),
        onDone: _markDisconnected,
      );
    } catch (_) {
      _markDisconnected();
    }
  }

  bool send(String text) {
    if (!_connected || _channel == null) return false;
    try {
      _channel!.sink.add(jsonEncode({
        'type': 'message',
        'sessionId': sessionId,
        'sender': 'visitor',
        'text': text,
      }));
      return true;
    } catch (_) {
      _markDisconnected();
      return false;
    }
  }

  void _handleFrame(dynamic frame) {
    if (_disposed || frame is! String) return;
    try {
      final data = jsonDecode(frame);
      if (data is Map) {
        if (data['type'] != 'message' || data['sender'] != 'owner' ||
            data['sessionId'] != sessionId) {
          return;
        }
        final text = data['text'];
        if (text is String && text.trim().isNotEmpty) {
          onMessage(text.trim());
        }
      }
    } on FormatException {
      // Ignore frames outside the message protocol.
    }
  }

  void _markDisconnected() {
    if (_disposed) return;
    _connected = false;
    onConnectionChanged(false);
  }

  Future<void> dispose() async {
    _disposed = true;
    await _subscription?.cancel();
    await _channel?.sink.close();
  }
}
