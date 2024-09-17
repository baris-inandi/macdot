import os
import sys

cmd_base = "git clone "
acc_uname = "baris-inandi"

if len(sys.argv) < 2 or sys.argv[1].startswith("-"):
    print("Usage:")
    print("  gitclone <url>")
    print("  gitclone <repo>")
    print("  gitclone <user/repo>")
    sys.exit(0)

if "://" in sys.argv[1]:
    # Is a URL
    # directly clone it
    cmd = cmd_base + sys.argv[1]
elif "/" in sys.argv[1]:
    # is a user/repo
    # clone it from github
    cmd = cmd_base + "https://github.com/" + sys.argv[1]
else:
    # is just a repo name
    # clone from personal account
    cmd = cmd_base + "https://github.com/" + acc_uname + "/" + sys.argv[1]

print(cmd)
os.system(cmd)
