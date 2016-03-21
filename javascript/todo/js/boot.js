'use strict';

+function(){
  var items = [
    {
      title: 'Water the flowers'
    },
    {
      title: 'Walk the dog',
      done: true
    },
    {
      title: 'Master JavaScript'
    }
  ];

  var app = new App({items: items});

  app.render();
}();
