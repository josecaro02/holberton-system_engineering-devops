#!/usr/bin/python3
""" Queries Reddit API and returns the number of
suscriber for a given subreddit. If invalid subreddit is given
return 0
"""
import requests


def recurse(subreddit, hot_list=[], full_name=""):
    subrd_info = requests.get("https://www.reddit.com/r/" +
                              subreddit + "/hot.json?&after=" + full_name,
                              headers={'User-agent': 'Chrome'},
                              allow_redirects=False)
    if (subrd_info.status_code == 200):
        subs = subrd_info.json().get('data').get('children')
        if len(subs) != 0:
            title = subs[0].get('data').get('title')
            name = subs[0].get('data').get('name')
            hot_list.append(title)
            return recurse(subreddit, hot_list, name)
        else:
            return(hot_list)
    return(None)
