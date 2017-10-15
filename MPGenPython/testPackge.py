from motion_profile import mpgen

video = cv.VideoCapture('/Users/shuqinlee/Documents/PROJECT/Transportation/Video/FILE0039.MOV');

success, frame = video.read();

while success:
	cv.imshow('video', frame)
	success, frame = video.read();
	cv.waitKey(30)
print('video end')