Create a virtual envoirment
Install requirements from requirement.txt file


Go to mysql and create a database with name "treebo_hotels"

Change your USER and PASSWORD according to you mysql in setting.py

Go to Project root directory and run following command

python manage.py migrate 
python manage.py makemigrations hotel
python manage.py migrate

Go to project root dicrectory and run below command to load data

mysql -u username -p treebo_hotels < database_dump.sql


Go to backend directory and run server with
python manage.py runserver 8000

Go to fontend directory and run server with 
python -m SimpleHTTPServer 8001

Now Go to browser and type "http://localhost:8200/#/" to access the appliction

Below is the link to my github repo
https://github.com/viveksyngh/treebo

This appliction is hosted on aws server:

application URL : http://54.209.4.94/#/

API Endpoint: http://54.209.4.94:8000/