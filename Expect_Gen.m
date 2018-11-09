function [M] = Expect_Gen(SIM_Title,SIM_Param_Initial, SIM_Param_Final, SIM_Param_Initial_Value, SIM_Param_Final_Value,SIM_Speed, SIM_Num, Geofence)

delete('~/ardupilot/ArduCopter/*.exp')
fileID = fopen('~/Dropbox/Generator/SIL.exp');
A = fileread('~/Dropbox/Generator/SIL.exp');
script_data = {};
tline = 0;
[~,~] = size(fileID);
Enter = '\r';
while tline ~=-1
    tline = fgetl(fileID);
    if tline ~=-1
        script_data = [script_data;tline];
    end
end
NTitles = length(SIM_Title);
Main_ID = fopen('~/ardupilot/ArduCopter/MAIN.sh','w');
bash_header = sprintf('#!/bin/bash\n');
execution_allowance = sprintf('chmod a+x *.exp\n');
sleep = sprintf('sleep 10\n');
fwrite(Main_ID, bash_header)
fwrite(Main_ID, execution_allowance)
fwrite(Main_ID, sleep)
main_script = './%s | wait |echo "STARTING SCRIPT %g"\n';
%Convert strings to cells
SIM_Title = (SIM_Title);
SIM_Param_Initial = (SIM_Param_Initial);
SIM_Param_Final = (SIM_Param_Final);

%Returning the lengths of all user input vectors
L_SIM_Param_Initial = length(SIM_Param_Initial);

for i = 1:L_SIM_Param_Initial
    
%Dynamically Changing the iteration of tests to perform
str_SIM_NUM = 'for {set i 1} {$i <= %g} {incr i} {';
sent_SIM_NUM = sprintf(str_SIM_NUM,char(SIM_Num(i)));
script_data(3,1) = {sent_SIM_NUM};


%Dynamically Changing the simulation speed of tests
str_SIM_Speed = 'send "param set SIM_SPEEDUP %g%s"';
sent_SIM_Speed = sprintf(str_SIM_Speed,char(SIM_Speed(i)), Enter);
script_data(28,1) = {sent_SIM_Speed};
script_data(42,1) = {sent_SIM_Speed};
script_data(56,1) = {sent_SIM_Speed};
script_data(71,1) = {sent_SIM_Speed};

%Dynamically Enable/Disable Geofence
str_GEOFENCE = 'send "param set FENCE_ENABLE %g%s"';
sent_GEOFENCE= sprintf(str_GEOFENCE,char(Geofence(i)), Enter);
script_data(70,1) = {sent_GEOFENCE};

%Dynamically changing the type and value of initial parameter
str_SIM_Initial_Param = 'send "param set %s %g%s"';
sent_SIM_Initial_Param = sprintf(str_SIM_Initial_Param,SIM_Param_Initial{i}, char(SIM_Param_Initial_Value(i)),Enter);
script_data(76,1) = {sent_SIM_Initial_Param};

%Dynamically changing the type and value of final parameter
str_SIM_Final_Param = 'send "param set %s %g%s"';
sent_SIM_Final_Param = sprintf(str_SIM_Final_Param,SIM_Param_Final{i}, char(SIM_Param_Final_Value(i)),Enter);
script_data(97,1) = {sent_SIM_Final_Param};

%Dynamically creating files for each test 
str_SIM_Title = '~/Dropbox/ArduPilot_Logs/%s';
sent_SIM_Title = sprintf(str_SIM_Title,char(SIM_Title(i)));
mkdir(sent_SIM_Title,'Logs')

%SUCCESFFUL FLIGHT Dynamically move, and rename the logs to the specified file
str_SIM_Copy = 'file copy -force ~/ardupilot/ArduCopter/mav.tlog ~/Dropbox/ArduPilot_Logs/%s/Logs';
sent_SIM_Title_Copy = sprintf(str_SIM_Copy,char(SIM_Title(i)));
script_data(30,1) = {sent_SIM_Title_Copy};

str_SIM_Rename = 'file rename -force -- ~/Dropbox/ArduPilot_Logs/%s/Logs/mav.tlog ~/Dropbox/ArduPilot_Logs/%s/Logs/%s_$i.tlog';
sent_SIM_Title_Rename = sprintf(str_SIM_Rename,char(SIM_Title(i)),char(SIM_Title(i)),char(SIM_Title(i)));
script_data(32,1) = {sent_SIM_Title_Rename};

%TIMER FAILURE Dynamically move, and rename the logs to the specified file
str_SIM_Copy_T = 'file copy -force ~/ardupilot/ArduCopter/mav.tlog ~/Dropbox/ArduPilot_Logs/%s/Logs';
sent_SIM_Title_Copy_T = sprintf(str_SIM_Copy_T,char(SIM_Title(i)));
script_data(44,1) = {sent_SIM_Title_Copy_T};

str_SIM_Rename_T = 'file rename -force -- ~/Dropbox/ArduPilot_Logs/%s/Logs/mav.tlog ~/Dropbox/ArduPilot_Logs/%s/Logs/T_%s_$i.tlog';
sent_SIM_Title_Rename_T = sprintf(str_SIM_Rename_T,char(SIM_Title(i)),char(SIM_Title(i)),char(SIM_Title(i)));
script_data(46,1) = {sent_SIM_Title_Rename_T};

%BATTERY FAILURE Dynamically move, and rename the logs to the specified file
str_SIM_Copy_B = 'file copy -force ~/ardupilot/ArduCopter/mav.tlog ~/Dropbox/ArduPilot_Logs/%s/Logs';
sent_SIM_Title_Copy_B = sprintf(str_SIM_Copy_B,char(SIM_Title(i)));
script_data(58,1) = {sent_SIM_Title_Copy_B};

str_SIM_Rename_B = 'file rename -force -- ~/Dropbox/ArduPilot_Logs/%s/Logs/mav.tlog ~/Dropbox/ArduPilot_Logs/%s/Logs/B_%s_$i.tlog';
sent_SIM_Title_Rename_B = sprintf(str_SIM_Rename_B,char(SIM_Title(i)),char(SIM_Title(i)),char(SIM_Title(i)));
script_data(60,1) = {sent_SIM_Title_Rename_B};

TitleSpec = '%s.exp';
str = sprintf(TitleSpec,char(SIM_Title(i)));
spr_main_script = sprintf(main_script, str, i);
fwrite(Main_ID, spr_main_script)



fileI = fopen(str,'w');
[nrows,~] = size(script_data);
formatSpec = '%s\n';
for row = 1:nrows
    fprintf(fileI,formatSpec,script_data{row,:});
end
fclose(fileI);
S_FIleName = '%s.exp';
Titlesr = sprintf(S_FIleName,char(SIM_Title(i)));
movefile(Titlesr,'~/ardupilot/ArduCopter')
end
fclose(Main_ID)
end

