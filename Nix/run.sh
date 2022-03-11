for i in {0..100}
do
    nix eval --impure --expr "import ./fizzbuzz.nix $i"
done