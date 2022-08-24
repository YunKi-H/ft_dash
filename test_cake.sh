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

#OK
ARG=`jot -r 500 1 200 | tr '\n' ' '` ; ./vpdlwldkfrhflwma $ARG | ./corrector $ARG

#OK (ctrl-d)
./vpdlwldkfrhflwma 
./corrector 
