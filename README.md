# Pre-work - *Tipster*

**Tipster** is a tip calculator application for iOS.

Submitted by: **Shania Joseph**

Time spent: **48** hours spent in total

## User Stories

The following **required** functionality is complete:

* [x] User can enter a bill amount, choose a tip percentage, and see the tip and total values.
* [x] User can select between tip percentages by tapping different values on the segmented control and the tip value is updated accordingly

The following **optional** features are implemented:

* [ ] UI animations
* [ ] Remembering the bill amount across app restarts (if <10mins)
* [ ] Using locale-specific currency and currency thousands separators.
* [x] Making sure the keyboard is always visible and the bill amount is always the first responder. This way the user doesn't have to tap anywhere to use this app. Just launch the app and start typing.

The following **additional** features are implemented:

- [x] Create a tip slider that adjusts the tip percentage
- [x] Make a tip splitting feature
- [x] Make a settings page to change the default tip options

## Video Walkthrough

Here's a walkthrough of implemented user stories:

<img src='http://g.recordit.co/fu1m6gXui5.gif' title='Video Walkthrough' width='' alt='Video Walkthrough' />

GIF created with [Recordit](https://recordit.co).

## Notes

Describe any challenges encountered while building the app:


-Had trouble getting the left and right arrows to display their icon for changing the party size, eventually got rid of the arrow image and just used an arrow character in the text field

-The color of certain components/background colors/text colors would be different when I ran the app on my phone as opposed to when I ran it on a simulator, was quite confusing as I couldn't figure out why it didnt conform to what was being shown on my storyboard

-Had to push the current segmented tip values to the settings screen to be displayed as placeholder text and as I didnt know about UserDefauts when I started working on the feature, I ended up implementing it in a way that took a bit of time to learn and understand

## License

    Copyright [yyyy] [name of copyright owner]

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

        http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
