void main()
{
    import std.stdio, std.string, std.algorithm, std.conv;

//static here forces the compiler to perform compile time function execution CTFE.
    static string conv(char c)
    {
        return (c == '^') ? "^^" : to!string(c);
    }

    // Reduce the RPN expression using a stack
    readln.split.fold!((stack, op)
    {
        switch (op)
        {
            // Generate operator switch cases statically
            static foreach (c; "+-*/^")
                case [c]:
                    return stack[0 .. $ - 2] ~
                        mixin("stack[$ - 2] " ~ conv(c) ~
                            " stack[$ - 1]");
            default: return stack ~ op.to!real;
        }
    })((real[]).init).writeln;
}