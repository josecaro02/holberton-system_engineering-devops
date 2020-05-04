#!/usr/bin/python3
""" Script that uses a RESTAPI """
import json
import requests
import sys



if __name__ == "__main__":
    user_info = requests.get("https://jsonplaceholder.typicode.com/users")\
                        .json()
    list_user = {}
    for user in user_info:
        user_todos = requests.get(
            "https://jsonplaceholder.typicode.com/users/" +
            str(user.get('id')) + "/todos").json()
        list_user[user.get('id')] = []
        user_list = {}
        for todo in user_todos:
            user_list['username'] = user.get('username')
            user_list['task'] = todo.get('title')
            user_list['completed'] = todo.get('completed')
            list_user[user.get('id')].append(user_list.copy())
            user_list.clear()
    with open('todo_all_employees.json', 'w') as outfile:
        json.dump(list_user, outfile)
