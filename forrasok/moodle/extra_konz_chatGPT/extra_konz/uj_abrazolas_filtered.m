clear all
close all


load villanymotor.mat % adatok beolvasasa

input_matrix = adatokmotor; %atnevezes
result_matrix = process_matrix(input_matrix); %fuggveny hivasa
%disp(result_matrix);

result_matrix(end-3:end,:) = []; %utolso 4 sort torlom, mert ott nem ment vegig a meres

% %szetbontom oszlopokra, az abrazolashoz
% x_proc = result_matrix(:,1);
% y_proc = result_matrix(:,2);
% z_proc = result_matrix(:,3);
% 
% %abrazolas
% figure()
% scatter3(x_proc,y_proc,z_proc,'b*')
% xlabel('fordulatszam [rpm]')
% ylabel('nyomatek [Nm]')
% zlabel('hatasfok')
% title('hatasfokmezo')


filtered_matrix = smooth_segments(result_matrix); %fuggveny hivasa
%szetbontom oszlopokra, az abrazolashoz
x_filt = filtered_matrix(:,1);
y_filt = filtered_matrix(:,2);
z_filt = filtered_matrix(:,3);

figure()
scatter3(x_filt,y_filt,z_filt,'b*')
xlabel('fordulatszam [rpm]')
ylabel('nyomatek [Nm]')
zlabel('hatasfok')
title('hatasfokmezo')

hold on


final_matrix = create_final_matrix(filtered_matrix);

[~, unique_idx, ~] = unique(final_matrix, 'rows');
unique_matrix = final_matrix(unique_idx, :);



%egyes fordulatszamokhoz tartozo maximumok jelolese az abran
scatter3(unique_matrix(:,1),unique_matrix(:,2),unique_matrix(:,3),'ro','LineWidth',2)
hold off


figure()
scatter(unique_matrix(:, 1), unique_matrix(:, 2), 100, unique_matrix(:, 3), 'filled');
colorbar;
xlabel('fordulatszam [rpm]');
ylabel('nyomatek [Nm]');
title('2D abra, a hatasfok szinezessel');
%esetleg lehet basic fitting-gel linearis illeszteni ra