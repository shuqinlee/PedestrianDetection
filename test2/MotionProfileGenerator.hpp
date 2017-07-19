//
//  MotionProfileGenerator.hpp
//  test2
//
//  Created by Shuqin Lee on 09/06/2017.
//  Copyright © 2017 Shuqin Lee. All rights reserved.
//

#ifndef MotionProfileGenerator_hpp
#define MotionProfileGenerator_hpp

#include <string>
#include <queue>
#include <iostream>
#include <fstream>
#include <algorithm>
#include <opencv2/opencv.hpp>
#include <opencv2/imgproc/imgproc.hpp>
#include <opencv2/core/core.hpp>
#include <opencv2/highgui/highgui.hpp>

using namespace std;
using namespace cv;


class MPGenerator {
private:
    VideoCapture video;
    bool _isInterlaced;
    string _saveFolder;
    string _savePth;
    
    // MARK: methods
    
    void verticalCondensing(Mat& vert_condensed, int y1, int y2);
    
    
public:
    /// @param videoPth the path for video
    MPGenerator(string videoPth, string saveFolder, bool isInterlaced);
    void generate(int y1, int y2, string fileName);
    
};
#endif /* MotionProfileGenerator_hpp */
