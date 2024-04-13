#! /usr/bin/python3

import cgi
import cgitb
cgitb.enable()
print("Content-Type: text/html")    # HTML is following
print()
cgi.print_environ()
