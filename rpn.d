void main()
{
    import std.stdio, std.string, std.algorithm, std.conv;

    version(iconJack)
    {
        string[] iconJackOperators()
        {
            return ["+", "-", "*", "/", "**"];
        }

        string dOperator(string op)
        {
            string [string] map;

            static foreach(s; iconJackOperators())
            {
                map[s] = s;
            }
            map["**"] = "^^";
            return map[op];
        }

        string[] getOperators()
        {
            return iconJackOperators();
        }
    }
    else
    {
        string[] operators()
        {
            return ["+", "-", "*", "/", "^"];
        }
        string dOperator(string op)
        {
            string [string] map;

            static foreach(s; dOperators())
            {
                map[s] = s;
            }
            map["^"] = "^^";
            return map[op];

        }
        string[] getOperators()
        {
            return operators();
        }
    }

    // Reduce the RPN expression using a stack
static if (true)
{
    
    readln.split.fold!((stack, op)
    {
        switch (op)
        {
            // Generate operator switch cases statically
            static foreach (o; getOperators())
                case o:
                    return stack[0 .. $ - 2] ~
                        mixin("stack[$ - 2] " ~ dOperator(o) ~
                            " stack[$ - 1]");
            default: return stack ~ op.to!real;
        }
    })((real[]).init).writeln;
    }    

}