Misc
====

Movies to images: `ffmpeg -f image2 -r 06 -i img%3d.jpg output.mp4`
[http://ffmpeg-users.933282.n4.nabble.com/convert-a-sequence-of-images-to-a-video-file-td938068.html]()
	
Speed up movies by factor 2: `ffmpeg -i iphone_info2go.mp4 -vf "setpts=(1/2)*PTS" iphone_info2go-3.mp4`

