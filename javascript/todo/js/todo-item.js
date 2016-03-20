'use strict';

var TodoItem = Base.extend({
  init: function(state) {
    this.state = state || {title: 'Todo Title'};
  },

  render: function() {
    var $el = document.createElement('li'),
        $btnDelete = document.createElement('span'),
        $checkbox = document.createElement('span'),
        $label = document.createElement('span');

    $el.className = 'todo-item';

    $label.innerText = this.state.title;
    $label.className = 'todo-item-label';

    $btnDelete.innerText = 'X';
    $btnDelete.className = 'btn-delete';
    $btnDelete.todoItem = this;

    $checkbox.className = 'checkbox';
    $checkbox.todoItem = this;

    if (this.state.done) {
      $el.className += ' todo-item-done';
      $checkbox.className += ' checked';
    }

    $el.appendChild($btnDelete);
    $el.appendChild($checkbox);
    $el.appendChild($label);

    return $el;
  }
});
