Misc
====

Movies to images: `ffmpeg -f image2 -r 06 -i img%3d.jpg output.mp4`
[http://ffmpeg-users.933282.n4.nabble.com/convert-a-sequence-of-images-to-a-video-file-td938068.html]()
	
Speed up movies by factor 2: `ffmpeg -i iphone_info2go.mp4 -vf "setpts=(1/2)*PTS" iphone_info2go-3.mp4`


Vim tips
--------
		:set incsearch             " I have this in .vimrc
		/my complicated regexp     " Highlighted as you enter characters
		:%s//replace with this/    " You don't have to type it again

'gi' switches to insertion mode placing the cursor at the same location it was previously.

'g;' goes to where the last change happened

'gv' reselects the last selection

^X-F completes using filenames from the current directory. No more copying/pasting from the terminal or painful double checking.

^X-P completes using words in the current file

^O and ^I
Go to previous (^O - "O" for old) location or to the next (^I - "I" just near to "O"). When you perform searches, edit files etc., you can navigate through these "jumps" forward and back.

vimcryption: vim -x filename.txt

