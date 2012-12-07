## US Map

A Javascript map of the United States built with SVG/VML by using Raphael as a jQuery plugin.

You can configure the styles of the states and labels for the default, per state, and hover. You can bind to it through jQuery to capture the events of when users click on states.


## How to Use ##

### Include Javascript Dependencies

```html
<script src="js/jquery.js"></script>
<script src="js/raphael.js"></script>
<script src="js/jquery.usmap.js"></script>
```

### Setup Containing HTML Element

```html
<div id="map" style="width: 350px; height: 250px;"></div>
```

### Activate the Plugin

```js
$().ready(function(){
  $('#map').usmap();
});
```

## Layout Configuration

### Height and Width

The *native* dimensions of the map are 930 by 630, however the map will resize automatically into whatever dimensions are specified on the containing HTML element. The map width/height ratio will always remain the same, so it's best to keep the containing elements width/height ratio the same.

It is important that you specify the height/width of the containing HTML element with inline styles and not a separate stylesheet. Otherwise you will get a number of JS console errors and older versions of Internet Explorer will not render at all.

### showLabels

Hide/Show labels for the small states along the eastern seaboard (VT, NH, MA, RI, CT, NJ, DE, MD, and DC). Defaults to **true**.

```js
$('#map').usmap({
  showLabels: false
});
```

### continental

Hide/Show the non-continental states (AK and HI). Defaults to **false**.

```js
$('#map').usmap({
  continental: true
});
```

### stateHoverAnimation

The time in milliseconds for the animation between styles when hovering over a state.

```js
$('#map').usmap({
  stateHoverAnimation: 300
});
```

### mapPointHoverAnimation

The time in milliseconds for the animation between styles when hovering over a map point.

```js
$('#map').usmap({
  mapPointHoverAnimation: 300
});
```

## Map Points

You can add additional click-able points on a map by specifying a `mapPoints` hash on the configuration hash. The keys of the hash are used for identification purpose and must be unique. Each MapPoint hash value must itself be a hash that specifies an `x`, `y`, and a `label` value. The `x` and `y` values specify the map coordinates for the point to appear, and the `label` is the next put inside of the point. The hash can also take a `style`, `hoverStyle`, and `textStyle` hash that can be used to override the default styles using any of the valid SVG properties.

```js
$('#map').usmap({
  mapPoints: {
    'CA-07': { x: '47',  y: '244', label: 'CA-07' },
    'CA-23': { x: '59',  y: '310', label: 'CA-23' },
    'CA-26': {
      x: '86',  y: '347', label: 'CA-26',
      style: { fill: 'blue' },
      hoverStyle: { fill: 'green' }
    }
  }
})
```

Note that having a MapPoint ontop of a state can make it difficult to click on the underlying state.

## Events

Use events to connect the U.S. Map with your custom code. With events, you can allow a function to react to user interactions.

All events have a similar pattern in their arguments and ability to either target individual or all states.

The event handler is passed two arguments: the jQuery event object and a data object for the state or map point.

### State Data object

> #### name (string)
>
> The two letter abbreviation of the state.
>
> #### shape (Element)
>
> The shape element (SVG or VML) for the state.
>
> #### hitArea (Element)
>
> The shape element (SVG or VML) for the transparent hit area.
>
> #### labelBacking (Element)
>
> The shape element (SVG or VML) for the backing of the label if there is one for the state.
>
> ####  labelText (Element)
>
> The vector text element (SVG or VML) for the label text if there is one for the state.
>
> #### labelHitArea (Element)
>
> The shape element (SVG or VML) for the transparent hit area for the label if there is one for the state.
>
> #### isMapPoint (boolean)
>
> Will always be **false** for a state.

### Map Point Data Object

> #### name (string)
>
> The identifier string used to reference the map point it the configuration hash.
>
> #### mapPointShape  (Element)
>
> The circle element (SVG or VML) for the map point.
>
> #### mapPointHitArea  (Element)
>
> The circle element (SVG or VML) for the transparent hit area.
>
> #### mapPointLabelText (Element)
>
> The vector text element (SVG or VML) for the map point's label text.
>
> #### isMapPoint (boolean)
>
> Will always be **true** for a map point.

### Event Types

#### click

When the user clicks on a state or map point.

#### mouseover

When the user moves their mouse over a state or map point.

#### mouseout

When the user moves their mouse out of a state or map point.

### Events by Configuration

The usmap configuration hash accepts a function at keys named after the three events. When the event is triggered an event object and appropriate data object is passed to the provided method.

```js
$('#map').usmap({
  click: function(event, data) {
    // Output the abbreviation of the state name to the console
    console.log(data.name);
  },
  mouseover: function(event, data) {
    // Output the abbreviation of the state name to the console
    console.log(data.name);
  },
  mouseout: function(event, data) {
    // Output the abbreviation of the state name to the console
    console.log(data.name);
  }
});
```

### Events by Binding

It is also possible to use jQuery binding to listen for events. Binding events use the event names listed above with the 'usmap' prefix.

```js
$('#map').on('usmapclick', function(event, data) {
  // Output the abbreviation of the state name to the console
  console.log(data.name);
});

$('#map').on('usmapmouseover', function(event, data) {
  // Output the abbreviation of the state name to the console
  console.log(data.name);
});


$('#map').on('usmapmouseout', function(event, data) {
  // Output the abbreviation of the state name to the console
  console.log(data.name);
});
```

### Specific State Events

It is also possible to attach events to specific states by using their identifiers in combination with the event names.

```js
$('#map').usmap({
  clickState: {
    'MD' : function(event, data) {
      console.log('You interacted with the state of Maryland');
    }
  }
});
```

```js
$('#map').on('usmapclickMD', function(event, data) {
  console.log('You clicked on the state of Maryland');
});
```

## Methods

### trigger

Manually trigger off an event and the resulting event handlers.

```js
$('#map').usmap('trigger', state, eventType, event)
```

> #### state (string)
>
> The two letter abbreviation of the state.
>
> #### eventType (string)
>
> The type of event to trigger
>
> #### event (Event) [optional]
>
> The original triggering event.


## Styling

The styling used for the map is highly customizable. While the map comes with many good defaults, you can override those globally as well as on a state-by-state level.

### SVG Style Attributes

The configurations listed in this section use the following set of SVG style attributes. Not all configurations accept all the attributes, mostly the font related attributes have no impact on style that does not have a font.

#### fill (color)

The fill color of the shape or text.

```js
{'fill': '#335577'}
```

#### stroke (color)

The stroke color of the shape or text.

```js
{'stroke': '#000'}
```

#### stroke-width (width)

The width of the stroke.

```js
{'stroke-width': 2}
```

#### stroke-linejoin (miter | round | bevel | inherit)

The shape to be used at the corners of stroked paths or basic shapes.

```js
{'stroke-linejoin': 'round'}
```

#### font-weight (weight)

The font-weight of the text element.

```js
{'font-weight': 300}
```

#### font-size (pixel)

The size of the text.

```js
{'font-size': '10px'}
```

#### font-family (font priority list)

The font of the text. Will use loaded webfonts, but is ignored in some browsers.

```js
{'font-family': 'bebas-neue,sans-serif'}
```

#### radius (integer)

The radius of a map point.

```js
{'radius': 20}
```

### stateStyles

An SVG Style hash used to style all states in their default state.

```js
$('#map').usmap({
  stateStyles: {fill: 'blue'}
});
```

### stateHoverStyles

An SVG Style hash used to style all states when the in the hover state.

```js
$('#map').usmap({
  stateHoverStyles: {fill: 'red'}
});
```

### stateSpecificStyles

A hash of states, using the state's two letter acronym as the key. The value for each key is an SVG Style hash used to style the specific state in its default state.

```js
$('#map').usmap({
  stateSpecificStyles: {
    'MD': {fill: 'yellow'},
    'VA': {fill: 'teal'}
  }
});
```

### stateSpecificHoverStyles

A hash of states, using the state's two letter acronym as the key. The value for each key is an SVG Style hash used to style the specific state in its hover state.

```js
$('#map').usmap({
  stateSpecificHoverStyles: {
    'MD': {fill: 'purple'},
    'VA': {fill: 'orange'}
  }
});
```

### mapPointStyles

An SVG Style hash used to style all map points in their default state. Is overridden in the mapPoint configuration hash on a point-by-point basis with `style`.

```js
$('#map').usmap({
  mapPointStyles: {fill: 'yellow'}
});
```

### mapPointTextStyles

An SVG Style hash used to style all map points labels. Is overridden in the mapPoint configuration hash on a point-by-point basis with `textStyle`.

```js
$('#map').usmap({
  mapPointTextStyles: {font-size: '16px'}
});
```

### mapPointHoverStyles

An SVG Style hash used to style all map points in their hover state. Is overridden in the mapPoint configuration hash on a point-by-point basis with `hoverStyle`.

```js
$('#map').usmap({
  mapPointHoverStyles: {fill: 'blue'}
});
```

## Label Styling

If you're using the small eastern seaboard state labels, you can configure most aspects of their with these configuration options.

### labelWidth

The width of the labels.

### labelHeight

The height of the labels.

### labelGap

The distance between labels.

### labelRadius

The radius of the rounded corners of the labels.

### labelBackingStyles

The default styles for the label shapes.

### labelBackingHoverStyles

The default hover styles for the label shapes.

### stateSpecificLabelBackingStyles

An object to override the default styles for individual label. The object keys are the state abbreviation with the value being the style object.

### stateSpecificLabelBackingHoverStyles

An object to override the default hover styles for an individual label. The object keys are the state abbreviation with the value being the style object.

### labelTextStyles

The styling for the label text.

### stateSpecificLabelTextStyles

An object to override the default styles for an individual label text. The object keys are the state abbreviation with the value being the style object.

### stateSpecificLabelTextHoverStyles

An object to override the default hover styles for an individual label text. The object keys are the state abbreviation with the value being the style object.

## Credits

Forked from the excellent [NewSignature/us-map](/NewSignature/us-map).