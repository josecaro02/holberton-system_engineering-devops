#!/usr/bin/python3
""" Queries Reddit API and returns the number of
suscriber for a given subreddit. If invalid subreddit is given
return 0
"""
import requests


def number_of_subscribers(subreddit):
    subrd_info = requests.get("https://www.reddit.com/r/" +
                              subreddit + "/about.json",
                              headers={'User-agent': 'yout bot 0.1'},
                              allow_redirects=False)
    if (subrd_info.status_code == 200):
        subs = subrd_info.json().get('data').get('subscribers')
        return(subs)
    return(0)
