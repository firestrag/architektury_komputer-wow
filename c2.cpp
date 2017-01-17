#include <iostream>
using namespace std;

extern "C" int iloscCyfr(int);

int main(){
	int a;
	cout << "podaj liczbę: ";
	cin >> a;
	cout << "Liczba: " << a << " ma " << iloscCyfr(a) << " cyfr\n";
	return 0;
}
