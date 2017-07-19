//
//  MotionProfileGenerator.cpp
//  test2
//
//  Created by Shuqin Lee on 09/06/2017.
//  Copyright © 2017 Shuqin Lee. All rights reserved.
//

#include "MotionProfileGenerator.hpp"

MPGenerator::MPGenerator(string videoPth, string saveFolder, bool isInterlaced): video(videoPth) {
    _saveFolder = saveFolder;
    _isInterlaced = isInterlaced;
}
void MPGenerator::generate(int y1, int y2, string fileName) {
    _savePth = _saveFolder + fileName + ".png";
    
    Mat vert_condensed;
    int height = video.get(CV_CAP_PROP_FRAME_HEIGHT);
    int width = video.get(CV_CAP_PROP_FRAME_WIDTH);
    int frameCount = video.get(CV_CAP_PROP_FRAME_COUNT);
    
    
    if(_isInterlaced)
    {
        vert_condensed=Mat(2*frameCount, width, CV_8UC3);
    }
    else{
        vert_condensed=Mat(frameCount, width, CV_8UC3);
    }
    
    video.set(CV_CAP_PROP_POS_FRAMES,0);
    int frame_counter=0;
    
    Mat frame;
    cout<<width<<endl;
    cout<<height<<endl;
    //For Non-Interlaced Videos
    if(!_isInterlaced)
    {
        video>>frame;
        long int sum_b;
        long int sum_g;
        long int sum_r;
        long int b,g,r;
        while(!frame.empty())
        {
            Vec3b value;
            for(int col=0;col<width;col++)
            {
                sum_b=0;
                sum_g=0;
                sum_r=0;
                for( int row=y1;row<y2;row++)
                {
                    sum_b+=frame.at<Vec3b>(row,col)[0];
                    sum_g+=frame.at<Vec3b>(row,col)[1];
                    sum_r+=frame.at<Vec3b>(row,col)[2];
                }
                
                b=sum_b/(y2-y1);
                g=sum_g/(y2-y1);
                r=sum_r/(y2-y1);
                value=Vec3b(b,g,r);
                vert_condensed.at<Vec3b>(frame_counter,col)=value;
            }
            video>>frame;
            frame_counter++;
        }
    }
    //For Interlaced Videos
    else
    {
        long int e_sum_b;
        long int e_sum_g;
        long int e_sum_r;
        long int o_sum_b;
        long int o_sum_g;
        long int o_sum_r;
        Vec3b value;
        long b,g,r;
        video>>frame;
        while(!frame.empty()){
            
            for(int col=0;col<width;col++)
            {
                e_sum_b=0;
                e_sum_g=0;
                e_sum_r=0;
                o_sum_b=0;
                o_sum_g=0;
                o_sum_r=0;
                for( int row=y1;row<y2;row+=2)
                {
                    e_sum_b+=frame.at<Vec3b>(row,col)[0];
                    e_sum_g+=frame.at<Vec3b>(row,col)[1];
                    e_sum_r+=frame.at<Vec3b>(row,col)[2];
                }
                
                for( int row=y1+1;row<y2+1;row+=2)
                {
                    o_sum_b+=frame.at<Vec3b>(row,col)[0];
                    o_sum_g+=frame.at<Vec3b>(row,col)[1];
                    o_sum_r+=frame.at<Vec3b>(row,col)[2];
                }
                
                b = (e_sum_b*2)/(y2-y1);
                g = (e_sum_g*2)/(y2-y1);
                r = (e_sum_r*2)/(y2-y1);
                value = Vec3b(b,g,r);
                vert_condensed.at<Vec3b>(frame_counter*2,col)=value;

                b=(o_sum_b*2)/(y2-y1);
                g=(o_sum_g*2)/(y2-y1);
                r=(o_sum_r*2)/(y2-y1);
                value=Vec3b(b,g,r);
                vert_condensed.at<Vec3b>((frame_counter*2)+1,col)=value;
                
            }
            video>>frame;
            
            frame_counter++;
        }
    }
    imwrite(_savePth, vert_condensed);
}
