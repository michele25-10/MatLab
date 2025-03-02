% Cognome Nome
% Matricola
close all;
clear all;

% ----------------------------
% Esercizio 6 - 26/01/2018
% ----------------------------
disp('Esercizio 6');

% Definizione della funzione e della sua derivata
f = @(x) (tan(1 - x) - 2/3);
fprimo = @(x) (-1 - tan(1 - x).^2); % Oppure @(x) (-1 ./ cos(1 - x).^2)

% Parametri
a = 2.7; 
b = 4; 
x0 = 2.8;
tolx = 1.0e-5; 
tolf = 1.0e-7; 
maxit = 10; 
trace = 1;

% Metodo di Newton
[xs, it, xk, yk] = myNewton(f, fprimo, x0, tolx, tolf, maxit, trace);

% Preparazione dei dati per il grafico
xx = linspace(a, b, 201)';
yy = f(xx);

% Grafico del metodo di Newton
figure;
plot([xx(1); xx(end)], [0; 0], 'k-', ...          % Asse delle ascisse
     xx, yy, 'b-', ...                           % Grafico della funzione
     xk, zeros(size(xk)), 'ko', ...              % Iterazioni xk del metodo di Newton
     xk, yk, 'ro', ...                           % Valori di f(xk)
     xs, f(xs), 'r*');                           % Soluzione calcolata
title('Metodo di Newton applicato a f(x) = tan(1 - x) - (2/3)', 'FontSize', 16);
xlabel('Intervallo di ricerca degli zeri');
ylabel('Valori di f(x)');
grid on;

% Parte opzionale: Linee per visualizzare le iterazioni
hold on;
plot([xk xk]', [zeros(size(xk)) yk]', '--k');    % Linee verticali
plot([xk(1:end-1) xk(2:end)]', ...
     [yk(1:end-1) zeros(size(yk, 1) - 1, 1)]', '-k'); % Linee orizzontali
hold off;

% ---- Parte opzionale: implementazione alternativa ------------------------
% Uncomment per usare questa versione
% hold on;
% lh1 = line([xk xk]', [zeros(size(xk)) yk]');
% set(lh1, 'LineStyle', '--', 'Color', 'k', 'MarkerEdgeColor', 'r');
% lh2 = line([xk(1:end-1) xk(2:end)]', [yk(1:end-1) zeros(size(yk, 1) - 1, 1)]');
% set(lh2, 'LineStyle', '-', 'Color', 'k');
% hold off;
