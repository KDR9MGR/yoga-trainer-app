import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zego_uikit_prebuilt_video_conference/zego_uikit_prebuilt_video_conference.dart';

class LiveSessionPage extends ConsumerStatefulWidget {
  final String conferenceID;
  final String userId;
  final String userName;
  final String sessionTitle;
  final bool isHost;
  final VoidCallback? onLeave;

  const LiveSessionPage({
    super.key,
    required this.conferenceID,
    required this.userId,
    required this.userName,
    required this.sessionTitle,
    this.isHost = false,
    this.onLeave,
  });

  @override
  ConsumerState<LiveSessionPage> createState() => _LiveSessionPageState();
}

class _LiveSessionPageState extends ConsumerState<LiveSessionPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ZegoUIKitPrebuiltVideoConference(
        appID: 1484647939, // Demo App ID
        appSign: "06055002a5b2b74d0a94e9bbcb6d2827e5a27bb0b85b21d27cb6a16097fc7936", // Demo App Sign
        userID: widget.userId,
        userName: widget.userName,
        conferenceID: widget.conferenceID,
        config: ZegoUIKitPrebuiltVideoConferenceConfig(
          onLeave: () {
            if (widget.onLeave != null) {
              widget.onLeave!();
            }
            Navigator.of(context).pop();
          },
        ),
      ),
    );
  }
} 