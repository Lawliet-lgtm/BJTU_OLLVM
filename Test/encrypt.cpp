#include <stdint.h>
extern "C" char *__decrypt(char *encStr) {
  char *curr = encStr;
  while (*curr) {
    *curr ^= 42;
    curr++;
  }
  return encStr;
}

extern "C" char *__encrypt(char *originStr) {
  char *curr = originStr;
  while (*curr) {
    *curr ^= 42;
    curr++;
  }
  return originStr;
}