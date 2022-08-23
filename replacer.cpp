#include <iostream>
#include <string>
#include <vector>
#include <utility>

#define ARRAYSIZE 4

bool isnum(std::string str) {
	size_t i = 0;
	if (str[i] == '+') {
		i += 1;
	}
	if (i >= str.length()) {
		return false;
	}
	for (; i < str.length(); ++i) {
		if (!isdigit(str[i])) {
			return false;
		}
	}
	return true;
}

void printCache(int cache[ARRAYSIZE]) {
	for (int i = 0; i < ARRAYSIZE; i++) {
		std::cout << cache[i];
		if (i != ARRAYSIZE - 1) {
			std::cout << " ";
		}
	}
	std::cout << std::endl;

	// int output;
	// std::cin >> output;
	// if (output != cache[0] * 1000 + cache[1] * 100 + cache[2] * 10 + cache[3]) {
	// 	std::cout << "KO" << std::endl;
	// 	exit(0);
	// }
}

int main(int argc, char **argv) {
	// initialize
	int input[argc];
	for (int i = 1; i < argc; ++i) {
		if (!isnum(argv[i])) {
			std::cerr << "Error" << std::endl;
			return 1;
		}
		long long temp = strtol(argv[i], NULL, 10);
		if (temp > INT_MAX || temp <= 0) {
			std::cerr << "Error" << std::endl;
			return 1;
		}
		input[i] = temp;
	}

	// run
	int cache[ARRAYSIZE] = {};
	for (int idx = 1; idx < argc; ++idx) {
		// is already in
		bool isalready = false;
		for (int i = 0; i < ARRAYSIZE; ++i) {
			if (cache[i] == input[idx]) {
				isalready = true;
				break;
			}
		}
		if (isalready) {
			printCache(cache);
			continue;
		}
		// is empty space
		bool isempty = false;
		for (int i = 0; i < ARRAYSIZE; ++i) {
			if (cache[i] == 0) {
				cache[i] = input[idx];
				isempty = true;
				break;
			}
		}
		if (isempty) {
			printCache(cache);
			continue;
		}
		// else == page fault
		// get_distance
		int dist[ARRAYSIZE] = {};
		int flag = 0;
		for (int i = idx + 1; i < argc; ++i) {
			for (int j = 0; j < ARRAYSIZE; ++j) {
				if (cache[j] == input[i] && dist[j] == 0) {
					dist[j] = i - idx;
					flag |= 1<<j;
				}
			}
			if (flag == 0b1111) {
				break;
			}
		}
		// replace
		std::pair<int, int> max;
		for (int i = 0; i < ARRAYSIZE; ++i) {
			if (dist[i] == 0) {
				max.second = i;
				break;
			}
			if (max.first < dist[i]) {
				max.first = dist[i];
				max.second = i;
			}
		}
		cache[max.second] = input[idx];
		printCache(cache);
	}
}
