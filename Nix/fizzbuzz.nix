number: with builtins; let
  mod = n: m: n - m * floor (n / m);
  fizzbuzz-rules = [
    [ 3 "Fizz" ]
    [ 5 "Buzz" ]
  ];
  check-rule = rule: let
    divisor = elemAt rule 0;
  in mod number divisor == 0;
  applicable-rules = filter check-rule fizzbuzz-rules;
  get-word = rule: elemAt rule 1 ;
  words = map get-word applicable-rules;
in if length words == 0
  then toString number
  else concatStringsSep "" words