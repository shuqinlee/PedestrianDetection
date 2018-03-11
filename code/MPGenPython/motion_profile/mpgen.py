import cv2 as cv;

import numpy as np
import math
#video = cv.VideoCapture('/Users/shuqinlee/Documents/PROJECT/Transportation/Video/FILE0039.MOV');
#
#success, frame = video.read();
#
#while success:
#	cv.imshow('video', frame)
#	success, frame = video.read();
#	cv.waitKey(30)
#print('video end')



class MPGenerator:
	def __init__(self, videoPth, saveFolder, isInterlaced):
		self.video = cv.VideoCapture(videoPth)
		self._isInterlaced = isInterlaced
		self._saveFolder = saveFolder
		
#	def verticalCondesing(vert_condensed, y1, y2):
		
	def generate(self, y1, y2, fileName):
		self._savePth = self._saveFolder + fileName + ".png"
		
		height = math.ceil(self.video.get(cv.CAP_PROP_FRAME_HEIGHT))
		width = math.ceil(self.video.get(cv.CAP_PROP_FRAME_WIDTH))
		frameCount = math.ceil(self.video.get(cv.CAP_PROP_FRAME_COUNT))
		
		
		if self._isInterlaced:
			
#			vert_condensed = cv.CreateMat(2 * frameCount, width, cv.CV_8UC3) # deprecated
			vert_condensed = np.zeros((2 * frameCount, width, 3))
		else:
			vert_condensed = np.zeros((frameCount, width, 3))
		vert_condensed = vert_condensed.astype(np.uint8)

#			vert_condensed = cv.CreateMat(frameCount, width, cv.CV_8UC3)
			
		self.video.set(cv.CAP_PROP_POS_FRAMES, 0)
		frame_counter = 0
		
		success, frame = self.video.read()

		if not self._isInterlaced:
			while success:
				for col in range(width):
					sum_b = 0
					sum_g = 0;
					sum_r = 0
					
					for row in range(y1, y2):
						sum_b+=frame[row,col][0];
						sum_g+=frame[row,col][1];
						sum_r+=frame[row,col][2];
						''' modify later'''
					b = sum_b / (y2-y1);
					g = sum_g / (y2-y1);
					r = sum_r / (y2-y1);
					
					value = np.array([b , g, r])
					vert_condensed[frame_counter, col, :] = value
 
					''' modify later '''
				success, frame = self.video.read()
				frame_counter += 1
				
		else:
			success, frame = self.video.read()
			while success:
				for col in range(width):
					e_sum_b=0
					e_sum_g=0
					e_sum_r=0
					o_sum_b=0
					o_sum_g=0
					o_sum_r=0
					for row in range(y1, y2, 2):
						e_sum_b += frame[row,col][0];
						e_sum_g += frame[row,col][1];
						e_sum_r += frame[row,col][2];
						
						''' modeify later'''
					for row in range(y1 + 1, y2 + 1, 2):
						o_sum_b+=frame[row,col][0]
						o_sum_g+=frame[row,col][1]
						o_sum_r+=frame[row,col][2]
						'''modify later'''
					b = (e_sum_b * 2) / (y2-y1)
					g = (e_sum_g * 2) / (y2-y1)
					r = (e_sum_r * 2) / (y2-y1)
					value = np.array([b, g, r])
					vert_condensed[frame_counter * 2, col, :] = value

					''' modify later'''
					b = (o_sum_b*2) / (y2-y1)
					g = (o_sum_g*2) / (y2-y1)
					r = (o_sum_r*2) / (y2-y1)
					value = np.array([b, g, r])
					vert_condensed[(frame_counter*2)+1, col, :] = value
					''' modify later'''
					
				frame_counter += 1
				print(frame_counter)
				success, frame = self.video.read()
		cv.imwrite(self._savePth, vert_condensed)

'''
mpGen = MPGenerator('/Users/shuqinlee/Documents/PROJECT/Transportation/Video/FILE0039.MOV', 
								'/Users/shuqinlee/Documents/PROJECT/Transportation/PedestrianDetection/MPGenPython/', 
								True)
mpGen.generate(420, 510, "o1");
print('complete!')
'''
			