var App = Base.extend({
  init: function(state) {
    this.state = state || {input: {value: ''}};

    this.input = new Input(this.state.input);
    this.input.onReturnPressed(function(event) {
      console.log('New todo text:', this.state.value);
    });
  },

  render: function() {
    var $container = document.getElementById('container');

    $container.appendChild(this.input.render());
  }
});
