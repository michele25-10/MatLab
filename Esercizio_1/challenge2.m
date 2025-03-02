% segnale stereo (matrice con due colonne)
% la freq. di campionamento è nel file
% è stato effettuato 1/5 dei campionamenti 

badSignal = load('badSignal.mat');

passo = 5; 

ySub = badSignal.ySub;
[ ySubLength, numCol ] = size(ySub);

ySubCorr = ySub(1:passo:ySubLength, :);

[ ySubCorrLength, numColSubCorr ] = size(ySubCorr);

xx = [1:ySubLength]'; 

yy1 = spline(1 : passo : ySubLength, ySubCorr(:, 1), xx);
yy2 = spline(1 : passo : ySubLength, ySubCorr(:, 2), xx);

yy = [yy1, yy2]; 

player = audioplayer(yy, badSignal.FS);
player.play(); 

%yy1 = ppval(p1, [1:ySubLength]'); 
%yy2 = ppval(p2, [1:ySubLength]'); 



%figure(1); 
%plot(xx, [yy1], '-b', xx,  yy2, '-g'); 
%title('Grafico della traccia corretta');

%figure(2); 
%plot(xx, ySub(:, 1), '-y', xx, ySub(:, 2), '-r'); 
%title('Grafico della traccia corrotta');


%figure(1); 
%plot(xx, ySub(:, 1), '-b', xx, yy1, '-g'); 
%title('Grafico della traccia del primo segnale');

%figure(2); 
%plot(xx, ySub(:, 2), '-y', xx, yy2, '-r'); 
%title('Grafico della traccia del secondo segnale');


