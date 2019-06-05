void main()
{
    import std.stdio, std.string, std.algorithm, std.conv;
    import std.meta;

    alias staticTuple = AliasSeq!(string, string);

//static here forces the compiler to perform compile time function execution CTFE.
    static string conv(string c)
    {
        return (c == "**") ? "^^" : c;
    }


    // Reduce the RPN expression using a stack
    readln.split.fold!((stack, op)
    {
        switch (op)
        {
            // Generate operator switch cases statically
            static foreach (o; ["+", "-", "*", "/", "**"])
                case o:
                    return stack[0 .. $ - 2] ~
                        mixin("stack[$ - 2] " ~ conv(o) ~
                            " stack[$ - 1]");
            default: return stack ~ op.to!real;
        }
    })((real[]).init).writeln;
}