#include <iostream>
using namespace std;

extern "C" bool isTriangle( unsigned int, unsigned int, unsigned int );

int main(){
	unsigned int a,b,c;
	cout << "Podaj 3 liczby: ";
	cin >> a;
	cin >> b;
	cin >> c;
	
	if( isTriangle(a, b, c) ){
		cout << "Można utworzyć trójkąt o podanych bokach";
	}else{
		cout << "Nie można utworzyć trójkątu o podanych bokach";
	}
	cout << endl;
	return 0;
}
