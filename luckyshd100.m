%% Set Film/Developer Data
lucky_data = { 
%   Name                 1+n      ASA     Zeit   Temp
    'HC-110',             49      100,     13,     20;
    'ID-11/D-76',          1      100,     6,      20;
    'ID-11/D-76',          1      100,     7,      20;
    'ID-11/D-76',          1      400,     8,      20;
    'XTOL',                3      400,     36,     20;
    'MicroMF',             1      100,     7,      20;
    'Ilfosol 3',           9      100,     7.5,    20;
    'MicroMF',             0      100,     8,      20;
    %'MicroMF',             1      400,     16,     25;
    %'MicroMF',             1      100,     7,      25;
    %'MicroMF',             1      100,     7,      28;
    'MicroMF',             0      100,     14,     20;
    'HC-110',             31      100,     7.5,    20;
    'MicroMF',             0      100,     9.5,    20;
    'Microphen',           1      100,     6,      20;
    'Microphen',           1      100,     10,     20;
    'Fomadon R09',        50      100,     10,     20;

    'Rodinal',            25      100,      6.5     20;
    'Rodinal',            25      100,      7       20;
    'Rodinal',            25      400,      7       20;
    %'Rodinal',           25      100,      5.0     23;
    %'Rodinal',            25      400,     25.0     22;
    'Rodinal',            50      100,     12.0     20;
    'Rodinal',            50      100,     13.0     20;
    'Rodinal',            50      160,     20.0     20;
    'Rodinal',           100      100,     20.0     20;

    %'Rodinal',            25     1600,     25.0     20; % Lucky 400
    'Rodinal',            25      800,     16.0     20; % Lucky 400 - adapted
};

%{
lucky_stand = {
     'Agfa Rodinal',        100,       50,      60,     20;
     'Spürsinn HCD',         15       100,       8.0,   20;
     'Spürsinn HCD',         25       800,      30.5,   20;
     'Agfa Rodinal',        100       100,      50,     20;         % error! http://filmdev.org/recipe/show/5417
     'Agfa Rodinal',        200        50,     120,     20;
     };
%}

%% Calculate Estimate
[results, meanalpha, developers] = plot_and_estimate('Lucky SHD 100', lucky_data)