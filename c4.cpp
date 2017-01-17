#include <iostream>
#include <string>
using namespace std;

extern "C" void change(const char*);

int main(){
	string a;
	cout << "Podaj ciąg znaków: ";
	cin >> a;
	const char *tmp = a.c_str();
	change(tmp);
	cout << "Po zamianie: " << tmp << endl;
	return 0;
}
