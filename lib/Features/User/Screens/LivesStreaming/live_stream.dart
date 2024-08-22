import 'package:flutter/material.dart';
import 'package:zego_uikit_prebuilt_live_streaming/zego_uikit_prebuilt_live_streaming.dart';

import 'keys.dart';

class LiveStreamPage extends StatelessWidget {
  final String liveId;
  final bool isHost;
  
  const LiveStreamPage(
    {Key? key,required this.isHost, required this.liveId})
    : super(key: key);
    @override

    Widget build(BuildContext context){
      return SafeArea(
        child: ZegoUIKitPrebuiltLiveStreaming(
        appID: Keys().appId,
        appSign: Keys().appSign,
        userID: Keys().userId,
        userName: "user_${Keys().userId}",
        liveID: liveId,
        config: isHost
            ? ZegoUIKitPrebuiltLiveStreamingConfig.host()
            : ZegoUIKitPrebuiltLiveStreamingConfig.audience(),
      ),
    );
  }
}