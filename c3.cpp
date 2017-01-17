#include <iostream>
using namespace std;

extern "C" int getMax( int*, int);

int main(){
	int tab[] = { 9, 5, 7, 2, 0, 6, 3, 5, 12, 8, 9};
	int size = sizeof(tab)/sizeof(int);
	cout << "Największa wartość to: " << getMax(tab, size)<<endl;
	return 0;
}
