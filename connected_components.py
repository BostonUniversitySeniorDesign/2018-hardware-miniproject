#!/usr/bin/env python
"""
setup of connected components with OpenCV (also possible with scikit-image)
"""
import cv2
import h5py
from pathlib import Path
from datetime import datetime


def main():

    B = setupblob(params)
    
    Ncount = []
    for i, img in enumerate(imgs):
        motion = process(img)
        keypoints = B.detect(motion)
        
        Ncount.append(len(keypoints))
        
        if i and not i % 10:
            countfn = PATH / ('count' + datetime.now().isoformat()[:-7] + '.h5')
            with h5py.File(countfn, 'w') as f:
                f['count'] = Ncount
                f['index'] = i
            Ncount = []


def setupblob(param: dict):
    """
    setup connected components "blob detection"
    """
    B = cv2.SimpleBlobDetector_Params()
    B.filterByArea = True
    B.filterByColor = False
    B.filterByCircularity = False
    B.filterByInertia = False
    B.filterByConvexity = False

    B.minDistBetweenBlobs = param['mindist']
    B.minArea = param['minarea']
    B.maxArea = param['maxarea']


    return cv2.SimpleBlobDetector_create(B)
    
