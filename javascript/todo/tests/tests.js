QUnit.test( 'BaseClass', function( assert ) {

  var myNewClass = Base.extend({
    name: 'kalina.tech',
    myFunction: function() {
      return 'test';
    }
  });

  var myNewInstance = new myNewClass();

  assert.equal( myNewInstance.name, 'kalina.tech', 'Returns the predefined property' );
  assert.equal( myNewInstance.myFunction(), 'test', 'Execute the predefined function' );

  myNewInstance.setState({newProperty: 1});
  assert.equal( myNewInstance.getState().newProperty, 1, 'Returns the newly asigned state' );
});
