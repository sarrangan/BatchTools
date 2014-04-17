set "line1=This is the first line of the file"
set "line2=This is the second line of the file"
copy /y file.txt fileCopy.txt 
:: ">" causes an overwrite of the existing file.txt (or creates a new one) and writes %line1% to the first line
echo %line1% > file.txt
:: ">>" appends to the end of a text file
echo %line2% >> file.txt
:: more removes +x number of lines from the top of the file
more +2 fileCopy.txt >> file.txt
del fileCopy.txt
