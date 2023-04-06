#include <iostream>
#include <opencv2/core/core.hpp>
#include <opencv2/imgproc/imgproc.hpp>
#include <opencv2/highgui/highgui.hpp>

using namespace std;

int main()
{
    cv::VideoCapture cap(0);
    cv::Mat img;

    while(1)
    {
        cout << img.size() << "\n";
        cap >> img;
        cv::resize(img, img, cv::Size(320,240));
        cv::imshow("img", img);
        cv::waitKey(30);
    }

    return 0;
}