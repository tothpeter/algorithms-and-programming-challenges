'use strict';

var TodoList = Base.extend({
  init: function(state) {
    this.state = state || {items: []};
  },

  addItem: function(item) {
    var newState = this.state;
    newState.items.push(item);

    this.setState(newState);
  },

  removeItem: function(itemToRemove) {
    var newState = this.state,
        indexToRemove = this.state.items.indexOf(itemToRemove);

    newState.items.splice(indexToRemove, 1);
    itemToRemove.destroy();

    this.setState(newState, true);
  },

  render: function() {
    var $el = document.createElement('ul'),
        _this = this;

    this.state.items.forEach(function(item) {
      $el.appendChild(item.render());
    });

    $el.addEventListener('click', function(e) {
      if (e.target && e.target.matches('.btn-delete')) {
        if (confirm('Are you sure?')) {
          _this.removeItem(e.target.todoItem);
        }
      }
    });

    return $el;
  }
});
