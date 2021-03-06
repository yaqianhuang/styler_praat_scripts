# This Praat script will change the sample rate of all sound files in a given directory
# and save AIFF files with the new rate to another directory.
# (See the Praat manual for details on resampling.)
# 
# This script is distributed under the GNU General Public License.
# Copyright 29.10.2003 Mietta Lennes
# Redistributed by Will Styler, because it's useful

form Change sample rate in sound files´
   sentence Sound_file_extension .wav
   comment Directory path of input files:
   text input_directory  /Users/will/Documents/research/hyperarticulation/gm stimuli for psyscope/nodeltalo/
   comment Directory path of resampled files (old files will be overwritten!):
   text output_directory  /Users/will/Documents/research/hyperarticulation/gm stimuli for psyscope/nodeltalo/
endform

Create Strings as file list... list 'input_directory$'*'sound_file_extension$'
numberOfFiles = Get number of strings
for ifile to numberOfFiles
	select Strings list
	sound$ = Get string... ifile
	Read from file... 'input_directory$''sound$'
	objectname$ = selected$ ("Sound", 1)
	Write to AIFF file... 'output_directory$''objectname$'.aif
	Remove
#	select Sound 'objectname$'
#	Remove
endfor

select Strings list
Remove