import "bootstrap";

import 'mapbox-gl/dist/mapbox-gl.css'; // <-- you need to uncomment the stylesheet_pack_tag in the layout!

import { initMapbox } from '../plugins/init_mapbox';

initMapbox();


import "jquery-bar-rating/dist/themes/css-stars.css"

import { initStarRating } from '../plugins/init_star_rating';

initStarRating();

import 'bootstrap-slider';

var mySlider = $("input.slider").slider();

import '@mapbox/mapbox-gl-geocoder/dist/mapbox-gl-geocoder.css';
