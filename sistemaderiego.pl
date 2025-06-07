% ---------------------
% ESTADO DE LOS SENSORES
% ---------------------
humedad_suelo(baja).
temperatura(35).
hora(20).
pronostico_lluvia(false).

% ---------------------
% CONDICIONES DE TIEMPO
% ---------------------
hora_adecuada :-
    hora(H),
    (H < 10 ; H > 18).

% ---------------------
% ACTIVACIÓN DEL RIEGO
% ---------------------
activar_riego :-
    humedad_suelo(baja),
    pronostico_lluvia(false),
    hora_adecuada.

% ---------------------
% ESTADO DEL RIEGO
% ---------------------
estado_riego('Activado') :-
    activar_riego.

estado_riego('No activado') :-
    \+ activar_riego.

% ---------------------
% ALERTAS
% ---------------------
alerta_calor :-
    temperatura(T),
    T >= 32.

% ---------------------
% RECOMENDACIÓN GENERAL
% ---------------------
recomendacion :-
    activar_riego,
    alerta_calor,
    !,
    writeln('⚠️ Riego activado con temperatura alta. Considere riego nocturno o por goteo.').

recomendacion :-
    activar_riego,
    !,
    writeln('✅ Riego activado en condiciones normales.').

recomendacion :-
    writeln('💧 El riego no es necesario en este momento.').

% ---------------------
% OPCIONAL: VISUALIZAR ESTADO COMPLETO
% ---------------------
resumen :-
    humedad_suelo(H),
    temperatura(T),
    hora(Hora),
    pronostico_lluvia(Lluvia),
    writeln('--- Estado Actual del Sistema ---'),
    writeln(['Humedad del suelo:', H]),
    writeln(['Temperatura:', T]),
    writeln(['Hora:', Hora]),
    writeln(['Pronóstico de lluvia:', Lluvia]).
