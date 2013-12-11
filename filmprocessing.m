% $Id%
clear; close all;   

%% Filme definieren

%{
lucky = [ 
    'HC-110 1:49',          100,    13,     20;
    'ID-11 stock',          100,     6,     20;
    'XTOL 1+3',             400,    36,     20;
    'MicroMF stock',        100,     7,     20;
    'Ilfosol 3 1:9',        100,    7.5,    20;
    'MicroMF stock',        100,     8,     20;
    'MicroMF stock',        400,     16,    25;
    'MicroMF stock',        100,     7,     25;
    'MicroMF stock',        100,     14,    20;
    'HC-110 1:31',          100,    7.5,    20;
    'Agfa Rodinal 1:50',    100,     12,    20;
    'MicroMF stock',        100,     9.5,    20;
    'Microphen stock',      100,     6,     20;
    'Microphen stock',      100,     10,     20;
    'Fomadon R09 1:50',     100,     10,     20;
];

lucky_stand = [
     'Agfa Rodinal 1:100',    50,     60,     20;
     'Spürsinn HCD 1:25',     800,    30.5,  20;
     'Agfa Rodinal 1:100',    100,    50,    20;         % Fehler! http://filmdev.org/recipe/show/5417
     'Agfa Rodinal 1:200',    50,     120,     20;
     ];
%}

trix_rodinal = [
%   1+n      ASA     Zeit   Temp
    50       100     7.5     20;
    50       200     9       20;
    50       100     7.5     20;
%    100      200     20      20;
%    100      250     20      20;
%    100      250     15      20;
%    24       320     6       20;
%    25       400     7       20;
%    35       400     10      20;
    50       400     13      20;
%    60       400     15      20;
%    75       400     17.5    20;
%    100      400     20      20;
    %100      400     24      21;
    50       640     15.5    20;
    50       800     16.5    20;
    %100      800     17.5    24;
    50       1600    18.5    20; % stand
    50       3200    33      20; % stand
    50       12800   51      20; % stand
];

%% Verdünnungen auswerten und plotten
figure('Name', 'Entwicklungszeiten', 'NumberTitle', 'off');

% Auswerten
dilutions = unique(trix_rodinal(:,1));
labels = cell(size(dilutions));
for i=1:length(dilutions)
    dilution = dilutions(i);
    
    % Indizes aller Einträge dieser Verdünnung in der Hauptliste ermitteln
    indices = find(trix_rodinal(:,1) == dilution);
    
    % Werte extrahieren
    values = zeros(length(indices), 2);
    values(:, 1) = trix_rodinal(indices,2);
    values(:, 2) = trix_rodinal(indices,3);
    values = sortrows(values);
    
    % Plotten.
    plot(values(:,1), values(:,2), '+-', 'LineWidth', 2);
    hold all;
    
    % Legende ergänzen
    label = mat2str(['1+' num2str(dilution)]);
    labels{i} = label;
end

t = min(trix_rodinal(:,2)):10:max(trix_rodinal(:,2));
x = (1-exp(- 3.5/(max(trix_rodinal(:,2)-min(trix_rodinal(:,2)))) *(t-100)))  *(51-7.5)+7.5;
plot(t, x, 'r:', 'LineWidth', 2);

% Legende und Achsenbeschriftungen
legend(labels, 'Location', 'SouthEast');
grid on;
grid(gca,'minor');
xlabel('Empfindlichkeit [ASA]');
ylabel('Entwicklungszeit [Minuten]');
