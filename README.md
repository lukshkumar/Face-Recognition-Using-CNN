
# Face-Recognition-Using-CNN

This is a course project for CS495 (Fundamentals of Computer Vision) and is based on the idea of recognizing the human faces in a crowd. The project is build by maneuvering the feature vector extracted from YOLO v2 face detection and passing it to face recognition module build on dlib.


## Objective
The aim of this project was to implement crowd based face recognition using convolutional neural network. In the process of discovering several libraries and architectures, we increased the accuracy of dlib face recognition by maneuvering several feature vectors by incorporating it with YOLO v3.

## Procedure and Methodology

1. We used "faced" library that implements YOLO v2 for face detection with subtle changes in the grid size and output feature vector.
2. On the other hand, dlib provides it own face detection algorithm using HOG (Histogram of oriented gradients) which using the pre-defined features to compare the faces as attached below.

<img src='https://cdn-images-1.medium.com/max/1250/1*6xgev0r-qn4oR88FrW6fiA.png' height="400" width="800">

3. The problem with these features was that it was not robust to side angles and unorthodox orientations therefore we used YOLO v2 instead of HOG detection and fed its feature vector to the face recognition module.

4. The face is recognized using the 68 specific face landmarks incorporating the the top of the chin, the outside edge of each eye, the inner edge of each eyebrow, etc. Then we will train a machine learning algorithm as a softmax or logistic regression output layer of the convolutional neural network to classify the identity of an individual.

5. We classfiy those faces which are detected but not recognized by showing a bounding box so that the system knows that this is the possible face but can not detect due to the absense of appropriate features.

6. This project includes the Person Detector code as well, which was used to try and detect the person first and then feed that segment to face recognition module so to decrease the search space for it. But, it did not work well because of orientation problems.

## Prerequisites and Dependencies

The following dependencies must be installed to run the program.<br />
    pip==8.1.2 <br />
    bumpversion==0.5.3<br />
    wheel==0.29.0<br />
    watchdog==0.8.3<br />
    flake8==2.6.0<br />
    tox==2.3.1<br />
    coverage==4.1<br />
    Sphinx==1.4.8<br />
    cryptography==1.7<br />
    pyyaml>=4.2b1<br />
    face_recognition_models<br />
    Click>=6.0<br />
    dlib>=19.3.0<br />
    numpy<br />
    scipy<br />
    yolo v2<br />
    cv2 (opencv)<br />
    requests<br />
    face_recognition <br />
    
 <strong>Note: This project will only run on MAC OS and Linux because dlib does not provide it's official support for windows. </strong> 
 
 ## References
 
 https://medium.com/@ageitgey/machine-learning-is-fun-part-4-modern-face-recognition-with-deep-learning-c3cffc121d78<br>
 https://towardsdatascience.com/cnn-based-face-detector-from-dlib-c3696195e01c<br>
 https://towardsdatascience.com/faced-cpu-real-time-face-detection-using-deep-learning-1488681c1602

 
