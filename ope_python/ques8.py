'''Write a Python program to print the ISBN numbers of books which are published in a given year. Here, the year is obtained as the value of function L(x) (given after the sample output) at x. You have to read the value of x from the input file "number.txt", and use it to find the value of L(x). Your program must assume that the file number.txt resides in the same folder as your Python program.


You have to iterate through the list and print each value separately as shown in the output below: 

9789352921171
9789351343202
9789353333380
The line function is given below:
L4(x) = 2000 + 4*x + 4'''

import psycopg2
import sys
import os

file = open('number.txt','r')
x = file.read()

def L(x):
    return 2000 + 4*x +4

na = L(int (x))

try:
    connection= psycopg2.connect(
        database = sys.argv[1],
        user = os.environ.get('PGUSER'), 
        password = os.environ.get('PGPASSWORD'),
        host = os.environ.get('PGHOST'),
        port = os.environ.get('PGPORT')
        )
    cursor= connection.cursor()
    query = "select ISBN_no from book_catalogue where year ='{}'".format(na)
    cursor.execute(query)
    result = cursor.fetchall()
    for res in result:
        print(res[0])
    cursor.close()
    

except(Exception,psycopg2.DatabaseError) as e:
    print(e)

finally:
    connection.close