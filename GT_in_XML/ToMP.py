import cv2 as cv
import numpy
import re   # for getting the number in the string
import os
import xml.dom.minidom
# -*- coding:utf-8 -*-

rootPath = './CCHN_0018_229730_46_130718_0907_00216_Front/'
dir = os.listdir(rootPath)
f = 'CCHN_0018_229730_46_130718_0907_00216_Front'

range_map = {}
range_map[26] = [180, 211, 227, 243, 283]
range_map[27] = [184, 212, 228, 244, 308] # 184
range_map[28] = [180, 203, 219, 235, 283] # 180
range_map[29] = [176, 203, 219, 235, 283] # 176
range_map[30] = [180, 190, 206, 222, 283] # 196

# get ind
i = 15
while f[i] != '_':
        i += 1
ind = int(f[i-2: i])
rg = range_map[ind]
print(rg)

allZone = open(f + '.txt','w')
zone = [0] * 4
zone[0] = open(f + '_0.txt', 'w')
zone[1] = open(f + '_1.txt', 'w')
zone[2] = open(f + '_2.txt', 'w')
zone[3] = open(f + '_3.txt', 'w')

for file in dir:
    get_name = os.path.splitext(file)
    xml_name = get_name[0] + get_name[1]
    dom = xml.dom.minidom.parse(rootPath + xml_name)
    # get the number of  the frame
    frame_num_0 = re.findall(r'Front+\d+',xml_name)
    frame_num = (re.findall(r'\d+\d*',frame_num_0[0]))[0]
    # get all the x pos
    xmin = dom.getElementsByTagName('xmin')
    xmax = dom.getElementsByTagName('xmax')
    ymin = dom.getElementsByTagName('ymin')
    ymax = dom.getElementsByTagName('ymax')
    
    allZone.writelines(frame_num + '\t')
    zone[0].writelines(frame_num + '\t')
    zone[1].writelines(frame_num + '\t')
    zone[2].writelines(frame_num + '\t')
    zone[3].writelines(frame_num + '\t')

    i = 0
    while i < len(xmin):
        x1 = xmin[i].firstChild.data
        x2 = xmax[i].firstChild.data
        y1 = int(ymin[i].firstChild.data)
        y2 = int(ymax[i].firstChild.data)
        # print x1,x2
        allZone.writelines(x1 + '\t' + x2 + '\t')
        i += 1
        
        print(str(y1) + '  ' + str(y2))
        # find left bound
        l = 0
        while rg[l] < y1:
            l += 1
        if l != 0: l -= 0
        # find right bound
        r = len(rg) - 1
        ll = len(rg) - 1
        while rg[r] > y2:
             r -= 1
        if y2 >= rg[ll]: 
            r -= 1
        
        print(str(l) + ' ' + str(r))
        for k in range(l, r + 1):
            zone[k].writelines(x1 + '\t' + x2 + '\t')
    allZone.writelines('\n')
    for i in range(0, 4):
        zone[i].writelines('\n')
    # print xml_name, frame_num


