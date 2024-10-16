function T = taoCSDL(trainPath)
% trainPath la duong dan toi thu muc csdl anh .Thu muc nay ngoai nhung
% file anh con chua nhung file khac co ten : . , .. , Thumbs.db
% Bien tat ca anh kich thuoc MxN thanh vector cot M*Nx1 , su dung
% ham reshape cua Matlab , sau do dat vao ma tran T , cuoi cung ma tran T
% se co kich thuoc M*NxP
% return T
csdl = dir(trainPath);
soanh = 0;
for i = 1:size(csdl,1) % dem nhung file la anh trong csdl
    if not(strcmp(csdl(i).name,'.')|strcmp(csdl(i).name,'..')|strcmp(csdl(i).name,'Thumbs.db'))
        soanh = soanh + 1; % so anh chua trong tap csdl
    end
end
% Tao ma tran tu nhung tam anh
T = []; 
for i = 1 : soanh    
    % Trong csdl cua vi du nay thi cac file anh co ten : 1.jpg , 2.jpg ...    
    str = int2str(i);
    str = strcat('\',str,'.jpg');
    str = strcat(trainPath,str); % lay ten day du cua file anh    
    img = imread(str);
    img = rgb2gray(img);    
    [dong cot] = size(img);   
    tam = reshape(img',dong*cot,1);   % bien anh thanh vector
    T = [T tam]; % tang dan kich thuoc ma tran T                
end
