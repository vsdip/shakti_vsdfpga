volatile char* uart = (char*)0x10000000;

int main() {
    const char* msg = "Hello\n";
    while (*msg) {
        *uart = *msg++;
    }
    while (1); // loop forever
}
