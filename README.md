Please see the 
[Wiki](https://github.com/BostonUniversitySeniorDesign/hardware-project-2018/wiki) 
for the EC463 2018 hardware Miniproject.

![FFT-based lane automobile detection](https://raw.githubusercontent.com/BostonUniversitySeniorDesign/hardware-project-2018/master/out.gif)

There is no need for machine learning / computer vision methods to do this task, thanks to the h.264 motion vectors output by the GPU from the Picamera.
Since we know cars usually travel within their lane, we can exploit this fact to greatly simplify the processing to be nearly 100x faster using plain Python or Matlab/Octave code than is achievable with OpenCV.



## Code
We include a few examples in Python, but students should use whatever programming language they choose.

* `motdet.py` this gets the h.264 motion vectors from the camera as computed by the GPU, and stores them to `motion.h5`
* `docount.m` is a Matlab script (also runs in GNU Octave on the Pi directly, or your laptop) that counts objects without using OpenCV.  The same thing could be done equally well in Python, but I wanted to make an example for those more familiar with Matlab.


