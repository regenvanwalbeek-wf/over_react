import 'package:over_react/over_react.dart';

// ignore: uri_has_not_been_generated
part 'flawed_component.over_react.g.dart';

@Factory()
// ignore: undefined_identifier
UiFactory<FlawedProps> Flawed = _$Flawed;

@Props()
class _$FlawedProps extends UiProps {
  String buttonTestIdPrefix;
}

// AF-3369 This will be removed once the transition to Dart 2 is complete.
// ignore: mixin_of_non_class, undefined_class
class FlawedProps extends _$FlawedProps with _$FlawedPropsAccessorsMixin {
  // ignore: undefined_identifier, undefined_class, const_initialized_with_non_constant_value
  static const PropsMeta meta = _$metaForFlawedProps;
}

@State()
class _$FlawedState extends UiState {
  int errorCount;
  int differentTypeOfErrorCount;
}

// AF-3369 This will be removed once the transition to Dart 2 is complete.
// ignore: mixin_of_non_class, undefined_class
class FlawedState extends _$FlawedState with _$FlawedStateAccessorsMixin {
  // ignore: undefined_identifier, undefined_class, const_initialized_with_non_constant_value
  static const StateMeta meta = _$metaForFlawedState;
}

@Component()
class FlawedComponent extends UiStatefulComponent<FlawedProps, FlawedState> {
  @override
  Map getDefaultProps() => (newProps()..buttonTestIdPrefix = 'flawedComponent_');

  @override
  Map getInitialState() => (newState()
    ..errorCount = 0
    ..differentTypeOfErrorCount = 0
  );

  @override
  void componentWillUpdate(_, Map nextState) {
    final tNextState = typedStateFactory(nextState);
    if (tNextState.errorCount > state.errorCount) {
      throw FlawedComponentException();
    }

    if (tNextState.differentTypeOfErrorCount > state.differentTypeOfErrorCount) {
      throw FlawedComponentException2();
    }
  }

  @override
  render() {
    return Dom.div()(
      (Dom.button()
        ..addTestId('${props.buttonTestIdPrefix}flawedButton')
        ..onClick = (_) {
          setState(newState()..errorCount = state.errorCount + 1);
        }
      )(
        'oh hai',
      ),
      (Dom.button()
        ..addTestId('${props.buttonTestIdPrefix}flawedButtonThatThrowsADifferentError')
        ..onClick = (_) {
          setState(newState()..differentTypeOfErrorCount = state.differentTypeOfErrorCount + 1);
        }
      )(
        'oh hai',
      ),
      props.children,
    );
  }
}

class FlawedComponentException implements Exception {
  @override
  String toString() => 'FlawedComponentException: I was thrown from inside FlawedComponent.componentWillUpdate!';
}

class FlawedComponentException2 implements Exception {
  @override
  String toString() => 'FlawedComponentException2: I was thrown from inside FlawedComponent.componentWillUpdate!';
}
