chmod +x corrector

#Error
echo "\033[0m##########case2##########"
printf "\033[0;92mexpected: \tError\n\033[0;33myour program:\t"
./vpdlwldkfrhflwma -1 2 3  | ./corrector -1 2 3

#Error
echo "\033[0m##########case3##########"
printf "\033[0;92mexpected: \tError\n\033[0;33myour program:\t"
./vpdlwldkfrhflwma 0 2 3  | ./corrector 0 2 3

#Error
echo "\033[0m##########case5##########"
printf "\033[0;92mexpected: \tError\n\033[0;33myour program:\t"
./vpdlwldkfrhflwma ++1 2 3  | ./corrector ++1 2 3

#OK
echo "\033[0m##########case1##########"
printf "\033[0;92mexpected: \tOK\n\033[0;33myour program:\t"
./vpdlwldkfrhflwma 1 2 3  | ./corrector 1 2 3

#OK
echo "\033[0m##########case4##########"
printf "\033[0;92mexpected: \tOK\n\033[0;33myour program:\t"
./vpdlwldkfrhflwma +1 2 3  | ./corrector +1 2 3

#OK
echo "\033[0m##########case8##########"
printf "\033[0;92mexpected: \tOK\n\033[0;33myour program:\t"
./vpdlwldkfrhflwma 1 2 3 4 5 6 7 1 2 3 4 5 6 7  | ./corrector 1 2 3 4 5 6 7 1 2 3 4 5 6 7

#OK
echo "\033[0m##########case9##########"
printf "\033[0;92mexpected: \tOK\n\033[0;33myour program:\t"
ARG=`jot -r 500 1 200 | tr '\n' ' '` ; ./vpdlwldkfrhflwma $ARG | ./corrector $ARG

#KO
echo "\033[0m##########case6##########"
printf "\033[0;92mexpected: \tKO\n\033[0;33myour program:\t"
./vpdlwldkfrhflwma 1 2 3  | ./corrector 1 2 3 3

#KO
echo "\033[0m##########case7##########"
printf "\033[0;92mexpected: \tKO\n\033[0;33myour program:\t"
./vpdlwldkfrhflwma 1 2 3  | ./corrector 1 2
