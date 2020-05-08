#!/usr/bin/python3
""" Queries Reddit API and returns the number of
suscriber for a given subreddit. If invalid subreddit is given
return 0
"""
import requests


def recurse_pages(subreddit, hot_list, full_name):
    print(full_name)
    subrd_info = requests.get("https://www.reddit.com/r/" +
                              subreddit + "/hot.json?after=" + full_name,
                              headers={'User-agent': 'yout bot 0.1'},
                              allow_redirects=False)
    if (subrd_info.status_code == 200):
        subs = subrd_info.json().get('data').get('children')
        if len(subs) != 0:
            title = subs[0].get('data').get('title')
            name = subs[0].get('data').get('name')
            hot_list.append(title)
            recurse_pages(subreddit, hot_list, name)
    return (hot_list)


def recurse(subreddit, hot_list=[]):
    if len(hot_list) == 0:
        subrd_info = requests.get("https://www.reddit.com/r/" +
                                  subreddit + "/hot.json?limit=1",
                                  headers={'User-agent': 'yout bot 0.1'},
                                  allow_redirects=False)
        if (subrd_info.status_code == 200):
            subs = subrd_info.json().get('data').get('children')
            title = subs[0].get('data').get('title')
            name = subs[0].get('data').get('name')
            hot_list.append(title)
            hot_list = recurse_pages(subreddit, hot_list, name)
            return(hot_list)
        else:
            return(None)
