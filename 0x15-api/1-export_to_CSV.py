#!/usr/bin/python3
""" Script that uses a RESTAPI """
import requests
import sys
import csv
if __name__ == "__main__":
    user_id = sys.argv[1]
    user_info = requests.get("https://jsonplaceholder.typicode.com/users/" +
                             user_id).json()
    user_todos = requests.get("https://jsonplaceholder.typicode.com/users/" +
                              user_id + "/todos").json()
    list_user = []
    user_list = []
    for todo in user_todos:
        user_list.append(sys.argv[1])
        user_list.append(user_info['username'])
        user_list.append(todo['completed'])
        user_list.append(todo['title'])
        list_user.append(user_list.copy())
        user_list.clear()
    csv_name = sys.argv[1] + '.csv'
    with open(csv_name, 'w') as csvfile:
        writer = csv.writer(csvfile, quoting=csv.QUOTE_ALL)
        writer.writerows(list_user)
