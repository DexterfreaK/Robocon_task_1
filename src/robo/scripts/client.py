#!/usr/bin/env python

from numpy import append
from robo.srv import lidar,lidarResponse
import sys
import rospy
import PIL
from PIL import Image, ImageDraw
import pathlib
import math
import random

def plot_reading_on_map(centerX, centerY, lidar_reading, map):

    for i, reading in enumerate(lidar_reading):

        try:
            i0 = reading[0]
            r0 = reading[1]

            i1 = lidar_reading[i+1][0]
            r1 = lidar_reading[i+1][1]

            x0 = int(r0*math.cos(i0*math.pi/180)+centerX)
            y0 = int((r0*math.sin(i0*math.pi/180)+centerY))

            x1 = int(r1*math.cos(i1*math.pi/180)+centerX)
            y1 = int((r1*math.sin(i1*math.pi/180)+centerY))

            draw = ImageDraw.Draw(map)
            draw.polygon([(centerX, centerY), (x0, y0),
                         (x1, y1)], fill=255, outline=255)
            map.save("map.jpg")

        except:
            continue

def lidar_client(x, y):

    rospy.wait_for_service('scan')

    try:

        lidarscan = rospy.ServiceProxy('scan', lidar)
        scannedoutput = lidarscan(x, y)

        lidarscan = []

        for i, s in enumerate(scannedoutput.lidar_array):

            if(i%2):

                lidarscan.append((scannedoutput.lidar_array[i-1], s))
        
        return lidarscan
    
    except rospy.ServiceException as e:

        print("Service failed: %s"%e)


map = PIL.Image.new(mode="1", size=(400,400))

def usage():
    return "%s [x y z]"%sys.argv[0]

def planner(X,Y,number_of_scans):
    
    x=X
    y=Y

    for i in range(0, number_of_scans):

        try:
         lid_scan = lidar_client(x,y)
         plot_reading_on_map(x,y,lid_scan,map)
        except:
         continue

        x = random.choice(lid_scan)[0]-2
        y = random.choice(lid_scan)[1]-2



if __name__ == "__main__":
    if len(sys.argv) == 4:
        x = int(sys.argv[1])
        y = int(sys.argv[2])
        z=int(sys.argv[3])
    else:
        print(usage())

    planner(x,y,z)
    map.save("map.jpg")
    
    
    
    
