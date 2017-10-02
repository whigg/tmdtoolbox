%  constit returns amplitude, phase, frequency,alpha, species for
%  a tidal constituent identified by a 4 character string
%   This version returns zeros for all phases
%  Usage: [ispec,amp,ph,omega,alpha,constitNum] = constit(c);

function [ispec,amp,ph,omega,alpha,constitNum] = constit(c);
ispec=-1;
amp=0;ph=0;omega=0;alpha=0;constitNum=0;
if( nargout < 6)
   fprintf('Number of output arguments to constit.m does not agree with current usage\n');
end
%  c : character string ID of constituents that the program knows about
%   all other variables are in the same order

% ------- FP edit start --------
% c_data =  ['m2  ';'s2  ';'k1  ';'o1  '; ...
%            'n2  ';'p1  ';'k2  ';'q1  '; ...
%            '2n2 ';'mu2 ';'nu2 ';'l2  '; ...
%            't2  ';'j1  ';'no1 ';'oo1 '; ...
% 	   'rho1';'mf  ';'mm  ';'ssa ';'m4  ';'ms4 ';'mn4 ' ];

c_data1 =  {'m2  ';'s2  ';'k1  ';'o1  '; ...
    'n2  ';'p1  ';'k2  ';'q1  '; ...
    '2n2 ';'mu2 ';'nu2 ';'l2  '; ...
    't2  ';'j1  ';'no1 ';'oo1 '; ...
    'rho1';'mf  ';'mm  ';'ssa ';'m4  ';'ms4 ';'mn4 ' };
% ------- FP edit end --------

constitNum_data = [1,2,5,6,...
	    3,7,4,8,...
	    0,0,0,0,...
	    0,0,0,0,...
		    0,0,0,0,0,0,0];
%   ispec : species type (spherical harmonic dependence of quadropole potential)
ispec_data =   [2;2;1;1; ...
                2;1;2;1; ...
                2;2;2;2; ...
                2;1;1;1; ...
		1;0;0;0;0;0;0];
%   alpha : loading love number ... frequncy dependance here is suspect
alpha_data = [ 0.693;0.693;0.736;0.695; ...
               0.693;0.706;0.693;0.695; ...
               0.693;0.693;0.693;0.693; ...
               0.693;0.693;0.693;0.693; ...
	       0.693;0.693;0.693;0.693;0.693;0.693;0.693];

%  omega : frequencies
omega_data = [1.405189e-04;1.454441e-04;7.292117e-05;6.759774e-05; ...
              1.378797e-04;7.252295e-05;1.458423e-04;6.495854e-05; ...
              1.352405e-04;1.355937e-04;1.382329e-04;1.431581e-04; ...
              1.452450e-04;7.556036e-05;7.028195e-05;7.824458e-05; ...
              6.531174e-05;0.053234e-04;0.026392e-04;0.003982e-04; ...
	      2.810377e-04;2.859630e-04;2.783984e-04];

%  phase : Astronomical arguments (relative to t0 = 1 Jan 0:00 1992]
% Richrad Ray subs: "arguments" and "astrol"
phase_data = [ 1.731557546;0.000000000;0.173003674;1.558553872;...
               6.050721243;6.110181633;3.487600001;5.877717569;
               4.086699633;3.463115091;5.427136701;0.553986502;
               0.052841931;2.137025284;2.436575100;1.929046130;
               5.254133027;1.756042456;1.964021610;3.487600001;
	       3.463115091;1.731557546;1.499093481];
%  amp   :   amplitudes
%amp_data = [0.242334;0.112743;0.141565;0.100661; ...
amp_data = [0.2441  ;0.112743;0.141565;0.100661; ...
            0.046397;0.046848;0.030684;0.019273; ...
            0.006141;0.007408;0.008811;0.006931; ...
            0.006608;0.007915;0.007915;0.004338; ...
	    0.003661;0.042041;0.022191;0.019567;0;0;0];

nspecies = length(ispec_data);
nl = length(c);
% kk = 0;
% for k = 1:nspecies
%    if(lower(c) == c_data(k,1:nl)) ,
%       kk = k;
%       break
%    end
% end
% 
% if(kk == 0 ),
%   ispec = -1;
%   return
% else
%   constitNum = constitNum_data(kk);
%   ispec = ispec_data(kk);
%   amp = amp_data(kk);
%   alpha = alpha_data(kk);
%   omega = omega_data(kk);
% %  ph = 0;
%   ph = phase_data(kk);
% end

% ------- FP edit start --------
if nl ~= 4
    error('length of c must = 4')
end


kk = strcmpi(c, c_data1);
if ~any(kk)
    ispec = -1;
  return
else
  constitNum = constitNum_data(kk);
  ispec = ispec_data(kk);
  amp = amp_data(kk);
  alpha = alpha_data(kk);
  omega = omega_data(kk);
%  ph = 0;
  ph = phase_data(kk);
end
% ------- FP edit end --------

return    
