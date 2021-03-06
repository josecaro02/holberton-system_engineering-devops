#!/usr/bin/python3
""" Script that uses a RESTAPI """
import csv
import requests
import sys


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
        user_list.append(user_info.get('username'))
        user_list.append(todo.get('completed'))
        user_list.append(todo.get('title'))
        list_user.append(user_list.copy())
        user_list.clear()
    csv_name = '{}.csv'.format(sys.argv[1])
    with open(csv_name, 'w') as csvfile:
        writer = csv.writer(csvfile, quoting=csv.QUOTE_ALL)
        writer.writerows(list_user)
