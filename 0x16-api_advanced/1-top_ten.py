#!/usr/bin/python3
""" Queries Reddit API and returns the number of
suscriber for a given subreddit. If invalid subreddit is given
return 0
"""
import requests


def top_ten(subreddit):
    subrd_info = requests.get("https://www.reddit.com/r/" +
                              subreddit + "/hot.json?limit=10",
                              headers={'User-agent': 'yout bot 0.1'},
                              allow_redirects=False)
    if (subrd_info.status_code == 200):
        subs = subrd_info.json().get('data').get('children')
        for sub in subs:
            print(sub.get('data').get('title'))
        return
    print(None)
