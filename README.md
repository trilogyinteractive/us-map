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

### Setup HTML Element

```html
<div id="map" style="width: 350px; height: 250px;"></div>
```

### Activate the Plugin

```js
$().ready(function(){
  $('#map').usmap();
});
```

## Primary Configuration

### showLabels

Hide/Show labels for the small states along the eastern seaboard (VT, NH, MA, RI, CT, NJ, DE, MD, and DC). Defaults to **true**.

```js
$().ready(function(){
  $('#map').usmap({
    showLabels: false
  });
});
```

### continental

Hide/Show the non-continental states (AK and HI). Defaults to **false**.

```js
$().ready(function(){
  $('#map').usmap({
    continental: true
  });
});
```

## Credits

Forked from the excellent NewSignature/us-map