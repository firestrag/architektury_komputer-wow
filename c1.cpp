#include <iostream>
using namespace std;

extern "C" int iloraz(int, int);

int main(){
	int a,b;
	cout << "podaj dwie liczby\n";
	cin >> a;
	cin >> b;
	a = iloraz(a,b);
	cout << "Iloraz: " << a << endl;
}
