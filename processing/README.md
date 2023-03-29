
# Processing MATLAB v1.2 
<br />
&copy; 2023 Dhwdue 
<br />
Last modified Mar 29, 2023 by Andy Du
<br />


This is an automated script to quickly processing data from xls/xlsx/csv files.


## Procedure:

i. Put all the files in the folder 'processing_input' under '../processing/'. <br />

 
ii. Specify file type on line 2 (file_type = 'xlsx'; ). 'xls' can be changed to 'xls' or 'csv' if needed. <br />

iii. Click 'Run' in MATLAB. If anything pops out, just click 'change path'. It will then parse all the files and generate jpg-format plots respectively and save them into the folder'processing_output'. <br />

iv. Wait until all the processed excel files are moved to the folder 'processing_output'. <br />


### File requirement:

i. Headers NEEDED since this script does NOT process first line and first column. Independent variable (x vals, frequencies) should be in the first ROW, while the depedent variable (y vals, 360 degrees) should be in the first COL.  <br />


## PS 

Feel free to adjust the font, size, linewidth, x or y labels, and other parameters in the script. Very easy!



# Hooray!
