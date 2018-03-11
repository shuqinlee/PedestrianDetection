//
//  testClass.cpp
//  test2
//
//  Created by Shuqin Lee on 09/06/2017.
//  Copyright © 2017 Shuqin Lee. All rights reserved.
//

#include "MotionProfileGenerator.hpp"

int main() {
    string inPrefix = "/Users/shuqinlee/Documents/PROJECT/Transportation/Video/video_data/第三批/DCIM/100MEDIA/FILE";
    string sufix = ".MOV";
    char file[50];
    string dir;
    string filePth; // video path in full
    for (int i = 1; i < 104; i++ ) {
        sprintf(file, "%04d", i);
        filePth = inPrefix + file + sufix;
        cout << filePth << endl;
        dir = "/Users/shuqinlee/Documents/PROJECT/" + to_string(i) + "/";
        
        cout << dir << endl;
        MPGenerator mpGen = MPGenerator(filePth, dir, true);
        mpGen.generate(420, 510, "o1");
        mpGen.generate(360, 420, "o2");
        mpGen.generate(320, 360, "o3");
//        break;
    }

    
    return 0;
}
