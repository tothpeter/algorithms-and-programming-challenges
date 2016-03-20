var App = Base.extend({
  init: function(state) {
    this.state = state || {input: {value: ''}};
    var app = this;

    this.input = new Input(this.state.input);
    this.input.onReturnPressed(function(event) {
      app._addItem(this.state.value);
    });

    this.list = new TodoList();
  },

  _addItem: function(todoTitle) {
    var newTodoItem = new TodoItem({title: todoTitle});
    this.list.addItem(newTodoItem);
    this.input.setState({value: ''}).focus();
  },

  render: function() {
    var $container = document.getElementById('container');

    $container.appendChild(this.input.render());
    $container.appendChild(this.list.render());
  }
});
