part of 'switch_bloc.dart';

class SwitchState extends Equatable {
  final bool isSwitch;
  final double slider;

  const SwitchState({this.isSwitch = false, this.slider = 1.0});

  SwitchState copyWith({bool? isSwitch, double? slider}) {
    return SwitchState(
      isSwitch: isSwitch ?? this.isSwitch,
      slider: slider ?? this.slider,
    );
  }

  @override
  List<Object> get props => [isSwitch, slider];
}
