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

## Map Points

You can add additional clickable points on a map by specifying a `mapPoints` hash on the configuration hash. The keys of the hash are used for identification purpose and must be unique. Each MapPoint hash value must itself be a hash that specifies an `x`, `y`, and a `label` value. The `x` and `y` values specify the map coordinates for the point to appear, and the `label` is the next put inside of the point. The hash can also take a `style` and `hoverStyle` hash that can be used to override the default styles using any of the valid SVG properties.

```js
$('#map').usmap({
  mapPoints: {
    'CA-07': { x: '47',  y: '244', label: 'CA-07' },
    'CA-23': { x: '59',  y: '310', label: 'CA-23' },
    'CA-26': { x: '86',  y: '347', label: 'CA-26', style: { fill: 'blue' }, hoverStyle: { fill: 'green' } }
  }
})
```

Note that having a MapPoint ontop of a state can make it difficult to click on the underlying state.

## Styling



## Credits

Forked from the excellent NewSignature/us-map