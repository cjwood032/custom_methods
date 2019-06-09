# Custom Methods App. Contributor: Chris Wood.
Readme:
The purpose of the app is for users to store custom methods, and to view other users custom methods. Methods are stored in a database, and can be searched for based on their name, description, the code, or language. Users may edit or delete their previously created methods, however they cannot edit or delete the codes created by other users.
Features:
1. Create a new method: 
User is prompted to create their own method. If they leave the name, description, language, or code fields blank, the code will not be accepted, and it will return them to the create method page. Upon proper entry, the user?s method is added to the database, where it can then be edited or deleted, and other users will be able to find it.
2. Browse methods: 
All methods are displayed, from first submitted onward, the name and description are included, and all names will open a link to view the full details of the method.
3. Search methods:
A search field is opened, and the user may enter a search term, and select to search method?s names, details, code, or language for the desired keyword.
4. View your methods:
Shows all the methods created by the current user.
Currently, the only languages mentioned are C, Java, Perl, Python, and Ruby. The language selection does not affect how the code is input 

Installation instructions:
1. Download the app from Gitub.
2. Unzip the folder.
3. Navigate a command line into the main directory
4. Type 'bundle install' in the CLI and hit enter.
5. Type 'rack db:migrate' to create the database
5. Type 'shotgun' in the CLI and hit enter.
6. Navigate a web browser to the listed IP.
7. The database is up and running!

