load("4_AMP.mat");

time = 0:0.01:24.99;
positive = AMP_data.Mean_tau_actual{1,1}{1, 1};
negative = AMP_data.Mean_tau_actual{2,1}{1, 1};
plot(time,positive,'r',time,negative,'b');
title('Actual Angular Momentum Perturbation');
xlabel('Time (s)') ;
ylabel('Torque (N*m)') ;
legend({'positive','negative'});%,'Location','southwest'