%% Set Film/Developer Data
lucky_stand_data = {
     'Agfa Rodinal',        100,       50,      60,     20;
     'Sp?rsinn HCD',         15       100,       8.0,   20;
     'Sp?rsinn HCD',         25       800,      30.5,   20;
     'Agfa Rodinal',        100       100,      50,     20;         % error! http://filmdev.org/recipe/show/5417
     'Agfa Rodinal',        200        50,     120,     20;
     };

%% Calculate Estimate
[results, meanalpha, developers] = plot_and_estimate('Lucky SHD 100 (stand development)', lucky_stand_data)