import cv2

image = cv2.imread('C:/Images/REPOS/GitHub/VIDEO_STREAM/ZEDBOARD/uvm_tb/VFP_TEST/dut/tb/uvm_images/write/cgaintocgain.bmp')




# RGB Red
cv2.imshow('R-cgaintocgain',image[:, :, 0])
cv2.imwrite('R-cgaintocgain.bmp',image[:, :, 0])

cv2.imshow('G-cgaintocgain',image[:, :, 1])
cv2.imwrite('G-cgaintocgain.bmp',image[:, :, 1])

cv2.imshow('B-cgaintocgain',image[:, :, 2])
cv2.imwrite('B-cgaintocgain.bmp',image[:, :, 2])

cv2.waitKey(0)
