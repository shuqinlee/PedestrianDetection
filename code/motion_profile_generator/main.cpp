////
////  main.cpp
////  test2
////
////  Created by Shuqin Lee on 07/06/2017.
////  Copyright © 2017 Shuqin Lee. All rights reserved.
////
//
//#include <string>
////#include <cv.h>
//#include <queue>
//#include <iostream>
//#include <fstream>
//#include <algorithm>
////#include <highgui/highgui.hpp>
//#include <opencv2/opencv.hpp>
//#include <opencv2/imgproc/imgproc.hpp>
////#include <features2d/features2d.hpp>
////#include <opencv2/nonfree/nonfree.hpp>
////#include <opencv2/nonfree/features2d.hpp>
//#include <opencv2/core/core.hpp>
//#include <opencv2/highgui/highgui.hpp>
//
//using namespace std;
//using namespace cv;
//
////Provide arguments for the program
//void verticalCondensing(VideoCapture video, Mat& vert_condensed, bool
//                        isInterlaced,int y1, int y2)
//{
//    video.set(CV_CAP_PROP_POS_FRAMES,0);
//    int frame_counter=0;
//    int frameCount = video.get(CV_CAP_PROP_FRAME_COUNT);
//    Mat frame;
//    
//    
//    int width = video.get(CV_CAP_PROP_FRAME_WIDTH);
//    int height = video.get(CV_CAP_PROP_FRAME_HEIGHT);
//    cout<<width<<endl;
//    cout<<height<<endl;
//    //For Non-Interlaced Videos
//    if(!isInterlaced)
//    {
//        video>>frame;
//        long int sum_b;
//        long int sum_g;
//        long int sum_r;
//        int b,g,r;
//        while(!frame.empty())
//        {
//            Vec3b value;
//            for(int col=0;col<width;col++)
//            {
//                sum_b=0;
//                sum_g=0;
//                sum_r=0;
//                for( int row=y1;row<y2;row++)
//                {
//                    sum_b+=frame.at<Vec3b>(row,col)[0];
//                    sum_g+=frame.at<Vec3b>(row,col)[1];
//                    sum_r+=frame.at<Vec3b>(row,col)[2];
//                }
//                
//                b=sum_b/(y2-y1);
//                g=sum_g/(y2-y1);
//                r=sum_r/(y2-y1);
//                value=Vec3b(b,g,r);
//                vert_condensed.at<Vec3b>(frame_counter,col)=value;
//            }
//            video>>frame;
//            frame_counter++;
//        }
//    }
//    //For Interlaced Videos
//    else
//    {
//        
//        
//        
//        long int e_sum_b;
//        long int e_sum_g;
//        long int e_sum_r;
//        long int o_sum_b;
//        long int o_sum_g;
//        long int o_sum_r;
//        Vec3b value;
//        long b,g,r;
//        video>>frame;
//        int i = 0;
//        while(!frame.empty()){
//            
//            for(int col=0;col<width;col++)
//            {
//                e_sum_b=0;
//                e_sum_g=0;
//                e_sum_r=0;
//                o_sum_b=0;
//                o_sum_g=0;
//                o_sum_r=0;
//                for( int row=y1;row<y2;row+=2)
//                {
//                    e_sum_b+=frame.at<Vec3b>(row,col)[0];
//                    e_sum_g+=frame.at<Vec3b>(row,col)[1];
//                    e_sum_r+=frame.at<Vec3b>(row,col)[2];
////                    cout<<e_sum_b*2<<endl;
//                }
////                cout<<e_sum_b*2<<endl;
////                cout<<(y2-y1)<<endl;
//                for( int row=y1+1;row<y2+1;row+=2)
//                {
//                    o_sum_b+=frame.at<Vec3b>(row,col)[0];
//                    o_sum_g+=frame.at<Vec3b>(row,col)[1];
//                    o_sum_r+=frame.at<Vec3b>(row,col)[2];
//                }
//                
//                b=(e_sum_b*2)/(y2-y1);
//                g=(e_sum_g*2)/(y2-y1);
//                r=(e_sum_r*2)/(y2-y1);
//                value=Vec3b(b,g,r);
//                vert_condensed.at<Vec3b>(frame_counter*2,col)=value;
////                cout << "======\n1. r: "<<r<<" g: "<<g<<" b: "<<b<<endl;
//                b=(o_sum_b*2)/(y2-y1);
//                g=(o_sum_g*2)/(y2-y1);
//                r=(o_sum_r*2)/(y2-y1);
//                value=Vec3b(b,g,r);
//                vert_condensed.at<Vec3b>((frame_counter*2)+1,col)=value;
//                
////                cout << "======\n2. r: "<<r<<" g: "<<g<<" b: "<<b<<endl;
//            }
//            video>>frame;
////            cout << ++i <<endl;
//            
//            frame_counter++;
//        }
//    }
//    
//    return;
//}
//
//void singleCut(VideoCapture video, Mat& cut, bool isInterlaced)
//{
//    return;
//}
//
//int main (int argc, char* argv[])
//{
////    string path=argv[1];
////    bool isInterlaced;
////    string interlaced;
////    interlaced = argv[5];
////    string x_coor = argv[3];
////    string y_coor = argv[4];
////    string img=argv[2];
//    
//    
//    string path="/Users/shuqinlee/Documents/PROJECT/Transportation/Video/FILE0039.MOV";
//    string interlaced = "y";
//    bool isInterlaced;
//    string x_coor = "210";
//    string y_coor = "300";
//    string img = "/Users/shuqinlee/Documents/PROJECT/Transportation/output/";
//    string fileName;
//    cout << "File name(no need for extention): ";
//    cin >> fileName;
//    img += fileName + ".png";
//    VideoCapture video =VideoCapture(path);
//    if( !video.isOpened())
//    {
//        cout<< "error opening video file!" <<endl;
//        return 0;
//    }
//    
//    Mat vert_condensed;
//    int height = video.get(CV_CAP_PROP_FRAME_HEIGHT);
//    int width = video.get(CV_CAP_PROP_FRAME_WIDTH);
//    int frameCount = video.get(CV_CAP_PROP_FRAME_COUNT);
//    cout << (interlaced == "y" ?"Use interlaced mode":"Use none-interlaced mode")<< endl;
//    if(interlaced=="y")
//    {
//        isInterlaced=true;
//        vert_condensed=Mat(2*frameCount,width,CV_8UC3);
//    }
//    else{
//        isInterlaced=false;
//        vert_condensed=Mat(frameCount,width,CV_8UC3);
//    }
//    if( path=="")
//    {
//        path="mecca2.avi";
//    }
//    
//    int y1 =atoi(x_coor.c_str());
//    int y2 =atoi(y_coor.c_str());
//    y1= (y1%2==0)? y1:(y1-1);
//    y2= (y2%2==0)? y2:(y2-1);
//    verticalCondensing(video,vert_condensed,isInterlaced,y1,y2);
//    Mat vert_cut=Mat(height,frameCount,CV_8UC3);
//    
//    imwrite(img,vert_condensed);
//    return 0;
//}
//
//int nearestEvenInt(int value){
//    return (value % 2 == 0) ? value : (value + 1);
//}
