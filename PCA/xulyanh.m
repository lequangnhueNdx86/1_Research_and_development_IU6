function varargout = xulyanh(varargin)

gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @xulyanh_OpeningFcn, ...
                   'gui_OutputFcn',  @xulyanh_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before xulyanh is made visible.
function xulyanh_OpeningFcn(hObject, eventdata, handles, varargin)

handles.output = hObject;

% Update handles structure
guidata(hObject, handles);
clc; 


% --- Outputs from this function are returned to the command line.
function varargout = xulyanh_OutputFcn(hObject, eventdata, handles) 
varargout{1} = handles.output;


% --- Executes on button press in Search.
function Search_Callback(hObject, eventdata, handles)

load TestImage;
axes(handles.anhtimduoc);
trainPath='train';
T=taoCSDL(trainPath);

[m,A,Eigenfaces]= taoEF(T);
OutputName= nhandien(TestImage,m,A,Eigenfaces);
anhtim=strcat(trainPath,'\',OutputName);
anhtim=imread(anhtim);
imshow(anhtim);
title('Photo found');
str=strcat('Name Photo:', OutputName);
set(handles.tenanh,'string',str);


% --- Executes on button press in Browse.
function Browse_Callback(hObject, eventdata, handles)
% hObject    handle to Browse (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% [file_name file_path]=uigetfile('*.jpg','Chon Anh kiem tra','test\2.jpg');
[file_name, file_path, filterindex] = uigetfile('*.jpg', 'Select Test Image','test\2.jpg');
if file_path~= 0 
    TestImage=imread([file_path,file_name]);
end
axes(handles.anhkiemtra);
if file_path~= 0 
    imshow(TestImage);
end
save TestImage;


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close;


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close(xulyanh)

run giaodien.m
