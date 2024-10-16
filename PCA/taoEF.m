function [m, A, E] = taoEF(T)
% T la mot ma tran kich thuoc M*NxP chua tat ca anh trong csdl , moi anh la 
% mot vector cot trong ma tran T .
% Theo thuat toan PCA ,dau tien ta se tinh ra m la trung binh cua tat ca cac anh
% trong ma tran T.
% Sau do ta se lay tung buc anh trong T tru cho anh trung binh , ta se duoc mot ma 
% tran A kich thuoc M*NxP 
% Ta can tim Eigenface la nhung vector rieng cua ma tran A*A' , nhung ma
% tran A*A' kich thuoc là M*NxM*N qua lon , ta se tim nhung vector rieng
% cua  ma tran A'*A co kich thuoc PxP . Ta se tim nhung vector rieng 
% bang ham eig trong MatLab
% Gia su v la mot vector rieng cua ma tran A'*A , khi do A*v la vector 
% rieng cua ma tran A*A' .
% tap hop nhung vector rieng cua ma tran A*A' goi la Eigenfaces
% tra ve 3 gia tri :
%        m  anh trung binh
%        A  tap hop nhung (anh-anh trung binh )
%        E  nhung vector rieng cua ma tran A*A'  
%tinh toan anh trung binh
m = mean(T,2); 
soanh = size(T,2);
%xuat ra hinh anh cua m
show(m,'Average image');pause(1);
% tinh do lech giua anh moi buc anh voi anh trung binh
A = [];  
for i = 1 : soanh
    temp = double(T(:,i)) - m; % T(:,i): vector cot thu i chinh la mot buc anh
    if i<6 
    show(temp,'Image - Average image');pause (1);
    end 
    A = [A temp];
end
% tim nhung tri rieng va nhung vector rieng cua ma tran A'*A , tu do tim
% nhung vector rieng cua ma tran A*A' la nhung Eigenface
L = A'*A; 
[V D] = eig(L); 
%V chua nhung vector rieng , con D chua nhung tri rieng trong do vector
%rieng V(:,i) ung voi tri rieng D(i,i)
% D1=diag(D);
% D1=sort(D1);
% s=size(D1);s=s(1);
% D1=D1(s-18);
% LeigV = []; %tap hop vector rieng cua ma tran L=A'*A
% for i = 1 : size(V,2) 
%     if( D(i,i)>D1 )
%         LeigV = [LeigV V(:,i)];
%     end
% end
%ta chi lay 18 vector rieng ung voi 18 tri rieng lon nhat
%nhu da noi o tren , sau khi co cac vector rieng cua ma tran A'*A , ta tim
%cac vector rieng cua ma tran A*A' bang cach lay ma tran A nhan voi cac
%vector rieng nay , tap hop cac vector rieng cua ma tran A*A' con duoc goi 
%la Eigenface do day la nhung vector rieng va no giong hinh khuon mat .
E = A * V;
%xuat ra mot so hinh anh cua cac Eigenface
for i=1: 5
    anh=E(:,i);
    show(anh,'Eigenface');pause(0.1);
end
%E la mot co so gom nhung vector truc giao , ta se chuan hoa no de E bien
%thanh mot co so truc chuan
sovector=size(E,2);
for i=1:sovector
    dodai=norm(E(:,i));
    E(:,i)=E(:,i)/dodai;
end
end
