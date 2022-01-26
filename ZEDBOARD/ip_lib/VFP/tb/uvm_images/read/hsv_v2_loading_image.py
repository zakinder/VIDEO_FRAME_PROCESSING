import cv2

image = cv2.imread('C:/Images/REPOS/GitHub/VIDEO_STREAM/ZEDBOARD/uvm_tb/VFP_TEST/dut/tb/uvm_images/read/hsv_v2.bmp')

# Convert BGR to HSV
hsv = cv2.cvtColor(image, cv2.COLOR_BGR2HSV)
hsl = cv2.cvtColor(image, cv2.COLOR_BGR2HLS) # equal to HSL
luv = cv2.cvtColor(image, cv2.COLOR_BGR2LUV)

#HSV
cv2.imshow('V2_HSV.bmp',hsv)
cv2.imwrite('V2_HSV.bmp',hsv)

#HSL
cv2.imshow('V2_HSL.bmp',hsl)
cv2.imwrite('V2_HSL.bmp',hsl)

#LUV
cv2.imshow('V2_LUV.bmp',luv)
cv2.imwrite('V2_LUV.bmp',luv)




cv2.waitKey(0)
