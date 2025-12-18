import 'package:flutter/material.dart';
import 'package:rick_and_morty/characters/entity/character.dart';
import 'package:rick_and_morty/characters/view/remote_characters_list_item.dart';

class AnimatedRemoteCharactersListItem extends StatefulWidget {
  final Character character;

  const AnimatedRemoteCharactersListItem({required this.character, super.key});

  @override
  State<StatefulWidget> createState() =>
      AnimatedRemoteCharactersListItemState();
}

class AnimatedRemoteCharactersListItemState
    extends State<AnimatedRemoteCharactersListItem>
    with SingleTickerProviderStateMixin {
  late final controller = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 150),
  );
  final transofrmKey = GlobalKey();
  bool? _wasFavorite;

  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      if (controller.isCompleted) {
        controller.reverse();
      }
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => ListenableBuilder(
    listenable: controller,
    builder: (_, __) => Transform.scale(
      key: transofrmKey,
      scale: getScale(),
      child: RemoteCharactersListItem(
        character: widget.character,
        onFavoriteChangeCb: animateFavoriteChange,
      ),
    ),
  );
  void animateFavoriteChange(bool wasFavorite) {
    if (controller.isAnimating) {
      controller.stop();
    }
    _wasFavorite = wasFavorite;
    controller.forward();
  }

  double getScale() {
    if (_wasFavorite == null) {
      return 1;
    }
    return _wasFavorite!
        ? 1 - (0.04 * controller.value)
        : 1 + (0.04 * controller.value);
  }
}
