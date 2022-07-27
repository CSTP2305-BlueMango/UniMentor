###### CSTP 2305 iOS Mobile Programming Application

<!-- LOGO -->
<div align="center">
  <a href="https://github.com/github_username/repo_name">
    <img src="appLogo.jpg" alt="Logo" width="200" height="200">
  </a>


# UniMentor Project

<!-- TEAM MEMBERS -->
## Authors
[Yoonseo Jeong](https://github.com/YoonseoJ) •
[Son Minh Nguyen](https://github.com/SonMinhNguyen2000) •
[Nicole Tan](https://github.com/CSTNicole) •
[Harman Tiwana](https://github.com/HarmanTiwana901)
</div> 

<!-- TABLE OF CONTENTS -->
## :notebook_with_decorative_cover: Table of Contents
- [About the Project](#star2-about-the-project)
  * [Screenshots](#camera-screenshots)
  * [Tech Stack](#space_invader-tech-stack)
  * [Features](#dart-features)
  * [User Interface Reference](#art-user-interface-reference)
  * [Folders Structure](#file_folder-folder-structure)
- [Getting Started](#memo-getting-started)
  * [Requirements](#computer-requirements)
  * [Run Locally](#running-run-locally)
- [Contributing](#busts_in_silhouette-contributing)
- [License](#copyright-license)
- [References](#pushpin-references)

<!-- ABOUT THE PROJECT -->
## :star2: About the Project
UniMentor match students to be each other's mentor. UniMentor focuses on guiding each other as students to a fruitful and successful college path. UniMentor can be a way to find connections across institutions to find the guidance that suits the students pace. With our app, students will find the right and appropriate guidance they need whether it is regarding college, programs or similar interests. With UniMentor, students can find fellow students who had the same or have current situations they can solve together to adjust with life in college.

<!-- SCREENSHOTS -->
### :camera: Screenshots
<table>
  <tr>
    <td>Loading View</td>
     <td>Home View</td>
     <td>Matched Requests View</td>
  </tr>
  <tr>
    <td><img width="314" alt="loadingview" src="https://user-images.githubusercontent.com/56127179/181138703-ee7ca532-9499-4c7c-b04f-6d9e70dc167c.png"/>
    <td><img width="314" alt="homeview" src="https://user-images.githubusercontent.com/56127179/181139015-3bcee615-8d6b-40df-bf66-8cd08784f43b.png"/>
    <td><img width="315" alt="matchrequestview" src="https://user-images.githubusercontent.com/56127179/181139046-95ca5ec6-cfd7-4ea9-a6e2-e648c3e33635.png"/>
  </tr>
 </table>
 
 <table>
  <tr>
    <td>Matched Pop Up</td>
     <td>Message Chat View</td>
     <td>User Profile View</td>
  </tr>
  <tr>
    <td><img width="315" alt="matchedpopup" src="https://user-images.githubusercontent.com/56127179/181139175-2b581c62-7fa6-4f67-82e0-f4f7c2b3c280.png"/>
    <td><img width="314" alt="messagechatview" src="https://user-images.githubusercontent.com/56127179/181139183-35c35e17-c20c-4d5d-8290-3bf822765523.png"/>
    <td><img width="314" alt="profile" src="https://user-images.githubusercontent.com/56127179/181139191-05c0dc9c-eb2c-4a37-b689-85fb0bf41059.png"/>
  </tr>
 </table>

<!-- TECH STACK -->
### :space_invader: Tech Stack
- [SwiftUI](https://developer.apple.com/xcode/swiftui/)
- [Firebase](https://firebase.google.com/)
- [Swift Package Manager](https://www.swift.org/package-manager/)

<!-- FEATURES -->
### :dart: Features
- [x] Ability to match student with another student
- [x] Ability to filter and search relatable student profile
- [x] Ability to live chat with matched students alike

<!-- UI REFERENCES -->
### :art: User Interface Reference
**Color**
| Color     | Hex |
| :----------------| :----------- |
| Background in Start Screens  | [#C7B79E](https://www.colorcodehex.com/c7b79e.html) |
| Background in Main Screens   | [#E5E5E5](https://www.colorcodehex.com/e5e5e5.html) |
| Message Chat View            | [#F6F4F0](https://www.colorcodehex.com/f6f4f0.html) |
| Tab Bar             | [#9F8B6C](https://www.colorcodehex.com/9f8b6c.html) |
| Lighter buttons     | [#C7B79E](https://www.colorcodehex.com/c7b79e.html) |
| Darker buttons      | [#9F8B6C](https://www.colorcodehex.com/9f8b6c.html) |
| Accept side button  | [#DCD4CB](https://www.colorcodehex.com/dcd4cb.html) |
| Red buttons         | [#CE7D7D](https://www.colorcodehex.com/ce7d7d.html) |
| Font                | [#000000](https://www.colorcodehex.com/000000.html) |

**Font Family**
| Font    | Description |
| :----------------| :----------- |
| Charm | Google Font |

<!-- FOLDER STRUCTURE -->
### :file_folder: Folder Structure
1. **Model** - models of the project
 
2. **View**
  - Components - to maintain consistency for the whole project design we made reusable components
    - Buttons - all button views used
    - Cards - user cards for each tab views
    - FormComponents - including the input fields
    - Popups - all popup views used
  - Screens - user interface for each screen in the project
    - StartScreens - onboarding, loading, login, signup and setup profile views
    - MainScreens - tab bar, home, requests, matched, message and user profile views
    - SubScreens - when the views related with Main Screens, home profile, requests profile, matched profile, message chat and user profile edit views

3. **ViewModel** - viewmodels of the project

4. **Config** - font and firebase bundler identifier

5. **Utilities**
  - Extensions - to ensure that everything is confirmed before proceeding to next screen
  - Types - a place to hold structs in the project which are not model 
  - Validations - to authenticate user input
    - Credentials - email and password
    - Forms - signup, login and profile

<!-- GETTING STARTED -->
## :memo: Getting Started

<!-- REQUIREMENTS -->
### :computer: Requirements
- iOS 13+
- Swift 5+
- XCode 13.3+

<!-- RUN LOCALLY-->
### :running: Run Locally
1. Clone or download the project repository
2. Run ***UniMentor.xcodeproj***

<!-- CONTRIBUTING -->
## :busts_in_silhouette: Contributing
Contributions are welcome! Please ensure to always make a new branch for your additions.

<!-- LICENSE -->
## :copyright: License
Distributed under the **MIT License**. See ***LICENSE.md*** for more information.

<!-- REFERENCES -->
## :pushpin: References
- [Let's Build That App](https://www.letsbuildthatapp.com/course_video?id=7606)
- [Awesome README](https://github.com/Louis3797/awesome-readme-template/blob/main/README.md#art-color-reference)
- [Code of Conduct template](https://gist.github.com/PurpleBooth/b24679402957c63ec426)
- [Emoji for Github README](https://gist.github.com/rxaviers/7360908)
- [Color Code Hex](https://www.colorcodehex.com/)
