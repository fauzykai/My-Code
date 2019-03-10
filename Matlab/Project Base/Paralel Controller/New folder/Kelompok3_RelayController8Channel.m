function varargout = Kelompok3_RelayController8Channel(varargin)

gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Kelompok3_RelayController8Channel_OpeningFcn, ...
                   'gui_OutputFcn',  @Kelompok3_RelayController8Channel_OutputFcn, ...
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
function Kelompok3_RelayController8Channel_OpeningFcn(hObject, eventdata, handles, varargin)
imshow('2.png','Parent',handles.axes3)
handles.output = hObject;
guidata(hObject, handles);

function varargout = Kelompok3_RelayController8Channel_OutputFcn(hObject, eventdata, handles) 

varargout{1} = handles.output;

function checkbox1_Callback(hObject, eventdata, handles)
if (get(hObject,'Value') == get(hObject,'Max'))
    set(handles.checkbox1,'ForegroundColor','g');
else   
    set(handles.checkbox1,'ForegroundColor','w');
end
function pushbutton1_Callback(hObject, eventdata, handles)
clc
Relay1=get(handles.checkbox1,'Value');
Relay2=get(handles.checkbox2,'Value');
Relay3=get(handles.checkbox3,'Value');
Relay4=get(handles.checkbox4,'Value');
Relay5=get(handles.checkbox5,'Value');
Relay6=get(handles.checkbox6,'Value');
Relay7=get(handles.checkbox7,'Value');
Relay8=get(handles.checkbox8,'Value');
if Relay1==1;
    r1=1;
else
    r1=0;
end
if Relay2==1;
    r2=2;
else
    r2=0;
end
if Relay3==1;
    r3=4;
else
    r3=0;
end
if Relay4==1;
    r4=8;
else
    r4=0;
end
if Relay5==1;
    r5=16;
else
    r5=0;
end
if Relay6==1;
    r6=32;
else
    r6=0;
end
if Relay7==1;
    r7=64;
else
    r7=0;
end
if Relay8==1;
    r8=128;
else
    r8=0;
end
output=r1+r2+r3+r4+r5+r6+r7+r8
outputarray=[Relay1 Relay2 Relay3 Relay4 Relay5 Relay6 Relay7 Relay8]

parport= digitalio('parallel','LPT1');
get(parport,'PortAddress');
addline(parport, 0:7, 'out');
dataout = logical(outputarray);
putvalue(parport,dataout);

function checkbox2_Callback(hObject, eventdata, handles)
if (get(hObject,'Value') == get(hObject,'Max'))
    set(handles.checkbox2,'ForegroundColor','g');
else   
    set(handles.checkbox2,'ForegroundColor','w');
end
function checkbox3_Callback(hObject, eventdata, handles)
if (get(hObject,'Value') == get(hObject,'Max'))
    set(handles.checkbox3,'ForegroundColor','g');
else   
    set(handles.checkbox3,'ForegroundColor','w');
end
function checkbox4_Callback(hObject, eventdata, handles)
if (get(hObject,'Value') == get(hObject,'Max'))
    set(handles.checkbox4,'ForegroundColor','g');
else   
    set(handles.checkbox4,'ForegroundColor','w');
end

function checkbox5_Callback(hObject, eventdata, handles)
if (get(hObject,'Value') == get(hObject,'Max'))
    set(handles.checkbox5,'ForegroundColor','g');
else   
    set(handles.checkbox5,'ForegroundColor','w');
end

function checkbox6_Callback(hObject, eventdata, handles)
if (get(hObject,'Value') == get(hObject,'Max'))
    set(handles.checkbox6,'ForegroundColor','g');
else   
    set(handles.checkbox6,'ForegroundColor','w');
end

function checkbox7_Callback(hObject, eventdata, handles)
if (get(hObject,'Value') == get(hObject,'Max'))
    set(handles.checkbox7,'ForegroundColor','g');
else   
    set(handles.checkbox7,'ForegroundColor','w');
end

function checkbox8_Callback(hObject, eventdata, handles)
if (get(hObject,'Value') == get(hObject,'Max'))
    set(handles.checkbox8,'ForegroundColor','g');
else   
    set(handles.checkbox8,'ForegroundColor','w');
end

function pushbutton2_Callback(hObject, eventdata, handles)
set(handles.checkbox1,'Value',1);
set(handles.checkbox1,'ForegroundColor','g');
set(handles.checkbox2,'Value',1);
set(handles.checkbox2,'ForegroundColor','g');
set(handles.checkbox3,'Value',1);
set(handles.checkbox3,'ForegroundColor','g');
set(handles.checkbox4,'Value',1);
set(handles.checkbox4,'ForegroundColor','g');
set(handles.checkbox5,'Value',1);
set(handles.checkbox5,'ForegroundColor','g');
set(handles.checkbox6,'Value',1);
set(handles.checkbox6,'ForegroundColor','g');
set(handles.checkbox7,'Value',1);
set(handles.checkbox7,'ForegroundColor','g');
set(handles.checkbox8,'Value',1);
set(handles.checkbox8,'ForegroundColor','g');

function pushbutton3_Callback(hObject, eventdata, handles)
set(handles.checkbox1,'Value',0);
set(handles.checkbox1,'ForegroundColor','w');
set(handles.checkbox2,'Value',0);
set(handles.checkbox2,'ForegroundColor','w');
set(handles.checkbox3,'Value',0);
set(handles.checkbox3,'ForegroundColor','w');
set(handles.checkbox4,'Value',0);
set(handles.checkbox4,'ForegroundColor','w');
set(handles.checkbox5,'Value',0);
set(handles.checkbox5,'ForegroundColor','w');
set(handles.checkbox6,'Value',0);
set(handles.checkbox6,'ForegroundColor','w');
set(handles.checkbox7,'Value',0);
set(handles.checkbox7,'ForegroundColor','w');
set(handles.checkbox8,'Value',0);
set(handles.checkbox8,'ForegroundColor','w');
