# Viewers for ND-arrays in Matlab

This is very much a work in progress, but can already be used with some useful features.

## Use

The main entry point is `SectionViewer`, which takes as input either a Matlab numeric array or a (memory mapped) `file_array` object:
```
SectionViewer(obj);
```
By default, it will show a section, along the first two dimensions, extracted from the full volume. Sliders allow to navigate between sections. When the input is a `file_array`, only the shown section is loaded in memory, which allows visualising very large volumes.

![SectionViewer window showing a 2D section from a 3D brain template.](https://raw.githubusercontent.com/balbasty/viewers-toolbox/master/doc/SectionViewer.png "Typical SectionViewer window")

If you wishes to extract a section along a different pair of dimensions, you should use the `WhichLocation` keyword argument:
```
SectionViewer(obj, 'WhichSection', [2 3]);
```
The default value for this keyword argument is `[1 2]`.

The section to extract can be specified inline with the keyword argument `WhichLocation`. By default, the viewer position is set at the middle of each dimension:
```
SectionViewer(obj, 'WhichPosition', [10 1]);
```

The full list of keyword arguments is
- `WhichSection`: pair of dimensions along which to extract the section
- `WhichLocation`: section coordinates along the other dimensions
- `Title`: figure title
- `Parent`: parent figure or axis object

## Future developments

I would like to add a few features:
- Graphic handles to change some parameters (`WhichSection`, `Title`...)
- Fix parameters change when the figure already exists (as of today, there are lots of bugs when parameters are not set on construction)
- Allow color mapping along a given dimension (with stuff like the `catToColor` and `defToColor` functions that are used in shape-toolbox)
- Add a cursor  + seeing some information about values at the cursor position
- Deal with nifti objects and headers
