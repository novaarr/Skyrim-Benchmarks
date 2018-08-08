scriptname Benchmark_StressAlias_Player extends ReferenceAlias hidden

import Math

Benchmark_Stress property Stress auto

string[] Decoded
int[] Encoded

int[] CRC32TableLow
int[] CRC32TableHigh

event OnInit()
  if !CRC32TableLow.Length
    CRC32Init()

    Decoded = new string[4]
    Encoded = new int[4]

    Decoded[0] = "IF YOU ARE HAPPY AND YOU KNOW IT CLAP YOUR HANDS"
    Decoded[1] = "OH MAN, I SHOT MARVIN IN THE FACE"
    Decoded[2] = "NEVER GONNA LET YOU DOWN NEVER GONNA GIVE YOU UP"
    Decoded[3] = "LET ME GUESS SOMEONE STOLE YOUR SWEETROLL"

    Encoded[0] = 0x78294D19
    Encoded[1] = 0x56F9F8AF
    Encoded[2] = 0x44D7C214
    Encoded[3] = 0xE2D4803D
  endIf

  while !Stress.UpdateTime
    Utility.Wait(1.0)
  endWhile
endEvent

event OnUpdate()
  int pos = 4
  while pos
    pos -= 1

    if CRC32(Decoded[pos]) == Encoded[pos]
      Utility.Wait(0.01)
    else
      Utility.Wait(0.01)
    endIf
  endWhile
endEvent

;/
  uint32_t crc32_for_byte(uint32_t r) {
    for(int j = 0; j < 8; ++j)
      r = (r & 1? 0: (uint32_t)0xEDB88320L) ^ r >> 1;
    return r ^ (uint32_t)0xFF000000L;
  }
/;
int function CRC32Byte(int l)
  int i = 8

  while i
    i -= 1

    if LogicalAnd(l, 1)
      l = LogicalXor(0, RightShift(l, 1))
    else
      l = LogicalXor(0xEDB88320, RightShift(l, 1))
    endIf
  endWhile

  return LogicalXor(l, 0xFF000000)
endFunction

function CRC32Init()
  CRC32TableLow = new int[0x80]
  CRC32TableHigh = new int[0x80]
  int i = 0x100

  while i
    i -= 1

    if i < 0x80
      CRC32TableLow[i] = CRC32Byte(i)
    else
      CRC32TableHigh[i - 0x80] = CRC32Byte(i)
    endIf
  endWhile
endFunction

int function CRC32Table(int i)
  if i < 0x80
    return CRC32TableLow[i]
  else
    return CRC32TableHigh[i - 0x80]
  endIf
endFunction

;/
  void crc32(const void *data, size_t n_bytes, uint32_t* crc) {
  static uint32_t table[0x100];
  if(!*table)
    for(size_t i = 0; i < 0x100; ++i)
      table[i] = crc32_for_byte(i);
  for(size_t i = 0; i < n_bytes; ++i)
    *crc = table[(uint8_t)*crc ^ ((uint8_t*)data)[i]] ^ *crc >> 8;
  }
/;
int function CRC32(string data) ; because, why not
  int i = 0
  int len = StringUtil.GetLength(data)
  int chksum = 0

  while i < len
    int b = StringUtil.AsOrd(StringUtil.GetNthChar(data, i))

    if b >= 97 && b <= 122 ; lowercase
      b -= 0x20
    endIf

    int chksum_b = LogicalAnd(chksum, 0xFF)
    int tbl_i = LogicalXor(chksum_b, b)

    chksum = LogicalXor(CRC32Table(tbl_i), RightShift(chksum, 8))

    i += 1
  endWhile

  return chksum
endFunction
