function varargout = testui(varargin)
% TESTUI MATLAB code for testui.fig
%      TESTUI, by itself, creates a new TESTUI or raises the existing
%      singleton*.
%
%      H = TESTUI returns the handle to a new TESTUI or the handle to
%      the existing singleton*.
%
%      TESTUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in TESTUI.M with the given input arguments.
%
%      TESTUI('Property','Value',...) creates a new TESTUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before testui_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to testui_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help testui

% Last Modified by GUIDE v2.5 27-Apr-2016 18:49:19

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @testui_OpeningFcn, ...
                   'gui_OutputFcn',  @testui_OutputFcn, ...
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


% --- Executes just before testui is made visible.
function testui_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to testui (see VARARGIN)

% Choose default command line output for testui
handles.output = hObject;

%Check if saving files has been initiated yet
settingsFile = 'settings.mat';
settingsExist = exist(settingsFile, 'file');

if settingsExist == 2
    load(settingsFile);
    set(handles.latSEbox, 'string', num2str(settings_latStart))
    set(handles.latEEbox, 'string', num2str(settings_latEnd))
    set(handles.lonSEbox, 'string', num2str(settings_longStart))
    set(handles.lonEEbox, 'string', num2str(settings_longEnd))
    set(handles.folderEbox, 'string', settings_folderLocation)
    set(handles.integEbox, 'string', num2str(settings_integrationL))
    set(handles.timeinEbox, 'string', num2str(settings_timeInter))
    set(handles.stepEbox, 'string', num2str(settings_stepSize))
    set(handles.regionxminEbox, 'string', num2str(settings_regionXMin))
    set(handles.regionxmaxEbox, 'string', num2str(settings_regionXMax))
    set(handles.regionyminEbox, 'string', num2str(settings_regionYMin))
    set(handles.regionymaxEbox, 'string', num2str(settings_regionYMax))
    set(handles.meshxEbox, 'string', num2str(settings_meshX))
    set(handles.meshyEbox, 'string', num2str(settings_meshY))
    set(handles.startFEbox, 'string', num2str(settings_startF))
    set(handles.endFEbox, 'string', num2str(settings_endF))
    set(handles.frameIntEbox, 'string', num2str(settings_frameInt))
    
else
    %Defaults that were used during testing of project
    set(handles.latSEbox, 'string', num2str(55))
    set(handles.latEEbox, 'string', num2str(60))
    set(handles.lonSEbox, 'string', num2str(-160))
    set(handles.lonEEbox, 'string', num2str(-150))
    set(handles.folderEbox, 'string', 'Please set a folder to download to')
    set(handles.integEbox, 'string', num2str(4))
    set(handles.timeinEbox, 'string', num2str(0.6))
    set(handles.stepEbox, 'string', num2str(1))
    set(handles.regionxminEbox, 'string', num2str(-160))
    set(handles.regionxmaxEbox, 'string', num2str(-150))
    set(handles.regionyminEbox, 'string', num2str(54.99))
    set(handles.regionymaxEbox, 'string', num2str(59.99))
    set(handles.meshxEbox, 'string', num2str(21))
    set(handles.meshyEbox, 'string', num2str(21))
    set(handles.startFEbox, 'string', num2str(1))
    set(handles.endFEbox, 'string', num2str(4))
    set(handles.frameIntEbox, 'string', num2str(1))
end

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes testui wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = testui_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function latSEbox_Callback(hObject, eventdata, handles)
% hObject    handle to latSEbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of latSEbox as text
%        str2double(get(hObject,'String')) returns contents of latSEbox as a double


% --- Executes during object creation, after setting all properties.
function latSEbox_CreateFcn(hObject, eventdata, handles)
% hObject    handle to latSEbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function lonSEbox_Callback(hObject, eventdata, handles)
% hObject    handle to lonSEbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of lonSEbox as text
%        str2double(get(hObject,'String')) returns contents of lonSEbox as a double


% --- Executes during object creation, after setting all properties.
function lonSEbox_CreateFcn(hObject, eventdata, handles)
% hObject    handle to lonSEbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function latEEbox_Callback(hObject, eventdata, handles)
% hObject    handle to latEEbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of latEEbox as text
%        str2double(get(hObject,'String')) returns contents of latEEbox as a double


% --- Executes during object creation, after setting all properties.
function latEEbox_CreateFcn(hObject, eventdata, handles)
% hObject    handle to latEEbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function lonEEbox_Callback(hObject, eventdata, handles)
% hObject    handle to lonEEbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of lonEEbox as text
%        str2double(get(hObject,'String')) returns contents of lonEEbox as a double


% --- Executes during object creation, after setting all properties.
function lonEEbox_CreateFcn(hObject, eventdata, handles)
% hObject    handle to lonEEbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function folderEbox_Callback(hObject, eventdata, handles)
% hObject    handle to folderEbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of folderEbox as text
%        str2double(get(hObject,'String')) returns contents of folderEbox as a double


% --- Executes during object creation, after setting all properties.
function folderEbox_CreateFcn(hObject, eventdata, handles)
% hObject    handle to folderEbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in folderSaveBtn.
function folderSaveBtn_Callback(hObject, eventdata, handles)
% hObject    handle to folderSaveBtn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
g = uigetdir();

if g ~= 0
set(handles.folderEbox, 'string',g);

end


% --- Executes on button press in saveCloseBtn.
function saveCloseBtn_Callback(hObject, eventdata, handles)
% hObject    handle to saveCloseBtn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
settings_latStart = str2double(get(handles.latSEbox, 'string'));
settings_latEnd = str2double(get(handles.latEEbox, 'string'));
settings_longStart = str2double(get(handles.lonSEbox, 'string'));
settings_longEnd = str2double(get(handles.lonEEbox, 'string'));
settings_folderLocation = get(handles.folderEbox, 'string');
settings_integrationL = str2double(get(handles.integEbox, 'string'));
settings_timeInter = str2double(get(handles.timeinEbox, 'string'));
settings_stepSize = str2double(get(handles.stepEbox, 'string'));
settings_regionXMin = str2double(get(handles.regionxminEbox, 'string'));
settings_regionXMax = str2double(get(handles.regionxmaxEbox, 'string'));
settings_regionYMin = str2double(get(handles.regionyminEbox, 'string'));
settings_regionYMax = str2double(get(handles.regionymaxEbox, 'string'));
settings_meshX = str2double(get(handles.meshxEbox, 'string'));
settings_meshY = str2double(get(handles.meshyEbox, 'string'));
settings_startF = str2double(get(handles.startFEbox, 'string'));
settings_endF = str2double(get(handles.endFEbox, 'string'));
settings_frameInt = str2double(get(handles.frameIntEbox, 'string'));

save('settings.mat', 'settings_latStart', 'settings_latEnd', 'settings_longStart',...
    'settings_longEnd', 'settings_folderLocation', 'settings_integrationL',...
    'settings_timeInter','settings_stepSize', 'settings_regionXMin',...
    'settings_regionXMax', 'settings_regionYMin', 'settings_regionYMax',...
    'settings_meshX', 'settings_meshY', 'settings_startF', 'settings_endF',...
    'settings_frameInt');
close(handles.figure1);



function integEbox_Callback(hObject, eventdata, handles)
% hObject    handle to integEbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of integEbox as text
%        str2double(get(hObject,'String')) returns contents of integEbox as a double


% --- Executes during object creation, after setting all properties.
function integEbox_CreateFcn(hObject, eventdata, handles)
% hObject    handle to integEbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function timeinEbox_Callback(hObject, eventdata, handles)
% hObject    handle to timeinEbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of timeinEbox as text
%        str2double(get(hObject,'String')) returns contents of timeinEbox as a double


% --- Executes during object creation, after setting all properties.
function timeinEbox_CreateFcn(hObject, eventdata, handles)
% hObject    handle to timeinEbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function stepEbox_Callback(hObject, eventdata, handles)
% hObject    handle to stepEbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of stepEbox as text
%        str2double(get(hObject,'String')) returns contents of stepEbox as a double


% --- Executes during object creation, after setting all properties.
function stepEbox_CreateFcn(hObject, eventdata, handles)
% hObject    handle to stepEbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function regionxminEbox_Callback(hObject, eventdata, handles)
% hObject    handle to regionxminEbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of regionxminEbox as text
%        str2double(get(hObject,'String')) returns contents of regionxminEbox as a double


% --- Executes during object creation, after setting all properties.
function regionxminEbox_CreateFcn(hObject, eventdata, handles)
% hObject    handle to regionxminEbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function regionxmaxEbox_Callback(hObject, eventdata, handles)
% hObject    handle to regionxmaxEbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of regionxmaxEbox as text
%        str2double(get(hObject,'String')) returns contents of regionxmaxEbox as a double


% --- Executes during object creation, after setting all properties.
function regionxmaxEbox_CreateFcn(hObject, eventdata, handles)
% hObject    handle to regionxmaxEbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function regionyminEbox_Callback(hObject, eventdata, handles)
% hObject    handle to regionyminEbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of regionyminEbox as text
%        str2double(get(hObject,'String')) returns contents of regionyminEbox as a double


% --- Executes during object creation, after setting all properties.
function regionyminEbox_CreateFcn(hObject, eventdata, handles)
% hObject    handle to regionyminEbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function regionymaxEbox_Callback(hObject, eventdata, handles)
% hObject    handle to regionymaxEbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of regionymaxEbox as text
%        str2double(get(hObject,'String')) returns contents of regionymaxEbox as a double


% --- Executes during object creation, after setting all properties.
function regionymaxEbox_CreateFcn(hObject, eventdata, handles)
% hObject    handle to regionymaxEbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function meshxEbox_Callback(hObject, eventdata, handles)
% hObject    handle to meshxEbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of meshxEbox as text
%        str2double(get(hObject,'String')) returns contents of meshxEbox as a double


% --- Executes during object creation, after setting all properties.
function meshxEbox_CreateFcn(hObject, eventdata, handles)
% hObject    handle to meshxEbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function meshyEbox_Callback(hObject, eventdata, handles)
% hObject    handle to meshyEbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of meshyEbox as text
%        str2double(get(hObject,'String')) returns contents of meshyEbox as a double


% --- Executes during object creation, after setting all properties.
function meshyEbox_CreateFcn(hObject, eventdata, handles)
% hObject    handle to meshyEbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in defaultBtn.
function defaultBtn_Callback(hObject, eventdata, handles)
% hObject    handle to defaultBtn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    %Defaults that were used during testing of project
    set(handles.latSEbox, 'string', num2str(55))
    set(handles.latEEbox, 'string', num2str(60))
    set(handles.lonSEbox, 'string', num2str(-160))
    set(handles.lonEEbox, 'string', num2str(-150))
    set(handles.folderEbox, 'string', 'Please set a folder to download to')
    set(handles.integEbox, 'string', num2str(4))
    set(handles.timeinEbox, 'string', num2str(0.6))
    set(handles.stepEbox, 'string', num2str(1))
    set(handles.regionxminEbox, 'string', num2str(-160))
    set(handles.regionxmaxEbox, 'string', num2str(-150))
    set(handles.regionyminEbox, 'string', num2str(54.99))
    set(handles.regionymaxEbox, 'string', num2str(59.99))
    set(handles.meshxEbox, 'string', num2str(21))
    set(handles.meshyEbox, 'string', num2str(21))
    set(handles.startFEbox, 'string', num2str(1))
    set(handles.endFEbox, 'string', num2str(4))
    set(handles.frameIntEbox, 'string', num2str(1))
    



function startFEbox_Callback(hObject, eventdata, handles)
% hObject    handle to startFEbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of startFEbox as text
%        str2double(get(hObject,'String')) returns contents of startFEbox as a double


% --- Executes during object creation, after setting all properties.
function startFEbox_CreateFcn(hObject, eventdata, handles)
% hObject    handle to startFEbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function endFEbox_Callback(hObject, eventdata, handles)
% hObject    handle to endFEbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of endFEbox as text
%        str2double(get(hObject,'String')) returns contents of endFEbox as a double


% --- Executes during object creation, after setting all properties.
function endFEbox_CreateFcn(hObject, eventdata, handles)
% hObject    handle to endFEbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function frameIntEbox_Callback(hObject, eventdata, handles)
% hObject    handle to frameIntEbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of frameIntEbox as text
%        str2double(get(hObject,'String')) returns contents of frameIntEbox as a double


% --- Executes during object creation, after setting all properties.
function frameIntEbox_CreateFcn(hObject, eventdata, handles)
% hObject    handle to frameIntEbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
