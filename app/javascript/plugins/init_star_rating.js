// init_star_rating.js
import "jquery-bar-rating";
import "jquery-bar-rating/dist/themes/css-stars.css";
import $ from 'jquery'; // <-- if you're NOT using a Le Wagon template (cf jQuery section)

const initStarRating = () => {
  $("[id=booking_rating]").barrating({
    theme: 'css-stars',
    onSelect: (value, text, event) => {
      const form = $("form.booking_form"); // We are selecting the form on the page with its class
      // form.submit();
      // form.trigger('submit.rails');// We submit the form with javascript
    }
  });
};

export { initStarRating };
