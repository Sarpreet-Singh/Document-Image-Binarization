 %%%Uncomment to see different results 

 %img = imread('PR1.png');
 %img = imread('PR4.png');
 img = imread('PR6.png');
 %img = imread('H09.jpg');
 %img = imread('H02.jpg');
 %img = imread('HW1.png');
 %img = imread('HW4.png');
 
 img = rgb2gray(img);
 
 %Array of the counts of pixel
 histo= imhist(img);
 
 %Total pixels
 TP = sum(histo); 

 %Probability of all histograms levels in an array
 P =  histo / TP;
 
 Sigma = zeros(1,256); 
 
 %Main Loop
 for k = 1 :  256
     %Weight background and foregroung
     Wb = sum(P(1:k));
     Wf = sum(P(k+1 : end));
     
     %Mean value of background and foreground
     Ub = dot(0 : k-1 , P(1 : k)) / Wb;
     Uf = dot(k : 255, P(k + 1 : 256)) / Wf;
 
     Sigma(k) = Wb * Wf * ((Ub - Uf) ^ 2);
 end 
 
 max_variance = max(Sigma);
 
 %Find position in which it was maximum
 max_position = find(Sigma == max_variance);
 threshold =max_position-1;
 
 %Display
 img = (img>threshold);
 img = medfilt2(img);
 imshow(img);
 
 

     