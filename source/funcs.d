int inc(int n)
{
    return n + 1;
}

unittest
{
    assert(inc(1) == 2);
    assert(inc(2) == 3);
}