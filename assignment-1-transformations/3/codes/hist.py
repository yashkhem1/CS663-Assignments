import cv2
import numpy as np

img = cv2.imread('bulb5.jpg', 0)
# print(img)
img = img//6
median = np.median(img)
# print(median)
img1 = np.copy(img)
img2 = np.copy(img)
img1[img > median] = 0
img2[img <= median] = 0
timg1 = np.copy(img1[np.nonzero(img1)])
timg2 = np.copy(img2[np.nonzero(img2)])
# print(img)
print(timg1)
print(timg2)
hist,_ = np.histogram(timg1,256,[0,256]) 
cdf = np.cumsum(hist)
cdf_m = np.ma.masked_equal(cdf,0)
cdf_m = (cdf_m - np.min(cdf_m))*255/(np.max(cdf_m)-np.min(cdf_m))
cdf = np.ma.filled(cdf_m,0).astype('uint8')
fimg1 = np.zeros(img1.shape)
count = 0
for i in range(img1.shape[0]):
	for j in range(img1.shape[1]):
		if img1[i, j] != 0:
			fimg1[i, j] = np.copy(cdf[timg1[count]])
			count += 1

hist,_ = np.histogram(timg2,256,[0,256]) 
cdf = np.cumsum(hist)
cdf_m = np.ma.masked_equal(cdf,0)
cdf_m = (cdf_m - np.min(cdf_m))*255/(np.max(cdf_m)-np.min(cdf_m))
cdf = np.ma.filled(cdf_m,0).astype('uint8')
fimg2 = np.zeros(img2.shape)
# print(fimg2.shape)
count = 0
for i in range(img2.shape[0]):
	for j in range(img2.shape[1]):
		if img2[i, j] != 0:
			# print(cdf[img2[i, j]])
			fimg2[i, j] = np.copy(cdf[timg2[count]])
			count += 1
# print(fimg2.shape)
fimg = fimg1 + fimg2
print(img.shape)
print(fimg.shape)
print(fimg1 == fimg2)
cv2.imwrite('fimg.jpg', fimg)
# img = img//2
# # for i in range(img.shape[1]):
# 	# img[:, i] = img[:, i]/(np.log(i+2))
# cv2.imwrite('img.jpg', img)
fin = cv2.equalizeHist(img)
cv2.imwrite('fin.jpg', fin)
cv2.imwrite('img.jpg', img)