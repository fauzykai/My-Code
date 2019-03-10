function varargout = uts(varargin)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                   NAMA        :   ANITA FITRIZIA
%                   NIM         :   13112008
%                   PRODI       :   TEKNIK ELEKTRO
%                   FAKULTAS    :   TEKNIK DAN ILMU KOMPUTER
%                   UNIVERSITAS KOMPUTER INDONESIA, 2015
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% UTS MATLAB code for uts.fig
%      UTS, by itself, creates a new UTS or raises the existing
%      singleton*.
%
%      H = UTS returns the handle to a new UTS or the handle to
%      the existing singleton*.
%
%      UTS('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in UTS.M with the given input arguments.
%
%      UTS('Property','Value',...) creates a new UTS or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before uts_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to uts_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help uts

% Last Modified by GUIDE v2.5 07-May-2015 14:59:49

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @uts_OpeningFcn, ...
                   'gui_OutputFcn',  @uts_OutputFcn, ...
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


% --- Executes just before uts is made visible.
function uts_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to uts (see VARARGIN)

% Choose default command line output for uts
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes uts wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = uts_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --------------------------------------------------------------------
function Untitled_1_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in clear.
function clear_Callback(hObject, eventdata, handles)
set(handles.pengali, 'string', '')
set(handles.frekuensi, 'string', '11025')
axes(handles.axes1); 
plot(0); 
% hObject    handle to clear (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in bunyikan.
function bunyikan_Callback(hObject, eventdata, handles)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Mengambil data dari edit text
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Fs=str2num(get(handles.frekuensi,'String')); %frek sampling
nilai=str2num(get(handles.pengali,'String')); %nilai penaikkan atau penurunan amplitudo

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Kondisi pemilihan radio button
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
indeks=get(handles.naik,'Value'); %mengambil nilai jika radio yg dipilih adalah naik
if indeks == 1
    A=5+nilai
end

indeks=get(handles.turun,'Value'); %mengambil nilai jika radio yg dipilih adalah turun
if indeks == 1
    A=5-nilai
    if A==0
        A=1
    end
end
 
indeks=get(handles.normal,'Value'); %mengambil nilai jika radio yg dipilih adalah normal
if indeks == 1
    A=5
    set(handles.pengali, 'string', '0')
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Eksekusi sinyal dan bunyi
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
t=0:1/Fs:0.25; %proses normalisasi

c=sin(A*pi*264*t);         %1
c_kres=sin(A*pi*280.5*t);  %1#
d=sin(A*pi*297*t);         %2
d_kres=sin(A*pi*313.5*t);  %2#
e=sin(A*pi*330*t);         %3
f=sin(A*pi*352*t);         %4
f_kres=sin(A*pi*374*t);    %4#
g=sin(A*pi*396*t);         %5
g_kres=sin(A*pi*418*t);    %5#
a=sin(A*pi*440*t);         %6
a_kres=sin(A*pi*467.5*t);  %6#
b=sin(A*pi*495*t);         %7
ci=sin(A*pi*528*t); ;      %1 tinggi
ci_kres=sin(A*pi*561*t);   %1# tinggi
di=sin(A*pi*594*t);        %2 tinggi
di_kres=sin(A*pi*627*t);   %2# tinggi
ei=sin(A*pi*660*t);        %3 tinggi
fi=sin(A*pi*704*t);        %4 tinggi
fi_kres=sin(A*pi*748*t);   %4# tinggi
gi=sin(A*pi*792*t);        %5 tinggi
gi_kres=sin(A*pi*836*t);   %5# tinggi
ai=sin(A*pi*880*t);        %6 tinggi
ai_kres=sin(A*pi*935*t);   %6# tinggi
bi=sin(A*pi*990*t);        %7 tinggi

nol=[zeros(size(t))];      %jeda

pilihan=get(handles.pilihan_nada,'value');
if pilihan==2
    pilihan1=[e,nol,e,d,e,nol,g,g,nol,d,nol,nol,nol,d,d,e,f,nol,f,e,f,nol,a,e,e,e,e,e,nol,nol,nol,e,nol,e,d,e,nol,g,g,nol,d,nol,nol,nol,d,d,e,f,nol,f,e,f,nol,a,e,e,e,e,e,nol,nol]%[get(handles.edit2,'string')];
elseif pilihan==3
    pilihan1=[g,ci,ci,b,ci,di,nol,g,g,di,di,ci,di,ei,nol,nol,di,fi,nol,ci,di,ei,nol,ci,ci,di,di,ci,b,ci,nol,nol,di,fi,nol,ci,di,ei,nol,ci,ci,di,di,ci,b,ci,nol]
elseif pilihan==4
    pilihan1=[c,e,c,e,f,g,g,nol,b,ci,b,ci,b,g,nol,nol,c,e,c,e,f,g,g,nol,b,ci,b,ci,b,g,nol,nol,c,nol,e,nol,g,nol,f,nol,f,g,f,e,c,f,e,c,nol,c,nol,e,nol,g,nol,f,nol,f,g,f,e,c,f,e,c,nol]
elseif pilihan==5
    pilihan1=[g,g,e,e,f,f,g,g,g,g,g,nol,ci,ci,ei,ei,di,ci,b,b,a,a,g,g,g,g,g,g,g,g,nol,nol,g,g,ci,ci,ei,ei,di,di,di,di,di,nol,ci,ci,b,b,b,b,a,a,b,b,ci,ci,ci,ci,ci,ci,ci,ci,nol,nol,ci,ci,ci,ci,b,b,a,a,nol,a,a,a,a,a,nol,ci,ci,b,b,a,a,g,g,nol,nol,e,f,f,g,g,b,b,b,b,b,a,a,nol,d,d,e,e,f,f,e,e,e,e,e,nol]
end

nada=[pilihan1]
sound(pilihan1,Fs)
plot(t,nada)
% hObject    handle to bunyikan (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on selection change in pilihan_nada.
function pilihan_nada_Callback(hObject, eventdata, handles)
% hObject    handle to pilihan_nada (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns pilihan_nada contents as cell array
%        contents{get(hObject,'Value')} returns selected item from pilihan_nada


% --- Executes during object creation, after setting all properties.
function pilihan_nada_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pilihan_nada (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in pilih.
function pilih_Callback(hObject, eventdata, handles)
% hObject    handle to pilih (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns pilih contents as cell array
%        contents{get(hObject,'Value')} returns selected item from pilih


% --- Executes during object creation, after setting all properties.
function pilih_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pilih (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in checkbox1.
function checkbox1_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox1


% --- Executes on button press in naik.
function naik_Callback(hObject, eventdata, handles)
% hObject    handle to naik (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of naik

function pengali_Callback(hObject, eventdata, handles)
% hObject    handle to pengali (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of pengali as text
%        str2double(get(hObject,'String')) returns contents of pengali as a double


% --- Executes during object creation, after setting all properties.
function pengali_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pengali (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function frekuensi_Callback(hObject, eventdata, handles)
% hObject    handle to frekuensi (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of frekuensi as text
%        str2double(get(hObject,'String')) returns contents of frekuensi as a double


% --- Executes during object creation, after setting all properties.
function frekuensi_CreateFcn(hObject, eventdata, handles)
% hObject    handle to frekuensi (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on key press with focus on bunyikan and none of its controls.
function bunyikan_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to bunyikan (see GCBO)
% eventdata  structure with the following fields (see UICONTROL)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)


% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over bunyikan.
function bunyikan_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to bunyikan (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on key press with focus on pilihan_nada and none of its controls.
function pilihan_nada_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to pilihan_nada (see GCBO)
% eventdata  structure with the following fields (see UICONTROL)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)


% --- Executes when selected object is changed in uipanel1.
function uipanel1_SelectionChangeFcn(hObject, eventdata, handles)

% hObject    handle to the selected object in uipanel1 
% eventdata  structure with the following fields (see UIBUTTONGROUP)
%	EventName: string 'SelectionChanged' (read only)
%	OldValue: handle of the previously selected object or empty if none was selected
%	NewValue: handle of the currently selected object
% handles    structure with handles and user data (see GUIDATA)


% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over normal.
function normal_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to normal (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in radiobutton5.
function radiobutton5_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton5


% --- Executes on button press in radiobutton6.
function radiobutton6_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton6



function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in C.
function C_Callback(hObject, eventdata, handles)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Mengambil data dari edit text
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Fs=str2num(get(handles.frekuensi,'String')); %frek sampling
nilai=str2num(get(handles.pengali,'String')); %nilai penaikkan atau penurunan amplitudo

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Kondisi pemilihan radio button
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
indeks=get(handles.naik,'Value'); %mengambil nilai jika radio yg dipilih adalah naik
if indeks == 1
    A=5+nilai
end

indeks=get(handles.turun,'Value'); %mengambil nilai jika radio yg dipilih adalah turun
if indeks == 1
    A=5-nilai
    if A==0
        A=1
    end
end
 
indeks=get(handles.normal,'Value'); %mengambil nilai jika radio yg dipilih adalah normal
if indeks == 1
    A=5
    set(handles.pengali, 'string', '0')
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Eksekusi sinyal dan bunyi
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
t=0:1/Fs:0.25; %proses normalisasi
c=sin(A*pi*264*t);         %1

sound(c,Fs)
plot(t,c)
% hObject    handle to C (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in D.
function D_Callback(hObject, eventdata, handles)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Mengambil data dari edit text
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Fs=str2num(get(handles.frekuensi,'String')); %frek sampling
nilai=str2num(get(handles.pengali,'String')); %nilai penaikkan atau penurunan amplitudo

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Kondisi pemilihan radio button
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
indeks=get(handles.naik,'Value'); %mengambil nilai jika radio yg dipilih adalah naik
if indeks == 1
    A=5+nilai
end

indeks=get(handles.turun,'Value'); %mengambil nilai jika radio yg dipilih adalah turun
if indeks == 1
    A=5-nilai
    if A==0
        A=1
    end
end
 
indeks=get(handles.normal,'Value'); %mengambil nilai jika radio yg dipilih adalah normal
if indeks == 1
    A=5
    set(handles.pengali, 'string', '0')
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Eksekusi sinyal dan bunyi
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
t=0:1/Fs:0.25; %proses normalisasi
d=sin(A*pi*297*t);         %2

sound(d,Fs)
plot(t,d)
% hObject    handle to D (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in E.
function E_Callback(hObject, eventdata, handles)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Mengambil data dari edit text
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Fs=str2num(get(handles.frekuensi,'String')); %frek sampling
nilai=str2num(get(handles.pengali,'String')); %nilai penaikkan atau penurunan amplitudo

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Kondisi pemilihan radio button
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
indeks=get(handles.naik,'Value'); %mengambil nilai jika radio yg dipilih adalah naik
if indeks == 1
    A=5+nilai
end

indeks=get(handles.turun,'Value'); %mengambil nilai jika radio yg dipilih adalah turun
if indeks == 1
    A=5-nilai
    if A==0
        A=1
    end
end
 
indeks=get(handles.normal,'Value'); %mengambil nilai jika radio yg dipilih adalah normal
if indeks == 1
    A=5
    set(handles.pengali, 'string', '0')
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Eksekusi sinyal dan bunyi
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
t=0:1/Fs:0.25; %proses normalisasi
e=sin(A*pi*330*t);         %3

sound(e,Fs)
plot(t,e)
% hObject    handle to E (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in Ei.
function Ei_Callback(hObject, eventdata, handles)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Mengambil data dari edit text
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Fs=str2num(get(handles.frekuensi,'String')); %frek sampling
nilai=str2num(get(handles.pengali,'String')); %nilai penaikkan atau penurunan amplitudo

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Kondisi pemilihan radio button
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
indeks=get(handles.naik,'Value'); %mengambil nilai jika radio yg dipilih adalah naik
if indeks == 1
    A=5+nilai
end

indeks=get(handles.turun,'Value'); %mengambil nilai jika radio yg dipilih adalah turun
if indeks == 1
    A=5-nilai
    if A==0
        A=1
    end
end
 
indeks=get(handles.normal,'Value'); %mengambil nilai jika radio yg dipilih adalah normal
if indeks == 1
    A=5
    set(handles.pengali, 'string', '0')
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Eksekusi sinyal dan bunyi
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
t=0:1/Fs:0.25; %proses normalisasi
ei=sin(A*pi*660*t);         %3 tinggi

sound(ei,Fs)
plot(t,ei)
% hObject    handle to Ei (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in F.
function F_Callback(hObject, eventdata, handles)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Mengambil data dari edit text
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Fs=str2num(get(handles.frekuensi,'String')); %frek sampling
nilai=str2num(get(handles.pengali,'String')); %nilai penaikkan atau penurunan amplitudo

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Kondisi pemilihan radio button
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
indeks=get(handles.naik,'Value'); %mengambil nilai jika radio yg dipilih adalah naik
if indeks == 1
    A=5+nilai
end

indeks=get(handles.turun,'Value'); %mengambil nilai jika radio yg dipilih adalah turun
if indeks == 1
    A=5-nilai
    if A==0
        A=1
    end
end
 
indeks=get(handles.normal,'Value'); %mengambil nilai jika radio yg dipilih adalah normal
if indeks == 1
    A=5
    set(handles.pengali, 'string', '0')
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Eksekusi sinyal dan bunyi
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
t=0:1/Fs:0.25; %proses normalisasi
f=sin(A*pi*352*t);         %4

sound(f,Fs)
plot(t,f)
% hObject    handle to F (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in G.
function G_Callback(hObject, eventdata, handles)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Mengambil data dari edit text
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Fs=str2num(get(handles.frekuensi,'String')); %frek sampling
nilai=str2num(get(handles.pengali,'String')); %nilai penaikkan atau penurunan amplitudo

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Kondisi pemilihan radio button
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
indeks=get(handles.naik,'Value'); %mengambil nilai jika radio yg dipilih adalah naik
if indeks == 1
    A=5+nilai
end

indeks=get(handles.turun,'Value'); %mengambil nilai jika radio yg dipilih adalah turun
if indeks == 1
    A=5-nilai
    if A==0
        A=1
    end
end
 
indeks=get(handles.normal,'Value'); %mengambil nilai jika radio yg dipilih adalah normal
if indeks == 1
    A=5
    set(handles.pengali, 'string', '0')
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Eksekusi sinyal dan bunyi
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
t=0:1/Fs:0.25; %proses normalisasi
g=sin(A*pi*396*t);         %5

sound(g,Fs)
plot(t,g)
% hObject    handle to G (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in Fi.
function Fi_Callback(hObject, eventdata, handles)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Mengambil data dari edit text
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Fs=str2num(get(handles.frekuensi,'String')); %frek sampling
nilai=str2num(get(handles.pengali,'String')); %nilai penaikkan atau penurunan amplitudo

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Kondisi pemilihan radio button
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
indeks=get(handles.naik,'Value'); %mengambil nilai jika radio yg dipilih adalah naik
if indeks == 1
    A=5+nilai
end

indeks=get(handles.turun,'Value'); %mengambil nilai jika radio yg dipilih adalah turun
if indeks == 1
    A=5-nilai
    if A==0
        A=1
    end
end
 
indeks=get(handles.normal,'Value'); %mengambil nilai jika radio yg dipilih adalah normal
if indeks == 1
    A=5
    set(handles.pengali, 'string', '0')
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Eksekusi sinyal dan bunyi
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
t=0:1/Fs:0.25; %proses normalisasi
fi=sin(A*pi*704*t);         %4 tinggi

sound(fi,Fs)
plot(t,fi)
% hObject    handle to Fi (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in D_kres.
function D_kres_Callback(hObject, eventdata, handles)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Mengambil data dari edit text
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Fs=str2num(get(handles.frekuensi,'String')); %frek sampling
nilai=str2num(get(handles.pengali,'String')); %nilai penaikkan atau penurunan amplitudo

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Kondisi pemilihan radio button
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
indeks=get(handles.naik,'Value'); %mengambil nilai jika radio yg dipilih adalah naik
if indeks == 1
    A=5+nilai
end

indeks=get(handles.turun,'Value'); %mengambil nilai jika radio yg dipilih adalah turun
if indeks == 1
    A=5-nilai
    if A==0
        A=1
    end
end
 
indeks=get(handles.normal,'Value'); %mengambil nilai jika radio yg dipilih adalah normal
if indeks == 1
    A=5
    set(handles.pengali, 'string', '0')
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Eksekusi sinyal dan bunyi
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
t=0:1/Fs:0.25; %proses normalisasi
d_kres=sin(A*pi*313.5*t);  %2#

sound(d_kres,Fs)
plot(t,d_kres)
% hObject    handle to D_kres (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in F_kres.
function F_kres_Callback(hObject, eventdata, handles)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Mengambil data dari edit text
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Fs=str2num(get(handles.frekuensi,'String')); %frek sampling
nilai=str2num(get(handles.pengali,'String')); %nilai penaikkan atau penurunan amplitudo

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Kondisi pemilihan radio button
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
indeks=get(handles.naik,'Value'); %mengambil nilai jika radio yg dipilih adalah naik
if indeks == 1
    A=5+nilai
end

indeks=get(handles.turun,'Value'); %mengambil nilai jika radio yg dipilih adalah turun
if indeks == 1
    A=5-nilai
    if A==0
        A=1
    end
end
 
indeks=get(handles.normal,'Value'); %mengambil nilai jika radio yg dipilih adalah normal
if indeks == 1
    A=5
    set(handles.pengali, 'string', '0')
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Eksekusi sinyal dan bunyi
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
t=0:1/Fs:0.25; %proses normalisasi
f_kres=sin(A*pi*374*t);    %4#

sound(f_kres,Fs)
plot(t,f_kres)
% hObject    handle to F_kres (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in G_kres.
function G_kres_Callback(hObject, eventdata, handles)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Mengambil data dari edit text
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Fs=str2num(get(handles.frekuensi,'String')); %frek sampling
nilai=str2num(get(handles.pengali,'String')); %nilai penaikkan atau penurunan amplitudo

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Kondisi pemilihan radio button
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
indeks=get(handles.naik,'Value'); %mengambil nilai jika radio yg dipilih adalah naik
if indeks == 1
    A=5+nilai
end

indeks=get(handles.turun,'Value'); %mengambil nilai jika radio yg dipilih adalah turun
if indeks == 1
    A=5-nilai
    if A==0
        A=1
    end
end
 
indeks=get(handles.normal,'Value'); %mengambil nilai jika radio yg dipilih adalah normal
if indeks == 1
    A=5
    set(handles.pengali, 'string', '0')
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Eksekusi sinyal dan bunyi
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
t=0:1/Fs:0.25; %proses normalisasi
g_kres=sin(A*pi*418*t);    %5#

sound(g_kres,Fs)
plot(t,g_kres)
% hObject    handle to G_kres (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in A_kres.
function A_kres_Callback(hObject, eventdata, handles)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Mengambil data dari edit text
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Fs=str2num(get(handles.frekuensi,'String')); %frek sampling
nilai=str2num(get(handles.pengali,'String')); %nilai penaikkan atau penurunan amplitudo

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Kondisi pemilihan radio button
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
indeks=get(handles.naik,'Value'); %mengambil nilai jika radio yg dipilih adalah naik
if indeks == 1
    A=5+nilai
end

indeks=get(handles.turun,'Value'); %mengambil nilai jika radio yg dipilih adalah turun
if indeks == 1
    A=5-nilai
    if A==0
        A=1
    end
end
 
indeks=get(handles.normal,'Value'); %mengambil nilai jika radio yg dipilih adalah normal
if indeks == 1
    A=5
    set(handles.pengali, 'string', '0')
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Eksekusi sinyal dan bunyi
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
t=0:1/Fs:0.25; %proses normalisasi
a_kres=sin(A*pi*467.5*t);  %6#

sound(a_kres,Fs)
plot(t,a_kres)
% hObject    handle to A_kres (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in Ci_kres.
function Ci_kres_Callback(hObject, eventdata, handles)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Mengambil data dari edit text
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Fs=str2num(get(handles.frekuensi,'String')); %frek sampling
nilai=str2num(get(handles.pengali,'String')); %nilai penaikkan atau penurunan amplitudo

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Kondisi pemilihan radio button
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
indeks=get(handles.naik,'Value'); %mengambil nilai jika radio yg dipilih adalah naik
if indeks == 1
    A=5+nilai
end

indeks=get(handles.turun,'Value'); %mengambil nilai jika radio yg dipilih adalah turun
if indeks == 1
    A=5-nilai
    if A==0
        A=1
    end
end
 
indeks=get(handles.normal,'Value'); %mengambil nilai jika radio yg dipilih adalah normal
if indeks == 1
    A=5
    set(handles.pengali, 'string', '0')
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Eksekusi sinyal dan bunyi
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
t=0:1/Fs:0.25; %proses normalisasi
ci_kres=sin(A*pi*561*t);    %1# tinggi

sound(ci_kres,Fs)
plot(t,ci_kres)
% hObject    handle to Ci_kres (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in C_kres.
function C_kres_Callback(hObject, eventdata, handles)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Mengambil data dari edit text
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Fs=str2num(get(handles.frekuensi,'String')); %frek sampling
nilai=str2num(get(handles.pengali,'String')); %nilai penaikkan atau penurunan amplitudo

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Kondisi pemilihan radio button
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
indeks=get(handles.naik,'Value'); %mengambil nilai jika radio yg dipilih adalah naik
if indeks == 1
    A=5+nilai
end

indeks=get(handles.turun,'Value'); %mengambil nilai jika radio yg dipilih adalah turun
if indeks == 1
    A=5-nilai
    if A==0
        A=1
    end
end
 
indeks=get(handles.normal,'Value'); %mengambil nilai jika radio yg dipilih adalah normal
if indeks == 1
    A=5
    set(handles.pengali, 'string', '0')
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Eksekusi sinyal dan bunyi
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
t=0:1/Fs:0.25; %proses normalisasi
c_kres=sin(A*pi*280.5*t);  %1#

sound(c_kres,Fs)
plot(t,c_kres)
% hObject    handle to C_kres (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in A.
function A_Callback(hObject, eventdata, handles)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Mengambil data dari edit text
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Fs=str2num(get(handles.frekuensi,'String')); %frek sampling
nilai=str2num(get(handles.pengali,'String')); %nilai penaikkan atau penurunan amplitudo

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Kondisi pemilihan radio button
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
indeks=get(handles.naik,'Value'); %mengambil nilai jika radio yg dipilih adalah naik
if indeks == 1
    A=5+nilai
end

indeks=get(handles.turun,'Value'); %mengambil nilai jika radio yg dipilih adalah turun
if indeks == 1
    A=5-nilai
    if A==0
        A=1
    end
end
 
indeks=get(handles.normal,'Value'); %mengambil nilai jika radio yg dipilih adalah normal
if indeks == 1
    A=5
    set(handles.pengali, 'string', '0')
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Eksekusi sinyal dan bunyi
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
t=0:1/Fs:0.25; %proses normalisasi
a=sin(A*pi*440*t);         %6

sound(a,Fs)
plot(t,a)
% hObject    handle to A (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in Gi.
function Gi_Callback(hObject, eventdata, handles)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Mengambil data dari edit text
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Fs=str2num(get(handles.frekuensi,'String')); %frek sampling
nilai=str2num(get(handles.pengali,'String')); %nilai penaikkan atau penurunan amplitudo

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Kondisi pemilihan radio button
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
indeks=get(handles.naik,'Value'); %mengambil nilai jika radio yg dipilih adalah naik
if indeks == 1
    A=5+nilai
end

indeks=get(handles.turun,'Value'); %mengambil nilai jika radio yg dipilih adalah turun
if indeks == 1
    A=5-nilai
    if A==0
        A=1
    end
end
 
indeks=get(handles.normal,'Value'); %mengambil nilai jika radio yg dipilih adalah normal
if indeks == 1
    A=5
    set(handles.pengali, 'string', '0')
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Eksekusi sinyal dan bunyi
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
t=0:1/Fs:0.25; %proses normalisasi
gi=sin(A*pi*792*t);         %5 tinggi

sound(gi,Fs)
plot(t,gi)
% hObject    handle to Gi (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in B.
function B_Callback(hObject, eventdata, handles)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Mengambil data dari edit text
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Fs=str2num(get(handles.frekuensi,'String')); %frek sampling
nilai=str2num(get(handles.pengali,'String')); %nilai penaikkan atau penurunan amplitudo

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Kondisi pemilihan radio button
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
indeks=get(handles.naik,'Value'); %mengambil nilai jika radio yg dipilih adalah naik
if indeks == 1
    A=5+nilai
end

indeks=get(handles.turun,'Value'); %mengambil nilai jika radio yg dipilih adalah turun
if indeks == 1
    A=5-nilai
    if A==0
        A=1
    end
end
 
indeks=get(handles.normal,'Value'); %mengambil nilai jika radio yg dipilih adalah normal
if indeks == 1
    A=5
    set(handles.pengali, 'string', '0')
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Eksekusi sinyal dan bunyi
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
t=0:1/Fs:0.25; %proses normalisasi
b=sin(A*pi*495*t);         %7

sound(b,Fs)
plot(t,b)
% hObject    handle to B (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in Ci.
function Ci_Callback(hObject, eventdata, handles)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Mengambil data dari edit text
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Fs=str2num(get(handles.frekuensi,'String')); %frek sampling
nilai=str2num(get(handles.pengali,'String')); %nilai penaikkan atau penurunan amplitudo

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Kondisi pemilihan radio button
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
indeks=get(handles.naik,'Value'); %mengambil nilai jika radio yg dipilih adalah naik
if indeks == 1
    A=5+nilai
end

indeks=get(handles.turun,'Value'); %mengambil nilai jika radio yg dipilih adalah turun
if indeks == 1
    A=5-nilai
    if A==0
        A=1
    end
end
 
indeks=get(handles.normal,'Value'); %mengambil nilai jika radio yg dipilih adalah normal
if indeks == 1
    A=5
    set(handles.pengali, 'string', '0')
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Eksekusi sinyal dan bunyi
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
t=0:1/Fs:0.25; %proses normalisasi
ci=sin(A*pi*528*t);        %1 tinggi

sound(ci,Fs)
plot(t,ci)
% hObject    handle to Ci (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in Bi.
function Bi_Callback(hObject, eventdata, handles)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Mengambil data dari edit text
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Fs=str2num(get(handles.frekuensi,'String')); %frek sampling
nilai=str2num(get(handles.pengali,'String')); %nilai penaikkan atau penurunan amplitudo

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Kondisi pemilihan radio button
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
indeks=get(handles.naik,'Value'); %mengambil nilai jika radio yg dipilih adalah naik
if indeks == 1
    A=5+nilai
end

indeks=get(handles.turun,'Value'); %mengambil nilai jika radio yg dipilih adalah turun
if indeks == 1
    A=5-nilai
    if A==0
        A=1
    end
end
 
indeks=get(handles.normal,'Value'); %mengambil nilai jika radio yg dipilih adalah normal
if indeks == 1
    A=5
    set(handles.pengali, 'string', '0')
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Eksekusi sinyal dan bunyi
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
t=0:1/Fs:0.25; %proses normalisasi
bi=sin(A*pi*990*t);         %7 tinggi

sound(bi,Fs)
plot(t,bi)
% hObject    handle to Bi (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in Di.
function Di_Callback(hObject, eventdata, handles)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Mengambil data dari edit text
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Fs=str2num(get(handles.frekuensi,'String')); %frek sampling
nilai=str2num(get(handles.pengali,'String')); %nilai penaikkan atau penurunan amplitudo

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Kondisi pemilihan radio button
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
indeks=get(handles.naik,'Value'); %mengambil nilai jika radio yg dipilih adalah naik
if indeks == 1
    A=5+nilai
end

indeks=get(handles.turun,'Value'); %mengambil nilai jika radio yg dipilih adalah turun
if indeks == 1
    A=5-nilai
    if A==0
        A=1
    end
end
 
indeks=get(handles.normal,'Value'); %mengambil nilai jika radio yg dipilih adalah normal
if indeks == 1
    A=5
    set(handles.pengali, 'string', '0')
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Eksekusi sinyal dan bunyi
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
t=0:1/Fs:0.25; %proses normalisasi
di=sin(A*pi*594*t);         %2 tinggi

sound(di,Fs)
plot(t,di)
% hObject    handle to Di (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in Ai.
function Ai_Callback(hObject, eventdata, handles)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Mengambil data dari edit text
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Fs=str2num(get(handles.frekuensi,'String')); %frek sampling
nilai=str2num(get(handles.pengali,'String')); %nilai penaikkan atau penurunan amplitudo

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Kondisi pemilihan radio button
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
indeks=get(handles.naik,'Value'); %mengambil nilai jika radio yg dipilih adalah naik
if indeks == 1
    A=5+nilai
end

indeks=get(handles.turun,'Value'); %mengambil nilai jika radio yg dipilih adalah turun
if indeks == 1
    A=5-nilai
    if A==0
        A=1
    end
end
 
indeks=get(handles.normal,'Value'); %mengambil nilai jika radio yg dipilih adalah normal
if indeks == 1
    A=5
    set(handles.pengali, 'string', '0')
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Eksekusi sinyal dan bunyi
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
t=0:1/Fs:0.25; %proses normalisasi
ai=sin(A*pi*880*t);         %6 tinggi

sound(ai,Fs)
plot(t,ai)
% hObject    handle to Ai (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in Di_kres.
function Di_kres_Callback(hObject, eventdata, handles)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Mengambil data dari edit text
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Fs=str2num(get(handles.frekuensi,'String')); %frek sampling
nilai=str2num(get(handles.pengali,'String')); %nilai penaikkan atau penurunan amplitudo

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Kondisi pemilihan radio button
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
indeks=get(handles.naik,'Value'); %mengambil nilai jika radio yg dipilih adalah naik
if indeks == 1
    A=5+nilai
end

indeks=get(handles.turun,'Value'); %mengambil nilai jika radio yg dipilih adalah turun
if indeks == 1
    A=5-nilai
    if A==0
        A=1
    end
end
 
indeks=get(handles.normal,'Value'); %mengambil nilai jika radio yg dipilih adalah normal
if indeks == 1
    A=5
    set(handles.pengali, 'string', '0')
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Eksekusi sinyal dan bunyi
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
t=0:1/Fs:0.25; %proses normalisasi
di_kres=sin(A*pi*627*t);    %2# tinggi

sound(di_kres,Fs)
plot(t,di_kres)
% hObject    handle to Di_kres (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in Ai_kres.
function Ai_kres_Callback(hObject, eventdata, handles)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Mengambil data dari edit text
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Fs=str2num(get(handles.frekuensi,'String')); %frek sampling
nilai=str2num(get(handles.pengali,'String')); %nilai penaikkan atau penurunan amplitudo

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Kondisi pemilihan radio button
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
indeks=get(handles.naik,'Value'); %mengambil nilai jika radio yg dipilih adalah naik
if indeks == 1
    A=5+nilai
end

indeks=get(handles.turun,'Value'); %mengambil nilai jika radio yg dipilih adalah turun
if indeks == 1
    A=5-nilai
    if A==0
        A=1
    end
end
 
indeks=get(handles.normal,'Value'); %mengambil nilai jika radio yg dipilih adalah normal
if indeks == 1
    A=5
    set(handles.pengali, 'string', '0')
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Eksekusi sinyal dan bunyi
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
t=0:1/Fs:0.25; %proses normalisasi
ai_kres=sin(A*pi*935*t);    %6# tinggi

sound(ai_kres,Fs)
plot(t,ai_kres)
% hObject    handle to Ai_kres (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in Gi_kres.
function Gi_kres_Callback(hObject, eventdata, handles)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Mengambil data dari edit text
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Fs=str2num(get(handles.frekuensi,'String')); %frek sampling
nilai=str2num(get(handles.pengali,'String')); %nilai penaikkan atau penurunan amplitudo

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Kondisi pemilihan radio button
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
indeks=get(handles.naik,'Value'); %mengambil nilai jika radio yg dipilih adalah naik
if indeks == 1
    A=5+nilai
end

indeks=get(handles.turun,'Value'); %mengambil nilai jika radio yg dipilih adalah turun
if indeks == 1
    A=5-nilai
    if A==0
        A=1
    end
end
 
indeks=get(handles.normal,'Value'); %mengambil nilai jika radio yg dipilih adalah normal
if indeks == 1
    A=5
    set(handles.pengali, 'string', '0')
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Eksekusi sinyal dan bunyi
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
t=0:1/Fs:0.25; %proses normalisasi
gi_kres=sin(A*pi*836*t);    %5# tinggi

sound(gi_kres,Fs)
plot(t,gi_kres)
% hObject    handle to Gi_kres (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in Fi_kres.
function Fi_kres_Callback(hObject, eventdata, handles)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Mengambil data dari edit text
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Fs=str2num(get(handles.frekuensi,'String')); %frek sampling
nilai=str2num(get(handles.pengali,'String')); %nilai penaikkan atau penurunan amplitudo

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Kondisi pemilihan radio button
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
indeks=get(handles.naik,'Value'); %mengambil nilai jika radio yg dipilih adalah naik
if indeks == 1
    A=5+nilai
end

indeks=get(handles.turun,'Value'); %mengambil nilai jika radio yg dipilih adalah turun
if indeks == 1
    A=5-nilai
    if A==0
        A=1
    end
end
 
indeks=get(handles.normal,'Value'); %mengambil nilai jika radio yg dipilih adalah normal
if indeks == 1
    A=5
    set(handles.pengali, 'string', '0')
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Eksekusi sinyal dan bunyi
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
t=0:1/Fs:0.25; %proses normalisasi
fi_kres=sin(A*pi*748*t);    %4# tinggi

sound(fi_kres,Fs)
plot(t,fi_kres)
% hObject    handle to Fi_kres (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
