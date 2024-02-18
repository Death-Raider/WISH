import cv2
import numpy as np
import utlis
import pytesseract

webCamFeed = False
MODEL_CONFIG = '-l eng --oem 1 --psm 3'
pathImage = r"C:\Users\KIIT\OneDrive\Desktop\Vedant_Official\vedant_projects\Deep learning\Adhar_card_scanner\Images\Test_images\Test_3.jpg"
paths=r"http://192.168.119.129:8080/video"
cap = cv2.VideoCapture(0)
cap.set(10, 160)
heightImg = 480
widthImg = 640
imgWarpColored = None

utlis.initializeTrackbars()
count = 0
while True:
    if webCamFeed:
        success, img = cap.read()
    else:
        img = cv2.imread(pathImage)
    img = cv2.resize(img, (widthImg, heightImg))
    imgBlank = np.zeros((heightImg, widthImg, 3), np.uint8)
    imgGray = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)
    imgBlur = cv2.GaussianBlur(imgGray, (5, 5), 1)
    thres = utlis.valTrackbars()
    imgThreshold = cv2.Canny(imgBlur, thres[0], thres[1])
    kernel = np.ones((5, 5))
    imgDial = cv2.dilate(imgThreshold, kernel, iterations=2)
    imgThreshold = cv2.erode(imgDial, kernel, iterations=1)
    imgContours = img.copy()
    imgBigContour = img.copy()
    contours, hierarchy = cv2.findContours(imgThreshold, cv2.RETR_EXTERNAL,
                                           cv2.CHAIN_APPROX_SIMPLE)
    cv2.drawContours(imgContours, contours, -1, (0, 255, 0), 10)
    biggest, maxArea = utlis.biggestContour(contours)
    if biggest.size != 0:
        biggest = utlis.reorder(biggest)
        cv2.drawContours(imgBigContour, biggest, -1, (0, 255, 0), 20)
        imgBigContour = utlis.drawRectangle(imgBigContour, biggest, 2)
        pts1 = np.float32(biggest)
        pts2 = np.float32([[0, 0], [widthImg, 0], [0, heightImg], [widthImg, heightImg]])
        matrix = cv2.getPerspectiveTransform(pts1, pts2)
        imgWarpColored = cv2.warpPerspective(img, matrix, (widthImg, heightImg))
        x, y, w, h = cv2.boundingRect(biggest)
        # imgWarpColored = cv2.warpPerspective(img, matrix, (w,h))
        # REMOVE 20 PIXELS FORM EACH SIDE
        imgWarpColored = imgWarpColored[20:imgWarpColored.shape[0] - 20, 20:imgWarpColored.shape[1] - 20]
        imgWarpColored = cv2.resize(imgWarpColored, (widthImg, heightImg))

        imgWarpGray = cv2.cvtColor(imgWarpColored, cv2.COLOR_BGR2GRAY)
        imgAdaptiveThre = cv2.adaptiveThreshold(imgWarpGray, 255, 1, 1, 7, 2)
        imgAdaptiveThre = cv2.bitwise_not(imgAdaptiveThre)
        imgAdaptiveThre = cv2.medianBlur(imgAdaptiveThre, 3)

        imageArray = ([img, imgGray, imgThreshold, imgContours],
                      [imgBigContour, imgWarpColored, imgWarpGray, imgAdaptiveThre])

    else:
        imageArray = ([img, imgGray, imgThreshold, imgContours],
                      [imgBlank, imgBlank, imgBlank, imgBlank])

    lables = [["Original", "Gray", "Threshold", "Contours"],
              ["Biggest Contour", "Warp Prespective", "Warp Gray", "Adaptive Threshold"]]

    stackedImage = utlis.stackImages(imageArray, 0.75, lables)
    cv2.imshow("Result", stackedImage)
    key=cv2.waitKey(1)
    if key == ord('s'):
        scanpath=r"C:\Users\KIIT\OneDrive\Desktop\Vedant_Official\vedant_projects\Deep learning\Adhar_card_scanner\Images\Scanned_image"
        imgWarpColored=cv2.resize(imgWarpColored,(1080,720))
        # data = pytesseract.image_to_string(imgWarpColored, config=MODEL_CONFIG) + ' '
        # print(data)
        if imgWarpColored is not None:
            cv2.imwrite(scanpath+ "\\" + str(count) + ".jpg", imgWarpColored)
        utlis.display_img(imgWarpColored)
        info=utlis.extractDataFromIdCard(imgWarpColored)
        cv2.rectangle(stackedImage, ((int(stackedImage.shape[1] / 2) - 230), int(stackedImage.shape[0] / 2) + 50),
                      (1100, 350), (0, 255, 0), cv2.FILLED)
        cv2.putText(stackedImage, "Scan Saved", (int(stackedImage.shape[1] / 2) - 200, int(stackedImage.shape[0] / 2)),
                    cv2.FONT_HERSHEY_DUPLEX, 3, (0, 0, 255), 5, cv2.LINE_AA)
        stackedImage=cv2.resize(stackedImage,(640,480))
        cv2.imshow('Result', stackedImage)
        cv2.waitKey(300)
        count += 1
        break
    elif key == 27:
        cv2.destroyAllWindows()
        break