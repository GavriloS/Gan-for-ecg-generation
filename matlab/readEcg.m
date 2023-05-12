[sig, Fs, tm] = rdsamp('mitdb/219', 1);
disp(length(sig));

Fs = 360;                                                  % Sampling Frequency (Hz)
Fn = Fs/2;                                                  % Nyquist Frequency (Hz)
Wp = [1.1 100]/Fn;                                          % Passband Frequency (Normalised)
Ws = [0.1 101]/Fn;                                          % Stopband Frequency (Normalised)
Rp =   1;                                                   % Passband Ripple (dB)
Rs = 150;                                                   % Stopband Ripple (dB)
[n,Ws] = cheb2ord(Wp,Ws,Rp,Rs);                             % Filter Order
[z,p,k] = cheby2(n,Rs,Ws);                                  % Filter Design
[sosbp,gbp] = zp2sos(z,p,k);                                % Convert To Second-Order-Section For Stability
figure(3)
disp(sosbp)
freqz(sosbp, 2^16, Fs)   
disp("Drugi")
disp(sosbp)% Filter Bode Plot
filtered_signal = filtfilt(sosbp, gbp, sig);   

disp(length(filtered_signal));
csvwrite('filtered_signal.csv',filtered_signal) 