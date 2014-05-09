volatile char porta __attribute__((io));

int f ()
{
  return porta;
}

