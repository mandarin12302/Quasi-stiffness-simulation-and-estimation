load('2_KINEMATICS.mat');
%% number: %d  strings: %s enter:\r\n
name = 'first test';
nRows = 'nRows=';
nColumns = 'nColumns=';
unit = 'Units are S.I. units (second, meters, Newtons, ...)';
inDegrees = 'Angles are in degrees.';
endheader = 'endheader';
rows = 2500;
columns = 7;
numbers = 1;
subject = 1;
fp = fopen('test.mot','at');
% name
fprintf(fp,'%s\r',name);
% rows and columns
fprintf(fp,'%s',nRows);
fprintf(fp,'%d\r',rows);
fprintf(fp,'%s',nColumns);
fprintf(fp,'%d\r',columns);
fprintf(fp,'%d\r','');
% unit
fprintf(fp,'%s\r',unit);
% indegrees
fprintf(fp,'%s\r',inDegrees);
fprintf(fp,'%d\r','');
% endheader
fprintf(fp,'%s\r',endheader);

%% titles time hip_flexion_r knee_angle_r ankle_angle_r hip_flexion_l knee_angle_l ankle_angle
t = {'time','hip_flexion_r','knee_angle_r','ankle_angle_r','hip_flexion_l','knee_angle_l','ankle_angle_l'};
for i = 1:columns
    fprintf(fp,'%s\t',t{i});%\t or ' ' 
end
fprintf(fp,'%s\r','');
time = 0.01:0.01:25;
%% data import

hip = table2array(KINEMATICS_data(1,14));
hip_angle = hip{1,1};
knee = table2array(KINEMATICS_data(1,13));
knee_angle = knee{1,1};
ankle = table2array(KINEMATICS_data(1,12));
ankle_angle = ankle{1,1};
for k = 1:rows
    fprintf(fp,'%d\t','');
    fprintf(fp,'%d\t',time(k));
    fprintf(fp,'%d\t',hip_angle(subject,k));
    fprintf(fp,'%d\t',knee_angle(subject,k));
    fprintf(fp,'%d\t',ankle_angle(subject,k));
    fprintf(fp,'%d\t',hip_angle(subject,k));
    fprintf(fp,'%d\t',knee_angle(subject,k));
    fprintf(fp,'%d\t',ankle_angle(subject,k));
    fprintf(fp,'%d\r','');
end
fclose(fp);
