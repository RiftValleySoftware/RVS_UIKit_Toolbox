*Version 1.7.1* **February 26, 2024**
- Oops. Forgot to make it public.

*Version 1.7.0* **February 26, 2024**
- This adds a Bundle extension for fetching the app icon.

*Version 1.6.3* **February 8, 2024**
- I also had to mask out a bunch of UIKit stuff.

*Version 1.6.2* **February 8, 2024**
- Mask out Core Haptics.

*Version 1.6.1* **April 26, 2024**
- Made sure that the label can not be wider than the text entry field.

*Version 1.6.0* **April 26, 2024**
- Made the placeholder label for the `RVS_PlaceholderTextView` publicly accessible, so it can be modified at runtime.
- If the corner radius of a view is over 0, then we force clipsToBounds to be true.

*Version 1.5.4* **April 11, 2024**
- Made the placeholder label in the `RVS_PlaceholderTextView` class multiline.

*Version 1.5.3* **January 6, 2024**
- Added a standard Apple privacy manifest (in addition to the markdown file).
- Added the ability to switch the font for the placeholder text label.

*Version 1.5.2* **January 5, 2024**
- Re-added the `RVS_PlaceholderTextView` class (It was PEBCAK).
- Updated to the latest generic toolbox dependency.

*Version 1.5.1* **January 5, 2024**
- Removed the `RVS_PlaceholderTextView` class (It was too problematic).

*Version 1.5.0* **January 5, 2024**
- Added the `RVS_PlaceholderTextView` class.
- Added a privacy manifest.

*Version 1.4.4* **November 23, 2023**
- Tweaked the biometric type computed property, to be a bit more robust.

*Version 1.4.2* **August 6, 2023**
- Fixed an issue with the new UIImage(color:) extension. It wasn't rendering at the correct size.
- Added tests for the new UIImage extension into the test harness (the first tab actually tests it).

*Version 1.4.2* **August 4, 2023**
- Documentation fixes.

*Version 1.4.1* **August 4, 2023**
- Documentation updates.

*Version 1.4.0* **August 4, 2023**
- Added a color image generator to the UIImage extension.

*Version 1.3.4* **October 6, 2022**
- Updated the test harness dependency. No API changes.

*Version 1.3.3* **September 16, 2022**
- Updated to the latest tools. No API changes.

*Version 1.3.2* **July 21, 2022**
- Documentation fixes only. No API or code changes.

*Version 1.3.1* **July 21, 2022**
- Fixed an issue with the new class/instance property. It really needs to live in the view controller; not the view.

*Version 1.3.0* **July 21, 2022**
- The `screenAspect` computed property was problematic. I changed it to use the main screen. This also gives us a class property.

*Version 1.2.2* **July 21, 2022**
- Updated the docs. No API or code changes.

*Version 1.2.1* **July 21, 2022**
- Updated the docs. No API or code changes.

*Version 1.2.0* **July 20, 2022**
- Added the `isICloudAvailable` computed property.

*Version 1.1.5* **July 12, 2022**
- Documentation updates only. No API changes.

*Version 1.1.4* **July 9, 2022**
- Updated the Generic Swift Toolbox Package.

*Version 1.1.3* **July 9, 2022**
- Documentation improvements. No code or API changes.

*Version 1.1.2* **July 8, 2022**
- Forgot to change it in the package file, too.

*Version 1.1.1* **July 8, 2022**
- Dropped the minimum version to iOS 13.
- Updated the Generic Swift Toolbox dependency.

*Version 1.1.0* **July 7, 2022**
- Fixed a bug in the hex extraction computed property.
- Added an RGBA extraction computed property.
- Greatly improved the color tab of the test harness.

*Version 1.0.0* **July 7, 2022**
- Initial Release.
