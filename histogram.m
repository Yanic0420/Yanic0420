clear;close all;clc;
img1=imread('1.jpg');%较暗的图像dark
img2=imread('2.jpg');%较亮的图像bright
% figure(1);
% subplot(121);imshow(img1);
% subplot(122);imshow(img2);
gray1img=rgb2gray(img1);
gray2img=rgb2gray(img2);
% figure(2);
% subplot(121);imshow(gray1img);
% subplot(122);imshow(gray2img);
%取反
neg1img=255-gray1img;%imcomplement(bw1img);
neg2img=255-gray2img;%incomplement(bw2img);
figure(3);
subplot(241);imshow(gray1img);title('dark');
subplot(242);imhist(gray1img);title('hist-dark');
subplot(243);imshow(neg1img);title('!dark');
subplot(244);imhist(neg1img);title('hist-!dark');
subplot(245);imshow(gray2img);title('bright');
subplot(246);imhist(gray2img);title('hist-bright');
subplot(247);imshow(neg2img);title('!bright');
subplot(248);imhist(neg2img);title('hist--!bright');
%取对数
% a1=max(max(gray1img));
% a2=max(max(gray2img));
l1=(log2(double(1+gray1img)));
l2=(log2(double(1+gray2img)));

log01img=uint8((l1-min(min(l1)))/(max(max(l1)))*255);
log02img=uint8((l2-min(min(l2)))/(max(max(l2)))*255);
figure(4);
subplot(221);imshow(log01img,[]);title('log2-dark');
subplot(222);imhist(log01img);title('hist--log2-dark');
subplot(223);imshow(log02img,[]);title('log2-bright');
subplot(224);imhist(log02img);title('hist--log2-bright');
%取反对数（指数）
i1=double(gray1img).^3-1;
i2=double(gray2img).^3-1;
index01img=uint8((i1-min(min(i1)))/(max(max(i1)))*255);
index02img=uint8((i2-min(min(i2)))/(max(max(i2)))*255);
figure(5);
subplot(221);imshow(index01img,[]);title('index2-dark');
subplot(222);imhist(index01img);title('hist--index2-dark');
subplot(223);imshow(index02img,[]);title('index2-bright');
subplot(224);imhist(index02img);title('hist--index2-bright');
%对对数取反对数
in1=double(log01img).^3-1;
in2=double(log02img).^3-1;
index11img=uint8((in1-min(min(in1)))/(max(max(in1)))*255);
index12img=uint8((in2-min(min(in2)))/(max(max(in2)))*255);
figure(6);
subplot(221);imshow(index11img,[]);title('index2-dark');
subplot(222);imhist(index11img);title('hist--index2-dark');
subplot(223);imshow(index12img,[]);title('index2-bright');
subplot(224);imhist(index12img);title('hist--index2-bright');
%取幂
r1=double(gray1img).^3;
r2=double(gray2img).^3;
r01img=uint8((r1-min(min(r1)))/(max(max(r1)))*255);
r02img=uint8((r2-min(min(r2)))/(max(max(r2)))*255);
figure(7);
subplot(221);imshow(r01img,[]);title('r2-dark');
subplot(222);imhist(r01img);title('hist--r2-dark');
subplot(223);imshow(r02img,[]);title('r2.5-bright');
subplot(224);imhist(r02img);title('hist--r2.5-bright');

%testshow
figure;
imshowpair(log01img,index11img,'montage');
figure;
imshowpair(log02img,index12img,'montage');

