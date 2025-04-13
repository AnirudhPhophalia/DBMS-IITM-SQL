'''In this question, you must write a Python program to output the name of the main referee for a given match date (in yyyy-mm-dd format). The input to your program is a file named “date.txt” that has the match date as the first word of the file. Your program must assume that date.txt resides in the same folder as your Python program. 


The output name has to be formatted as follows. The last name is displayed followed by the initials of the first name, then a full stop, a space and then the initials of the middle name (if the middle name exists), followed by a full stop.

For example, if the name of the main referee is “Kennedy Sapam”, the output must be ”Sapam K.” 

If the name of the main referee is “Asit Kumar '''

import psycopg2
import sys
import os

file = open('date.txt','r')
data = file.read()

try:
    connection= psycopg2.connect(
        database = sys.argv[1],
        user = os.environ.get('PGUSER'), 
        password = os.environ.get('PGPASSWORD'),
        host = os.environ.get('PGHOST'),
        port = os.environ.get('PGPORT')
        )
    
    cursor = connection.cursor()
    query = (f"select referees.name from referees, match_referees, matches where matches.match_date='{data}' and match_referees.referee=referees.referee_id and match_referees.match_num=matches.match_num")
    cursor.execute(query)
    result = cursor.fetchall()
    
    def nameformat(name):
        a = name.split(" ")
        lname = a[-1]
        editedname = lname
        a.pop()
        for i in a:
            editedname+=f" {i[0]}."
        return editedname
    
    for name in result:
        formattedname = nameformat(name[0])
        print(formattedname)
    
    cursor.close()
    
except(Exception, psycopg2.DatabaseError) as e:
    print(e)
    
finally:
    connection.close