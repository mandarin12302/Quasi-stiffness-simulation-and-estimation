load("2_KINEMATICS.mat");
%% load subject moment data (1time 2time     3hip 4knee 5ankle)

load('sub2_p.txt');

hip = table2array(KINEMATICS_data(1,14));
hip_angle = hip{1,1};
knee = table2array(KINEMATICS_data(1,13));
knee_angle = knee{1,1};
ankle = table2array(KINEMATICS_data(1,12));
ankle_angle = ankle{1,1};
%% subject 2

subject = 2;
hip_moment_1 = sub2_p(:,3)';
knee_moment_1 = sub2_p(:,4)';
ankle_moment_1 = sub2_p(:,5)';
time = sub2_p(:,2)';

hip_angle_1 = hip_angle(subject,:);
knee_angle_1 = knee_angle(subject,:);
ankle_angle_1 = ankle_angle(subject,:);

%%
% windowSize = 50; 
% b = (1/windowSize)*ones(1,windowSize);
% a = 1;
% hip_moment_1 = filter(b,a,hip_moment_1i);
% knee_moment_1 = filter(b,a,knee_moment_1i);
% ankle_moment_1 = filter(b,a,ankle_moment_1i);
% 
% figure(1)
% plot(time,hip_moment_1i)
% hold on
% plot(time,hip_moment_1)
% legend('Input Data','Filtered Data')

%% delta moment / delta angle
stepsize = 25;% 25?50=
step = [1:stepsize+1];
%%
hip_stiffness_1 = zeros(1,1100);%length(ankle_angle_1)

for i = 500:1000
    moment = fit(step',hip_moment_1(i:i+stepsize)','poly1');
    angle = fit(step',hip_angle_1(i:i+stepsize)','poly1');


    d_hipmoment = moment(i+stepsize) - moment(i);
    d_hipangle = (angle(i+stepsize) - angle(i))/180*pi;
    if d_hipangle == 0
        hip_stiffness_1(i) = hip_stiffness_1(i+1);
    else
        hip_stiffness_1(i) = d_hipmoment/d_hipangle;
    end    
end
figure(1)

plot(hip_stiffness_1)
title('Quasi stiffness of hip in positve direction');
xlabel('Time (ms)') ;
ylabel('Quasi Stiffness (N*m/rad)') ;
%legend({'positive','negative'});%,'Location','southwest'
%% 
knee_stiffness_1 = zeros(1,1100);%length(ankle_angle_1)

for i = 500:1000 %:(length(ankle_angle_1)-stepsize)
    moment = fit(step',knee_moment_1(i:i+stepsize)','poly1');
    angle = fit(step',knee_angle_1(i:i+stepsize)','poly1');


    d_hipmoment = moment(i+stepsize) - moment(i);
    d_hipangle = (angle(i+stepsize) - angle(i))/180*pi;
    if d_hipangle == 0
        knee_stiffness_1(i) = knee_stiffness_1(i+1);
    else
        knee_stiffness_1(i) = d_hipmoment/d_hipangle;
    end    
end
figure(2)

plot(knee_stiffness_1)
title('Quasi stiffness of knee in positve direction');
xlabel('Time (ms)') ;
ylabel('Quasi Stiffness (N*m/rad)') ;
%legend({'positive','negative'});%,'Location','southwest'
%% 
ankle_stiffness_1 = zeros(1,1100);%length(ankle_angle_1)

for i = 500:1000
    moment = fit(step',ankle_moment_1(i:i+stepsize)','poly1');
    angle = fit(step',ankle_angle_1(i:i+stepsize)','poly1');


    d_hipmoment = moment(i+stepsize) - moment(i);
    d_hipangle = (angle(i+stepsize) - angle(i))/180*pi;
    if d_hipangle == 0
        ankle_stiffness_1(i) = ankle_stiffness_1(i+1);
    else
        ankle_stiffness_1(i) = d_hipmoment/d_hipangle;
    end    
end
figure(3)

plot(ankle_stiffness_1)
title('Quasi stiffness of ankle in positve direction');
xlabel('Time (ms)') ;
ylabel('Quasi Stiffness (N*m/rad)') ;
%legend({'positive','negative'});%,'Location','southwest'
