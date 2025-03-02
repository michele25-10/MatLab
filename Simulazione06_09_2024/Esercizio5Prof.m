% Cognome Nome
% Matricola
% ----------------------------
% esercizio 5 - 06/09/2024
% ----------------------------
close all; clear all; clc;
disp('Esercizio 5');

f = @(x)(0.001 * exp(3 * pi - 2 * x.^2) .* sin(-4 * x));
a = 0.8; b = 1.3; N = 201; gradiPol = [2, 5];

for k = 1:2
    n = gradiPol(k); 
    n1 = n + 1;
    tCheb = cos(pi * (2 * [n:-1:0]' + 1) / (2 * n1));
    xCheb = 0.5 * ((b - a) * tCheb + (a + b));
    fxCheb = f(xCheb);

    xx = linspace(a, b, N)'; % campionamento uniforme di [a,b]
    yy = f(xx); % valori di f nei punti campionati

    [ww, ~] = polyLagrange(xCheb, fxCheb, xx); % valori del pol. di Lagrange
    zz = polyval(polyfit(xCheb, fxCheb, n), xx); % valori di p_n(x) da polyfit

    % Generazione dei grafici (nota: l'unico graphics handle indispensabile è lh)
    fig(k) = figure;
    ax(k) = gca; % graphics handle di figura e axes

    p1h(:, k) = ... % graphics handle del plot
        plot([xx(1); xx(end)], [0; 0], 'k-', ... % asse delle ascisse
        xCheb, zeros(size(xCheb)), 'bo', ... % nodi di interpolazione
        xCheb, fxCheb, 'b*'); % valori di f(x) nei nodi di interp.

    hold on;
    p2h(1:2, k) = plot(xx, yy, 'b-', ... % grafico della funzione
        xx, ww, 'r-'); % grafico del pol. interp. da polyLagrange
    hold off;

    th(k) = title(sprintf('Funzione e pol. interp. su %d nodi di Chebychev', n1));
    xh(k) = xlabel('Intervallo di interpolazione');
    yh(k) = ylabel(sprintf('Valori di f(x) e p_{%d}(x)', n));

    lh(k) = legend([p2h(1:2, k); p1h(2:3, k)], 'Funzione', 'Polinomio di Lagrange', ...
        'Nodi di interpolazione', 'Punti di interpolazione', ...
        'Location', 'south');

    hold on;
    p2h(3, k) = plot(xx, zz, 'k--');
    hold off;

    % aggiornamento della legenda per la nuova curva aggiunta
    str = get(lh(k), 'String');
    str{end} = 'Pol. interp. con polyfit';
    set(lh(k), 'String', str);
end
