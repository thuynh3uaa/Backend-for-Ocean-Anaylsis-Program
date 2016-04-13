% In  LoadOriginalDataMenuItem_Callback()
% orginaldata_pathname - main program will put this script into the folder with the data, this just grabs the name 
% of the folder it's in
% originaldata_filename - this will grab every filename inside the folder. Right now the program is assumed to only run one time
% so it doesn't check if files that won't work are in the folder. Will
% throw error if so
% 
% In ConvertToMATFilesMenuItem_Callback()
% mkdir MatFiles - This makes the folder for the MAT files
% directory_name = 'MatFiles' - This tells where to put the MAT files
% 
% In function SaveFTLECalculationMenuItem_Callback()
% output_file = '/FTLE.txt'; - Name of what the FTLE file will be, keep /
% output_path = directory_name - Name of the directory FTLE will be put in

function lcscaltesting(varargin)
global settings_startF settings_endF settings_frameInt settings_integrationL settings_meshY settings_meshX
global settings_timeInter settings_stepSize settings_regionXMax settings_regionYMax settings_regionXMin settings_regionYMin

load('settings.mat','settings_startF', 'settings_endF', 'settings_frameInt', 'settings_integrationL', 'settings_meshY',...
    'settings_meshX', 'settings_timeInter', 'settings_stepSize', 'settings_regionXMax', 'settings_regionYMax',...
    'settings_regionXMin', 'settings_regionYMin' );
b = char(varargin);
 cd (b)
%% % LCS_Calculation M-file for LCS_Calculation.fig
% %      LCS_Calculation, by itself, creates a new LCS_Calculation or raises the existing
% %      singleton*.
% %
% %      H = LCS_Calculation returns the handle to a new LCS_Calculation or
% %      the handle to
% %      the existing singleton*.
% %
% %      LCS_Calculation('CALLBACK',hObject,eventData,handles,...) calls the local
% %      function named CALLBACK in LCS_Calculation.M with the given input arguments.
% %
% %      LCS_Calculation('Property','Value',...) creates a new LCS_Calculation or raises the
% %      existing singleton*.  Starting from the left, property value pairs are
% %      applied to the GUI before LCS_Calculation_OpeningFunction gets called.  An
% %      unrecognized property name or invalid value makes property application
% %      stop.  All inputs are passed to LCS_Calculation_OpeningFcn via varargin.
% %
% %      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
% %      instance to run (singleton)".
% %
% % See also: GUIDE, GUIDATA, GUIHANDLES
% 
% % Edit the above text to modify the response to help LCS_Calculation
% 
% % Last Modified by GUIDE v2.5 07-Mar-2009 21:59:45
% 
% % Begin initialization code - DO NOT EDIT
% gui_Singleton = 1;
% gui_State = struct('gui_Name',       mfilename, ...
%                    'gui_Singleton',  gui_Singleton, ...
%                    'gui_OpeningFcn', @LCS_Calculation_OpeningFcn, ...
%                    'gui_OutputFcn',  @LCS_Calculation_OutputFcn, ...
%                    'gui_LayoutFcn',  [] , ...
%                    'gui_Callback',   []);
% if nargin & isstr(varargin{1})
%     gui_State.gui_Callback = str2func(varargin{1});
% end
% 
% if nargout
%     [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
% else
%     gui_mainfcn(gui_State, varargin{:});
% end
% % End initialization code - DO NOT EDIT
% 
% 
% % --- Executes just before LCS_Calculation is made visible.
% function LCS_Calculation_OpeningFcn(hObject, eventdata, handles, varargin)
% % This function has no output args, see OutputFcn.
% % hObject    handle to figure
% % eventdata  reserved - to be defined in a future version of MATLAB
% % handles    structure with handles and user data (see GUIDATA)
% % varargin   command line arguments to LCS_Calculation (see VARARGIN)
% 
% % Choose default command line output for LCS_Calculation
% handles.output = hObject;
% 
% % Update handles structure
% guidata(hObject, handles);
% 
% % UIWAIT makes LCS_Calculation wait for user response (see UIRESUME)
% % uiwait(handles.figure1);
% 
% 
% % --- Outputs from this function are returned to the command line.
% function varargout = LCS_Calculation_OutputFcn()
% % varargout  cell array for returning output args (see VARARGOUT);
% % hObject    handle to figure
% % eventdata  reserved - to be defined in a future version of MATLAB
% % handles    structure with handles and user data (see GUIDATA)
% 
% % Get default command line output from handles structure
% varargout{1} = handles.output;
% 
% 
% % --- Executes during object creation, after setting all properties.
% function starting_frame_CreateFcn()
% % hObject    handle to starting_frame (see GCBO)
% % eventdata  reserved - to be defined in a future version of MATLAB
% % handles    empty - handles not created until after all CreateFcns called
% 
% % Hint: edit controls usually have a white background on Windows.
% %       See ISPC and COMPUTER.
% if ispc
%     set(hObject,'BackgroundColor','white');
% else
%     set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
% end
% 
% function starting_frame_Callback()
% % hObject    handle to starting_frame (see GCBO)
% % eventdata  reserved - to be defined in a future version of MATLAB
% % handles    structure with handles and user data (see GUIDATA)
% 
% % Hints: get(hObject,'String') returns contents of starting_frame as text
% %        str2double(get(hObject,'String')) returns contents of starting_frame as a double
% 
% 
% % --- Executes during object creation, after setting all properties.
% function end_frame_CreateFcn()
% % hObject    handle to starting_frame (see GCBO)
% % eventdata  reserved - to be defined in a future version of MATLAB
% % handles    empty - handles not created until after all CreateFcns called
% 
% % Hint: edit controls usually have a white background on Windows.
% %       See ISPC and COMPUTER.
% if ispc
%     set(hObject,'BackgroundColor','white');
% else
%     set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
% end
% 
% function end_frame_Callback()
% % hObject    handle to end_frame (see GCBO)
% % eventdata  reserved - to be defined in a future version of MATLAB
% % handles    structure with handles and user data (see GUIDATA)
% 
% % Hints: get(hObject,'String') returns contents of end_frame as text
% %        str2double(get(hObject,'String')) returns contents of end_frame as a
% %        double
% 
% 
% % --- Executes during object creation, after setting all properties.
% function interval_CreateFcn()
% % hObject    handle to interval (see GCBO)
% % eventdata  reserved - to be defined in a future version of MATLAB
% % handles    empty - handles not created until after all CreateFcns called
% 
% % Hint: edit controls usually have a white background on Windows.
% %       See ISPC and COMPUTER.
% if ispc
%     set(hObject,'BackgroundColor','white');
% else
%     set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
% end
% 
% function interval_Callback()
% % hObject    handle to interval (see GCBO)
% % eventdata  reserved - to be defined in a future version of MATLAB
% % handles    structure with handles and user data (see GUIDATA)
% 
% % Hints: get(hObject,'String') returns contents of interval as text
% %        str2double(get(hObject,'String')) returns contents of interval as a double
% 
% 
% % --- Executes during object creation, after setting all properties.
% function integration_length_CreateFcn()
% % hObject    handle to integration_length (see GCBO)
% % eventdata  reserved - to be defined in a future version of MATLAB
% % handles    empty - handles not created until after all CreateFcns called
% 
% % Hint: edit controls usually have a white background on Windows.
% %       See ISPC and COMPUTER.
% if ispc
%     set(hObject,'BackgroundColor','white');
% else
%     set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
% end
% 
% 
% 
% function integration_length_Callback()
% % hObject    handle to integration_length (see GCBO)
% % eventdata  reserved - to be defined in a future version of MATLAB
% % handles    structure with handles and user data (see GUIDATA)
% 
% % Hints: get(hObject,'String') returns contents of integration_length as text
% %        str2double(get(hObject,'String')) returns contents of integration_length as a double
% 
% 
% % --- Executes during object creation, after setting all properties.
% function time_interval_CreateFcn()
% % hObject    handle to time_interval (see GCBO)
% % eventdata  reserved - to be defined in a future version of MATLAB
% % handles    empty - handles not created until after all CreateFcns called
% 
% % Hint: edit controls usually have a white background on Windows.
% %       See ISPC and COMPUTER.
% if ispc
%     set(hObject,'BackgroundColor','white');
% else
%     set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
% end
% 
% 
% 
% function time_interval_Callback()
% % hObject    handle to time_interval (see GCBO)
% % eventdata  reserved - to be defined in a future version of MATLAB
% % handles    structure with handles and user data (see GUIDATA)
% 
% % Hints: get(hObject,'String') returns contents of time_interval as text
% %        str2double(get(hObject,'String')) returns contents of time_interval as a double
% 
% 
% % --- Executes during object creation, after setting all properties.
% function meshsize_x_CreateFcn()
% % hObject    handle to meshsize_x (see GCBO)
% % eventdata  reserved - to be defined in a future version of MATLAB
% % handles    empty - handles not created until after all CreateFcns called
% 
% % Hint: edit controls usually have a white background on Windows.
% %       See ISPC and COMPUTER.
% if ispc
%     set(hObject,'BackgroundColor','white');
% else
%     set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
% end
% 
% 
% 
% function meshsize_x_Callback()
% % hObject    handle to meshsize_x (see GCBO)
% % eventdata  reserved - to be defined in a future version of MATLAB
% % handles    structure with handles and user data (see GUIDATA)
% 
% % Hints: get(hObject,'String') returns contents of meshsize_x as text
% %        str2double(get(hObject,'String')) returns contents of meshsize_x as a double
% 
% 
% % --- Executes during object creation, after setting all properties.
% function meshsize_y_CreateFcn()
% % hObject    handle to meshsize_y (see GCBO)
% % eventdata  reserved - to be defined in a future version of MATLAB
% % handles    empty - handles not created until after all CreateFcns called
% 
% % Hint: edit controls usually have a white background on Windows.
% %       See ISPC and COMPUTER.
% if ispc
%     set(hObject,'BackgroundColor','white');
% else
%     set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
% end
% 
% 
% 
% function meshsize_y_Callback()
% % hObject    handle to meshsize_y (see GCBO)
% % eventdata  reserved - to be defined in a future version of MATLAB
% % handles    structure with handles and user data (see GUIDATA)
% 
% % Hints: get(hObject,'String') returns contents of meshsize_y as text
% %        str2double(get(hObject,'String')) returns contents of meshsize_y as a double
% 
% 
% % --- Executes during object creation, after setting all properties.
% function region_x_min_CreateFcn()
% % hObject    handle to region_x_min (see GCBO)
% % eventdata  reserved - to be defined in a future version of MATLAB
% % handles    empty - handles not created until after all CreateFcns called
% 
% % Hint: edit controls usually have a white background on Windows.
% %       See ISPC and COMPUTER.
% if ispc
%     set(hObject,'BackgroundColor','white');
% else
%     set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
% end
% 
% 
% 
% function region_x_min_Callback()
% % hObject    handle to region_x_min (see GCBO)
% % eventdata  reserved - to be defined in a future version of MATLAB
% % handles    structure with handles and user data (see GUIDATA)
% 
% % Hints: get(hObject,'String') returns contents of region_x_min as text
% %        str2double(get(hObject,'String')) returns contents of region_x_min as a double
% 
% 
% % --- Executes during object creation, after setting all properties.
% function region_x_max_CreateFcn()
% % hObject    handle to region_x_max (see GCBO)
% % eventdata  reserved - to be defined in a future version of MATLAB
% % handles    empty - handles not created until after all CreateFcns called
% 
% % Hint: edit controls usually have a white background on Windows.
% %       See ISPC and COMPUTER.
% if ispc
%     set(hObject,'BackgroundColor','white');
% else
%     set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
% end
% 
% 
% 
% function region_x_max_Callback()
% % hObject    handle to region_x_max (see GCBO)
% % eventdata  reserved - to be defined in a future version of MATLAB
% % handles    structure with handles and user data (see GUIDATA)
% 
% % Hints: get(hObject,'String') returns contents of region_x_max as text
% %        str2double(get(hObject,'String')) returns contents of region_x_max as a double
% 
% 
% 
% % --- Executes during object creation, after setting all properties.
% function region_y_max_CreateFcn()
% % hObject    handle to region_y_max (see GCBO)
% % eventdata  reserved - to be defined in a future version of MATLAB
% % handles    empty - handles not created until after all CreateFcns called
% 
% % Hint: edit controls usually have a white background on Windows.
% %       See ISPC and COMPUTER.
% if ispc
%     set(hObject,'BackgroundColor','white');
% else
%     set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
% end
% 
% 
% 
% function region_y_max_Callback()
% % hObject    handle to region_y_max (see GCBO)
% % eventdata  reserved - to be defined in a future version of MATLAB
% % handles    structure with handles and user data (see GUIDATA)
% 
% % Hints: get(hObject,'String') returns contents of region_y_max as text
% %        str2double(get(hObject,'String')) returns contents of region_y_max as a double
% 
% 
% % --- Executes during object creation, after setting all properties.
% function region_y_min_CreateFcn()
% % hObject    handle to region_y_min (see GCBO)
% % eventdata  reserved - to be defined in a future version of MATLAB
% % handles    empty - handles not created until after all CreateFcns called
% 
% % Hint: edit controls usually have a white background on Windows.
% %       See ISPC and COMPUTER.
% if ispc
%     set(hObject,'BackgroundColor','white');
% else
%     set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
% end
% 
% 
% 
% function region_y_min_Callback()
% % hObject    handle to region_y_min (see GCBO)
% % eventdata  reserved - to be defined in a future version of MATLAB
% % handles    structure with handles and user data (see GUIDATA)
% 
% % Hints: get(hObject,'String') returns contents of region_y_min as text
% %        str2double(get(hObject,'String')) returns contents of region_y_min as a double
% 
% 
% % --- Executes during object creation, after setting all properties.
% function step_size_CreateFcn()
% % hObject    handle to step_size (see GCBO)
% % eventdata  reserved - to be defined in a future version of MATLAB
% % handles    empty - handles not created until after all CreateFcns called
% 
% % Hint: edit controls usually have a white background on Windows.
% %       See ISPC and COMPUTER.
% if ispc
%     set(hObject,'BackgroundColor','white');
% else
%     set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
% end
% 
% 
% 
% function step_size_Callback()
% % hObject    handle to step_size (see GCBO)
% % eventdata  reserved - to be defined in a future version of MATLAB
% % handles    structure with handles and user data (see GUIDATA)
% 
% % Hints: get(hObject,'String') returns contents of step_size as text
% %        str2double(get(hObject,'String')) returns contents of step_size as a double
% 
% 
% % --- Executes on button press in forward_FTLE.
% function forward_FTLE_Callback()
% % hObject    handle to forward_FTLE (see GCBO)
% % eventdata  reserved - to be defined in a future version of MATLAB
% % handles    structure with handles and user data (see GUIDATA)
% 
% % Hint: get(hObject,'Value') returns toggle state of forward_FTLE
% 
% 
% % --- Executes on button press in backward_FTLE.
% function backward_FTLE_Callback()
% % hObject    handle to backward_FTLE (see GCBO)
% % eventdata  reserved - to be defined in a future version of MATLAB
% % handles    structure with handles and user data (see GUIDATA)
% 
% % Hint: get(hObject,'Value') returns toggle state of backward_FTLE
% 
% % --- Executes during object creation, after setting all properties.
% function figure1_CreateFcn()
% % hObject    handle to figure1 (see GCBO)
% % eventdata  reserved - to be defined in a future version of MATLAB
% % handles    empty - handles not created until after all CreateFcns called
% 
% % Add the current directory to the path, as the pwd might change thru' the
% % gui. Remove the directory from the path when gui is closed 
% % (See figure1_DeleteFcn)
% setappdata(hObject, 'StartPath', pwd);
% addpath(pwd);


% % --------------------------------------------------------------------

LoadOriginalDataMenuItem_Callback

function LoadOriginalDataMenuItem_Callback()

global originaldata_filename originaldata_pathname find_txt find_wk1
%[originaldata_filename, originaldata_pathname, filterindex] = uigetfile({'*.txt';'*.wk1'}, 'MultiSelect', 'on');
originaldata_pathname = [pwd '/'];
getFolder = dir(fullfile(originaldata_pathname, 'data from*'));
%getFolder = getFolder(~ismember({getFolder.name},{'.','..'}));
originaldata_filename = {getFolder.name};
filterindex = 1;
if iscell(originaldata_filename)==1
    find_txt=max(size(strfind(originaldata_filename{1},'.txt')));
    find_wk1=max(size(strfind(originaldata_filename{1},'.wk1')));
else
    find_txt=max(size(strfind(originaldata_filename,'.txt')));
    find_wk1=max(size(strfind(originaldata_filename,'.wk1')));
end

if find_txt==0 & find_wk1==0
    warndlg('Selection failed. Unknown file format.','error');
end

if filterindex==0
    warndlg('Selection failed. Matlab sometimes fails to a open large number of files. Please select less files.','error');
end
originaldata_filename=sort_char_array(originaldata_filename);

% % --------------------------------------------------------------------

%%
ConvertToMATFilesMenuItem_Callback

function ConvertToMATFilesMenuItem_Callback()

global originaldata_filename originaldata_pathname directory_name find_txt find_wk1
mkdir MatFiles
directory_name = 'MatFiles';
%directory_name = uigetdir('','Select directory of the folder to which MAT files are to be saved');
%directory_name = '/Users/mb00k/Desktop/LCS_TEST/Mat Files';

% prompt = {'Enter the starting frame number:'};
% dlg_title = 'Convert Original Data to Matlab Files';
% num_lines = 1;
% def = {'1'};

% MatFileStartingFrameString = inputdlg(prompt,dlg_title,num_lines,def);
MatFileStartingFrame = 1; %str2num(MatFileStartingFrameString{1});

n_originaldata=length(originaldata_filename);
for i=1:n_originaldata
    i_frame=i+MatFileStartingFrame-1;
    filename=[originaldata_pathname originaldata_filename{i}];
    
    if find_txt==1
        A = dlmread(filename);
    end
    if find_wk1==1
        A = wk1read(filename);
    end
    A = sortrows(A,1);
    B=sortrows(A,2);
    ndata=max(size(A));

    if i==1
        ysize=max(find(A(:,1)==A(1,1)));
        xsize=max(find(B(:,2)==B(1,2)));
        xcoor=B(1:xsize,1);
        ycoor=A(1:ysize,2);
        [xloc yloc]=meshgrid(xcoor,ycoor);
        save([directory_name '/xgrid'],'xcoor');
        save([directory_name '/ygrid'],'ycoor');
    end

    for j=1:xsize
        u(1:ysize,j)=A(1+ysize*(j-1):ysize*j,3);
        v(1:ysize,j)=A(1+ysize*(j-1):ysize*j,4);
    end

    expression=['u' num2str(i_frame) '=u'';'];
    eval(expression);
    expression=['v' num2str(i_frame) '=v'';'];
    eval(expression);
    expression=['save(''' directory_name '/U_T' num2str(i_frame) ''',''u' num2str(i_frame) ''');'];
    eval(expression);
    expression=['save(''' directory_name '/V_T' num2str(i_frame) ''',''v' num2str(i_frame) ''');'];
    eval(expression);
    expression=['clear u' num2str(i_frame) ' v' num2str(i_frame) ';'];
    eval(expression);
end




ComputeFTLEMenuItem_Callback

function ComputeFTLEMenuItem_Callback()
% % hObject    handle to ComputeFTLEMenuItem (see GCBO)
% % eventdata  reserved - to be defined in a future version of MATLAB
% % handles    structure with handles and user data (see GUIDATA)
global nx ny f_start f_end f_int t_length tstep dt 
global settings_startF settings_endF settings_frameInt settings_integrationL settings_meshY settings_meshX
global settings_timeInter settings_stepSize settings_regionXMax settings_regionYMax settings_regionXMin settings_regionYMin

load('/usr/local/MATLAB/R2014b/Research/Tuan_testing/403code/settings.mat');
% FTLE Type

forward_FTLE = 1;
backward_FTLE = 0;


if settings_regionYMax == 90
    settings_regionYMax = 89.90947;
end

if settings_regionXMin == -180
   settings_regionXMin = 74.16;
else
    settings_regionXMin = normalToNOAA(settings_regionXMin);
end

if settings_regionXMax == 180
    settings_regionXMax = 434.06227;
else
    settings_regionXMax = normalToNOAA(settings_regionXMax);
end

% FTLE frames Settings
starting_frame = num2str(settings_startF);%'1';
end_frame = num2str(settings_endF);%'4';
interval = num2str(settings_frameInt);%'1';

% Integration Settings
integration_length = num2str(settings_integrationL);%'4';
time_interval = num2str(settings_timeInter);%'0.6';
step_size = num2str(settings_stepSize);%'1';

% Calculation Region [X1 X2 Y1 Y2] Settings
region_x_min = num2str(settings_regionXMin);%'199.99';
region_x_max = num2str(settings_regionXMax);%'209.99';
region_y_min = num2str(settings_regionYMin);%'54.99';
region_y_max = num2str(settings_regionYMax);%'59.99';

% Mesh Size
meshsize_x = num2str(settings_meshX);%'21';
meshsize_y = num2str(settings_meshY);%'21';





f_start=str2double(starting_frame);
f_end=str2double(end_frame);
f_int=str2double(interval);
t_length=str2double(integration_length);
tstep=str2double(time_interval);
dt=str2double(step_size);

region_x1=str2double(region_x_min);
region_x2=str2double(region_x_max);
region_y1=str2double(region_y_min);
region_y2=str2double(region_y_max);

nx=str2double(meshsize_x);
ny=str2double(meshsize_y);

forward_calculation=double(forward_FTLE);
backward_calculation=double(backward_FTLE);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%some variables repeated recalled by subroutines are set as global
%variables to save computation time
global xloc yloc xcoor ycoor sxcoor sycoor umesh vmesh directory_name sigma

load([directory_name '/xgrid']);
load([directory_name '/ygrid']);
[xloc yloc]=meshgrid(xcoor,ycoor);
velo_x1=min(xcoor);
velo_x2=max(xcoor);
velo_y1=min(ycoor);
velo_y2=max(ycoor);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
sxcoor=linspace(region_x1,region_x2,nx);               % define the initial region of the fluid to track
sycoor=linspace(region_y1,region_y2,ny);         
[xmesh ymesh]=meshgrid(sxcoor,sycoor);
sigma_x=xmesh';                         
sigma_y=ymesh';                         
sigma=zeros(nx,ny);
sigma0=sigma;

CalcFTLE=zeros(nx,ny)+1;                
LeftDomain=zeros(nx,ny);
% 
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %Forward FTLE Calculation%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if forward_calculation==1
    for iT=f_start:f_int:f_end                        % define the time when the FTLE is calculated

        % calculate FTLE at frame # iT
        t_proc = ['T = ', ...
            num2str( iT )];
        disp( t_proc );

        t_start=iT;                         % starting frame
        t_end=t_start+t_length;
        T_start=(t_start-1)*tstep;          % initial time
        T_end=(t_end-1)*tstep;              % end time
        T_span=T_end-T_start;               % integration time length

        sigma_x=xmesh';                     % initial position
        sigma_y=ymesh';

        CalcFTLE=zeros(nx,ny)+1;
        LeftDomain=zeros(nx,ny);

        for t_integration=0:dt:t_length-dt;
            %integrate the flow trajectory from t0 to t1;
            t0=t_start+t_integration;
            t1=t0+dt;

            iiT=t0;
            %%%%%%%%%%%% read the velocity files
            expression=['load(''' directory_name '/U_T' num2str(iiT) '.mat'');'];
            eval(expression);
            expression=['load(''' directory_name '/V_T' num2str(iiT) '.mat'');'];
            eval(expression);
            expression=['umesh=u' num2str(iiT) ';'];
            eval(expression);
            expression=['vmesh=v' num2str(iiT) ';'];
            eval(expression);
            expression=['clear u' num2str(iiT) ' v' num2str(iiT) ';'];
            eval(expression);

            clear X Y T
            %%%%%% if the point is inside, calculate it's trajectory
            [X,Y,T]= RungeKutta_f(t0,t1,tstep,sigma_x,sigma_y);
            sigma_x_new=X;
            sigma_y_new=Y;
            
            for ix=1:nx
                for iy=1:ny
                    clear X Y T
                    %%%%%% if the point is inside, calculate it's trajectory
                    if LeftDomain(ix,iy)==0;

                        % of the point is convected out of the domian,
                        % calculate the FTLE at this point and adjacent points.
                        if (sigma_x_new(ix,iy)-velo_x1)*(sigma_x_new(ix,iy)-velo_x2)>=0 | ...
                                (sigma_y_new(ix,iy)-velo_y1)*(sigma_y_new(ix,iy)-velo_y2)>=0
                            LeftDomain(ix,iy)=1;

                            if CalcFTLE(ix,iy)==1
                                sigma(ix,iy)=calculate_FTLE(ix,iy,sigma_x,sigma_y,T_span);
                                CalcFTLE(ix,iy)=0;

                                if ix>1 & CalcFTLE(ix-1,iy)==1
                                    sigma(ix-1,iy)=calculate_FTLE(ix-1,iy,sigma_x,sigma_y,T_span);
                                    CalcFTLE(ix-1,iy)=0;
                                end
                                if  ix<nx & CalcFTLE(ix+1,iy)==1
                                    sigma(ix+1,iy)=calculate_FTLE(ix+1,iy,sigma_x,sigma_y,T_span);
                                    CalcFTLE(ix+1,iy)=0;
                                end
                                if  iy>1 & CalcFTLE(ix,iy-1)==1
                                    sigma(ix,iy-1)=calculate_FTLE(ix,iy-1,sigma_x,sigma_y,T_span);
                                    CalcFTLE(ix,iy-1)=0;
                                end
                                if  iy<ny & CalcFTLE(ix,iy+1)==1
                                    sigma(ix,iy+1)=calculate_FTLE(ix,iy+1,sigma_x,sigma_y,T_span);
                                    CalcFTLE(ix,iy+1)=0;
                                end

                            end
                        end
                        %%%%%% if the point is outside, don't calculate it's trajectory. keep its position
                    else
                        sigma_x_new(ix,iy)=sigma_x(ix,iy);
                        sigma_y_new(ix,iy)=sigma_y(ix,iy);
                    end
                end
            end

            % update the position for all the points in the domain
            for ix=1:nx
                for iy=1:ny
                    if LeftDomain(ix,iy)==0
                        sigma_x(ix,iy)=sigma_x_new(ix,iy);
                        sigma_y(ix,iy)=sigma_y_new(ix,iy);
                    end
                end
            end
            
            c_frame = (['Frame = ',num2str(iT)]);
            c_proc = strcat( 'process accomplished :  ', ...
                num2str( 100*t_integration/t_length,' %03.0f' ), '/100' );
            disp( c_proc );


%             axes(handles.axes1);
%             Z = sigma0';
%             [C,h] = contourf(xmesh,ymesh,Z,10);
%             axis([region_x1 region_x2 region_y1 region_y2]);
%             
%             xlabel('X');
%             ylabel('Y');
%             title('FTLE plot');
%             text_output=strvcat(c_frame,c_proc);
%             text(region_x2,region_y2,text_output);
%             pause(0.2);
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

        end

        % calculate FTLE for all the points inside the domain at the last
        % time step.
        c_proc = strcat( 'process accomplished :  ', ...
            num2str( 100,' %03.0f' ), '/100' );

        for ix=1:nx
            for iy=1:ny
                if CalcFTLE(ix,iy)==1
                    sigma(ix,iy)=calculate_FTLE(ix,iy,sigma_x,sigma_y,T_span);
                    CalcFTLE(ix,iy)=0;
                end
            end
        end
        
        sigma0=sigma;
        expression=['clear FTLE' num2str(iT)];
        eval(expression);
        expression=['global FTLE' num2str(iT)];
        eval(expression);
        expression=['FTLE' num2str(iT) '=sigma;'];
        eval(expression);
        
         expression=['save(''' directory_name '/Z_T' num2str(iT) '.mat'');'];
         eval(expression);
        
        
        %     figure
%         axes(handles.axes1);
%         Z = sigma0';
%         [C,h] = contourf(xmesh,ymesh,Z,10);
%         axis([region_x1 region_x2 region_y1 region_y2]);
%         
%         xlabel('X');
%         ylabel('Y');
%         title('FTLE plot');
%         text_output=strvcat(c_frame,c_proc);
%         text(region_x2,region_y2,text_output);

    end
end

% % --------------------------------------------------------------------
%%
SaveFTLECalculationMenuItem_Callback

function SaveFTLECalculationMenuItem_Callback()

global sigma directory_name
%[output_file,output_path] = uiputfile('FTLE.txt','Save file name');
output_file = '/FTLE.txt';
output_path = directory_name;
output_FTLE(sigma,output_file,output_path)
%%

%
%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %Function sort_char_array%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [sortedArr,finalIndex] = sort_char_array(orgArr)

% SORTN - Sort cell array or char array in textual and numerical mode.
%               Primary sort by first letter, secondary by second letter and so on.
%               Numbers are considered an numerical values.
%               
%               Sorting Rules:
%                           'a' comes before 'b' and so on.
%                           Numbers come before letters
%                           Numbers are compared according to their value
%                           Short string comes before a long one (when first chars are identical) 
%                           Ignore characters that are not letters or
%                           numbers.
%                           SORTN is NOT case sensitive.
%
%               The main interest in this function is that it can sort
%               numbers with text, so string like 'a60' comes before 'a100'
%
%[SORTED_CELL_ARRAY , INDEXES] = SORTN(CELL_ARRAY) - Sorts the cells array
%                or char array and returns sorted cell array and indexes
%                vector of new arranged cell array.
%
%EXAMPLE:
%               cell_arr = {'abcde54f';
%                                       'aabde54f'}
%
%              [sorted,indexes]=sortn(cell_arr)
%
%               sorted = 
%                                   'aabde54f'
%                                   'abcde54f'
%               indexes = 
%                                       2
%                                       1                          
%
%
%
%               cell_arr = {'abcde154f';
%                                       'abcde54f'}
%
%              [sorted,indexes]=sortn(cell_arr)
%
%               sorted = 
%
%                                   'abcde54f'
%                                   'abcde154f'
%               indexes =
%
%                                   2
%                                   1    
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



if ischar(orgArr)   %function works with cell array, so if char input, convert to cell array
    tempList = lower(orgArr);
    orgArr = cellstr(orgArr);
else
    tempList = char(lower(orgArr));
end

finalIndex = (1:length(orgArr))';   %create the index vector to be changed
g = {};
for i=1:size(tempList)  %go over all strings and break each one to single letters and numbers
    tempCellArr = breakString(tempList(i,:));   %break one string from the cell array
    g = AssignCellArray(tempCellArr, g);    %add the breaked string to cell matrix
end
%[g,indexes] = SortByColumn2(g,5);
for i=size(g,2):-1:1    %go over cell matrix of breaked strings and sort is from last column to the first

    [g,indexes] = SortByColumn(g,i);    %sort the i column
    
    orgArr = orgArr(indexes);   %update cell array order by the indexes
    finalIndex = finalIndex(indexes);   %update final index order
    
end

sortedArr =orgArr ;


function [sortedArr,indexes] = SortByColumn(arr,column);    
%this function sort each column of the breaked cell-matrix
%sorting is done by converting each textual number to its real value
%and later assign every letter its ascii value plus the maximum of all
%numbers. 
%the sorting is pure numeric (Matlab sort) so numbers are always before
%letters.

tempColumn = zeros(size(arr,1),1);
for i=1:length(tempColumn)
    if ~isempty(str2num(char(arr(i,column)))); %finds all numbers including non-real numbers
        tempColumn(i) = str2num(char(arr(i,column)))+1; %assign numbers to the vactor
    end
end
maxNum = max(tempColumn);
u2 = isletter(char(arr(:,column))); %find all letters
tempColumn(u2) = char(arr(u2,column)) + maxNum; %assign numerical representation of letters that is bigger then the numbers

[tempSort,indexes] = sort(tempColumn);
sortedArr = arr(indexes,:);



function newArr = AssignCellArray(assignmentVector, assignTo)
%this function helps adding cell-arrays to the breaked strings cell-matrix


assignToSize = size(assignTo,2);
assignmentVectorSize = length(assignmentVector);
if assignToSize==0
    newArr = assignmentVector;
    
elseif (assignToSize==assignmentVectorSize)
    newArr = [assignTo;assignmentVector];
elseif (assignToSize>assignmentVectorSize)
    assignmentVector((assignmentVectorSize+1):assignToSize)={' '};
    newArr = [assignTo;assignmentVector];
else
    assignTo(:,(assignToSize+1):assignmentVectorSize)={' '};
    newArr = [assignTo;assignmentVector];
end


function groups = breakString(stringToBreak)
%this function breaks a string to its single letters and numbers,
%producing cell array for a single string.

if ~ischar(stringToBreak)   %convert to char array
    tempString = char(stringToBreak);
else
    tempString=stringToBreak;
end
counter = 1;
i=1;
groups = {};
while i<=length(tempString) %go over all chars in the string
    if  ~isletter(tempString(i)) & isempty(str2num(tempString(i)))   %tempString(i)==' '   %Skip spaces
        i=i+1;
        continue;
    end
    if isempty(str2num(tempString(i)))  %in case of a letter - just add it to the array
        groups(counter)={tempString(i)};
        counter = counter + 1;
        i = i + 1;
    else
        groups(counter) = {tempString(i)};
        i = i+1;
        while (i<=length(tempString) & ~isempty(str2num(tempString(i))))    %in case of number,
            %add it to the array and search for following numbers
            groups(counter)={[char(groups(counter)) tempString(i)]};
            i = i + 1;
        end
        counter = counter + 1;
    end
end
% 
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %Function RungeKutta_f%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [X,Y,T]= RungeKutta_f(i_start,i_end,h,xstart,ystart)

% global umesh vmesh

n=1;
t=i_start;
tend=i_end;

delta_i=i_end-i_start;

[ux,uy] = velocity(xstart,ystart,i_start);
x = xstart + delta_i*h*ux;
y = ystart + delta_i*h*uy;
    
X=x;
Y=y;
T=t+1;


% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %Function velocity%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [ux,uy] = velocity(x,y,iiT)

global xloc yloc umesh vmesh
    
ux = interp2(xloc,yloc,umesh',x,y,'linear');
uy = interp2(xloc,yloc,vmesh',x,y,'linear');

index=find(isnan(ux)==1);
ux(index)=0;

index=find(isnan(uy)==1);
uy(index)=0;
% 
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %Function calculate_FTLE%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 
function out=calculate_FTLE(ix,iy,flowmap_x,flowmap_y,t_span)

global sxcoor sycoor

[nx ny]=size(flowmap_x);

if (ix-1)*(ix-nx)<0 & (iy-1)*(iy-ny)<0
    A11=(flowmap_x(ix+1,iy)-flowmap_x(ix-1,iy))/(sxcoor(ix+1)-sxcoor(ix-1));
    A12=(flowmap_x(ix,iy+1)-flowmap_x(ix,iy-1))/(sycoor(iy+1)-sycoor(iy-1));
    A21=(flowmap_y(ix+1,iy)-flowmap_y(ix-1,iy))/(sxcoor(ix+1)-sxcoor(ix-1));
    A22=(flowmap_y(ix,iy+1)-flowmap_y(ix,iy-1))/(sycoor(iy+1)-sycoor(iy-1));
    A=[A11 A12;A21 A22];
    B=A'*A;
    delta=max(eig(B));
    out=log(delta)/(2*t_span);
else
    out=0;
end
% 
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %Function output%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function out=output_FTLE(sigma,file,path)

global sxcoor sycoor f_start f_end f_int

% f_start=str2double(get(handles.starting_frame,'String'));
% f_end=str2double(get(handles.end_frame,'String'));
% f_int=str2double(get(handles.interval,'String'));

%     expression=['save(''sigma_f'',''sigma'');'];
%     eval(expression);
    
[xmesh ymesh]=meshgrid(sxcoor,sycoor);
xloc1=reshape(xmesh(:,:),[],1);
yloc1=reshape(ymesh(:,:),[],1);

filename=[path file];
fid = fopen(filename,'wt');
fprintf(fid,'TITLE = FTLE FIELD\n');
fprintf(fid,'VARIABLES = X, Y, FTLE\n');
for iT=f_start:f_int:f_end
    expression=['global FTLE' num2str(iT) ';'];
    eval(expression);
    expression=['sigma0=FTLE' num2str(iT) ';'];
    eval(expression);

    [nx,ny]=size(sigma0);

    % FTLE FIELD
    Z = sigma0';

    Z1=reshape(Z,[],1);
    dummy=0*Z1;
    data=[xloc1 yloc1 Z1];

    fprintf(fid,['ZONE T=''A' num2str(iT) ''' I=' num2str(ny) ', J=' num2str(nx) ', F=POINT\n']);
    fprintf(fid,'%12.8f %12.8f %12.8f \n',data');
end
fclose(fid);

