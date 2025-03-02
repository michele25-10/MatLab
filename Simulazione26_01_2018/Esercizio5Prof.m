% Cognome Nome
% Matricola
close all
clear all

% ----------------------------
% Esercizio 5 - 26/01/2018
% ----------------------------
disp('Esercizio 5');

% Definizione della funzione
f = @(x) (exp(-7 * (x - 3).^2) / 3);

% Intervallo di interpolazione
a = 1; 
b = 5;

% Punti per il grafico della funzione originale
xx = linspace(a, b, 201)';
yy = f(xx);

% Creazione delle figure
fig1 = figure(1);
fig2 = figure(2); % Opzionale

% Numero massimo di nodi
N = 10;

% Ciclo per gradi crescenti del polinomio interpolante
for n = 1:N
    % Creazione dei nodi di interpolazione
    x = linspace(a, b, n + 1)';
    y = f(x);

    % Calcolo del polinomio interpolante con polyLagrange
    [zz, ~] = polyLagrange(x, y, xx);

    % Figura 1: Funzione originale e polinomio interpolante
    figure(1);
    plot([xx(1); xx(end)], [0; 0], 'k-', ... % Asse delle ascisse
         xx, yy, 'b-', ...                  % Grafico della funzione originale
         xx, zz, 'r-', ...                  % Grafico del polinomio interpolante
         x, zeros(size(x)), 'ko', ...       % Nodi di interpolazione
         x, y, 'ro');                       % Valori del polinomio nei nodi
    title(sprintf('Funzione e polinomio interpolante di grado %d', n), 'FontSize', 16);
    xlabel('Intervallo di interpolazione');
    ylabel('Valori di f(x) e p_n(x)');
    grid on;

    % Figura 2: Errore di interpolazione (opzionale)
    figure(2);
    plot([xx(1); xx(end)], [0; 0], 'k-', ... % Asse delle ascisse
         xx, yy - zz, 'r-', ...             % Errore di interpolazione
         x, zeros(size(x)), 'ko');          % Nodi di interpolazione
    title(sprintf('Errore con polinomio interpolante di grado %d', n), 'FontSize', 16);
    xlabel('Intervallo di interpolazione');
    ylabel('Errore di interpolazione f(x) - p_n(x)');
    grid on;

    % Pausa tra un'interpolazione e l'altra
    pause(2);
end
