# experimentalASM
General functions written in asm x64
<br><br>
<ul>
  <li> long GetTSC();
  <li> float experimentalSIN(int);
  <li> float experimentalCOS(int);
  <li> void experimentalMEMCPY(void*,void*,int);
  <li> void experimentalMEMSET(void*,char,int); /// faster then memset C for small memory block (100 - 20 000 bytes)
  <li> int experimentalRAND(unsigned int, unsigned int);
</ul>
