'use strict';

var TodoItem = Base.extend({
  init: function(state) {
    this.state = state || {title: 'Todo Title'};
  },

  render: function() {
    var $el = document.createElement('li');

    $el.innerText = this.state.title;

    return $el;
  }
});
