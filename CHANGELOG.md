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
