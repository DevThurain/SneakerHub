import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

void usPrecache() {
  return use(_Precache());
}

class _Precache extends Hook<void> {
  const _Precache();

  @override
  HookState<void, Hook<void>> createState() => _PrecacheState();
}

class _PrecacheState extends HookState<void, _Precache> {
  @override
  void initHook() {
    super.initHook();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> precacheAssets(BuildContext context) async {
    await precacheImage(const AssetImage('assets/pngs/ic_box.png'), context);
    if (context.mounted) {
      await precacheImage(const AssetImage('assets/pngs/ic_box_close.png'), context);
    }
  }

  @override
  void build(BuildContext context) {
    precacheAssets(context);
  }
}
