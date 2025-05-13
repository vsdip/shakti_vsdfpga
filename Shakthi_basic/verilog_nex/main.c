volatile unsigned int *uart = (unsigned int *)0x90000000;

int main() {
    *uart = 'H';
    *uart = 'i';
    *uart = '\n';
    while (1);
    return 0;
}
