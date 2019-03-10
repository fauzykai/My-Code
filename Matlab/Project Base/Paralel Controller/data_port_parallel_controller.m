function varargout = data_port_parallel_controller(varargin)
% DATA_PORT_PARALLEL_CONTROLLER M-file for data_port_parallel_controller.fig
%      DATA_PORT_PARALLEL_CONTROLLER, by itself, creates a new DATA_PORT_PARALLEL_CONTROLLER or raises the existing
%      singleton*.
%
%      H = DATA_PORT_PARALLEL_CONTROLLER returns the handle to a new DATA_PORT_PARALLEL_CONTROLLER or the handle to
%      the existing singleton*.
%
%      DATA_PORT_PARALLEL_CONTROLLER('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in DATA_PORT_PARALLEL_CONTROLLER.M with the given input arguments.
%
%      DATA_PORT_PARALLEL_CONTROLLER('Property','Value',...) creates a new DATA_PORT_PARALLEL_CONTROLLER or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before data_port_controller_OpeningFunction gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to data_port_parallel_controller_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help data_port_parallel_controller

% Last Modified by GUIDE v2.5 06-May-2015 13:18:34

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @data_port_parallel_controller_OpeningFcn, ...
                   'gui_OutputFcn',  @data_port_parallel_controller_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin & isstr(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before data_port_parallel_controller is made visible.
function data_port_parallel_controller_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to data_port_parallel_controller (see VARARGIN)

handles_i
handles.data=0;
% Choose default command line output for data_port_parallel_controller
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes data_port_parallel_controller wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = data_port_parallel_controller_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

parport
%putvalue(data1,0)%initializes to zero at every pin , XP normally has a value 255 at data port


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close

% --- Executes on button press in checkbox1.
function checkbox1_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox1

handles.output = hObject;
handles.i1=1-handles.i1;
data
parport

guidata(hObject, handles);
if handles.i1==1;
    axes(handles.axes1)
    set(gca,'Color','r')
elseif handles.i1~=1;
    axes(handles.axes1)
    set(gca,'Color','w')
end
% --- Executes on button press in checkbox2.
function checkbox2_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox2
handles.output = hObject;
handles.i2=1-handles.i2;
data
parport
guidata(hObject, handles);
if handles.i2==1;
    axes(handles.axes2)
    set(gca,'Color','r')
elseif handles.i2~=1;
    axes(handles.axes2)
    set(gca,'Color','w')
end

% --- Executes on button press in checkbox3.
function checkbox3_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox3
handles.output = hObject;
handles.i3=1-handles.i3;
data
parport
guidata(hObject, handles);
if handles.i3==1;
    axes(handles.axes3)
    set(gca,'Color','r')
elseif handles.i3~=1;
    axes(handles.axes3)
    set(gca,'Color','w')
end

% --- Executes on button press in checkbox4.
function checkbox4_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox4
handles.output = hObject;
handles.i4=1-handles.i4;
data
parport
guidata(hObject, handles);
if handles.i4==1;
    axes(handles.axes4)
    set(gca,'Color','r')
elseif handles.i4~=1;
    axes(handles.axes4)
    set(gca,'Color','w')
end

% --- Executes on button press in checkbox5.
function checkbox5_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox5
handles.output = hObject;
handles.i5 = 1-handles.i5;
data
parport
guidata(hObject, handles);
if handles.i5==1;
    axes(handles.axes5)
    set(gca,'Color','r')
elseif handles.i5~=1;
    axes(handles.axes5)
    set(gca,'Color','w')
end

% --- Executes on button press in checkbox6.
function checkbox6_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox6
handles.output = hObject;
handles.i6=1-handles.i6;
data
parport
guidata(hObject, handles);
if handles.i6==1;
    axes(handles.axes6)
    set(gca,'Color','r')
elseif handles.i6~=1;
    axes(handles.axes6)
    set(gca,'Color','w')
end

% --- Executes on button press in checkbox7.
function checkbox7_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox7
handles.output = hObject;
handles.i7=1-handles.i7;
data
parport
guidata(hObject, handles);
if handles.i7==1;
    axes(handles.axes7)
    set(gca,'Color','r')
elseif handles.i7~=1;
    axes(handles.axes7)
    set(gca,'Color','w')
end

% --- Executes on button press in checkbox8.
function checkbox8_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox8
handles.output = hObject;
handles.i8=1-handles.i8;
data
parport
guidata(hObject, handles);
if handles.i8==1;
    axes(handles.axes8)
    set(gca,'Color','r')
elseif handles.i8~=1;
    axes(handles.axes8)
    set(gca,'Color','w')
end


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.i1=1;
handles.i2=1;
handles.i3=1;
handles.i4=1;
handles.i5=1;
handles.i6=1;
handles.i7=1;
handles.i8=1;
data
parport
set(handles.checkbox1, 'value',handles.i1);
axes(handles.axes1)
    set(gca,'Color','r')
set(handles.checkbox2, 'value',handles.i2);
axes(handles.axes2)
    set(gca,'Color','r')
set(handles.checkbox3, 'value',handles.i3);
axes(handles.axes3)
    set(gca,'Color','r')
set(handles.checkbox4, 'value',handles.i4);
axes(handles.axes4)
    set(gca,'Color','r')
set(handles.checkbox5, 'value',handles.i5);
axes(handles.axes5)
    set(gca,'Color','r')
set(handles.checkbox6, 'value',handles.i6);
axes(handles.axes6)
    set(gca,'Color','r')
set(handles.checkbox7, 'value',handles.i7);
axes(handles.axes7)
    set(gca,'Color','r')
set(handles.checkbox8, 'value',handles.i8);
axes(handles.axes8)
    set(gca,'Color','r')

guidata(hObject, handles);

% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles_i
data
parport
set(handles.checkbox1, 'value',handles.i1);
axes(handles.axes1)
    set(gca,'Color','w')
set(handles.checkbox2, 'value',handles.i2);
axes(handles.axes2)
    set(gca,'Color','w')
set(handles.checkbox3, 'value',handles.i3);
axes(handles.axes3)
    set(gca,'Color','w')
set(handles.checkbox4, 'value',handles.i4);
axes(handles.axes4)
    set(gca,'Color','w')
set(handles.checkbox5, 'value',handles.i5);
axes(handles.axes5)
    set(gca,'Color','w')
set(handles.checkbox6, 'value',handles.i6);
axes(handles.axes6)
    set(gca,'Color','w')
set(handles.checkbox7, 'value',handles.i7);
axes(handles.axes7)
    set(gca,'Color','w')
set(handles.checkbox8, 'value',handles.i8);
axes(handles.axes8)
    set(gca,'Color','w')

guidata(hObject, handles);



% --- Executes during object creation, after setting all properties.
function axes1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes1
