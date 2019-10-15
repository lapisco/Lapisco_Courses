function [ ] = saveFig_eps(filename)

% Function call:
% ===================
% saveFig_eps(filename) 
    
    mkdir Figures
    
    
    
    print(['Figures/' filename '.eps'],'-depsc2')
    
    disp(['=================='])
    disp(['Figure saved'])
    disp(['=================='])

end

