function varargout = Morpion(varargin)
% MORPION MATLAB code for Morpion.fig
%      MORPION, by itself, creates a new MORPION or raises the existing
%      singleton*.
%
%      H = MORPION returns the handle to a new MORPION or the handle to
%      the existing singleton*.
%
%      MORPION('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MORPION.M with the given input arguments.
%
%      MORPION('Property','Value',...) creates a new MORPION or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Morpion_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Morpion_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Morpion

% Last Modified by GUIDE v2.5 29-Nov-2016 10:11:00

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Morpion_OpeningFcn, ...
                   'gui_OutputFcn',  @Morpion_OutputFcn, ...
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


% --- Executes just before Morpion is made visible.
function Morpion_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Morpion (see VARARGIN)

% For turn and cell, 1 means player, 2 means computer

% Array of cell
global cellBoard turn player1 player2 endGame p1Win p2Win draw mode;

% 0 = pvp, 1 = pvc, 2 = cvc
mode = 0;

p1Win = sprintf(['\n\n\n' player1.name ' won the game']);
p2Win = sprintf(['\n\n\n' player2.name ' won the game']);
draw = sprintf(['\n\n\n' 'Draw']);

endGame = -1;

cellBoard(1, 1).value = 0;
cellBoard(1, 1).cell = handles.cell11;
cellBoard(1, 2).value = 0;
cellBoard(1, 2).cell = handles.cell12;
cellBoard(1, 3).value = 0;
cellBoard(1, 3).cell = handles.cell13;
cellBoard(2, 1).value = 0;
cellBoard(2, 1).cell = handles.cell21;
cellBoard(2, 2).value = 0;
cellBoard(2, 2).cell = handles.cell22;
cellBoard(2, 3).value = 0;
cellBoard(2, 3).cell = handles.cell23;
cellBoard(3, 1).value = 0;
cellBoard(3, 1).cell = handles.cell31;
cellBoard(3, 2).value = 0;
cellBoard(3, 2).cell = handles.cell32;
cellBoard(3, 3).value = 0;
cellBoard(3, 3).cell = handles.cell33;

player1 = struct('nb', 1, 'name', 'Player', 'score', 0, 'mark', 'X');
player2 = struct('nb', 2, 'name', 'Computer', 'score', 0, 'mark', 'O');

set(handles.text2, 'String', player1.name);
set(handles.text3, 'String', player2.name);

set(handles.text7, 'Visible', 'off');

% First player is chosen randomly
turn = 1 + round(rand);

% Choose default command line output for Morpion
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Morpion wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Morpion_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in cell11.
function cell11_Callback(hObject, eventdata, handles)
% hObject    handle to cell11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
updateBoard(1, 1, handles);


% --- Executes on button press in cell12.
function cell12_Callback(hObject, eventdata, handles)
% hObject    handle to cell12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
updateBoard(1, 2, handles);


% --- Executes on button press in cell13.
function cell13_Callback(hObject, eventdata, handles)
% hObject    handle to cell13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
updateBoard(1, 3, handles);


% --- Executes on button press in cell23.
function cell23_Callback(hObject, eventdata, handles)
% hObject    handle to cell23 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
updateBoard(2, 3, handles);


% --- Executes on button press in cell22.
function cell22_Callback(hObject, eventdata, handles)
% hObject    handle to cell22 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
updateBoard(2, 2, handles);


% --- Executes on button press in cell21.
function cell21_Callback(hObject, eventdata, handles)
% hObject    handle to cell21 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
updateBoard(2, 1, handles);


% --- Executes on button press in cell31.
function cell31_Callback(hObject, eventdata, handles)
% hObject    handle to cell31 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
updateBoard(3, 1, handles);


% --- Executes on button press in cell32.
function cell32_Callback(hObject, eventdata, handles)
% hObject    handle to cell32 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
updateBoard(3, 2, handles);


% --- Executes on button press in cell33.
function cell33_Callback(hObject, eventdata, handles)
% hObject    handle to cell33 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
updateBoard(3, 3, handles);


% --- Update board and check if game is finished
function updateBoard(i ,j, handles)
    global cellBoard turn player1 player2;

    cellBoard(i ,j).value = turn;
    set(cellBoard(i, j).cell, 'Enable', 'off');

    if turn==player1.nb
        set(cellBoard(i, j).cell, 'String', player1.mark);
    else
        set(cellBoard(i, j).cell, 'String', player2.mark);
    end

    finished=checkFinished();

    if finished==0
        if turn==1
            turn = 2;
        else
            turn = 1;
        end
    else    
        endGame(finished, handles);
    end


% --- Check if a player won
% 0 = game not finished
% Else the winner's nb is returned
function finished=checkFinished()
    global cellBoard endGame;
    finished = 0;
    % Check lines
    i=1;
    while finished==0 && i<=3
        if (cellBoard(i, 1).value == cellBoard(i, 2).value) && (cellBoard(i, 2).value == cellBoard(i, 3).value)

            finished = cellBoard(i, 1).value;
        end
        i = i+1;
    end

    % Check columns
    j=1;
    while finished==0 && j<=3
        if (cellBoard(1, j).value == cellBoard(2, j).value) && (cellBoard(2, j).value == cellBoard(3, j).value)

            finished = cellBoard(1, j).value;
        end
        j = j+1;
    end

    % Check 1st diag
    if finished == 0
        if (cellBoard(1, 1).value == cellBoard(2, 2).value) && (cellBoard(2, 2).value == cellBoard(3, 3).value)
            finished = cellBoard(1, 1).value;
        end
    end

    % Check 2nd diag
    if finished == 0 
        if (cellBoard(1, 3).value == cellBoard(2, 2).value) && (cellBoard(2, 2).value == cellBoard(3, 1).value)
            finished = cellBoard(1, 3).value;
        end
    end
    
    % Check if board is full
    if finished==0
        ended = 1;
        for i=1:3
            for j=1:3
                if cellBoard(i, j).value == 0
                    ended = 0;
                end
            end
        end
        if ended==1
           finished = endGame; 
        end
    end
    
% --- Reinitialize the board, update score
function endGame(winner, handles)
    global cellBoard player1 player2 mode p1Win p2Win draw;
    
    for i=1:3
        for j=1:3
           cellBoard(i, j).value = 0;
           set(cellBoard(i, j).cell, 'Enable', 'off');
       end
    end
    
    if winner==player1.nb
        player1.score = player1.score + 1;
        set(handles.text7, 'String', p1Win);
    elseif winner==player2.nb
        player2.score = player2.score + 1;
        set(handles.text7, 'String', p2Win);
    else
        set(handles.text7, 'String', draw);
    end
    
    set(handles.disp_1, 'String', num2str(player1.score));
    set(handles.disp_2, 'String', num2str(player2.score));  
    
    if mode==0
       set(handles.text7, 'Visible', 'on');
       pause(3);
    end
    
    reinitialize(handles);

    
% --- Reinitialize the board
function reinitialize(handles)
    global cellBoard;

    set(handles.text7, 'Visible', 'off');
    for i=1:3
       for j=1:3
           cellBoard(i, j).value = 0;
           set(cellBoard(i, j).cell, 'Enable', 'on');
           set(cellBoard(i, j).cell, 'String', ' ');
       end
    end