# STUDY SESSION

## App Description

An app to create and find study sessions on campus. This promotes collaborative learning among students and helps them get better prepared for exams and assignments in challenging classes at Cornell.

## Github 
Github: https://github.com/triple-jay/studysessionproj

## Members 
- Shiyuan Huang : Backend 
- Mansi Agarwal : Backend 
- Jeremy Jung: iOS
- Christy Song: iOS

## Backend Requirements Met
Used database modeling to store information about study sessions and users. 
Created a many-to-many relationship between study sessions and users.
Deployed to Google Cloud via Docker and Docker Hub.

Backend Routes
- GET
  - /api/study_groups/
    - Gets all study sessions
  - /api/users/
    - Gets all users
  - /api/user/<int:user_id>/
    - Gets a specific user
  - /api/partners/
    - Gets all partner postings
- POST
  - /api/study_groups/
    - Creates a study session
  - /api/likes/<int:group_id>/
    - Adds a like to a study session
  - /api/users/
    - Creates a user
  - /api/study_group/<int:group_id>/add/
    - Add a user to a study session as a participant
  - /api/partners/
    - Creates a partner posting
- DELETE
  - /api/study_group/<int:group_id>/
    - Deletes a study session
  - /api/partner/<int:id>/
    - Deletes a partner posting

## iOS Requirements Met
- Used NSLayoutConstraint 
- Many UICollectionViews
- Used both UINavigationController and UITabBarController 
- APIs Used: Integration with Backend API using Alamofire, MapKit

## iOS Features
- Three Tabs: 
  - Study Sessions: Shows all study sessions that all of the users posted
  - My Study Sessions: Shows study sessions that the user is interested in (Add Button)
  - New Session: Allows the user to post new sessions 
- UICollectionView cell displays:
  - Image related to the session
  - Title of the session (=session name) in bold
  - Time = Study session starting time
  - Date = When the session is held
- Clicking on one cell shows a modal navigation view controller: 
  - Image & Title & Date & Time
  -Description of the session that the user who posted it wrote
  - Location
  - Map (possibly showing the location)
  - Back Button to dismiss
  - Add Button to add the session to the user’s My Study Sessions tab if interested (also dismisses the modal navigation view controller) 
- New session view controller contains:
  - UITextFields for setting the title, location, description, duration
  - UIPickerView for scrolling through and setting the duration of the session
  - UIDatePicker for picking the date when the session will happen
  - Select Image button to set the image displayed when it is uploaded
  - Upload button 
  
  ![](https://github.com/triple-jay/studysessionproj/blob/master/Screenshots/1.png)
  ![](https://github.com/triple-jay/studysessionproj/blob/master/Screenshots/2.png)
  ![](https://github.com/triple-jay/studysessionproj/blob/master/Screenshots/3.png)



