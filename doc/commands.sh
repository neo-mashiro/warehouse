# ------------------------------------------------------------------------------
# shell notations
# ------------------------------------------------------------------------------

/               # root directory, the very top of the filesystem
/home/repl      # absolute path starts with a slash /
seasonal        # relative path does not start with a slash /.
                # seasonal = /home/repl/seasonal
.               # single dot means "the current directory"
..              # double dots means the parent of the current dir
~               # tilde means "your home directory"
*               # wildcard, match zero or more characters
?               # wildcard, match a single character
[...]           # wildcard, match any one of the characters inside []
                # 201[78].txt matches 2017.txt or 2018.txt, but not 2016.txt
{...}           # wildcard, match any of the command-separated patterns inside {}
                # {*.txt, *.csv} matches any txt or csv files, but not pdf files.
$@              # default variable, means all of the command-line parameters given by "bash script.sh <arg>" to the script
$1              # default variable, means the 1st command-line parameter given by "bash script.sh <arg>" to the script
$2              # default variable, means the 2nd command-line parameter given by "bash script.sh <arg>" to the script, and so on
$#              # default variable, means the number of parameters given by "bash script.sh <arg>" to the script
#               # comment in shell scripts
$?              # last exit status


# ------------------------------------------------------------------------------
# self-defined notations
# ------------------------------------------------------------------------------

<dir>           # quick notation for a directory, such as /home/repl(absolute), repl/seasonal(relative)
<file>          # quick notation for a file, such as word.txt(relative), /home/repl/word.txt(absolute)
                # ! if there are spaces in the filename, the filename must be quoted in shell
<com>           # quick notation for a shell command, such as head
<text>          # simple text or string without quotes
<reg>           # patterns or regular expressions
<var>           # quick notation for a shell variable
<VAR>           # quick notation for an environment variable
<arg>           # command arguments
<opt>           # command options like -n -l -c...
<exp>           # logical expression


# ------------------------------------------------------------------------------
# permissions
# ------------------------------------------------------------------------------

ls -l | head -n 10

# -rw-rw-r--, total 10 digits, leading hyphen - indicates a file
# drw-rw-r--, total 10 digits, leading d indicates a dir
# the last 9 digits represent the permissions for the (current user)/(current user group)/(other users)

# r--: read only
# rwx: full permissions to read/write/execute the file
# rw-: read/write, but not authorized to execute the file
# r-x: read/execute, but not authorized to edit the file

chmod u+x <file>  # alter file permission
u                 # The owner of the file
g                 # The group that the file belongs to
o                 # Everyone else (other than)
a                 # Everyone above
+                 # Add permission
-                 # Remove permission
=                 # Set permission

# u+x allows the owner to execute <file>, for example
# a+x allows anyone to execute <file>
# go-rw prevents anyone other than the owner from reading or modifying <file>

chmod 777 <file>  # set full permission on <file>, r=4, w=2, x=1，so 777 = rwxrwxrwx
chmod -R 777 *    # set full permission recursively on all files in the current directory


# ------------------------------------------------------------------------------
# global commands
# ------------------------------------------------------------------------------

set               # view a complete list of environment variables
set | grep USER   # see the value of a specific ENV VAR

echo $SHELL       # commonly used environment variables
echo $USER
echo $HOME
echo $PWD
echo $PATH

man <com>
man nano          # man <com> opens the manual for a command
                  # then type / in order to start a search
                  # then type the word or phrase that you are searching for
                  # press Enter, then the page jumps to the first related entry
                  # press the n key in order to search for the next occurrence of the word
                  # type Shift + n to go to the previous occurrence
                  # type q to quit. this way of searching also works with less

apropos <text>    # search keyword for a command (when you forgot the exact command name)
apropos who       # all commands that has a substring "who" will appear in console

history           # list all commands (with number assigned) in the history (within the current session)
                  # history commands are stored in ~/.zsh_history (including past shell sessions)
!25               # re-run the 25th command in your history

%%!               # cell magic that runs shell commands in Jupyter notebook

<com> > log.py    # > redirects command output to a text file, suppress output in the console
                  # this will overwrite log.py if it already exists, so use this > only for the first time
<com> >> log.py   # >> redirects and append output to an existing text file, old data in log.py won't be overwritten

<com1> | <com2>   # | is called a pipe, and this line of command is called a pipeline
                  # it uses the output of the command on the left as the input to the command on the right
                  # in a pipeline command, the <file> argument of <com2> is not needed, it's simply the output of <com1>
                  # a pipeline can chain any number of commands together, <com1> | <com2> | <com3> | <com4> | ...

pwd               # print working directory in absolute path, such as '/home/neo-mashiro/Desktop/dev02'

whoami            # print where you are

clear             # clean up the console, = ctrl + L

make              # command for making files/installation, this is advanced and complicated, see reference:
                  # http://www.gnu.org/software/make/manual/make.html#Options-Summary
                  # http://makefiletutorial.com


# ------------------------------------------------------------------------------
# basic commands
# ------------------------------------------------------------------------------

ls
ls <file>
ls <dir>
ls ..
ls ~
ls -R <dir>                        # list everything in the dir recursively
ls -F <dir>                        # prints a / after every dir and a * after every runnable program
ls -l                              # print a long list of dirs/files, one for each row.

cd <dir>                           # change directory
cd ..                              # change to the parent dir
cd ~                               # takes you home
cd                                 # takes you home
cd /                               # go to root

cp <file1> <file2>                 # create a copy of file1 to file2 (will overwrite if file2 already exists)
cp <file1> <file2> <file3> <dir>   # copy multiple files to a dir
cp -r <dir1> <dir2>                # copy the entire dir1(including its sub-dirs) into dir2
                                   # specify -r recursive option so that the copy remains intact

mv <file1> <file2>                 # move(rename) file1 to file2 (will overwrite if file2 already existed)
mv <dir1> <dir2>                   # rename dirs
mv <file1> <file2> <file3> <dir>   # move multiple files to a dir

rm <file1> <file2> <file3>         # remove(delete) files for good
rm -r <dir>                        # remove a dir, must specify -r recursive option
rmdir <dir>                        # delete a dir (dir must be empty first)
                                   # ! DO NOT use any "delete" commands, instead, just move files/dirs to the trash bin
                                   # ! there is no undo button in the console, there is no ctrl-z command in life
                                   # ! below is the path to the Trash Bin:

~/.Trash                           # on Mac
~/.local/share/Trash               # on Ubuntu
mv test.pdf ~/.local/share/Trash

mkdir <dir>                        # create a dir
touch <file>                       # create a new file
touch <dir> <file>

wc <file>                          # word count the file
-l                                 # only count the number of lines
-w                                 # only count the number of words
-c                                 # only count the number of characters

wc -l <file>                       # first make sure the file is not too large to print
cat <file>                         # print the contents of a file
cat <file> <file>                  # concatenate multiple files output

head <file>                        # print the first 10 lines of a file
head -n 5 <file>                   # print the first 5 lines of a file
tail -n +7 <file>                  # print from the 7th line, ignoring the first 6 lines

cut -d , -f 2-5,8 <file>           # print 2-5 and the 8th column of a file, using comma as delimiter
paste -d , <file1> <file2>

less <file1> <file2> <file3>       # less prints contents of multiple large files
                                   # one page is displayed at a time
                                   # press spacebar to page down within a file, press b to page up
                                   # type :n to move to the next file, or :p to go back to the previous file.
                                   # type q to quit less

sort <file>                        # sort lines of text in the file in alphabetical asc order by default
-n                                 # sort numerically
-r                                 # reverse the order, desc
-b                                 # ignore leading blanks
-f                                 # fold case (i.e., be case-insensitive)

uniq                               # remove adjacent duplicates only
<com> | sort | uniq -c             # sort before uniq to remove all possible duplicates, -c shows the frequency of a line

expr 5 + 2                         # expr evaluates math expressions
expr 5 - 2
expr 5 \* 2                        # multiplication * has to be escaped or the bash recognize it as regex
expr 5 / 2                         # integer division
expr 5 % 2                         # modulus division

echo "22 / 7" | bc -l              # math with decimals, must use echo with the bench calculator bc with flag -l
echo <text>                        # print text to the console, doesn't matter if its quoted

grep <text> <file>                 # select lines in the file that contain text
egrep <reg> <file>                 # egrep is more powerful, it selects using regular expressions
                                   # you can also grep multiple files at once <file1> <file2>..., and output will show the filenames

-c                                 # print the count of matching lines rather than the lines themselves
-h                                 # do not print the names of files when searching multiple files
-i                                 # ignore case (e.g., treat "Regression" and "regression" as matches)
-l                                 # print the names of files that contain matches, not the matches
-n                                 # print line numbers for matching lines
-v                                 # invert the match, i.e., only show lines that don't match

cal                                # print calendar
date                               # print current datetime
sleep 10                           # let the console run(sleep) for 10 secs

find <dir> <opt> <arg>             # search files in dir(including sub dirs) and return its path
find . -name "states.txt"          # find states.txt in the current dir by name
find . -name "*.jpg"

sdiff <file1> <file2>              # compare 2 files in a side-by-side format
md5 <file>                         # compute the MD5 hash of a file
shasum <file>                      # compute the SHA-1 hash(or checksum)


# ------------------------------------------------------------------------------
# create variables
# ------------------------------------------------------------------------------

<var>=<var>/<text>/<file>...       # create a shell variable (!without any spaces before or after the = sign)

let <var>=$<var>+1                 # modify variable values
let <var>=$<var>\*10

echo $<var>                        # print the <var> value

<var>=$(<com>)                     # command substitution: save output of some <com> to variable <var> using $()
count=$(cat math.sh | wc -l)
echo $count

city="New York"
echo "I live in $city."            # $<var> can be used inside a string


# ------------------------------------------------------------------------------
# read input into variables and output
# ------------------------------------------------------------------------------

read userdata                      # temporarily stops the execution and waits for user input, the argument is a variable
                                   # the execution goes on after user press Enter
                                   # user input data will be stored in variable 'userdata'
                                   # when the script is called, the caller(user) needs to enter input

echo "Type in a string and then press Enter:"
read response
echo "You entered: $response"

echo $?                            # see the last exit status.
echo true                          # true has an exit status of 0 and false has an exit status of 1
                                   # exit status: it's like the po_return of a command or program
                                   # The exit status of a program is an integer
                                   # the exit status of the last program run is stored in ($?).
                                   # the exit status of a successful program is 0
                                   # the exit status of a program with errors is > 0, such as 127
                                   # every positive integer number corresponds to a specific shell built-in error.


# ------------------------------------------------------------------------------
# operands
# ------------------------------------------------------------------------------

&&                                 # AND
||                                 # OR
<com> && <com> && <com>            # any <com> to the right of a <com> that has a non-zero exit status is not executed.
<com> || <com> || <com>            # <com> to the right of || is executed only if <com> on the left fails (exit status > 0).

[[]]                               # Conditional expressions are always between double brackets, return true/false

-gt  Greater Than                  [[ $planets -gt 8 ]]
-ge  Greater Than or Equal To      [[ $votes -ge 270 ]]
-eq  Equal                         [[ $fingers -eq 10 ]]
-ne  Not Equal                     [[ $pages -ne 0 ]]
-le  Less Than or Equal To         [[ $candles -le 9 ]]
-lt  Less Than                     [[ $wives -lt 2 ]]
-e   A File Exists                 [[ -e $taxes_2016 ]]
-d   A Directory Exists            [[ -d $photos ]]
-z   Length of String is Zero      [[ -z $name ]]
-n   Length of String is Non-Zero  [[ -n $name ]]
=~   Matches Regular Expression    [[ $consonants =~ [aeiou] ]]  # return true only if the string matches the regex
=    String Equal To               [[ $password = "pegasus" ]]
!=   String Not Equal To           [[ $fruit != "banana" ]]
!    Not                           [[ ! "apple" =~ ^b ]]


[[ 4 -gt 3 ]]
echo $?                                    # 0 (true)
[[ 3 -gt 4 ]]
echo $?                                    # 1 (false)

[[ <exp> ]] && echo t || echo f            # a quick test for logical expression, returns t/f
[[ 4 -gt 3 ]] && echo t || echo f          # t
[[ 3 -gt 4 ]] && echo t || echo f          # f
[[ -e math.sh ]] && echo t || echo f       # t (if the file math.sh exists in current directory)

number=7
[[ $number -gt 3 ]] && echo t || echo f    # t
[[ -e $number ]] && echo t || echo f       # f (no file called 7 exists)

name=sean
[[ $name =~ ^s.+n$ ]] && echo t || echo f  # t


# ------------------------------------------------------------------------------
# arrays ()
# ------------------------------------------------------------------------------

()                                 # Lists(arrays) are created with parentheses, with a space separating each element in the list
${}                                # To retrieve the array you need to use parameter expansion, ${ }
                                   # The positions of the elements in the array are numbered starting from zero

plagues=(blood frogs lice flies sickness boils hail locusts darkness death)
echo ${plagues[0]}
echo ${plagues[3]}
echo ${plagues[*]}                 # * get all of the elements

plagues[4]=disease
echo ${plagues[*]}

echo ${plagues[*]:5:3}             # get 3 array elements starting from the 6th
echo ${#plagues[*]}                # find the length of an array using the pound sign (#)

dwarfs=(grumpy sleepy sneezy doc)
echo ${dwarfs[*]}
dwarfs+=(bashful dopey happy)      # '+=' append another array onto the end
echo ${dwarfs[*]}


# ------------------------------------------------------------------------------
# string sequences {}
# ------------------------------------------------------------------------------

echo {0..9}                        # 0 1 2 3 4 5 6 7 8 9
echo {a..e}                        # a b c d e
echo {W..Z}                        # W X Y Z

echo a{0..4}                       # a0 a1 a2 a3 a4
echo b{0..4}c                      # b0c b1c b2c b3c b4c
echo {1..3}{A..C}                  # 1A 1B 1C 2A 2B 2C 3A 3B 3C

start=4
end=9
echo {$start..$end}                # {4..9}
eval echo {$start..$end}           # 4 5 6 7 8 9, must use eval to create out of variables

echo {{1..3},{a..c}}               # 1 2 3 a b c, use comma ',' to paste

echo {Who,What,Why,When,How}s      # Whos Whats Whys Whens Hows


# ------------------------------------------------------------------------------
# if statement and for loop
# ------------------------------------------------------------------------------

## if statement: use 'fi' to end, indent with 2 spaces, can be nested

if [[ $1 -gt 3 ]] && [[ $1 -lt 7 ]]
then
  echo "$1 is between 3 and 7"
elif [[ $1 =~ "Jeff" ]] || [[ $1 =~ "Roger" ]] || [[ $1 =~ "Brian" ]]
then
  echo "$1 works in the Data Science Lab"
else
  echo "You entered: $1, not what I was looking for."
fi

## for loop: for .. in ..; do ..; done

for ...variable... in ...list...; ...body...; done

for suffix in gif jpg png; do echo $suffix; done
for file in seasonal/*.csv; do echo $file; done
for file in seasonal/*.csv; do head -n 2 $file | tail -n 1; done
for file in seasonal/*.csv; do <com1>; <com2>; done  # the body can contain any number of commands, separated by ;

for filename in $@    # in shell scripts, semi-colons ; are not needed, and the loop should be in readable structure
do
    head -n 2 $filename | tail -n 1
    tail -n 1 $filename
done


# ------------------------------------------------------------------------------
# regular expressions
# ------------------------------------------------------------------------------

### http://regexr.com/

.                                  # Any Character
\w                                 # A Word(including all letters, numbers, and even _)
\W                                 # Not a Word
\d                                 # A Digit
\D                                 # Not a Digit
\s                                 # Whitespace
\S                                 # Not Whitespace
[def]                              # A Set of Characters
[^def]                             # Negation of Set
[e-q]                              # A Range of Characters
^                                  # Beginning of String
$                                  # End of String
\n                                 # Newline
+                                  # One or More of Previous
*                                  # Zero or More of Previous
?                                  # Zero or One of Previous
|                                  # Either the Previous or the Following
{6}                                # Exactly 6 of Previous
{4, 6}                             # Between 4 and 6 or Previous
{4, }                              # More than 4 of Previous

egrep "s+as" states.txt            # one or more s followed by as
egrep "s*as" states.txt            # zero or more s followed by as
egrep "s{2}" states.txt            # s{2} means exactly two s = ss
egrep "s{2,3}" states.txt          # 2~3 adjacent s
egrep "(iss){2}" states.txt        # search for iss occurring twice. (iss) is a capturing group instead of a single character
egrep "(i.{2}){3}" states.txt      # 3 occurrences of an i followed by 2 of any character

egrep "[aeiou]" small.txt          # contains any char in [aeiou]
egrep "[^aeiou]" small.txt         # contains any char not in [aeiou]
egrep "[e-q]" small.txt            # between e and q
egrep "[E-Q]" small.txt            # between E and Q
egrep -i "[e-q]" small.txt         # ignore cases

egrep "\+" small.txt               # \ escape
egrep "\." small.txt
egrep "^M" states.txt              # the caret (^), represents the start of a line, so start with M
egrep "S$" states.txt              # the dollar sign ($) represents the end of line, so end with S
egrep -n "t$" states.txt           # display the line number -n
egrep "North|South" states.txt     # | represents or

egrep "New" states.txt canada.txt              # grep multiple files at once
egrep "^[AEIOU]{1}.+[aeiou]{1}$" states.txt    # begin and end with a vowel


# ------------------------------------------------------------------------------
# shell functions and scripts
# ------------------------------------------------------------------------------

nano script.sh                     # create a shell script file in nano
bash script.sh                     # then the bash command can run that script like a batch file
bash script.sh <args>              # pass <args> into the script to run
                                   # "All script arguments: $@"
                                   # "First arg: $1. Second arg: $2."
                                   # "Number of arguments: $#"
                                   # 'chmod u+x script.sh' if current user has no x permission

bash script.sh > script.out        # redirect output to a .out file
cat script.out                     # check output

source script.sh                   # 'source' allows you to use function inside bash scripts as terminal commands

# Example: use functions inside bash scripts on the command line

#!/usr/bin/env bash
# File: script.sh
function ntmy {
  echo "Nice to meet you $1"
}

source script.sh
ntmy Jeff    # Nice to meet you Jeff
ntmy Philip  # Nice to meet you Philip
ntmy Jenny   # Nice to meet you Jenny

# Another example

#!/usr/bin/env bash
# File: addseq.sh
function addseq {
  local sum=0    # must specify local keyword

  for element in $@
  do
    let sum=sum+$element
  done

  echo $sum
}

source addseq.sh
addseq 1 5 3 8 4 6 3  # 30


# ------------------------------------------------------------------------------
# commonly used commands in Linux Ubuntu 16.04 LTS
# ------------------------------------------------------------------------------

xrandr -q | grep " connected"
xrandr --output HDMI-1-1 --brightness 0.5
xset m 0/0 0
exit

sleep 5
reboot
shutdown now

apropos
apropos count

apt list --installed  # list all installed packages

# calculator in console
bc
expr 5 + 2
echo $[12.5*7]

cal
cal 05 2018
date

clear
cmatrix

convert 1.png 1.pdf                # convert pictures to pdf
convert 1.jpg -rotate -0.3 11.jpg  # rotate pictures with any small degrees
pdfimages 1.pdf 1.jpg              # convert pdf to pictures
pdfunite 1.pdf 2.pdf 12.pdf        # merge pdf

pdftk 1.pdf cat 1-endsouth output 1s.pdf  # rotate pdf, north-south-east-west
pdftk 1.pdf cat 1-endwest output 1w.pdf

crontab --help
crontab jobs.txt

# check free disk
df -h
free -h
fdisk -l

history
history 10
history | cut -c 8-  # remove row numbers

env  # show all environment variables
hostname  # starspower
select-editor
shutter -s  # screenshot

# check network
ifconfig
ip link show
netstat -l
netstat -tup
ping 138.197.211.100
telnet 138.197.211.100 8388
sudo /etc/init.d/networking restart

# process management
ps -A
ps -A | grep "cron"
ps -ef
ps -ef | grep atom
ps -ef | grep firefox
kill 15027
kill 15092

# check hardware
lsblk
lsmod
lspci -tv
lspci | grep VGA
lsusb -tv

md5 test/movies.out
md5sum
md5sum --help
shasum test/movies.out

sort text.out
sort text.out | uniq

sudo apt-add-repository ppa:shutter/ppa
sudo apt-get update
sudo apt-get install atom
sudo apt-get purge --auto-remove clementine
sudo apt-get remove --auto-remove clementine

tree -dh > tree_view.md

which firefox
which mongo

tar -xvzf abc.tar.gz   # z for .tar.gz
tar -xvjf abc.tar.bz2  # j for .tar.bz2
tar -cvzf abc.tar.gz dir1
tar -cvjf abc.tar.bz2 dir1


# ------------------------------------------------------------------------------
# Exercise: write a program that has the following behavior:
#
# 1. when the program starts the user should be asked how many files are in the current directory.
# 2. then the user should be prompted for a guess.
# 3. If the user's answer is incorrect the user should be advised that the guess was either too low or too high.
# 4. then the user should be prompted to try to guess again.
# 5. If the user's guess is correct then they should be congratulated and the program should end.
#
# *. The program should not end until the user has entered the correct number of files in the current directory.
# *. The program should be able to be run by entering `bash xxx.sh` into the console.
# *. The program should contain at least one function, one loop, and one if statement.
# *. The program should be more than 20 lines of code but less than 50 lines of code.
# ------------------------------------------------------------------------------

# initial
n=$(ls -l | grep "^-" | wc -l)  # a file starts with '-', a directory starts with 'd'
success=0

# welcome msg
echo "How many files are in the current directory? Please input your guess:"

# function
function eval_guess {
    if [[ $1 -gt n ]]
    then
    	echo "Your guess is too high, please try again"
    elif [[ $1 -lt n ]]
    then
    	echo "Your guess is too low, please try again"
    elif [[ $1 -eq n ]]
    then
    	echo "Congratulations! You guess it right"
    	success=1
    fi
}

# main
while [[ $success -ne 1 ]]
do
  read input
  if [[ ! $input =~ [0-9]+ ]]
  then
    echo "Please enter a valid integer"
  else
    eval_guess $input
  fi
done
