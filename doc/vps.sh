## The main purpose of using cloud computers is to automate some tasks such as building up a twitter bot account  ##
## The biggest advantage of cloud computers is that they are never turned off and always connected to the internet ##

$ cd
$ pwd

## /home/neo-mashiro/Desktop/self.education.archive/REF_004_VPS_CLOUD/

$ mkdir cloud
$ cd cloud
$ pwd

## /home/neo-mashiro/Desktop/self.education.archive/REF_004_VPS_CLOUD/cloud

$ ssh root@159.89.201.176  # ssh: Secure Shell

## root@159.89.201.176's password:
## # (Enter your password)

-----------------------------------------------------------------------------------------------------------------
## Welcome to Ubuntu 16.04.2 LTS (GNU/Linux 4.4.0-78-generic x86_64)
##
##  * Documentation:  https://help.ubuntu.com
##  * Management:     https://landscape.canonical.com
##  * Support:        https://ubuntu.com/advantage
##
##   Get cloud support with Ubuntu Advantage Cloud Guest:
##     http://www.ubuntu.com/business/services/cloud
##
## 0 packages can be updated.
## 0 updates are security updates.
##
##
##
## The programs included with the Ubuntu system are free software;
## the exact distribution terms for each program are described in the
## individual files in /usr/share/doc/*/copyright.
##
## Ubuntu comes with ABSOLUTELY NO WARRANTY, to the extent permitted by
## applicable law.

root@159.89.201.176: pwd

## /root

root@159.89.201.176: scp root@159.89.201.176:/root/remote.txt local.txt  # download from server (scp: Secure Copy)

## root@159.89.201.176's password:
## remote.txt                100%   16     1.2KB/s   00:00

root@159.89.201.176: scp -r root@159.89.201.176:/root/folder ~/cloud/folder  # use -r (recursive) flag to transfer an entire folder

## root@159.89.201.176's password:
## remote.txt                100%   16     1.2KB/s   00:00

root@159.89.201.176: logout
## Connection to 159.89.201.176 closed.

-----------------------------------------------------------------------------------------------------------------
$ pwd

## /home/neo-mashiro/Desktop/self.education.archive/REF_004_VPS_CLOUD/cloud

$ scp local.txt root@159.89.201.176:/root/remote.txt  # upload to server

## root@159.89.201.176's password:
## local.txt                 100%   20     1.8KB/s   00:00

$ scp -r ../cloud root@159.89.201.176:/root/cloud  # use -r (recursive) flag to transfer an entire folder

## root@159.89.201.176's password:
## cloud.txt                 100%   20     4.8KB/s   00:00

$ ssh root@159.89.201.176

## root@159.89.201.176's password:
## # (Enter your password)

-----------------------------------------------------------------------------------------------------------------
## Welcome to Ubuntu 16.04.2 LTS (GNU/Linux 4.4.0-78-generic x86_64)
##
##  * Documentation:  https://help.ubuntu.com
##  * Management:     https://landscape.canonical.com
##  * Support:        https://ubuntu.com/advantage
##
##   Get cloud support with Ubuntu Advantage Cloud Guest:
##     http://www.ubuntu.com/business/services/cloud
##
## 0 packages can be updated.
## 0 updates are security updates.
##
##
##
## The programs included with the Ubuntu system are free software;
## the exact distribution terms for each program are described in the
## individual files in /usr/share/doc/*/copyright.
##
## Ubuntu comes with ABSOLUTELY NO WARRANTY, to the extent permitted by
## applicable law.

root@159.89.201.176: pwd

## /root

root@159.89.201.176: curl -O http://seankross.com/the-unix-workbench/01-What-is-Unix.md  # curl -O <url> for download

##   % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
##                                  Dload  Upload   Total   Spent    Left  Speed
## 100  1198  100  1198    0     0  13681      0 --:--:-- --:--:-- --:--:-- 13770

root@159.89.201.176: head -n 5 01-What-is-Unix.md

## # What is Unix?
##
## Unix is an operating system and a set of tools. The tool we'll be using the
## most in this book is a shell, which is a computer program that provides a
## command line interface. You've probably seen a command line interface in the

root@159.89.201.176: curl http://httpbin.org/get  # curl without any flags = a HTTP GET request

{
  "args": {},
  "headers": {
    "Accept": "*/*",
    "Connection": "close",
    "Host": "httpbin.org",
    "User-Agent": "curl/7.47.0"
  },
  "origin": "159.203.134.88",
  "url": "http://httpbin.org/get"
}

root@159.89.201.176: ps -A  # ps list all running programs

##  PID TTY          TIME CMD
##    1 ?        00:00:13 systemd
##    2 ?        00:00:00 kthreadd
##    3 ?        00:00:03 ksoftirqd/0
##    5 ?        00:00:00 kworker/0:0H
##    7 ?        00:00:11 rcu_sched
##    8 ?        00:00:00 rcu_bh
##    9 ?        00:00:00 migration/0
## ...

root@159.89.201.176: ps -A | grep "cron"  # cron is used for automating tasks, e.g.: create your own bot that tweets regularly

##  1273 ?        00:00:01 cron

root@159.89.201.176: select-editor

## Select an editor.  To change later, run 'select-editor'.
##   1. /bin/ed
##   2. /bin/nano        <---- easiest
##   3. /usr/bin/vim.basic
##   4. /usr/bin/vim.tiny
##
## Choose 1-4 [2]:

root@159.89.201.176: crontab -e  # (cron table edit)

# Edit this file to introduce tasks to be run by cron.
#
# m h  dom mon dow   command
* * * * * date >> ~/date_file.txt    # runs per min to log time
00-04 * * * * bash ~/script.sh       # runs per minute for the first five minutes of every hour
00 00 * * 0,6 bash ~/script.sh       # runs at midnight every Saturday and Sunday
00 03 01-15 * * bash ~/script.sh     # runs at 3am for the first fifteen days of every month
00,30 * * * * bash ~/script.sh       # runs at the start and middle of every hour
00 00,12 * * * bash ~/script.sh      # runs every day at midnight and noon
00 * 01-07 01,06 * bash ~/script.sh  # runs at the start of every hour for the first seven days of the months of January and June

# https://dev.twitter.com/rest/public  twitter API
# https://developer.github.com/v3/     Github API

root@159.89.201.176: logout
## Connection to 159.89.201.176 closed.

#############################################################################
## Next step, try out some cloud computing exercises
#############################################################################
1. Write a bash script that takes a file path as an argument and copies that file to a designated folder on your server.
2. Find a file online that changes periodically, then write a program to download that file every time it changes.
3. Try creating your own Twitter or GitHub bot with the Twitter API or the GitHub API.
