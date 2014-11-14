unsigned short calculateInternetChecksum16(void* data, size_t count)
{
   unsigned short* addr = (unsigned short*)data;
   unsigned int    sum  = 0;

   while(size >= sizeof(*addr)) {   /* Main calculation loop */
      sum += *addr++;
      size -= sizeof(*addr);
   }
   if(size > 0) {   /* Add left-over byte, if any */
      sum += * (unsigned char*)addr;
   }
   while(sum >> 16) {   /* Fold 32-bit sum to 16 bits */
      sum = (sum & 0xffff) + (sum >> 16);
   }
   return(~sum);
}
