#!/usr/bin/python3
""" Script that uses a RESTAPI """
import requests
import sys
import json


if __name__ == "__main__":
    user_id = sys.argv[1]
    user_info = requests.get("https://jsonplaceholder.typicode.com/users/" +
                             user_id).json()
    user_todos = requests.get("https://jsonplaceholder.typicode.com/users/" +
                              user_id + "/todos").json()
    list_user = {sys.argv[1]: []}
    user_list = {}
    for todo in user_todos:
        user_list['task'] = todo.get('title')
        user_list['completed'] = todo.get('completed')
        user_list['username'] = user_info.get('username')
        list_user[sys.argv[1]].append(user_list.copy())
        user_list.clear()
    json_name = sys.argv[1] + '.json'
    with open(json_name, 'w') as outfile:
        json.dump(list_user, outfile)
