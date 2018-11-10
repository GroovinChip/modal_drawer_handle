## modal_drawer_handle

modal_drawer_handle is A Flutter package that allows you to add a highly customizable drawer handle widget to your modalBottomSheets.

Sample images: https://imgur.com/gallery/zf6NriP

YouTube video walkthrough: https://www.youtube.com/watch?v=VF-zR9ougi8&feature=youtu.be

Every aspect of the drawer handle can be customized:
- color
- height
- width
- the MainAxisAlignment of the Row it sits in
- the BorderRadius of all four corners

The recommended use of this widget is within the showModalBottomSheet builder (or the showRoundedModalBottomSheet builder, if you prefer the package by Gildaswise like I do).

The ideal use in this case is to return a Container that returns a Column, and the ModalDrawerHandle widget should be the first widget in the Column. I personally wrap the ModalDrawerHandle with a Padding that has a const EdgeInsets.all(8.0). Below is an example of this:

```
showRoundedModalBottomSheet(
  context: context,
  builder: (builder) {
    return Container(
	  child: Column(
	    mainAxisSize: MainAxisSize.min,
	    children: <Widget>[
		  Padding(
		    padding: const EdgeInsets.all(8.0),
		    child: ModalDrawerHandle(),
		  ),
	    ],
	  ),
    );
  },
);
```

By default, the ModalDrawerHandle is initialized with the following properties:
```
  ModalDrawerHandle({
    this.handleRowAlignment = MainAxisAlignment.center,
    this.handleHeight = 5.0,
    this.handleWidth = 25.0,
    Color handleColor,
    this.handleBorderRadius = const BorderRadius.all(Radius.circular(10.0))
  }):
     this.handleColor = handleColor ?? Colors.grey[300];
```

As such, developers can pass in any or all of their own custom values to the constructor as they choose. 

## Getting Started With Flutter

For help getting started with Flutter, view our online
[documentation](https://flutter.io/).