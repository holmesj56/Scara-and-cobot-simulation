function varargout = SCARA_GUI(varargin)
% SCARA_GUI M-file for SCARA_GUI.fig
%      SCARA_GUI, by itself, creates a new SCARA_GUI or raises the existing
%      singleton*.
%
      %returns the handle to a new SCARA_GUI or the handle to
%      the existing singleton*.
%
%      SCARA_GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SCARA_GUI.M with the given input arguments.
%
%      SCARA_GUI('Property','Value',...) creates a new SCARA_GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before SCARA_GUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to SCARA_GUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help SCARA_GUI

% Last Modified by GUIDE v2.5 02-Oct-2023 23:20:25

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @SCARA_GUI_OpeningFcn, ...
                   'gui_OutputFcn',  @SCARA_GUI_OutputFcn, ...
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


% --- Executes just before SCARA_GUI is made visible.
function SCARA_GUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to SCARA_GUI (see VARARGIN)

% Choose default command line output for SCARA_GUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes SCARA_GUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);
SCARA28 = vrworld('SCARA28.wrl');
open(SCARA28)
view(SCARA28);


Px=get(handles.slider5,'value');



global d3;
d3=-get(handles.slider4,'value');
SCARA28.d4b.translation=[0,d3,0];




global T2;
T2=-get(handles.slider2,'value');
SCARA28.a2.rotation = [1, 0, 0, T2*pi/180];

global t1;
T1=get(handles.slider1,'value');
SCARA28.d1.rotation = [0, 1, 0, T1*pi/180];


clc
% --- Outputs from this function are returned to the command line.
function varargout = SCARA_GUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on slider movement.
function slider1_Callback(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of
%        slider

SCARA28 = vrworld('SCARA28.wrl');
open(SCARA28)
T1=get(handles.slider1,'value');
if T1==360
   set(handles.slider1,'value',0);
end
SCARA28.d1.rotation = [0, 1, 0, T1*pi/180];

% --- Executes during object creation, after setting all properties.
function slider1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider2_Callback(hObject, eventdata, handles)
% hObject    handle to slider2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
SCARA28 = vrworld('SCARA28.wrl');
open(SCARA28)
T2=-get(handles.slider2,'value');
SCARA28.a2.rotation = [1, 0, 0, T2*pi/180];


% --- Executes during object creation, after setting all properties.
function slider2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider3_Callback(hObject, eventdata, handles)
Py=get(handles.slider3,'value');
% hObject    handle to slider3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
SCARA28 = vrworld('SCARA28.wrl');
open(SCARA28)
%T4=get(handles.slider3,'value');
%if T4==360
  % set(handles.slider3,'value',0);
%end
%SCARA28.d4b.rotation = [0, 1, 0,T4*pi/180];

% --- Executes during object creation, after setting all properties.
function slider3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider4_Callback(hObject, eventdata, handles)
% hObject    handle to slider4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
SCARA28 = vrworld('SCARA28.wrl');
open(SCARA28)
d3=-get(handles.slider4,'value');
SCARA28.d4b.translation=[0,d3,0];

T1=get(handles.slider1,'value');


T2=get(handles.slider2,'value')
d3=-get(handles.slider4,'value');

a0=50; a1=100; a2=150; a3=175;

H01=[ cos(T1) -sin(T1)  0    a1*cos(T1);...
      sin(T1)  cos(T1)  0    a1*sin(T1);...
      0          0      1    a0;...
      0          0      0    1 ];

H12=[ cos(T2) -sin(T2)  0    a3*cos(T2);...
      sin(T2)  cos(T2)  0    a3*sin(T2);...
      0          0      1    a2;...
      0          0      0    1 ];

H23=[ 1   0   0    0;...
      0   1   0    0;...
      0   0   1    -d3;...
      0   0   0    1 ];

H03=H01*H12*H23;

 Px= H03(1,4) 
Py= H03(2,4)
Pz= H03(3,4)
% --- Executes during object creation, after setting all properties.
function slider4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider5_Callback(hObject, eventdata, handles)
% hObject    handle to slider5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
SCARA28 = vrworld('SCARA28.wrl');
open(SCARA28)
Py=get(handles.slider5,'value');




% --- Executes during object creation, after setting all properties.
function slider5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --------------------------------------------------------------------
function File_tag_Callback(hObject, eventdata, handles)
% hObject    handle to File_tag (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Edit_tag_Callback(hObject, eventdata, handles)
% hObject    handle to Edit_tag (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Reset_tag_Callback(hObject, eventdata, handles)
% hObject    handle to Reset_tag (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
SCARA28 = vrworld('SCARA28.wrl');
open(SCARA28)

d3=0;
SCARA28.d4b.translation=[0,d3,0];
%T4=0;
%SCARA28.d4b.rotation = [0, 1, 0,T4*pi/180];
T2=0;
SCARA28.a2.rotation = [1, 0, 0, T2*pi/180];
T1=0;
SCARA28.d1.rotation = [0, 1, 0, T1*pi/180];


set(handles.slider5,'value',0);
set(handles.slider4,'value',0);
set(handles.slider3,'value',0);
set(handles.slider2,'value',0);
set(handles.slider1,'value',0);
set(handles.slider6,'value',0)


% --------------------------------------------------------------------
function About_us_tag_Callback(hObject, eventdata, handles)
% hObject    handle to About_us_tag (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

about_us


% --- Executes during object creation, after setting all properties.
function figure1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --------------------------------------------------------------------
function Exit_Tag_Callback(hObject, eventdata, handles)
% hObject    handle to Exit_Tag (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on slider movement.
function slider6_Callback(hObject, eventdata, handles)
Px=get(handles.slider3,'value');
Py=get(handles.slider5,'value');
Pz=get(handles.slider6,'value');
T1=get(handles.slider1,'value');


T2=get(handles.slider2,'value')
d3=-get(handles.slider4,'value');

px_new=vpa(subs(Px,[t1,t2,D3],[T1,T2,d3]))

 py_new=vpa(subs(Py,[t1,t2,D3],[T1,T2,d3]))
 
 pz_new=vpa(subs(Pz,[t1,t2,D3],[T1,T2,d3]))

 %IK  Solution
 [the1,the2] = solve(Px==px_new,Py==py_new,Pz==pz_new,t1,t2)

The1=vpa((the1)*180/pi)

The2=vpa((the2)*180/pi)



Solution=[The1,The2,d3]
% hObject    handle to slider6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end
