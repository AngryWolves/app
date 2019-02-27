import 'package:event_bus/event_bus.dart';
import 'package:smart_park/event/home_action_event.dart';

class Event {

    static final EventBus eventBus = EventBus();

    static void fireHomeActionEvent(int type) {
        eventBus.fire(HomeActionEvent(type));
    }
}