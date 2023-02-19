load('2_KINEMATICS.mat');
%% number: %d  strings: %s enter:\r\n %8.4f
name = 'first test';
nRows = 'nRows=';
nColumns = 'nColumns=';
unit = 'Units are S.I. units (second, meters, Newtons, ...)';
inDegrees = 'Angles are in degrees.';
endheader = 'endheader';
rows = 2500;
columns = 24; %24 dof
numbers = 1;
subject = 1;
fp = fopen('mot_with05xyz.txt','at');
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

%% 1time	2pelvis_tilt	3pelvis_list	4pelvis_rotation	5pelvis_tx	6pelvis_ty	7pelvis_tz	
% 8hip_flexion_r	9hip_adduction_r	10hip_rotation_r	11knee_angle_r	12ankle_angle_r	13subtalar_angle_r	
% 14hip_flexion_l	15hip_adduction_l	16hip_rotation_l	17knee_angle_l	18ankle_angle_l	19subtalar_angle_l	
% 20lumbar_extension	21lumbar_bending	22lumbar_rotation	23mtp_angle_r	24mtp_angle_l
% Columns = 24
t = {'time','pelvis_tilt','pelvis_list','pelvis_rotation','pelvis_tx','pelvis_ty','pelvis_tz',...
    'hip_flexion_r','hip_adduction_r','hip_rotation_r','knee_angle_r','ankle_angle_r','subtalar_angle_r',...
    'hip_flexion_l','hip_adduction_l','hip_rotation_l','knee_angle_l','ankle_angle_l','subtalar_angle_l',...
    'lumbar_extension','lumbar_bending','lumbar_rotation','mtp_angle_r','mtp_angle_l'};
for i = 1:columns
    fprintf(fp,'%s\t',t{i});%\t or ' ' 
end
fprintf(fp,'%s\r','');
time = 0.01:0.01:25;
zero = zeros(1,2500);
%% data import



pitch = table2array(KINEMATICS_data(1,2));
pitch_angle = pitch{1,1}./pi*180;
roll = table2array(KINEMATICS_data(1,3));
roll_angle = roll{1,1}./pi*180;
yaw = table2array(KINEMATICS_data(1,4));
yaw_angle = yaw{1,1}./pi*180;

hip = table2array(KINEMATICS_data(1,14));
hip_angle = hip{1,1};
knee = table2array(KINEMATICS_data(1,13));
knee_angle = knee{1,1};
ankle = table2array(KINEMATICS_data(1,12));
ankle_angle = ankle{1,1};

tx = KINEMATICS_data.Mean_HIP{1,1}.HIP_Data{1,1}; %qianhou
ty = KINEMATICS_data.Mean_HIP{1,1}.HIP_Data{2,1}; %shangxia

for k = 1:rows
    %fprintf(fp,'%d\t','');
    fprintf(fp,'%8.4f\t',time(k));%1 times
    fprintf(fp,'%8.4f\t',pitch_angle(subject,k));%2 tilt
    fprintf(fp,'%8.4f\t',roll_angle(subject,k));%3 list
    fprintf(fp,'%8.4f\t',yaw_angle(subject,k));%4 rotation
    fprintf(fp,'%8.4f\t',tx(subject,k)*0.5-0.1);%5x
    fprintf(fp,'%8.4f\t',ty(subject,k)+0.1);%6y
    fprintf(fp,'%8.4f\t',zero(k));%7z
    fprintf(fp,'%8.4f\t',hip_angle(subject,k));%8flexion
    fprintf(fp,'%8.4f\t',zero(k));%3
    fprintf(fp,'%8.4f\t',zero(k));%3
    fprintf(fp,'%8.4f\t',knee_angle(subject,k));%11
    fprintf(fp,'%8.4f\t',ankle_angle(subject,k));%12
    fprintf(fp,'%8.4f\t',zero(k));%13
    fprintf(fp,'%8.4f\t',hip_angle(subject,k));%14
    fprintf(fp,'%8.4f\t',zero(k));%15
    fprintf(fp,'%8.4f\t',zero(k));%16
    fprintf(fp,'%8.4f\t',knee_angle(subject,k));%17
    fprintf(fp,'%8.4f\t',ankle_angle(subject,k));%18
    fprintf(fp,'%8.4f\t',zero(k));%19
    fprintf(fp,'%8.4f\t',zero(k));%20
    fprintf(fp,'%8.4f\t',zero(k));%21
    fprintf(fp,'%8.4f\t',zero(k));%22
    fprintf(fp,'%8.4f\t',zero(k));%23
    fprintf(fp,'%8.4f\t',zero(k));%24
    fprintf(fp,'%8.4f\r','');
end
fclose(fp);
