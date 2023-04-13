First look at the requirements of this project, verify that everything is installed.

Next, run the commnad "aws configure" to config your credentials at the system.

Finally, run the project using "py ./app.py" command.

This project will look at all the regions in AWS and search for relevant services.
The services are configured in the DB (SQLite) with the relevant parameters to get information about.

To add a service or a parameter to the output or the code process, you should
add a record to the DB with the appropriate values and it will be automatically added to the system.

The output of the application is exported to excel file.

!!! IMPORTANT !!!
If the excel file is already been used by this app, you should make another clean one.
Just create a new Excel file with the name which is conigured at the .env file as 'workbook_name' .

If you want to change the DB name, change also the name which is conigured at the .env file as 'db_name' .
