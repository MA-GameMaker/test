#include "Gms2Ext.hpp"

extern "C" __declspec(dllexport) double ext_test() {
	DebugConsoleOutput("Hello world!\n1 + 2 = %i\n", 1 + 2);

	return 0;
}