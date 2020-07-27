#!/home/ee904/ee904/bin/python

import rospy
import rosbag
import os
import sys
import imp
import math
import io
import numpy as np
import matplotlib.cm as cm
import PIL
import random
from pandaset_viewer.msg import LidarPoint
from pandaset_viewer.msg import PointSet
from std_msgs.msg import Header
from std_msgs.msg import String
from sensor_msgs.msg import Image
from sensor_msgs.msg import PointCloud
from geometry_msgs.msg import Point32
from visualization_msgs.msg import MarkerArray
from visualization_msgs.msg import Marker
from matplotlib import pyplot as plt
from transformations import quaternion_from_euler, quaternion_from_matrix

m = imp.find_module('pandaset', ['/Pandaset/pandaset-devkit/python'])
imp.load_module('pandaset', m[0], m[1], m[2])
from pandaset.dataset import DataSet
from pandaset import geometry

Car = (0, 0, 255)
Motorized_Scooter = (255, 0, 255)
Pickup_Truck = (255, 255, 0)
Pedestrian = (0, 255, 0)
Bicycle = (255, 0, 0)
Signs = (0, 255, 255)
my_dpi = 96 * 3

def distances_projection(image, lidar_obj_data, camera_poses, camera_intrinsics):
    points3d_lidar_xyz = lidar_obj_data.to_numpy()[:, :3]
    projected_points2d, camera_points_3d, inner_indices = geometry.projection(
                                                          lidar_points = points3d_lidar_xyz, 
                                                          camera_data = image,
                                                          camera_pose = camera_poses,
                                                          camera_intrinsics = camera_intrinsics,
                                                          filter_outliers = True)
    distances = np.sqrt(np.sum(np.square(camera_points_3d), axis = -1))
    colors = cm.jet(distances / np.max(distances))
    p = []
    c = []
    for i, pt in enumerate(projected_points2d):
        if (int(pt[0]) < 1919) and (int(pt[1] < 1079)):
            p.append(pt.tolist())
            c.append(colors[i].tolist())
    points = np.array(p)
    c_aray = np.array(c)
    #plt.figure(figsize = (2478/my_dpi, 1579/my_dpi), dpi = my_dpi)
    plt.figure(figsize = (2478/288, 1579/288), dpi = 300)
    plt.imshow(image)
    plt.xticks([])
    plt.yticks([])
    plt.axis('off')
    plt.gca().scatter(points[:, 0], points[:, 1], color = c_aray, s = 1)

    buf = io.BytesIO()
    #plt.savefig('t.png', bbox_inches = 'tight', pad_inches = 0, format = 'png', dpi = 300)
    plt.savefig(buf, bbox_inches = 'tight', pad_inches = 0, format = 'png', dpi = my_dpi)
    buf.seek(0)
    im = PIL.Image.open(buf)
    projection_img = im.resize((1920, 1080))
    projection_img = projection_img.convert("RGB")
    buf.close()
    plt.close()
    
    return projection_img
    
    return 0

def semantic_segmentation_projection(image, lidar_obj_data, camera_poses, camera_intrinsics, semseg_load):
    points3d_lidar_xyz = lidar_obj_data.to_numpy()[:, :3]
    projected_points2d, camera_points_3d, inner_indices = geometry.projection(
                                                          lidar_points = points3d_lidar_xyz, 
                                                          camera_data = image,
                                                          camera_pose = camera_poses,
                                                          camera_intrinsics = camera_intrinsics,
                                                          filter_outliers = True)
    semseg = semseg_load.to_numpy()
    semseg_on_image = semseg[inner_indices].flatten()
    max_seg_id = np.max(semseg_on_image)
    
    color_maps = [(random.random(), random.random(), random.random()) for _ in range(max_seg_id + 1)]
    colors = np.array([color_maps[seg_id] for seg_id in semseg_on_image])
    p = []
    c = []
    
    for i, pt in enumerate(projected_points2d):
        if (int(pt[0]) < 1919) and (int(pt[1] < 1079)):
            p.append(pt.tolist())
            c.append(colors[i].tolist())
    
    points = np.array(p)
    c_aray = np.array(c)

    plt.figure(figsize = (2478/my_dpi, 1579/my_dpi), dpi = my_dpi)
    plt.imshow(image)
    plt.axis('off')
    plt.xticks([])
    plt.yticks([])
    
    plt.gca().scatter(points[:, 0], points[:, 1], color = c_aray, s = 1)
    
    buf = io.BytesIO()
    plt.savefig(buf, bbox_inches = 'tight', pad_inches = 0, format = 'png', dpi = 300)
    buf.seek(0)
    im = PIL.Image.open(buf)
    projection_img = im.resize((1920, 1080))
    projection_img = projection_img.convert("RGB")
    buf.close()
    plt.close()
    #print(projection_img) 
    return projection_img
    #return 0

def camera_setting(index, image, camera, lidar_obj, f, camera_name, bag, rate):
    camera_image = Image()
    camera_image.header.frame_id = "/base_link"
    camera_image.header.stamp.secs = int(camera.timestamps[index])
    camera_image.header.stamp.nsecs = int((camera.timestamps[index] - camera_image.header.stamp.secs) * (10**9))
    camera_image.height = image.height
    camera_image.width = image.width
    camera_image.encoding = "rgb8"

    #original image
    ##########
    camera_image.data = np.array(image).tostring()
    ##########

    #distances projection image
    ###########
    #camera_image.data = np.array(distances_projection(image, lidar_obj.data[index], camera.poses[index], camera.intrinsics)).tostring()
    ##########

    #semantic segmentation projection image
    ##########
    #camera_image.data = np.array(semantic_segmentation_projection(image, lidar_obj.data[index], camera.poses[index], camera.intrinsics, f.semseg[index])).tostring()
    #tmp_img = semantic_segmentation_projection(image, lidar_obj.data[index], camera.poses[index], camera.intrinsics, f.semseg[index])
    #camera_image.data = np.array(tmp_img).tostring()
    ##########

    topic_name = "/camera_image/" + camera_name
    bag.write(topic_name, camera_image, camera_image.header.stamp)
    rate.sleep()


def recorder():
    rospy.init_node('recorder', anonymous = True)
    rate = rospy.Rate(10)
    header = Header()
    
    #please fill the data_path and bag_path
    data_path = "/Pandaset/data"
    bag_path = "/Pandaset/bagfiles/"
    dataset = DataSet(data_path)
    
    for files in dataset.sequences(with_semseg = True):
        f = dataset[files]
        f.load()
        print("===file", files, "open===")
        bag_name = "data_" + files + ".bag"
        full_bag_path = bag_path + bag_name
        bag = rosbag.Bag(full_bag_path, 'w')
         
        ###lidar visualization
        lidar_obj = f.lidar
         
        for i, pc0 in enumerate(f.lidar):
            semseg = np.array(f.semseg[i])
            lidar = PointCloud()
            lidar_set = PointSet()
            lidar_set.header = header
            lidar_set.header.frame_id = "/base_link"
            lidar_set.header.stamp.secs = int(lidar_obj.timestamps[i])
            lidar_set.header.stamp.nsecs = int((lidar_obj.timestamps[i] - lidar.header.stamp.secs) * (10**9))

            lidar.header = header
            lidar.header.frame_id = "/base_link"
            lidar.header.stamp.secs = int(lidar_obj.timestamps[i])
            lidar.header.stamp.nsecs = int((lidar_obj.timestamps[i] - lidar.header.stamp.secs) * (10**9))
            for index, lidar_points in enumerate(pc0.values):
                lidar.points.append(Point32(lidar_points[0], lidar_points[1], lidar_points[2]))
                lidar_set.point.append(LidarPoint(lidar_points[0]
                                                 ,lidar_points[1]
                                                 ,lidar_points[2]
                                                 ,lidar_points[3]
                                                 ,semseg[index][0]))
            bag.write("lidar_data", lidar, lidar.header.stamp)
            bag.write("lidar_info", lidar_set, lidar_set.header.stamp)
            rate.sleep()
        rospy.loginfo("===lidar_complete===")
        
        for i, cuboid in enumerate(f.cuboids):
            lidar_label = MarkerArray()
            header = Header()
            header.frame_id = "base_link"
            header.stamp.secs = int(f.timestamps[i])
            header.stamp.nsecs = int((f.timestamps[i] - header.stamp.secs) * (10**9))
            POSITION_X = cuboid["position.x"]
            POSITION_Y = cuboid["position.y"]
            POSITION_Z = cuboid["position.z"]
            DIMENSIONS_X = cuboid["dimensions.x"]
            DIMENSIONS_Y = cuboid["dimensions.y"]
            DIMENSIONS_Z = cuboid["dimensions.z"]
            YAW = cuboid.yaw
            LABEL = cuboid.label
            for idx, UUID in enumerate(cuboid.uuid):
                label_marker = Marker()
                label_marker.header = header
                label_marker.type = Marker.CUBE
                label_marker.action = Marker.ADD
                ID = int(UUID[len(UUID)-8:len(UUID)].encode("utf-8").hex(), 16)
                label_marker.id = np.int32(ID)
                label_marker.lifetime = rospy.Duration(0.1)
                label_marker.pose.position.x = POSITION_X[idx]
                label_marker.pose.position.y = POSITION_Y[idx]
                label_marker.pose.position.z = POSITION_Z[idx]
                label_marker.scale.x = DIMENSIONS_X[idx]
                label_marker.scale.y = DIMENSIONS_Y[idx]
                label_marker.scale.z = DIMENSIONS_Z[idx]
                quaternion = quaternion_from_euler(0, 0, YAW[idx])
                label_marker.pose.orientation.x = quaternion[1]
                label_marker.pose.orientation.y = quaternion[2]
                label_marker.pose.orientation.z = quaternion[3]
                label_marker.pose.orientation.w = quaternion[0]
                label_marker.color.a = 0.5

                if LABEL[idx] == "Car":
                    label_marker.color.b = Car[0]
                    label_marker.color.g = Car[1]
                    label_marker.color.r = Car[2]
                    label_marker.ns = "Car"

                elif LABEL[idx] == "Motorized Scooter":
                    label_marker.color.b = Motorized_Scooter[0]
                    label_marker.color.g = Motorized_Scooter[1]
                    label_marker.color.r = Motorized_Scooter[2]
                    label_marker.ns = "Motorized Scooter"

                elif LABEL[idx] == "Pickup Truck":
                    label_marker.color.b = Pickup_Truck[0]
                    label_marker.color.g = Pickup_Truck[1]
                    label_marker.color.r = Pickup_Truck[2]
                    label_marker.ns = "Pickup Truck"

                elif LABEL[idx] == "Pedestrian":
                    label_marker.color.b = Pedestrian[0]
                    label_marker.color.g = Pedestrian[1]
                    label_marker.color.r = Pedestrian[2]
                    label_marker.ns = "Pedestrian"

                elif LABEL[idx] == "Signs":
                    label_marker.color.b = Signs[0]
                    label_marker.color.g = Signs[1]
                    label_marker.color.r = Signs[2]
                    label_marker.ns = "Signs"

                elif LABEL[idx] == "Bicycle":
                    label_marker.color.b = Bicycle[0]
                    label_marker.color.g = Bicycle[1]
                    label_marker.color.r = Bicycle[2]
                    label_marker.ns = "Bicycle"
                lidar_label.markers.append(label_marker)
            bag.write("/lidar_label", lidar_label, header.stamp)
            rate.sleep()
        rospy.loginfo("===cuboids_complete===")
        
        ###camera visualization
        back_camera = f.camera['back_camera']
        front_camera = f.camera['front_camera']
        front_left_camera = f.camera['front_left_camera']
        front_right_camera = f.camera['front_right_camera']
        left_camera = f.camera['left_camera']
        right_camera = f.camera['right_camera']
        
        for index, back_img in enumerate(back_camera):
            camera_setting(index, back_img, back_camera, lidar_obj, f, "back_camera", bag, rate)
        rospy.loginfo("===back_camera_complete===")
        
        for index, front_img in enumerate(front_camera):
            camera_setting(index, front_img, front_camera, lidar_obj, f, "front_camera", bag, rate)
        rospy.loginfo("===front_camera_complete===")
        
        for index, front_left_img in enumerate(front_left_camera):
            camera_setting(index, front_left_img, front_left_camera, lidar_obj, f, "front_left_camera", bag, rate)
        rospy.loginfo("===front_left_camera_complete===")
  
        for index, front_right_img in enumerate(front_right_camera):
            camera_setting(index, front_right_img, front_right_camera, lidar_obj, f, "front_right_camera", bag, rate)
        rospy.loginfo("===front_right_camera_complete===")
  
        for index, left_img in enumerate(left_camera):
            camera_setting(index, left_img, left_camera, lidar_obj, f, "left_camera", bag, rate)
        rospy.loginfo("===left_camera_complete===")
        
        for index, right_img in enumerate(right_camera):
            camera_setting(index, right_img, right_camera, lidar_obj, f, "right_camera", bag, rate)
        rospy.loginfo("===right_camera_complete===")
        
        bag.close()
        rospy.loginfo("===all complete===")
        print()

if __name__ == '__main__':
    try:
        recorder()
    except rospy.ROSInterruptException:
        pass
     
