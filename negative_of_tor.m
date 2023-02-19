load('2_KINEMATICS.mat');
load('3_KINETICS.mat');
load('4_AMP.mat');
%% number: %d  strings: %s enter:\r\n %8.4f
name = 'torque';
nRows = 'nRows=';
nColumns = 'nColumns=';
unit = 'Units are S.I. units (second, meters, Newtons, ...)';
inDegrees = 'Angles are in degrees.';
endheader = 'endheader';
rows = 2500;
columns = 19; %19 GRF
numbers = 1;
subject = 2;
fp = fopen('sub2_tor_n.txt','at');
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

%%time	1ground_force_vx	2ground_force_vy	3ground_force_vz	4ground_force_px	5ground_force_py
% 6ground_force_pz	71_ground_force_vx	81_ground_force_vy	91_ground_force_vz	101_ground_force_px	111_ground_force_py	
% 121_ground_force_pz	13ground_torque_x	14ground_torque_y	15ground_torque_z	161_ground_torque_x	171_ground_torque_y	181_ground_torque_z
% Columns = 19
t = {'time','ground_force_vx','ground_force_vy','ground_force_vz','ground_force_px','ground_force_py','ground_force_pz',...
    '1_ground_force_vx','1_ground_force_vy','1_ground_force_vz','1_ground_force_px','1_ground_force_py','1_ground_force_pz',...
    'ground_torque_x','ground_torque_y','ground_torque_z','1_ground_torque_x','1_ground_torque_y','1_ground_torque_z'};
for i = 1:columns
    fprintf(fp,'%s\t',t{i});%\t or ' ' 
end
fprintf(fp,'%s\r','');
time = 0.01:0.01:25;
zero = zeros(1,2500);
%% data import
mass = 75;
g = 9.81;


GRF_px = zero;
GRF_py = KINETICS_data.Mean_COP{2,1}.COP_Data{1,1};
GRF_pz = zero;

GRF_vy = KINETICS_data.Mean_GRF{2,1}.GRF_Data{1,1}.*mass.*g;
GRF_vz = KINETICS_data.Mean_GRF{2,1}.GRF_Data{2,1}.*mass.*g;

pitch = table2array(KINEMATICS_data(2,2));
pitch_angle = pitch{1,1}./pi*180;
roll = table2array(KINEMATICS_data(2,3));
roll_angle = roll{1,1}./pi*180;
yaw = table2array(KINEMATICS_data(2,4));
yaw_angle = yaw{1,1}./pi*180;

hip = table2array(KINEMATICS_data(2,14));
hip_angle = hip{1,1};
knee = table2array(KINEMATICS_data(2,13));
knee_angle = knee{1,1};
ankle = table2array(KINEMATICS_data(2,12));
ankle_angle = ankle{1,1};

torque = AMP_data.Mean_tau_actual{2,1}{1,1};


for k = 1:rows
    %fprintf(fp,'%d\t','');
    fprintf(fp,'%8.8f\t',time(k));%1 times

%     fprintf(fp,'%8.8f\t',GRF_vy(subject,k));%2 vx
%     fprintf(fp,'%8.8f\t',GRF_vz(subject,k));%3 vy
%     fprintf(fp,'%8.8f\t',zero(k));%4 vz 0
%     fprintf(fp,'%8.8f\t',GRF_py(subject,k));%5 px
%     fprintf(fp,'%8.8f\t',GRF_pz(subject,k));%6 py
%     fprintf(fp,'%8.8f\t',GRF_px(subject,k));%7 pz 0
% 
%     fprintf(fp,'%8.8f\t',GRF_vy(subject,k));%8 vx
%     fprintf(fp,'%8.8f\t',GRF_vz(subject,k));%9 vy
%     fprintf(fp,'%8.8f\t',zero(k));%10 vz 0
%     fprintf(fp,'%8.8f\t',GRF_py(subject,k));%11 px
%     fprintf(fp,'%8.8f\t',GRF_pz(subject,k));%12 py
%     fprintf(fp,'%8.8f\t',GRF_px(subject,k));%13 pz 0

    fprintf(fp,'%8.8f\t',zero(k));%14
    fprintf(fp,'%8.8f\t',zero(k));%15
    fprintf(fp,'%8.8f\t',zero(k));%16
    fprintf(fp,'%8.8f\t',zero(k));%17
    fprintf(fp,'%8.8f\t',zero(k));%18
    fprintf(fp,'%8.8f\t',zero(k));%19
    fprintf(fp,'%8.8f\t',zero(k));%14
    fprintf(fp,'%8.8f\t',zero(k));%15
    fprintf(fp,'%8.8f\t',zero(k));%16
    fprintf(fp,'%8.8f\t',zero(k));%17
    fprintf(fp,'%8.8f\t',zero(k));%18
    fprintf(fp,'%8.8f\t',zero(k));%19
    fprintf(fp,'%8.8f\t',zero(k));%14
    fprintf(fp,'%8.8f\t',zero(k));%15
    fprintf(fp,'%8.8f\t',zero(k));%16
    fprintf(fp,'%8.8f\t',zero(k));%17
    fprintf(fp,'%8.8f\t',zero(k));%18
    fprintf(fp,'%8.8f\t',torque(k));%19
    fprintf(fp,'%8.4f\r','');
end
fclose(fp);
