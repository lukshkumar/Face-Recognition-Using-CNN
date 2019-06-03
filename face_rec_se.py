

import face_recognition
import cv2
import numpy as np
import requests

from faced import FaceDetector
from faced.utils import annotate_image
from urllib.request import urlopen

# This is a demo of running face recognition on live video from your webcam. It's a little more complicated than the
# other example, but it includes some basic performance tweaks to make things run a lot faster:
#   1. Process each video frame at 1/4 resolution (though still display it at full resolution)
#   2. Only detect faces in every other frame of video.

# PLEASE NOTE: This example requires OpenCV (the `cv2` library) to be installed only to read from your webcam.
# OpenCV is *not* required to use the face_recognition library. It's only required if you want to run this
# specific demo. If you have trouble installing it, try any of the other demos that don't require it instead.

# Get a reference to webcam #0 (the default one)
video_capture = cv2.VideoCapture(0)

face_detector = FaceDetector()

# Load a sample picture and learn how to recognize it.
#obama_image = face_recognition.load_image_file("Ali.jpg")
#obama_face_encoding = face_recognition.face_encodings(obama_image)[0]

# Load a second sample picture and learn how to recognize it.
#biden_image = face_recognition.load_image_file("luksh6.png")
#biden_face_encoding = face_recognition.face_encodings(biden_image)[0]





# Create arrays of known face encodings and their names
#known_face_encodings = [
    #face_recognition.face_encodings(face_recognition.load_image_file("Ali.jpg"))[0],
   # face_recognition.face_encodings(face_recognition.load_image_file("luksh6.png"))[0],

    
#]

URL = "http://localhost/se/get_training_se.php"
r = requests.get(url = URL)

URL2 = "http://localhost/se/insert_detection_se.php"


data = r.json() 

known_face_encodings=[]
known_face_names = []

n=data[0][0]+1

for i in range(1,n):
    url=data[i][1]
    print(url)
    resp = urlopen(url)
    image = np.asarray(bytearray(resp.read()), dtype="uint8")
    image = cv2.imdecode(image, cv2.IMREAD_COLOR)
    known_face_encodings.append(face_recognition.face_encodings(image)[0])
    known_face_names.append(data[i][0])

#known_face_names = [
 #   "Ali",
 #   "Luksh"

#]

# Initialize some variables
face_locations = []
face_encodings = []
face_names = []
process_this_frame = True

name2='';
k=0;

while True:
    # Grab a single frame of video
    


    ret, frame = video_capture.read()

    # Resize frame of video to 1/4 size for faster face recognition processing
    small_frame = cv2.resize(frame, (0, 0), fx=0.25, fy=0.25)

    # Convert the image from BGR color (which OpenCV uses) to RGB color (which face_recognition uses)
    rgb_small_frame = small_frame[:, :, ::-1]

    rgb_large_frame = frame[:, :, ::-1]

    
    	

    # Only process every other frame of video to save time
    if process_this_frame:
        # Find all the faces and face encodings in the current frame of video
        face_locations = face_recognition.face_locations(rgb_small_frame, number_of_times_to_upsample=2)
        face_encodings = face_recognition.face_encodings(rgb_small_frame, face_locations)

        face_names = []
        test=0;
        for face_encoding in face_encodings:
            # See if the face is a match for the known face(s)

           # if i==1:
            #	font = cv2.FONT_HERSHEY_DUPLEX    	
            #	cv2.putText(frame, "Hey",(4,4), font, 1.0, (255, 255, 255), 1)

            i=1;		   

            matches = face_recognition.compare_faces(known_face_encodings, face_encoding, tolerance=0.5)
            name = ""

            # # If a match was found in known_face_encodings, just use the first one.
            # if True in matches:
            #     first_match_index = matches.index(True)
            #     name = known_face_names[first_match_index]

            # Or instead, use the known face with the smallest distance to the new face
            face_distances = face_recognition.face_distance(known_face_encodings, face_encoding)
            best_match_index = np.argmin(face_distances)
            if matches[best_match_index]:
                name = known_face_names[best_match_index]

                if name2!=name:
                    b=requests.get(url=URL2, params={'name':name, 'desc': 'Face Recognized'})
                    test=1;
                    name2=name;    

            face_names.append(name)
        
           

    process_this_frame = not process_this_frame

    
    bboxes = face_detector.predict(rgb_large_frame)
    y = 0;
    for x in bboxes:
        #print(type(bboxes[0]), "before");
        bboxe = list(bboxes[y]);
        #print(type(bboxe),"after")
        bboxe[2] = bboxe[2] * 1.3;
        bboxe[3] = bboxe[3]  * 1.4;

        bboxes[y] = tuple(bboxe);
        y +=1;
           
    frame=annotate_image(frame, bboxes)



    j=0;


    # Display the results
    for (top, right, bottom, left), name in zip(face_locations, face_names):
        # Scale back up face locations since the frame we detected in was scaled to 1/4 size
        top *= 4
        right *= 4
        bottom *= 4
        left *= 4

        # Draw a box around the face
        j=1;

        #cv2.rectangle(frame, (left, top), (right, bottom), (0, 0, 255), 2)
        frame=annotate_image(frame, bboxes)

        # Draw a label with a name below the face

        if name!='':
            cv2.rectangle(frame, (left - 10 , bottom + 30), (right, bottom), (153, 0, 0), cv2.FILLED)
            font = cv2.FONT_HERSHEY_DUPLEX
            cv2.putText(frame, name, (left +100, bottom + 30), font, 1.0, (255,255, 255), 1)
        

    # Display the resulting image


       
        name2=''

        #Pedestrain Code 
        #import cv2
        #from pedestrian_detection_ssdlite import api
        #from matplotlib import pyplot as plt

        #img = cv2.imread('example8.jpeg')
        #bbox_list = api.get_person_bbox(img, thr=0.6)
        #print(bbox_list)

        #for i in bbox_list:
        #    cv2.rectangle(img, i[0], i[1], (125, 255, 51), thickness=2)

        #plt.imshow(img[:, :, ::-1])
        #plt.show()

        if len(bboxes)==0:
            k=0;



    cv2.imshow('Video', frame)

    # Hit 'q' on the keyboard to quit!
    if cv2.waitKey(1) & 0xFF == ord('q'):
        break

# Release handle to the webcam
video_capture.release()
cv2.destroyAllWindows()