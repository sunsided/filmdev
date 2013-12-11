%% Set Film/Developer Data
trix400_stand_data = {
%   Name            1+n      ASA     Time   Temperature
    'Rodinal'       50       1600    18.5    20; % http://kzar.net/wiki/Photo/D%E9veloppement
    'Rodinal'       50       3200    33      20;
    'Rodinal'       50       12800   51      20;

    'Rodinal'       100      3200    120     20; % FilmDev
    'Rodinal'       100      1000     60     20;
    'Rodinal'       100       400     60     20;
    'Rodinal'       100      1600    120     20;
    'Rodinal'       100      1600     60     20;
    'Rodinal'       100       400     60     20;
    'Rodinal'       100      1250     60+(15/60)     20;
    'Rodinal'       100      3200     12*60  20;
    %'Rodinal'        50       400     10*60+(15/60)  20;
    'Rodinal'       100       400     60     20;
    'Rodinal'        50      3200     33     20;
    'Rodinal'       100       320     60     20;
};

%% Calculate Estimate
[results, meanalpha, developers] = plot_and_estimate('Tri-X 400 (stand development)', trix400_stand_data);