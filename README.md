# README
Ruby version: 3.2.0
Rails version: 7.0.4
Database:
 name: PostgreSQL
 version: 14
Additional gems:
 devise version 4.8
 ransack version 3.2

# Tattle

Tattle is a webapp where you can publish public articles viewable by the tattle registered users. Also you can chat with the users with 'public' profiles in the chat section.

Articles section

The articles can only be deleted by the user who has written them. Includes commenting functionality on articles, deletable by the user who has written the comment or the user who has written the article.

Also exists an admin page, that can only be viewed by admin and also requires http basic authentication to see the list of users, their articles with access to deleting the article, and the comments on it. The admin cannot edit the articles written by other users.

Chat section
A person can chat with another user on tattle. The list of users as seen on the 'rooms' page is the list of users who have marked their profile to be public (the default of tattle).