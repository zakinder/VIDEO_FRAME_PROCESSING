import cv2

image = cv2.imread('C:/Images/REPOS/GitHub/VIDEO_STREAM/ZEDBOARD/uvm_tb/VFP_TEST/dut/tb/uvm_images/read/rgb_v2.bmp')
b = image.copy()
# set green and red channels to 0
b[:, :, 1] = 0
b[:, :, 2] = 0


g = image.copy()
# set blue and red channels to 0
g[:, :, 0] = 0
g[:, :, 2] = 0

r = image.copy()
# set blue and green channels to 0
r[:, :, 0] = 0
r[:, :, 1] = 0
# Convert BGR to HSV
hsv = cv2.cvtColor(image, cv2.COLOR_BGR2HSV)
hsl = cv2.cvtColor(image, cv2.COLOR_BGR2HLS) # equal to HSL
luv = cv2.cvtColor(image, cv2.COLOR_BGR2LUV)

#HSV
cv2.imshow('RGB_V2_HSV.bmp',hsv)
cv2.imwrite('RGB_V2_HSV.bmp',hsv)

#HSL
cv2.imshow('RGB_V2_HSL.bmp',hsl)
cv2.imwrite('RGB_V2_HSL.bmp',hsl)

#LUV
cv2.imshow('RGB_V2_LUV.bmp',luv)
cv2.imwrite('RGB_V2_LUV.bmp',luv)




cv2.waitKey(0)
