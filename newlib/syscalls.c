#include <sys/stat.h>
#include <soc_AM1808.h>
#include <hw_uart.h>
#include <string.h>
  
char readBuffer[1024] = "";
int readBufferLength = 0;

int putchar(int c);

void printDebug(char *functionName) {
    char* start = "WARN: Syscall ";
    char* end = " called but not fully implemented!\n";
    int i = 0;
    while ((*(start + i)) != '\0') {
        putchar(*(start + i));
        ++i;
    }
    i = 0;
    while ((*(functionName + i)) != '\0') {
        putchar(*(functionName + i));
        ++i;
    }
    i = 0;
    while ((*(end + i)) != '\0') {
        putchar(*(end + i));
        ++i;
    }
}

void readChar() {
    // TODO This should be done in an ISR
    while (!(*((volatile char*)(SOC_UART_1_REGS + UART_LSR)) & 1))
        ;

    char c = *((volatile char*)(SOC_UART_1_REGS + UART_RBR));
    readBuffer[readBufferLength] = c;
    ++readBufferLength;
}

int _read(int file, char *ptr, int len) {
    printDebug("_read");
    readChar();

    while (readBufferLength == 0)
        ;

    if (len > readBufferLength) {
        int ret = readBufferLength;
        memcpy(ptr, readBuffer, readBufferLength);
        readBufferLength = 0;
        return ret;
    } else {
        readBufferLength -= len;
        memcpy(ptr, readBuffer, len);
        memcpy(readBuffer, readBuffer + len, readBufferLength);
        return len;
    }
}
 
char *heap_end = 0;

caddr_t _sbrk(int incr) {
    extern char heap_low; /* Defined by the linker */
    extern char heap_top; /* Defined by the linker */
    char *prev_heap_end;
 
    if (heap_end == 0) {
        heap_end = &heap_low;
    }
    prev_heap_end = heap_end;
 
    if (heap_end + incr > &heap_top) {
        /* Heap and stack collision */
        return (caddr_t)0;
    }
 
    heap_end += incr;
    return (caddr_t) prev_heap_end;
}

int putchar (int c) {
    if (c == '\n')
        putchar('\r');

    while (!(*((volatile char*)(SOC_UART_1_REGS + UART_LSR)) & (1 << 5)))
        ;

    *((volatile char*)(SOC_UART_1_REGS + UART_THR)) = c;
 
    return c;
}

int puts(const char *str) {
    int i = 0;
    while ((*(str + i)) != '\0') {
        putchar(*(str + i));
        ++i;
    }
    return i;
}
 
int _write(int file, char *ptr, int len) {
    if (len == 0)
        return 0;

    int i = 0;
    while (i < len && (*(ptr + i)) != '\0') {
        putchar(*(ptr + i));
        ++i;
    }
    return len;
}

void _exit(int code) {
    printDebug("_exit");
    while(1);
}

int _close(int file) {
    printDebug("_close");	
    return -1; 
}
 
int _fstat(int file, struct stat *st) {
    printDebug("_fstat");
    st->st_mode = S_IFCHR;
    return 0;
}
 
int _isatty(int file) { 
    printDebug("_isatty");
    return 1; 
}
 
int _lseek(int file, int ptr, int dir) { 
    printDebug("_lseek");
    return 0; 
}
 
int _open(const char *name, int flags, int mode) { 
    printDebug("_open");
    return -1; 
}

#include <errno.h>
#undef errno

extern int errno;

int _execve(char *name, char **argv, char **env) {
    printDebug("_execve");
    errno = ENOMEM;
    return -1;
}

int _fork(void) {
    printDebug("_fork");
    errno = EAGAIN;
    return -1;
}

int _getpid(void) {
    printDebug("_getpid");
    return 1;
}

int _kill(int pid, int sig) {
    printDebug("_kill");
    errno = EINVAL;
    return -1;
}

int _link(char *old, char *new) {
    printDebug("_link");
    errno = EMLINK;
    return -1;
}

int _stat(char *file, struct stat *st) {
    printDebug("_stat");
    st->st_mode = S_IFCHR;
    return 0;
}

int _unlink(char *name) {
    printDebug("_unlink");
    errno = ENOENT;
    return -1; 
}

int _wait(int *status) {
    printDebug("_wait");
    errno = ECHILD;
    return -1;
}
