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

  removeItem: function(item) {
    var newState = this.state,
        indexToRemove = this.state.items.indexOf(item);

    newState.items.splice(indexToRemove, 1);

    this.setState(newState);
  },

  render: function() {
    var $el = document.createElement('ul');

    this.state.items.forEach(function(item) {
      $el.appendChild(item.render());
    });

    return $el;
  }
});
