#include <iostream>
using namespace std;

extern "C" int getBinary();

int main(){
	cout << "Podaj liczbę: ";
	int count = getBinary();
	cout << "Podana liczba w reprezentacji binarnej posiada: " << count << " jedynek\n";
	return 0;
}
