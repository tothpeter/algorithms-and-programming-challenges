QUnit.test( 'Minify', function( assert ) {
  assert.equal( minify('aabcccccaaa'), 'a2b1c5a3', 'The minified version is shorter than the original' );
  assert.equal( minify('abc'), 'abc', 'The minified version is not shorter than the original' );
  assert.equal( minify(), null, 'Edge case' );
});
