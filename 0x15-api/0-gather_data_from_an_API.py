#!/usr/bin/python3
""" Script that uses a RESTAPI """
import requests
import sys
if __name__ == "__main__":
    user_id = sys.argv[1]
    user_info = requests.get("https://jsonplaceholder.typicode.com/users/" +
                             user_id).json()
    user_todos = requests.get("https://jsonplaceholder.typicode.com/users/" +
                              user_id + "/todos").json()
    completed_task = total_tasks = 0
    for todo in user_todos:
        total_tasks += 1
        if todo['completed'] is True:
            completed_task += 1
    print("Employee {} is done with tasks ({}/{}):"
          .format(user_info['name'], completed_task, total_tasks))
    for todo in user_todos:
        if todo['completed'] is True:
            print("\t {}".format(todo['title']))
