extern(C) void main()
{
    import core.stdc.stdio : printf;
    printf("Hello betterC\n");

    string tests = "test";
    string tests2 = "again";
    
    int[10] test2 = [0,1,2,3,4,5,6,7,8,9];
    foreach(x; tests)
    {
        printf("%c\n", x);
    }

    string[2] s = [tests, tests2];

    foreach(x; s)
    {
        foreach(a; x)
        {
            printf("%c\n", a);
        }
    }
}