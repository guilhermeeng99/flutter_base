// @dart=3.6
// ignore_for_file: directives_ordering
// build_runner >=2.4.16
// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:build_runner/src/build_plan/builder_factories.dart' as _i1;
import 'package:freezed/builder.dart' as _i2;
import 'package:json_serializable/builder.dart' as _i3;
import 'package:slang_build_runner/slang_build_runner.dart' as _i4;
import 'package:source_gen/builder.dart' as _i5;
import 'dart:io' as _i6;
import 'package:build_runner/src/bootstrap/processes.dart' as _i7;

final _builderFactories = _i1.BuilderFactories(
  {
    'freezed:freezed': [_i2.freezed],
    'json_serializable:json_serializable': [_i3.jsonSerializable],
    'slang_build_runner:slang_build_runner': [_i4.i18nBuilder],
    'source_gen:combining_builder': [_i5.combiningBuilder],
  },
  postProcessBuilderFactories: {
    'slang_build_runner:slang_fan_out': _i4.i18nPostProcessBuilder,
    'source_gen:part_cleanup': _i5.partCleanup,
  },
);
void main(List<String> args) async {
  _i6.exitCode = await _i7.ChildProcess.run(
    args,
    _builderFactories,
  )!;
}
