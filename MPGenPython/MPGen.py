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
		delta = y2 - y1
		
		
		if not self._isInterlaced:
			arr = np.ones((1, delta))
			while success:
				frame = frame[y1 : y2].transpose(1, 0, 2)

				for col in range(width):
					c = frame[col] # y2-y1 * 3
					r = arr * c / (y2 - y1)
					vert_condensed[frame_counter, col, :] = r
				success, frame = self.video.read()
				frame_counter += 1
		else:
			arr1 = np.matrix([ int( i % 2 == 0) for i in range(delta) ]) # 1 * (y2-y1)
			arr2 = arr1 * (-1) + 1
			while success:
				frame = frame[y1 : y2].transpose(1, 0, 2)
				for col in range(width):
					c = frame[col] # (y2-y1) * 3
					r1, r2 = (arr1 * c) / np.sum(arr1), (arr2 * c) / np.sum(arr2)
#					r1, r2 = (arr1 * c), (arr2 * c) 

#					print(r1, r2)
				
					vert_condensed[frame_counter, col, :] = r1
					vert_condensed[frame_counter+1, col, :] = r2
					
					
					
				success, frame = self.video.read()
				frame_counter += 2	
					
		'''
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
						''modify later''
					b = sum_b / (y2-y1);
					g = sum_g / (y2-y1);
					r = sum_r / (y2-y1);
					
					value = np.array([b , g, r])
					vert_condensed[frame_counter, col, :] = value
 
					'' modify later ''
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
						

					for row in range(y1 + 1, y2 + 1, 2):
						o_sum_b+=frame[row,col][0]
						o_sum_g+=frame[row,col][1]
						o_sum_r+=frame[row,col][2]

					b = (e_sum_b * 2) / (y2-y1)
					g = (e_sum_g * 2) / (y2-y1)
					r = (e_sum_r * 2) / (y2-y1)
					value = np.array([b, g, r])
					vert_condensed[frame_counter * 2, col, :] = value


					b = (o_sum_b*2) / (y2-y1)
					g = (o_sum_g*2) / (y2-y1)
					r = (o_sum_r*2) / (y2-y1)
					value = np.array([b, g, r])
					vert_condensed[(frame_counter*2)+1, col, :] = value

					
				frame_counter += 1
				print(frame_counter)
				success, frame = self.video.read()
				'''
		
		cv.imwrite(self._savePth, vert_condensed)


mpGen = MPGenerator('/Users/shuqinlee/Documents/PROJECT/Transportation/Video/FILE0039.MOV', 
								'/Users/shuqinlee/Documents/PROJECT/Transportation/PedestrianDetection/MPGenPython/', 
								True)
mpGen.generate(420, 510, "o1");
print('complete!')
			