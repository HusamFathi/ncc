import 'dart:developer'; // For logging

import 'package:equatable/equatable.dart'; // For value equality in states/events
import 'package:flutter/material.dart'; // Flutter framework
import 'package:flutter_bloc/flutter_bloc.dart'; // BLoC pattern implementation

// Importing custom widgets used in the scrollable list
import '../../../../radio/presentation/widgets/radio_widget.dart';
import '../../widgets/footer/footer_bloc_widget.dart';
import '../../widgets/header/header_widget.dart';
import '../../widgets/ncc_info/ncc_info_widget.dart';

part 'home_event.dart'; // Defines events for HomeBloc
part 'home_state.dart'; // Defines states for HomeBloc

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  // ScrollController to manage and listen to scroll events on the home page
  final ScrollController homeScrollController = ScrollController();
  // GlobalKey for the Scaffold, useful for showing Snackbars or Drawer
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  // Late initialized list of GlobalKeys, one for each scrollable widget
  // These keys are crucial for programmatically scrolling to a specific widget
  late final List<GlobalKey> scrollableWidgetKeys;

  // Late initialized list of Widgets that will be displayed in a scrollable view
  // Each widget is associated with a GlobalKey from scrollableWidgetKeys
  late final List<Widget> scrollableWidgets;

  // PageStorageKey to preserve scroll position across page navigations or rebuilds
  final PageStorageKey homePageScrollKey = const PageStorageKey(
    'homePageScroll',
  );

  HomeBloc() : super(HomeInitialState()) {
    // --- Initialization of Keys and Widgets ---
    // Define the number of widgets that will be scrollable.
    // This should match the number of widgets you intend to create.
    const int numberOfScrollableWidgets = 4;

    // 1. Initialize the list of GlobalKeys.
    // A unique GlobalKey is generated for each scrollable widget.
    // The debugLabel helps in identifying keys during debugging.
    scrollableWidgetKeys = List.generate(
      numberOfScrollableWidgets,
      (index) => GlobalKey(debugLabel: 'ScrollableWidgetKey_$index'),
    );

    // 2. Initialize the list of scrollable Widgets.
    // Each widget is instantiated here and assigned its corresponding GlobalKey.
    // It's important that these custom widgets (HeaderWidget, RadioWidget, etc.)
    // are designed to accept and use the 'key' parameter.
    // Example: HeaderWidget(key: scrollableWidgetKeys[0])
    // This associates the first key with the HeaderWidget.
    scrollableWidgets = [
      HeaderWidget(key: scrollableWidgetKeys[0]), // Assign key to HeaderWidget
      RadioWidget(key: scrollableWidgetKeys[1]), // Assign key to RadioWidget
      NccInfoWidget(
        key: scrollableWidgetKeys[2],
      ), // Assign key to NccInfoWidget
      FooterBlocWidget(
        key: scrollableWidgetKeys[3],
      ), // Assign key to FooterBlocWidget
    ];
    // --- End of Initialization ---

    // Event handler for HomeStarted event
    on<HomeStarted>((event, emit) {
      // Add a listener to the scroll controller.
      // When the user scrolls, HomeScrollViewListenerAdded event will be dispatched.
      homeScrollController.addListener(() {
        add(HomeScrollViewListenerAdded());
      });

      // Emit the initial loaded state.
      // showGoToTopButton is false initially, and scrollOffset is 0.
      emit(HomeLoadedState(showGoToTopButton: false, scrollOffset: 0));
    });

    // Event handler for HomeScrollViewOffsetChanged event
    // This event is typically triggered when a navigation item is clicked,
    // and the view needs to scroll to a specific widget.
    on<HomeScrollViewOffsetChanged>((event, emit) {
      log('HomeScrollViewOffsetChanged event received');
      log('Target widget index: ${event.index}');
      log('Available keys: $scrollableWidgetKeys');

      // Validate the index to prevent out-of-bounds errors
      if (event.index >= 0 && event.index < scrollableWidgetKeys.length) {
        final GlobalKey keyToScroll = scrollableWidgetKeys[event.index];
        // Get the BuildContext of the widget associated with the key.
        // currentContext will be null if the widget is not in the tree or not yet built.
        final BuildContext? widgetContext = keyToScroll.currentContext;

        if (widgetContext != null && homeScrollController.hasClients) {
          // Ensure the scroll controller is attached to a scroll view.
          // Find the RenderObject of the widget to scroll to.
          final RenderObject? renderObject = widgetContext.findRenderObject();
          if (renderObject != null) {
            // Programmatically scroll to make the widget visible.
            homeScrollController.position.ensureVisible(
              renderObject,
              duration: const Duration(
                seconds: 1,
              ), // Duration of the scroll animation
              curve: Curves.easeInOut, // Animation curve for a smoother scroll
            );
          } else {
            log(
              'Error: findRenderObject() returned null for key $keyToScroll. Widget might not be laid out or visible.',
            );
          }
        } else {
          if (widgetContext == null) {
            log(
              'Error: currentContext is null for key $keyToScroll. Widget not in tree, key not properly assigned in UI, or widget not yet built.',
            );
          }
          if (!homeScrollController.hasClients) {
            log(
              'Error: homeScrollController has no clients (not attached to a Scrollable widget). Cannot scroll.',
            );
          }
        }
      } else {
        log(
          'Error: event.index ${event.index} is out of bounds for scrollableWidgetKeys (length: ${scrollableWidgetKeys.length}).',
        );
      }
    });

    // Event handler for HomeFrequentlyAskedQuestionUpdated event
    // This is a placeholder; you might use it to refresh parts of the UI
    // if FAQ data changes, for example.
    on<HomeFrequentlyAskedQuestionUpdated>((event, emit) {
      if (state is HomeLoadedState) {
        final HomeLoadedState currentState = state as HomeLoadedState;
        // Re-emit the current state, potentially with updated data if needed.
        // copyWith() is useful if HomeLoadedState has properties that might change.
        emit(currentState.copyWith());
      }
    });

    // Event handler for HomeScrollViewListenerAdded event
    // This event is triggered by the scroll controller's listener.
    on<HomeScrollViewListenerAdded>((event, emit) {
      if (state is HomeLoadedState) {
        HomeLoadedState currentState = state as HomeLoadedState;

        // Determine if the "Go to Top" button should be shown based on scroll offset.
        // Ensure controller has positions (is attached to a scroll view) before accessing offset.
        bool showGoToTopButton =
            homeScrollController.hasClients &&
            homeScrollController.offset > 500;
        // Get current scroll offset, or use the last known offset if controller is not ready.
        double currentOffset = homeScrollController.hasClients
            ? homeScrollController.offset
            : currentState.scrollOffset;

        // Emit an updated state with the new showGoToTopButton status and scrollOffset.
        emit(
          currentState.copyWith(
            showGoToTopButton: showGoToTopButton,
            scrollOffset: currentOffset,
          ),
        );
      }
    });
  }

  // Override close to dispose of the ScrollController when the BLoC is closed.
  // This prevents memory leaks.
  @override
  Future<void> close() {
    homeScrollController.dispose();
    return super.close();
  }
}
