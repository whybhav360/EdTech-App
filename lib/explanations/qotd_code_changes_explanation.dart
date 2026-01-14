
/// This file explains the changes made to `question_of_the_day.dart` to correctly
/// implement state persistence using `SharedPreferences`.
///
/// It is not part of the app and can be safely deleted.
library;

class QotdCodeChangesExplanation {
  /*
  ==============================================================================
  |                           EXPLANATION OF CHANGES                           |
  ==============================================================================

  1. **Correct `initState` Usage**:
     - The original code called an `async` method (`initPrefs`) directly from the
       synchronous `initState` method. This can cause race conditions where
       the widget tree builds before the async operation completes.
     - The corrected code uses a proper `async` method `_loadSavedState` that is
       called from `initState`. The state is updated within a `setState` call
       inside this method, ensuring the UI rebuilds correctly after the data is loaded.

  2. **Saving State on Submit**:
     - Previously, the state saving logic was not tied to the user's final action.
     - The new `_saveState` method is called only inside `_handleSubmit` when the user
       presses the "Submit" button. This ensures the state is persisted only when
       the answer is finalized.

  3. **Code Cleanup and Simplification**:
     - The redundant methods (`initPrefs`, `_setPrefs`, `_getPrefs`) were
       consolidated into `_loadSavedState` and `_saveState`.
     - The nullable `_prefs` instance variable was removed. Instead, the
       `SharedPreferences.getInstance()` is called directly where needed,
       making the code cleaner and less error-prone.
  */

  /// ==========================================================================
  /// |                                 BEFORE                                 |
  /// ==========================================================================
  ///
  /// The following snippet shows the incorrect implementation of SharedPreferences
  /// that was causing issues with state persistence.
  ///
  /// '''dart
  /// class _QuestionOfTheDayState extends State<QuestionOfTheDay> {
  ///   // ... other properties
  ///
  ///   SharedPreferences? _prefs;
  ///
  ///   @override
  ///   void initState() {
  ///     super.initState();
  ///     initPrefs();
  ///   }
  ///
  ///   @override
  ///   void initPrefs() async {
  ///     _prefs = await SharedPreferences.getInstance();
  ///     _setPrefs();
  ///     _getPrefs();
  ///   }
  ///
  ///   void _setPrefs() {
  ///     _prefs?.setBool('isSubmitted', _isSubmitted);
  ///     _prefs?.setInt('selectedOptionIndex', _selectedOptionIndex!);
  ///   }
  ///
  ///   void _getPrefs() {
  ///     setState(() {
  ///       _isSubmitted = _prefs?.getBool('isSubmitted') ?? false;
  ///       _selectedOptionIndex = _prefs?.getInt('selectedOptionIndex');
  ///     });
  ///   }
  ///
  ///   // ... build method and other logic
  /// }
  /// '''

  /// ==========================================================================
  /// |                                  AFTER                                 |
  /// ==========================================================================
  ///
  /// This snippet shows the corrected implementation, which properly handles
  /// the asynchronous nature of SharedPreferences and correctly persists state.
  ///
  /// '''dart
  /// class _QuestionOfTheDayState extends State<QuestionOfTheDay> {
  ///   // ... other properties
  ///
  ///   @override
  ///   void initState() {
  ///     super.initState();
  ///     _loadSavedState();
  ///   }
  ///
  ///   Future<void> _loadSavedState() async {
  ///     final prefs = await SharedPreferences.getInstance();
  ///     setState(() {
  ///       _isSubmitted = prefs.getBool('isSubmitted') ?? false;
  ///       _selectedOptionIndex = prefs.getInt('selectedOptionIndex');
  ///     });
  ///   }
  ///
  ///   Future<void> _saveState() async {
  ///     final prefs = await SharedPreferences.getInstance();
  ///     await prefs.setBool('isSubmitted', _isSubmitted);
  ///     if (_selectedOptionIndex != null) {
  ///       await prefs.setInt('selectedOptionIndex', _selectedOptionIndex!);
  ///     }
  ///   }
  ///
  ///   void _handleSubmit() {
  ///     if (_selectedOptionIndex == null) return;
  ///     setState(() {
  ///       _isSubmitted = true;
  ///     });
  ///     _saveState(); // State is now saved on submit
  ///   }
  ///
  ///   // ... build method and other logic
  /// }
  /// '''
}
