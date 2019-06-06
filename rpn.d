void main()
{
    import std.stdio, std.string, std.algorithm, std.conv;

    string[] operators()
    {
        version(iconJack)
        {
            return ["+", "-", "*", "/", "**"];
        }
        else
        {
            return ["+", "-", "*", "/", "^"];
        }
    }

    string dOperator(string op)
    {
        string [string] map;
        string actualDExp = "^^";

        static foreach(s; operators())
        {
            map[s] = s;
        }
        version(iconJack)   { map["**"] = actualDExp; }  else { map["^"] = actualDExp; }
        return map[op];
    }


    // Reduce the RPN expression using a stack
static if (true)
{
    
    readln.split.fold!((stack, op)
    {
        switch (op)
        {
            // Generate operator switch cases statically
            static foreach (o; operators())
                case o:
                    return stack[0 .. $ - 2] ~
                        mixin("stack[$ - 2] " ~ dOperator(o) ~
                            " stack[$ - 1]");
            default: return stack ~ op.to!real;
        }
    })((real[]).init).writeln;
    }    

}