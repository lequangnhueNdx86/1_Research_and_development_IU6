function anhtim = nhandien(InputImage, m, A, E)
%Ham nay se so sanh buc anh kiem tra voi tung buc anh trong CSDL .
%Dau tien tinh toa do hinh chieu cua buc anh kiem tra , sau do tinh toa do
%hinh chieu cua tat ca buc anh trong csdl . Cuoi cung do khoang cach giua
%toa do hinh chieu cua nhung buc anh trong csdl voi toa do hinh chieu cua
%anh kiem tra . Buc anh trong csdl co khoang cach ngan nhat voi anh kiem
%tra chinh la buc anh tuong ung voi buc anh kiem tra .
%Inputimage la duong dan toi buc anh can kiem tra
%m la anh trung binh cua cac anh trong csdl 
%A la ma tran , moi cot la do lech giua mot anh trong csdl so voi anh trung
%binh , con goi la vector anh trung tam
%E la tap hop nhung vector rieng cua ma tran A*A'
%m,A va E duoc lay tu ham 'taoEF'
%anhtim la ten cua buc anh tim duoc trong csld

toado = [];%tap toa do hinh chieu cua moi buc anh trong csdl
sovector = size(E,2);%so vector rieng trong E ( la so cot )
for i = 1 : sovector
    tam = E'*A(:,i); %toa do hinh chieu cua buc anh Ai
    toado = [toado tam]; 
end
tam = rgb2gray(InputImage);
[dong cot] = size(tam);
InImage = reshape(tam',dong*cot,1);
%tinh do lech giua anh kiem tra va anh trung binh trong csdl , do lech la
%mot vector cot giong nhu cac vector cot trong ma tran A
dolech = double(InImage)-m; 
%tuong tu nhu khi tim toa do hinh chieu cua cac vector cot cua A , bay gio ta
%tim toa do hinh chieu cua buc anh kiem tra 
toadoKT = E'*dolech; 
%
hinhchieuKT=double(InImage)*0;
for i=1:sovector
    hinhchieuKT=hinhchieuKT + toadoKT(i,1)*E(:,i);
end
show(hinhchieuKT,'Projecting images onto Image Space');pause(1);%figure;
kc=norm(double(InImage)-hinhchieuKT);
str=num2str(kc);
str=strcat('Distance from test image to face space : ',str);
disp(str);
%Bay gio ta se tinh khoang cach giua  toa do hinh chieu cua buc anh kiem tra voi
%tat ca toa do hinh chieu cua cac buc anh trong csdl . Toa do hinh chieu cua 
%anh kiem tra se co khoang cach ngan nhat voi hinh chieu cua buc anh tuong 
%ung trong csdl (Hai buc anh cung la khuon mat cua mot nguoi )
%
%ta luu y la moi toa do hinh chieu la mot vector , ta se dung chuan Euclid de tinh
%khoang cach giua 2 vector (2 toa do hinh chieu)
khoangcach = [];
for i = 1 : sovector
    q = toado(:,i);
    tam = ( norm( toadoKT - q ) )^2;
    khoangcach = [khoangcach tam];
end
%lay ra khoang cach ngan nhat va vi tri cua buc anh tim duoc trong csdl ,
%ta luu y la nhung file anh trong csdl co ten la : 1.jpg , 2.jpg ....
[minKC , vitri] = min(khoangcach);
str=num2str(minKC);
str=strcat('Mine distance between two projection coordinates : ',str);
disp(str);
anhtim = strcat(int2str(vitri),'.jpg');
