function imshow_categorical(f, vs, z, slice)

    if nargin < 4
        slice = 3;
    end
    dim = [size(f) 1 1];
    if nargin < 3 || ~isfinite(z)
        switch slice
            case {2,3}
                z = ceil(dim(slice)/2);
            case 1
                z = ceil(dim(slice)/3);
        end
    end
    if nargin < 2
        vs = [1 1 1];
    end
    switch slice
        case 1
            f = catToColor(reshape(f(z,:,:,:), [dim(2) dim(3) dim(4)]));
        case 2
            f = catToColor(reshape(f(:,z,:,:), [dim(1) dim(3) dim(4)]));
        case 3
            f = catToColor(reshape(f(:,:,z,:), [dim(1) dim(2) dim(4)]));
        otherwise
            error('not handled')
    end

%     if dim(4) > 1
%         f = reshape(f, [dim(1:2) dim(4)]);
%     end
    f = permute(f, [2 1 3]);
    asp = 1./[vs(2) vs(1) 1];
    figure, image(f(end:-1:1,:,:));
    daspect(asp);
    axis off

end