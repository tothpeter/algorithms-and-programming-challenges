'use strict';

var TodoList = Base.extend({
  init: function(state) {
    this.state = state || {items: []};
  },

  addItem: function(item) {
    this.state.items.unshift(item);
    this.setState(this.state);
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
          return _this.removeItem(e.target.todoItem);
        }
      }

      if (e.target && e.target.matches('.checkbox')) {
        var todoItem = e.target.todoItem;
        return todoItem.set('done', !todoItem.get('done'));
      }
    });

    return $el;
  }
});
