////
////  test.cpp
////  test2
////
////  Created by Shuqin Lee on 08/06/2017.
////  Copyright © 2017 Shuqin Lee. All rights reserved.
////
//
//#include <string>
//#include <queue>
//#include <iostream>
//#include <fstream>
//#include <algorithm>
//#include <opencv2/opencv.hpp>
//#include <opencv2/imgproc/imgproc.hpp>
//#include <opencv2/core/core.hpp>
//#include <opencv2/highgui/highgui.hpp>
//
//using namespace std;
//using namespace cv;
//
//int main(int argc, char* argv[]) {
//    
////    VideoCapture video = VideoCapture("/Users/shuqinlee/Documents/PROJECT/Transportation/Video/FILE0039mp4.mp4");
////    cout << video.isOpened() << endl;
////    imshow(<#const cv::String &winname#>, <#InputArray mat#>)
//    
//    
//        
//        cv::VideoCapture capVideo;
//        
//        cv::Mat imgFrame;
//        
//        capVideo.open("/Users/shuqinlee/Documents/PROJECT/Transportation/Video/FILE0039.MOV");
//        
//        if (!capVideo.isOpened()) {                                                 // if unable to open video file
//            std::cout << "\nerror reading video file" << std::endl << std::endl;      // show error message
////            _getch();                    // it may be necessary to change or remove this line if not using Windows
//            return(0);                                                              // and exit program
//        }
//        
//        if (capVideo.get(CV_CAP_PROP_FRAME_COUNT) < 1) {
//            std::cout << "\nerror: video file must have at least one frame";
////            _getch();
//            return(0);
//        }
//        
//        capVideo.read(imgFrame);
//        
//        char chCheckForEscKey = 0;
//        
//        while (capVideo.isOpened() && chCheckForEscKey != 27) {
//            
//            cv::imshow("imgFrame", imgFrame);
//            
//            // now we prepare for the next iteration
//            
//            if ((capVideo.get(CV_CAP_PROP_POS_FRAMES) + 1) < capVideo.get(CV_CAP_PROP_FRAME_COUNT)) {       // if there is at least one more frame
//                capVideo.read(imgFrame);                            // read it
//            }
//            else {                                                  // else
//                std::cout << "end of video\n";                      // show end of video message
//                break;                                              // and jump out of while loop
//            }
//            
//            chCheckForEscKey = cv::waitKey(1);      // get key press in case user pressed esc
//            
//        }
//        
//        if (chCheckForEscKey != 27) {               // if the user did not press esc (i.e. we reached the end of the video)
//            cv::waitKey(0);                         // hold the windows open to allow the "end of video" message to show
//        }
//        // note that if the user did press esc, we don't need to hold the windows open, we can simply let the program end which will close the windows
//        
//        
//
//    
//    
////    VideoCapture cap(0); // open the default camera
////    if(!cap.isOpened())  // check if we succeeded
////        return -1;
////    
////    Mat edges;
////    namedWindow("edges",1);
//////    for(;;)
////    {
//////        Mat frame;
//////        cap >> frame; // get a new frame from camera
//////        cvtColor(frame, edges, CV_BGR2GRAY);
//////        GaussianBlur(edges, edges, Size(7,7), 1.5, 1.5);
//////        Canny(edges, edges, 0, 30, 3);
//////        imshow("edges", edges);
//////        if(waitKey(30) >= 0) break;
////    }
////    // the camera will be deinitialized automatically in VideoCapture destructor
////    
//    return 0;
//    
//}
