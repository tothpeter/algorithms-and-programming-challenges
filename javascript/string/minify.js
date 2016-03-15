/*
 Implement a method to perform basic string compression using the counts of repeated characters.
 For example, the string aabcccccaaa would become a2blc5a3.
 If the "compressed" string would not become smaller than the original string, your method should return the original string
*/

function minify(input) {
  if(!input) {
    return null;
  }

  var minifiedResult = '',
      currentLetter = input[0],
      currentLetterCounter = 1;

  for(var i = 1, len = input.length; i <= len; i++) {
    if(currentLetter === input[i]) {
      currentLetterCounter++;
    } else {
      minifiedResult += currentLetter + currentLetterCounter;
      currentLetterCounter = 1;
      currentLetter = input[i];
    }
  }

  if(minifiedResult.length >= input.length) {
    return input;
  } else {
    return minifiedResult;
  }
}
