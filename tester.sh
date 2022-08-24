make re

#OK
./vpdlwldkfrhflwma 1 2 3  | ./corrector 1 2 3

#Error
./vpdlwldkfrhflwma -1 2 3  | ./corrector -1 2 3

#Error
./vpdlwldkfrhflwma 0 2 3  | ./corrector 0 2 3

#OK
./vpdlwldkfrhflwma +1 2 3  | ./corrector +1 2 3

#Error
./vpdlwldkfrhflwma ++1 2 3  | ./corrector ++1 2 3

#KO
./vpdlwldkfrhflwma 1 2 3  | ./corrector 1 2 3 3

#KO
./vpdlwldkfrhflwma 1 2 3  | ./corrector 1 2

#OK
./vpdlwldkfrhflwma 1 2 3 4 5 6 7 1 2 3 4 5 6 7  | ./corrector 1 2 3 4 5 6 7 1 2 3 4 5 6 7

#OK (ctrl-d)
./vpdlwldkfrhflwma 
./corrector 