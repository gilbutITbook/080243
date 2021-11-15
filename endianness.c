#include <stdio.h>
#include <inttypes.h>

typedef union unsignedInspect unsignedInspect;
union unsignedInspect {
  unsigned val;
  unsigned char bytes[sizeof(unsigned)];
};
unsignedInspect twofold = { .val = 0xAABBCCDD, };

int main(void) {
  printf("value is 0x%.08X\n", twofold.val);
  for (size_t i = 0; i < sizeof twofold.bytes; ++i)
    printf("byte[%zu]: 0x%.02hhX\n", i, twofold.bytes[i]);
  unsigned val = 0xAABBCCDD;
  unsigned char* valp = (unsigned char*)&val;
  for (size_t i = 0; i < sizeof val; ++i)
    printf("byte[%zu]: 0x%.02hhX\n", i, valp[i]);
}
