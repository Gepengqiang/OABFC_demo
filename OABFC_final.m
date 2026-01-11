%******************************************%
% Please kindly note that the CPU runtime mentioned in this paper only includes the time for level set evolution, 
% This applies to all ACMs used for comparison experiments in this paper.
% Please note that the CPU runtime is largely influenced by the performance of the CPU.
% Please kindly note that the CPU runtime does not account for the time spent computing metrics (IoU, DSC, MHD).
%******************************************%
% In case of slight deviations in IoU, DSC, or MHD values, 
% please kindly rerun the case several times to achieve consistent results as reported in the paper.
% Thank you for reviewing our code, and we wish you a happy day!
%******************************************%
close all;clear all;clc
path='test_images_IR/'; %Please load your path
addpath 'test_images_IR/'; %Please load your path

imgID= 9071; %Choose different images

Img1 = imread([num2str(imgID),'.bmp']); c0=1; 
initialLSF = ones(size(Img1(:,:,1))).*c0;

b0 = 1;
initialLSF1 = ones(size(Img1(:,:,1))).*b0; 
Img2=Img1;
Img2 = (Img2(:,:,1));
Img2 = double(Img2);

switch imgID

    case 9071
          sigma=3;alfa=3.4; iterNum=90;k=11; lambda=0.08;
          initialLSF(310:345,80:140) = -c0;

    case 9074
        sigma=1;alfa=3; iterNum=95;k=3;  lambda=0.08;
        initialLSF(85:150,125:180) = -c0;

    case 9154
        sigma=2;alfa=3; iterNum=95;k=6;lambda=0.08;
        initialLSF(200:220,230:265) = -c0; 

    case 9069
        sigma=1;alfa=1.78; iterNum=200;k=3;lambda=0.3;
        initialLSF(110:135,90:125) = -c0; 

    case 9117
        sigma=20;alfa=2; iterNum=100;k=14;lambda=0.8;
        initialLSF(150:180,60:100) = -c0;

    case 9127
        sigma=2;alfa=2.78; iterNum=88;k=7;lambda=0.8;
        initialLSF(190:255,135:195) = -c0;

    case 9128
        sigma=2;alfa=3; iterNum=85;k=8;lambda=0.08;
        initialLSF(115:135,60:85) = -c0;

    case 9131
        sigma=1;alfa=2.7; iterNum=100;k=7;lambda=0.08;
        initialLSF(295:330,255:300) = -c0;

    case 9133
        sigma=2;alfa=1.75; iterNum=100;k=7;lambda=1.3;
        initialLSF(275:300,70:100) = -c0;
        initialLSF(265:295,355:380) = -c0;

    case 9076
        sigma=1;alfa=3.2; iterNum=100;k=5;lambda=0.05;
        initialLSF(190:240,100:160) = -c0;

    case 9113
        sigma=3;alfa=2.4; iterNum=100;k=7;lambda=0.5;
        initialLSF(165:185,60:95) = -c0;

    case 9125
        sigma=2;alfa=3.5; iterNum=100;k=9;lambda=0.08;
        initialLSF(220:237,134:178) = -c0;

    case 9510
        sigma=3;alfa=0.5; iterNum=100;k=3;lambda=0.08;
        initialLSF(158:186,130:255) = -c0;

    case 9500
        sigma=3;alfa=2.5; iterNum=100;k=8;lambda=0.8;
        initialLSF(100:180,150:240) = -c0;

    case 73
        sigma=2;alfa=0.9; iterNum=100;k=3;lambda=0.55;
        initialLSF(40:50,50:60) = -c0; 

    case 9227
        sigma=1;alfa=3.3; iterNum=100;k=3;lambda=0.08;
        initialLSF(310:370,260:300) = -c0;

    case 9121
        sigma=2;alfa=2.2; iterNum=100;k=20;lambda=0.05;
        initialLSF(160:330,35:130) = -c0;

    case 9122
        sigma=1;alfa=3.5; iterNum=80;k=7;lambda=0.01;
        initialLSF(100:115,78:94) = -c0;

    case 9150
        sigma=3;alfa=2; iterNum=100;k=7;lambda=0.15;
        initialLSF(120:180,150:220) = -c0;

    case 9073
        sigma=1;alfa=3.5; iterNum=100;k=7;lambda=0.35;
        initialLSF(355:420,110:185) = -c0;

    case 9119
        sigma=2;alfa=3.33; iterNum=89;k=7;lambda=0.08;
        initialLSF(75:100,90:130) = -c0;

    case 9126
        sigma=3;alfa=3.3; iterNum=100;k=7;lambda=0.03;
        initialLSF(200:235,110:155) = -c0;

    case 9152
        sigma=8;alfa=1.45; iterNum=100;k=7;lambda=0.12;
        initialLSF(207:226,85:110) = -c0; 

    case 9118
        sigma=5;alfa=1.2; iterNum=100;k=5;lambda=0.5;
        initialLSF(95:120,160:180) = -c0;
        initialLSF(100:140,250:275) = -c0;

    case 9115
        sigma=3;alfa=2.3; iterNum=69;k=10;lambda=0.05;
        initialLSF(160:200,180:230) = -c0;

    case 9140
        sigma=3;alfa=2.68; iterNum=100;k=7;lambda=0.85;
        initialLSF(83:94,85:105) = -c0;
        initialLSF(68:80,228:245) = -c0;
        initialLSF(80:90,310:330) = -c0;

    case 9114
        sigma=3;alfa=3.5; iterNum=100;k=8;lambda=0.08;
        initialLSF(190:230,100:150) = -c0;

    case 9224
        sigma=1;alfa=0.65; iterNum=100;k=3;lambda=0.05; 
        initialLSF(220:265,180:340) = -c0;

    case 9223
        sigma=2;alfa=2.5; iterNum=100;k=8;lambda=0.65;
        initialLSF(165:260,200:350) = -c0;

    case 107
        sigma=1;alfa=2; iterNum=100;k=3;lambda=0.85;
        initialLSF(35:50,45:90) = -c0; 

    case 9225
        sigma=1;alfa=3.3; iterNum=100;k=3;lambda=0.85;  
        initialLSF(110:150,120:200) = -c0;

    case 9151
        sigma=6;alfa=1.65; iterNum=100;k=5;lambda=0.5;
        initialLSF(160:180,243:260) = -c0;

    case 11111
        sigma=3;alfa=1.3; iterNum=100;k=5;lambda=0.08;
        initialLSF(135:160,300:330) = -c0;

    case 11113
        sigma=3;alfa=0.7; iterNum=100;k=7;lambda=0.08;
        initialLSF(245:285,150:195) = -c0;

    case 11119
        sigma=7;alfa=0.8; iterNum=100;k=5;lambda=0.08;
        initialLSF(140:165,270:335) = -c0;

    case 11120
        sigma=5;alfa=1.55; iterNum=100;k=15;lambda=0.08;
        initialLSF(30:55,300:395) = -c0;

    case 11122
        sigma=7;alfa=1; iterNum=100;k=5;lambda=0.08;
        initialLSF(150:190,265:320) = -c0;

    case 11137
        sigma=7;alfa=3.5; iterNum=100;k=12;lambda=0.08;
        initialLSF(160:180,185:205) = -c0;

    case 11139
        sigma=7;alfa=2.5; iterNum=100;k=12;lambda=0.08;
        initialLSF(180:250,450:520) = -c0;

    case 11140
        sigma=7;alfa=2; iterNum=100;k=25;lambda=0.08;
        initialLSF(140:200,390:450) = -c0;

    case 11141
        sigma=7;alfa=3.5; iterNum=100;k=20;lambda=0.08;
        initialLSF(130:170,150:220) = -c0;

    case 11143
        sigma=18;alfa=3; iterNum=100;k=12;lambda=0.08;
        initialLSF(140:155,450:475) = -c0;

    case 11149
        sigma=7;alfa=0.7; iterNum=100;k=14;lambda=0.08;
        initialLSF(165:185,350:420) = -c0;

    case 11114
        sigma=3;alfa=0.9; iterNum=100;k=7;lambda=0.08;
        initialLSF(90:115,330:365) = -c0;
        

end

Img=double(Img1(:,:,1)); 
Img=log(1+Img/255);
fmin  = min(Img(:));
fmax  = max(Img(:));
Img = 255*(Img-fmin)/(fmax-fmin);  
u=initialLSF;
timestep=1;
epsilon=1;
beta=std2(Img);
G=fspecial('average',k);

numComponents = 2; 
r = gmm_fitting(Img, numComponents);

Ksigma=fspecial('gaussian',round(2*sigma)*2+1,sigma); 
KONE=conv2(ones(size(Img)),Ksigma,'same');

[Gx, Gy] = gradient(Img2);
gradientMagnitude=sqrt(Gx.^2 + Gy.^2);
w22 = 1 ./ (1 + lambda * gradientMagnitude); 

for  n1=1:iterNum
    u=NeumannBoundCond(u);
    DrcU=(epsilon/pi)./(epsilon^2.+u.^2);
    Hu=0.5*(1+(2/pi)*atan(u./epsilon));
    I=Img.*Hu;
    ex1 = global_fitting(Img, I, Hu);
    ex2 = local_fitting(Img, r, Hu, Ksigma, KONE);
    dataForce2 = alfa*new_GMM((1*w22.*ex1 + 1*(1-w22).*ex2)./beta);

    u1 = u;
    DiracU = Dirac(u,epsilon);
    ImageTerm = -DiracU.*dataForce2;

    u = u+timestep*ImageTerm;
    phi=u;
    u=new_GMM3(9*u);
    phi_R=u;

    u=imfilter(u,G,'symmetric');
    phi_av=u;

if abs(u - u1)> 0.001
    break
end
end

Imseg=im2bw(-u,0);

figure;
subplot(1,2,1);
imagesc(Img1); colormap(gray); axis off; axis equal;
hold on;
contour(initialLSF,[0 0],'g','LineWidth',2);
title('Initial contour', 'FontSize', 14);  

subplot(1,2,2);
imagesc(Img1); colormap(gray); axis off; axis equal;
hold on;
contour(u,[0 0],'r','LineWidth',2);
title('Segmentation results', 'FontSize', 14); 

function y = new_GMM(x)
y=(1 - 2*exp(-2*x)) ./ (1 + 2*exp(-2*x));
end

function y = new_GMM3(x)
y = (3.^x - 1) ./ (1 + 3.^x);
end

function f = Dirac(x, epsilon)
f=(epsilon/pi)./(epsilon^2.+x.^2);
end

function g = NeumannBoundCond(f)
[nrow,ncol] = size(f);
g = f;
g([1 nrow],[1 ncol]) = g([3 nrow-2],[3 ncol-2]);
g([1 nrow],2:end-1) = g([3 nrow-2],2:end-1);
g(2:end-1,[1 ncol]) = g(2:end-1,[3 ncol-2]);
end








