library test_component.type_inheritance.subtype;

import 'package:over_react/ui_core.dart';
import './parent.dart';

@Factory()
UiFactory<TestSubtypeProps> TestSubtype;

@Props()
class TestSubtypeProps extends UiProps {}

@Component(subtypeOf: TestParentComponent)
class TestSubtypeComponent extends UiComponent<TestSubtypeProps> {
  @override
  render() => Dom.div()();
}
