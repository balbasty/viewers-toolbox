function opennii(nii)
    N = nifti(nii);
    if numel(N.dat.dim) < 4
        spm_image('Display', nii);
    else
        if ~isdeployed, addpath(fullfile(spm('Dir'), 'spm_orthviews')); end
        i = 1;
        for k=1:size(N.dat, 4)
            for l=1:size(N.dat, 5)
                for m=1:size(N.dat, 6)
                    fname = [N.dat.fname ',' num2str(k) ',' num2str(l) ',' num2str(m)];
                    names(i,1:length(fname)) = fname;
                    i = i + 1;
                end
            end
        end        
        spm_check_registration(names);
    end
end