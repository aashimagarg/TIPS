# Pre-work - TIPS

TIPS is a tip calculator application for iOS.

Submitted by: Aashima Garg

Time spent: 6 hours spent in total

## User Stories

The following **required** functionality is complete:
* [X] User can enter a bill amount, choose a tip percentage, and see the tip and total values.

The following **optional** features are implemented:
* [X] Settings page to change the default tip percentage.
* [ ] UI animations
* [ ] Remembering the bill amount across app restarts (if <10mins)
* [ ] Using locale-specific currency and currency thousands separators.
* [ ] Making sure the keyboard is always visible and the bill amount is always the first responder. This way the user doesn't have to tap anywhere to use this app. Just launch the app and start typing.

The following **additional** features are implemented:

- [X] Settings page to change the given tip percentages 
- [X] UIView shifts up and down when the keyboard appears/dissapears (please see notes) 

## Video Walkthrough 

Here's a walkthrough of implemented user stories:

<img src='http://i.imgur.com/mX4szIg.gif?1' title='Video Walkthrough' width='' alt='Video Walkthrough' />

GIF created with [LiceCap](http://www.cockos.com/licecap/).

## Notes

Hi! I include a note about this at the top of my viewController.swift file as well, but I encountered one bug while programming this app, and after many hours of deleting, re-adding, googling, and thinking, I could not fix it. Normally, when a user tries to type in a bill amount, the keyboard pops up, the view is shifted upward, and the segmented control and labels for tip and total appear. However, if a user tries to typ ein a bill amount (meaning the keyboard is open), swtich to settings, and then come back, the view shifts downward. The downward shift should not happen. I just wanted to explain this small dysfunctionality. I hope that I am able to avoid such bugs in the future after hopefully participating in CodePath's class! Thank you so much for your consideration. 

## License

    Copyright 2015 Aashima Garg

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

        http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
