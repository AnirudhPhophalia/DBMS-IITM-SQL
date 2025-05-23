'''In this question, you must write a Python program to output the name of the main referee for a given match date (in yyyy-mm-dd format). 
The input to your program is a file named “date.txt” that has the match date as the first word of the file. 
Your program must assume that date.txt resides in the same folder as your Python program. The output name has to be formatted as follows. 
The last name is displayed followed by the initials of the first name, then a full stop, a space and then the initials of the middle name (if the middle name exists), followed by a full stop.
For example, if the name of the main referee is “Kennedy Sapam”, the output must be ”Sapam K.” 
If the name of the main referee is “Asit Kumar Sarkar”, the output must be ”Sarkar A. K.”'''

import psycopg2
import sys
import os

f = open("date.txt", "r")

database = sys.argv[1]

user = os.environ.get('PGUSER') 

password = os.environ.get('PGPASSWORD') 

host = os.environ.get('PGHOST')

port = os.environ.get('PGPORT')

con = psycopg2.connect(
dbname=database,
host=host,
user=user,
password=password,
port=port
)

cur = con.cursor()
details = []
for date in f.readlines():
    cur.execute(f"select referees.name from referees, match_referees, matches where matches.match_date='{date}' and match_referees.referee=referees.referee_id and match_referees.match_num=matches.match_num")
    details.append(cur.fetchone())

def nameformat(name):
    
    a = name.split(" ")
    lname = a[-1]
    editedname = lname
    a.pop()
    for i in a:
        editedname+=f" {i[0]}."
    return editedname
    
for name in details:
    formattedname = nameformat(name[0])
    print(formattedname)
    
cur.close()
con.close()