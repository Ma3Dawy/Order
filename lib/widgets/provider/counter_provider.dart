import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'counter_provider.g.dart';

//the oppsite of dispoose
@Riverpod(keepAlive: true)
class Count extends _$Count {
  @override
  bool build() {
    return true;
  }


}
