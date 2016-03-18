'use strict';

var Input = Base.extend({
  init: function(state) {
    this.state = state || { value: '' };
  },

  _onInput: function(event) {
    this.setState({
      value: event.target.value
    });
  },

  _onKeypress: function(event) {
    if (event.keyCode === 13) {
      if (typeof this._returnPressedCallback === 'function') {
        this._returnPressedCallback.call(this, event);
      }
    }
  },

  onReturnPressed: function(callback) {
    this._returnPressedCallback = callback;
    return this;
  },

  render: function() {
    var $el = document.createElement('input');
    $el.autofocus = true;
    $el.value = this.state.value;

    $el.oninput = this._onInput.bind(this);
    $el.onkeypress = this._onKeypress.bind(this);

    return $el;
  }
});
