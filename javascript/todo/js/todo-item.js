'use strict';

var TodoItem = Base.extend({
  init: function(state) {
    this.state = state || {title: 'Todo Title'};
  },

  render: function() {
    var $el = document.createElement('li'),
        $btnDelete = document.createElement('span');

    $el.innerText = this.state.title;

    $btnDelete.innerText = 'X';
    $btnDelete.className = 'btn-delete';
    $btnDelete.todoItem = this;

    $el.appendChild($btnDelete);

    return $el;
  }
});
