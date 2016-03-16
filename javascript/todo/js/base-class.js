var Base = (function() {
  'use strict';

  function extend(params) {
    var baseClass = function() {
      this.constructor.apply(this, arguments);
    };

    baseClass.prototype = {
      constructor: function (state) {
        this.subscribers = [];
        this.state = state || {};

        this.init.apply(this, arguments);
      },

      init: function () {},

      setState: function (state) {
        this.state = state;

        return this;
      },

      getState: function () {
        return this.state;
      }
    }

    for (var prop in params) {
      baseClass.prototype[prop] = params[prop];
    }

    return baseClass;
  }

  return {
    extend: extend
  }
})();
