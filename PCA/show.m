function show(m,t)
%ham show duoc su dung de hien thi hinh anh voi kich thuoc mau
%m la matran anh can hien thi
%t la chuoi the hien tieu de cua anh

im=imread('anhmau.jpg');
try
    im=rgb2gray(im);
catch
end
[dong,cot]=size(im);% lay kich thuoc (anhmau.jpg coi nhu bien tam luu kich thuoc) 
tam=reshape(m,cot,dong);
tam=tam';
imshow(tam);
dem=1;
for i=1:dong
    for j=1:cot  
       im(i,j)=tam(i,j);
    end 
end
imshow(im);title(t)
end
